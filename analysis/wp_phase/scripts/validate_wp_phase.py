#!/usr/bin/env python3
"""Validate the frozen WP experiment and its normalized audit artifacts."""

from __future__ import annotations

import csv
import hashlib
import json
import re
import subprocess
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
WP = ROOT / "analysis" / "wp_phase"
DATA = WP / "data"
RESULTS = WP / "results"


def read_tsv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def row_ids(rows: list[dict[str, str]], field: str) -> list[str]:
    return [row[field] for row in rows]


def normalized_expression(value: str) -> str:
    """Normalize only superficial ACSL/C spelling."""
    return re.sub(r"\s+", "", value).replace("(-2147483647-1)", "INT32_MIN")


errors: list[str] = []
final = read_tsv(WP / "FINAL_WP_RESULTS_48.tsv")
inputs = read_tsv(WP / "WP_TARGET_INPUTS.tsv")
repairs = read_tsv(ROOT / "analysis" / "repair_phase" / "48_CONFIRMED_REPAIR_TARGETS.tsv")
klee = read_tsv(ROOT / "analysis" / "klee_phase_c" / "results" / "summary.tsv")
targets = read_tsv(DATA / "wp_targets.tsv")
summary = read_tsv(RESULTS / "summary.tsv")
provenance = read_tsv(DATA / "git_provenance.tsv")
traceability = read_tsv(DATA / "wp_alarm_repair_traceability.tsv")
repair_catalog = read_tsv(DATA / "wp_repair_catalog.tsv")

collections = {
    "final WP matrix": (final, "KLEE Alarm ID"),
    "WP input matrix": (inputs, "KLEE Alarm ID"),
    "semantic-resolution matrix": (repairs, "KLEE Alarm ID"),
    "normalized target dataset": (targets, "klee_target_id"),
    "normalized result summary": (summary, "klee_target_id"),
    "git provenance": (provenance, "klee_target_id"),
    "alarm-to-repair traceability": (traceability, "klee_target_id"),
}
sets: dict[str, set[str]] = {}
for name, (rows, field) in collections.items():
    values = row_ids(rows, field)
    if len(rows) != 48:
        errors.append(f"{name}: expected 48 rows, found {len(rows)}")
    if len(set(values)) != len(values):
        errors.append(f"{name}: duplicate target ID")
    sets[name] = set(values)

klee_witness_ids = {
    row["alarm_id"] for row in klee if row["final_status"] == "CONFIRMED_COUNTEREXAMPLE"
}
if len(klee) != 149 or len(klee_witness_ids) != 48:
    errors.append(f"KLEE evidence: expected 149 rows/48 witnesses, found {len(klee)}/{len(klee_witness_ids)}")
for name, target_ids in sets.items():
    if target_ids != klee_witness_ids:
        errors.append(
            f"{name}: set differs from KLEE witnesses; "
            f"missing={sorted(klee_witness_ids - target_ids)}, extra={sorted(target_ids - klee_witness_ids)}"
        )

final_by_id = {row["KLEE Alarm ID"]: row for row in final}
inputs_by_id = {row["KLEE Alarm ID"]: row for row in inputs}
repairs_by_id = {row["KLEE Alarm ID"]: row for row in repairs}
targets_by_id = {row["klee_target_id"]: row for row in targets}
trace_by_id = {row["klee_target_id"]: row for row in traceability}
catalog_by_id = {row["repair_id"]: row for row in repair_catalog}

