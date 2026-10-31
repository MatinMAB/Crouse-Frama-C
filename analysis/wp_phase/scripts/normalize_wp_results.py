#!/usr/bin/env python3
"""Normalize the frozen 48-target WP evidence into stable audit datasets.

This script never executes Frama-C and never edits frozen per-target evidence.
"""

from __future__ import annotations

import csv
import hashlib
import json
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
WP = ROOT / "analysis" / "wp_phase"
DATA = WP / "data"
RESULTS = WP / "results"
FINAL = WP / "FINAL_WP_RESULTS_48.tsv"
INPUTS = WP / "WP_TARGET_INPUTS.tsv"
REPAIRS = ROOT / "analysis" / "repair_phase" / "48_CONFIRMED_REPAIR_TARGETS.tsv"
PRE_REPAIR_SOURCE_COMMIT = "93667d5dd8d25615c5da6deacb1bfbc007d03a2b"


def read_tsv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def write_tsv(path: Path, rows: list[dict[str, object]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        writer.writerows(rows)


def evidence_paths(value: str) -> tuple[str, str]:
    paths = [part.strip() for part in value.split(";")]
    report = next(path for path in paths if path.endswith("wp-report.json"))
    log = next(path for path in paths if path.endswith("stdout_stderr.log"))
    return report, log


def prover_summary(report: list[dict[str, object]]) -> tuple[str, dict[str, str]]:
    successful: list[str] = []
    timings = {"qed": "", "alt_ergo": "", "z3": "", "cvc5": ""}
    aliases = {"qed": "qed", "alt-ergo": "alt_ergo", "z3": "z3", "cvc5": "cvc5"}
    for goal in report:
        for attempt in goal.get("provers", []):
            name = str(attempt["prover"])
            base = name.split(":", 1)[0].lower()
            key = aliases.get(base)
            if key:
                timings[key] = str(attempt.get("time", ""))
            if int(attempt.get("success", 0)) == 1:
                successful.append(name)
    return ";".join(successful), timings


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


final_rows = read_tsv(FINAL)
input_by_id = {row["KLEE Alarm ID"]: row for row in read_tsv(INPUTS)}
repair_by_id = {row["KLEE Alarm ID"]: row for row in read_tsv(REPAIRS)}

if len(final_rows) != 48 or len(input_by_id) != 48 or len(repair_by_id) != 48:
    raise SystemExit("expected exactly 48 rows in final, input, and repair datasets")

normalized: list[dict[str, object]] = []
provenance: list[dict[str, object]] = []
summary: list[dict[str, object]] = []

for final in final_rows:
    alarm_id = final["KLEE Alarm ID"]
    inp = input_by_id[alarm_id]
    repair = repair_by_id[alarm_id]
    report_path, log_path = evidence_paths(final["Evidence Path"])
    report_file = ROOT / report_path
    log_file = ROOT / log_path
    result_dir = report_file.parent
    report = json.loads(report_file.read_text(encoding="utf-8"))
    if len(report) != 1:
        raise SystemExit(f"{alarm_id}: expected one selected goal, found {len(report)}")
    goal = report[0]
    successful, times = prover_summary(report)
    elapsed_file = result_dir / "elapsed_time.txt"
    elapsed = final["Runtime"].removesuffix(" seconds")
    recorded_elapsed = elapsed_file.read_text(encoding="utf-8").strip().removesuffix(" seconds")
    if elapsed != recorded_elapsed:
        raise SystemExit(f"{alarm_id}: runtime differs from elapsed_time.txt")
    git_state = (result_dir / "git_state.txt").read_text(encoding="utf-8").splitlines()
    proof_commit = git_state[0]
    resolution_class = (
        "CODE_REPAIR" if final["Resolution Type"] == "IMPLEMENTATION_REPAIR"
        else "SPECIFICATION_COMPLETION"
    )
    proof_mode = "QED_ONLY" if final["Qed"] == "VALID" else "EXTERNAL_PROVER"
    goals_total, goals_valid = (int(value) for value in final["Goals"].split("/"))
    goals_unknown = goals_total - goals_valid
    session_path = f"analysis/wp_phase/sessions/{alarm_id}"
    spec_change = "; ".join(
        value for value in (final["Function Contract?"], final["Interface Normalization?"])
        if value and value != "NO"
    )
    source_lines = (ROOT / inp["Repaired Source File"]).read_text(encoding="utf-8").splitlines()
    verified_lines = [
        str(index) for index, text in enumerate(source_lines, start=1)
        if inp["ACSL Label"] in text
    ]
    row: dict[str, object] = {
        "klee_target_id": alarm_id,
        "function": final["Function"],
        "wp_function": inp["Assertion Owner Function"],
        "source_file": repair["Original Source File"],
        "source_line": repair["Original Source Line"],
        "alarm_category": final["Eva Alarm Kind"],
        "source_expression": repair["Original Expression"],
        "original_eva_property": final["Original Eva Property"],
        "inserted_acsl_property": repair["Inserted ACSL Property"],
        "wp_property_name": final["ACSL Label"],
        "klee_status": "CONFIRMED_COUNTEREXAMPLE",
        "witness_reference": repair["KTest"],
        "target_error_reference": repair["Target Error Evidence"],
        "concrete_witness": final["KLEE Counterexample"],
        "semantic_decision": final["Resolution Type"],
        "resolution_type": resolution_class,
        "evidence_origin": final["Evidence Origin"],
        "original_source": inp["Original Source File"],
        "repaired_source": inp["Repaired Source File"],
        "current_assertion_line": inp["Current Assertion Line"],
        "verified_assertion_line": ";".join(verified_lines),
        "recorded_line_matches_current_source": (
            "YES" if verified_lines == [inp["Current Assertion Line"]] else "NO"
        ),
        "specification_change": spec_change or "NONE",
        "code_change_reference": final["Repair/Spec Commit"],
        "translation_unit_inputs": inp["Translation Unit Inputs"],
        "machine_model": inp["Machine Model"],
        "wp_model": inp["WP Model"],
        "wp_rte_used": "NO",
        "wp_status": final["Final WP Classification"],
        "proof_status": "VALID",
        "proof_mode": proof_mode,
        "qed_result": final["Qed"],
        "external_prover_required": "YES" if proof_mode == "EXTERNAL_PROVER" else "NO",
        "successful_prover": successful,
        "retained_json_alt_ergo_result": (
            "VALID" if any(name.startswith("Alt-Ergo:") for name in successful.split(";")) else "NOT_RECORDED_AS_SUCCESS"
        ),
        "retained_json_z3_result": (
            "VALID" if any(name.startswith("Z3:") for name in successful.split(";")) else "NOT_RECORDED_AS_SUCCESS"
        ),
        "retained_json_cvc5_result": (
            "VALID" if any(name.startswith("CVC5:") for name in successful.split(";")) else "NOT_RECORDED_AS_SUCCESS"
        ),
        "legacy_matrix_alt_ergo_result": final["Alt-Ergo"],
        "legacy_matrix_z3_result": final["Z3"],
        "legacy_matrix_cvc5_result": final["CVC5"],
        "goals_total": goals_total,
        "goals_valid": goals_valid,
        "goals_unknown": goals_unknown,
        "goals_timeout": 0,
        "runner_wall_time_seconds": elapsed,
        "qed_time_seconds": times["qed"],
        "alt_ergo_time_seconds": times["alt_ergo"],
        "z3_time_seconds": times["z3"],
        "cvc5_time_seconds": times["cvc5"],
        "session_path": session_path,
        "log_path": log_path,
        "report_json_path": report_path,
        "git_source_commit": PRE_REPAIR_SOURCE_COMMIT,
        "git_repair_commit": final["Repair/Spec Commit"],
        "git_proof_commit": proof_commit,
        "notes": final["Scientific Interpretation"],
    }
    normalized.append(row)
    provenance.append({
        "klee_target_id": alarm_id,
        "pre_repair_acsl_commit": PRE_REPAIR_SOURCE_COMMIT,
        "semantic_resolution_commit": final["Repair/Spec Commit"],
        "proof_execution_commit": proof_commit,
        "normalized_wp_branch_base": "9307d7b68ea4c9b1496cfd0160e337f739827edd",
        "base_branch": "analysis/eva-klee-final-shift-resolution",
        "base_branch_relation": "analysis/eva-klee-final-shift-resolution~1",
        "frozen_final_analysis_commit": "09e759283a6f1f9483cb560873e0b97d544fa714",
    })
    summary.append({
        "klee_target_id": alarm_id,
        "function": final["Function"],
        "resolution_type": resolution_class,
        "wp_property": final["ACSL Label"],
        "status": "VALID_QED" if proof_mode == "QED_ONLY" else "VALID_EXTERNAL_PROVER",
        "qed": final["Qed"],
        "successful_prover": successful,
        "goals_total": goals_total,
        "goals_valid": goals_valid,
        "goals_unknown": goals_unknown,
        "elapsed_seconds": elapsed,
        "qed_time_seconds": times["qed"],
        "alt_ergo_time_seconds": times["alt_ergo"],
        "z3_time_seconds": times["z3"],
        "cvc5_time_seconds": times["cvc5"],
        "result_dir": str(result_dir.relative_to(ROOT)),
    })

fields = list(normalized[0])
write_tsv(DATA / "wp_targets.tsv", normalized, fields)
(DATA / "wp_targets.json").write_text(
    json.dumps(normalized, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
)
write_tsv(DATA / "git_provenance.tsv", provenance, list(provenance[0]))
write_tsv(RESULTS / "summary.tsv", summary, list(summary[0]))

hash_targets = [
    DATA / "wp_targets.tsv",
    DATA / "wp_targets.json",
    DATA / "git_provenance.tsv",
    RESULTS / "summary.tsv",
    WP / "FINAL_WP_RESULTS_48.tsv",
    ROOT / "analysis" / "repair_phase" / "48_CONFIRMED_REPAIR_TARGETS.tsv",
    WP / "validation" / "WP_FINAL_FREEZE_AUDIT.md",
    ROOT / "reports" / "wp_phase" / "WP_TECHNICAL_REPORT.md",
    ROOT / "reports" / "wp_phase" / "WP_EXECUTIVE_SUMMARY.md",
    ROOT / "reports" / "wp_phase" / "WP_TARGET_PROOF_INVENTORY.md",
    ROOT / "reports" / "wp_phase" / "WP_COMMAND_REFERENCE.md",
]
(WP / "SHA256SUMS").write_text(
    "".join(f"{sha256(path)}  {path.relative_to(ROOT)}\n" for path in hash_targets),
    encoding="utf-8",
)
print(f"normalized_targets={len(normalized)}")
print(f"summary_rows={len(summary)}")
print(f"total_wall_seconds={sum(float(row['runner_wall_time_seconds']) for row in normalized):.9f}")