for alarm_id in sorted(klee_witness_ids):
    frozen = final_by_id[alarm_id]
    inp = inputs_by_id[alarm_id]
    repair = repairs_by_id[alarm_id]
    target = targets_by_id[alarm_id]
    trace = trace_by_id[alarm_id]
    property_values = [
        frozen["Original Eva Property"], inp["Eva Safety Property"],
        repair["Raw Eva Property"], target["original_eva_property"],
    ]
    if len({normalized_expression(value) for value in property_values}) != 1:
        errors.append(f"{alarm_id}: original property identity differs across retained evidence")
    labels = {frozen["ACSL Label"], inp["ACSL Label"], repair["ACSL Label"], target["wp_property_name"]}
    if len(labels) != 1:
        errors.append(f"{alarm_id}: ACSL label differs across retained evidence")
    if normalized_expression(trace["original_property"]) != normalized_expression(target["original_eva_property"]):
        errors.append(f"{alarm_id}: traceability original property differs from normalized target")
    if trace["wp_property_label"] != target["wp_property_name"]:
        errors.append(f"{alarm_id}: traceability WP label differs from normalized target")
    if trace["property_identity_preserved"] != "YES":
        errors.append(f"{alarm_id}: property identity is not marked preserved")
    if trace["wp_status"] != "VALID":
        errors.append(f"{alarm_id}: traceability WP status is not VALID")
    if trace["repair_id"] not in catalog_by_id:
        errors.append(f"{alarm_id}: unknown repair catalog ID {trace['repair_id']}")
    if trace["repair_commit"] != target["git_repair_commit"]:
        errors.append(f"{alarm_id}: repair commit differs from normalized target")
    for field in ("repair_id", "repair_commit", "repair_parent_commit", "changed_files"):
        if not trace[field] or trace[field] == "NOT_AVAILABLE_IN_RETAINED_EVIDENCE":
            errors.append(f"{alarm_id}: missing mandatory traceability field {field}")
    for path_field in ("klee_ktest_path", "klee_error_path"):
        path = ROOT / trace[path_field]
        if not path.is_file():
            errors.append(f"{alarm_id}: missing retained witness artifact {trace[path_field]}")
    if trace["resolution_type"] == "CODE_REPAIR":
        if trace["changed_source_before"] == "NOT_AVAILABLE_IN_RETAINED_EVIDENCE" or trace["changed_source_after"] == "NOT_AVAILABLE_IN_RETAINED_EVIDENCE":
            errors.append(f"{alarm_id}: Code Repair lacks exact before/after evidence")
    elif trace["resolution_type"] == "SPECIFICATION_COMPLETION":
        for field in ("resolution_provenance", "specification_after", "resolution_rationale"):
            if not trace[field] or trace[field] == "NOT_AVAILABLE_IN_RETAINED_EVIDENCE":
                errors.append(f"{alarm_id}: Specification Completion lacks {field}")
        if trace["specification_weakening_audit"] != "PASS_DOMAIN_CONSTRAINT_NOT_TARGET_PROPERTY":
            errors.append(f"{alarm_id}: Specification Completion weakening audit did not pass")

    repaired_source = ROOT / inp["Repaired Source File"]
    if not repaired_source.is_file():
        errors.append(f"{alarm_id}: missing repaired source {repaired_source.relative_to(ROOT)}")
    else:
        source_lines = repaired_source.read_text(encoding="utf-8").splitlines()
        actual_lines = [index for index, text in enumerate(source_lines, start=1) if inp["ACSL Label"] in text]
        if len(actual_lines) != 1:
            errors.append(f"{alarm_id}: ACSL target label is not unique in repaired source")
        elif target["verified_assertion_line"] != str(actual_lines[0]):
            errors.append(f"{alarm_id}: normalized verified assertion line is stale")

    report_path = ROOT / target["report_json_path"]
    log_path = ROOT / target["log_path"]
    if not report_path.is_file() or not log_path.is_file():
        errors.append(f"{alarm_id}: missing retained report/log evidence")
        continue
    report = json.loads(report_path.read_text(encoding="utf-8"))
    if len(report) != 1:
        errors.append(f"{alarm_id}: selected-property JSON contains {len(report)} goals")
        continue
    goal = report[0]
    if int(goal.get("passed", 0)) != 1:
        errors.append(f"{alarm_id}: retained JSON goal is not passed")
    if inp["ACSL Label"] not in str(goal.get("property", "")):
        errors.append(f"{alarm_id}: retained JSON goal does not name selected property")

    result_dir = report_path.parent
    command = (result_dir / "command.txt").read_text(encoding="utf-8")
    required_command_fragments = [
        "-machdep ppc_32", "-wp ", f"-wp-fct {inp['Assertion Owner Function']}",
        f"-wp-prop {inp['ACSL Label']}", "-wp-model Typed+int",
        "-wp-prover alt-ergo\\,z3\\,cvc5", "-wp-run-all-provers", "-wp-par 1",
        "-wp-timeout 120", "-wp-memlimit 2000", "-wp-cache rebuild",
        "-wp-report-json", "-wp-proof-trace", "-wp-status",
    ]
    for fragment in required_command_fragments:
        if fragment not in command:
            errors.append(f"{alarm_id}: retained command lacks {fragment!r}")
    if re.search(r"(?:^|\s)-wp-rte(?:\s|$)", command):
        errors.append(f"{alarm_id}: retained command unexpectedly used -wp-rte")

    # Exact equality is an automatic red flag for assuming the conclusion.
    # The retained semantic rationale remains the authoritative human review.
    if target["resolution_type"] == "SPECIFICATION_COMPLETION":
        contract = frozen["Function Contract?"].removeprefix("YES — ")
        if normalized_expression(contract) == normalized_expression(frozen["Original Eva Property"]):
            errors.append(f"{alarm_id}: function contract directly assumes the target property")

resolution_counts = Counter(row["resolution_type"] for row in targets)
proof_mode_counts = Counter(row["proof_mode"] for row in targets)
status_counts = Counter(row["proof_status"] for row in targets)
summary_status_counts = Counter(row["status"] for row in summary)
spec_provenance_counts = Counter(
    row["evidence_origin"] for row in targets
    if row["resolution_type"] == "SPECIFICATION_COMPLETION"
)
successful_prover_counts = Counter(row["successful_prover"] for row in targets)
line_match_counts = Counter(row["recorded_line_matches_current_source"] for row in targets)
if resolution_counts != Counter({"CODE_REPAIR": 35, "SPECIFICATION_COMPLETION": 13}):
    errors.append(f"unexpected semantic-resolution counts: {dict(resolution_counts)}")
if proof_mode_counts != Counter({"QED_ONLY": 35, "EXTERNAL_PROVER": 13}):
    errors.append(f"unexpected proof-mode counts: {dict(proof_mode_counts)}")
if status_counts != Counter({"VALID": 48}):
    errors.append(f"unexpected normalized proof statuses: {dict(status_counts)}")
if summary_status_counts != Counter({"VALID_QED": 35, "VALID_EXTERNAL_PROVER": 13}):
    errors.append(f"unexpected summary statuses: {dict(summary_status_counts)}")
if spec_provenance_counts != Counter({"THESIS_POLICY_SELECTED": 8, "REPOSITORY_INFERRED": 5}):
    errors.append(f"unexpected specification provenance: {dict(spec_provenance_counts)}")
if successful_prover_counts != Counter({"qed": 35, "Alt-Ergo:2.6.2": 12, "Z3:4.8.12": 1}):
    errors.append(f"unexpected successful-prover attribution: {dict(successful_prover_counts)}")
if line_match_counts != Counter({"YES": 35, "NO": 13}):
    errors.append(f"unexpected recorded/current line reconciliation: {dict(line_match_counts)}")
if Counter(row["alarm_category"] for row in targets) != Counter({"integer overflow": 29, "invalid shift": 19}):
    errors.append("unexpected WP target-category inventory (division-by-zero must remain absent)")
if Counter(row["eva_category"] for row in traceability) != Counter({"integer overflow": 29, "invalid shift": 19}):
    errors.append("unexpected traceability category inventory")
if Counter(row["resolution_type"] for row in traceability) != Counter({"CODE_REPAIR": 35, "SPECIFICATION_COMPLETION": 13}):
    errors.append("unexpected traceability semantic-resolution inventory")
if Counter(
    row["resolution_provenance"] for row in traceability
    if row["resolution_type"] == "SPECIFICATION_COMPLETION"
) != Counter({"THESIS_POLICY_SELECTED": 8, "REPOSITORY_INFERRED": 5}):
    errors.append("unexpected traceability specification provenance")
if Counter(row["wp_status"] for row in traceability) != Counter({"VALID": 48}):
    errors.append("unexpected traceability WP status inventory")
if Counter(row["qed_only"] for row in traceability) != Counter({"YES": 35, "NO": 13}):
    errors.append("unexpected traceability Qed/external inventory")
if Counter(row["successful_prover"] for row in traceability) != Counter({"qed": 35, "Alt-Ergo:2.6.2": 12, "Z3:4.8.12": 1}):
    errors.append("unexpected traceability successful-prover attribution")
if len(repair_catalog) != 13 or len(catalog_by_id) != 13:
    errors.append(f"repair catalog: expected 13 unique rows, found {len(repair_catalog)}/{len(catalog_by_id)}")
if Counter(row["resolution_type"] for row in repair_catalog) != Counter({"CODE_REPAIR": 6, "SPECIFICATION_COMPLETION": 7}):
    errors.append("unexpected unique repair catalog split")
for item in repair_catalog:
    commit = item["commit"]
    parent = item["parent_commit"]
    for revision in (commit, parent):
        if subprocess.run(["git", "cat-file", "-e", f"{revision}^{{commit}}"], cwd=ROOT, check=False).returncode:
            errors.append(f"{item['repair_id']}: missing Git commit {revision}")
    if item["before_code"] == "NOT_AVAILABLE_IN_RETAINED_EVIDENCE" or item["after_code"] == "NOT_AVAILABLE_IN_RETAINED_EVIDENCE":
        errors.append(f"{item['repair_id']}: missing before/after code")
    expected_ids = set(item["affected_alarm_ids"].split(";"))
    actual_ids = {row["klee_target_id"] for row in traceability if row["repair_id"] == item["repair_id"]}
    if expected_ids != actual_ids:
        errors.append(f"{item['repair_id']}: catalog/traceability alarm membership differs")
for row in provenance:
    if row["base_branch"] != "analysis/eva-klee-final-shift-resolution":
        errors.append(f"{row['klee_target_id']}: incorrect base branch provenance")
    if row["base_commit"] != "9307d7b68ea4c9b1496cfd0160e337f739827edd":
        errors.append(f"{row['klee_target_id']}: incorrect base commit provenance")

total = sum(float(row["runner_wall_time_seconds"]) for row in targets)
if abs(total - 183.910237408) > 0.0000005:
    errors.append(f"historical runner-wall total differs: {total:.9f}")

hash_manifest = WP / "SHA256SUMS"
if not hash_manifest.is_file():
    errors.append("missing SHA256SUMS")
else:
    for line in hash_manifest.read_text(encoding="utf-8").splitlines():
        expected, relative = line.split("  ", 1)
        path = ROOT / relative
        actual = hashlib.sha256(path.read_bytes()).hexdigest() if path.is_file() else "MISSING"
        if actual != expected:
            errors.append(f"checksum mismatch: {relative}")

shell_files = sorted(WP.rglob("*.sh"))
for script in shell_files:
    if subprocess.run(["bash", "-n", str(script)], check=False).returncode:
        errors.append(f"bash -n failed: {script.relative_to(ROOT)}")

if errors:
    print("VALIDATION: FAIL")
    raise SystemExit("\n".join(f"- {error}" for error in errors))

print("KLEE campaign rows=149")
print("KLEE witness targets=48")
print("Semantic decisions=48")
print("WP targets=48")
print("Set equality=PASS")
print("Duplicate target IDs=0")
print("Missing targets=0")
print("Unexpected targets=0")
print("Code Repair=35")
print("Specification Completion=13")
print("Specification repository-inferred=5")
print("Specification thesis-policy-selected=8")
print("VALID=48")
print("Qed-only=35")
print("External prover=13")
print("Alt-Ergo successful=12")
print("Z3 successful=1")
print("CVC5 successful=0")
print("Unknown=0")
print("Timeout=0")
print("Failure=0")
print(f"Historical runner wall time={total:.9f} seconds")
print(f"Shell scripts passing bash -n={len(shell_files)}")
print("Property identity checks=48")
print("Traceability rows=48")
print("Unique resolution diffs=13")
print("Code Repair before/after evidence=35")
print("Specification Completion before/after evidence=13")
print("Witness KTest/error evidence=48")
print("Historical/current assertion-line reconciliations=13")
print("Retained JSON proof reports=48")
print("VALIDATION: PASS")
