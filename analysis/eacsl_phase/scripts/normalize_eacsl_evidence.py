#!/usr/bin/env python3
"""Normalize the frozen E-ACSL experiment from primary repository evidence.

No Frama-C, E-ACSL, compiler, or runtime execution is performed here.  The
historical static/dynamic datasets come from the tagged E-ACSL lineage; seven
small raw violation artifacts are recovered from the retained Git objects that
contain the original campaign work directory.
"""

from __future__ import annotations

import csv
import hashlib
import io
import json
import math
import re
import statistics
import subprocess
from collections import Counter, defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
PHASE = ROOT / "analysis" / "eacsl_phase"
DATA = PHASE / "data"
RESULTS = PHASE / "results"
EVIDENCE = PHASE / "evidence" / "historical"
VALIDATION = PHASE / "validation"

HISTORICAL_STATIC_COMMIT = "3c307992ec1f8ee1839b1ef675e9d6c63519146e"
HISTORICAL_RUNTIME_COMMIT = "4f31f893a17c71af197d186dedb9341842279699"
HISTORICAL_FINAL_COMMIT = "66169432bfcc381ed5c2ad97079e5ffc69a1b085"
RAW_ARTIFACT_COMMIT = "1adf3521b1faf5f56fde5e7348e49be59be3f812"
SOURCE_COMMIT = "09e759283a6f1f9483cb560873e0b97d544fa714"
UPSTREAM_WP_COMMIT = "e79f62404a280add6f5bc63610a9fe1803e37c16"
NOT_AVAILABLE = "NOT_AVAILABLE_IN_RETAINED_EVIDENCE"


def read_tsv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def git_text(commit: str, path: str) -> str:
    return subprocess.run(
        ["git", "show", f"{commit}:{path}"], cwd=ROOT, check=True,
        stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True,
    ).stdout


def git_bytes(commit: str, path: str) -> bytes:
    return subprocess.run(
        ["git", "show", f"{commit}:{path}"], cwd=ROOT, check=True,
        stdout=subprocess.PIPE, stderr=subprocess.PIPE,
    ).stdout


def historical_tsv(path: str, commit: str = HISTORICAL_FINAL_COMMIT) -> list[dict[str, str]]:
    return list(csv.DictReader(io.StringIO(git_text(commit, path)), delimiter="\t"))


def write_tsv(path: Path, rows: list[dict[str, object]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        writer.writerows(
            {key: str(value).replace("\n", "\\n") for key, value in row.items()}
            for row in rows
        )


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def percentile(values: list[float], fraction: float) -> float:
    ordered = sorted(values)
    position = (len(ordered) - 1) * fraction
    lower, upper = math.floor(position), math.ceil(position)
    if lower == upper:
        return ordered[lower]
    return ordered[lower] + (ordered[upper] - ordered[lower]) * (position - lower)


def statistics_row(name: str, values: list[float]) -> dict[str, object]:
    return {
        "metric": name, "count": len(values), "total": f"{sum(values):.9f}",
        "mean": f"{statistics.fmean(values):.9f}", "median": f"{statistics.median(values):.9f}",
        "minimum": f"{min(values):.9f}", "maximum": f"{max(values):.9f}",
        "stddev": f"{statistics.stdev(values):.9f}" if len(values) > 1 else "0.000000000",
        "p25": f"{percentile(values, .25):.9f}", "p75": f"{percentile(values, .75):.9f}",
        "p90": f"{percentile(values, .90):.9f}", "p95": f"{percentile(values, .95):.9f}",
    }


def current_label_lines(source_file: str, label: str) -> list[int]:
    lines = (ROOT / source_file).read_text(encoding="utf-8").splitlines()
    return [index for index, text in enumerate(lines, 1) if label in text]


def main() -> None:
    for directory in (DATA, RESULTS, EVIDENCE, VALIDATION):
        directory.mkdir(parents=True, exist_ok=True)
    properties = read_tsv(ROOT / "analysis/repair_phase/149_ACSL_PROPERTY_MAP.tsv")
    klee_rows = read_tsv(ROOT / "analysis/klee_phase_c/results/summary.tsv")
    wp_rows = read_tsv(ROOT / "analysis/wp_phase/data/wp_targets.tsv")
    observations = historical_tsv("analysis/eacsl_runtime/results/RUNTIME_PROPERTY_OBSERVATIONS.tsv")
    static_runs = historical_tsv("analysis/eacsl_selective/results/STATIC_RAW_RUNS.tsv")
    runtime_runs = historical_tsv("analysis/eacsl_runtime/results/PERFORMANCE_RAW_RUNS.tsv")
    runtime_summary_source = git_text(HISTORICAL_FINAL_COMMIT, "analysis/eacsl_runtime/results/PERFORMANCE_SUMMARY.tsv")
    static_summary_source = git_text(HISTORICAL_FINAL_COMMIT, "analysis/eacsl_selective/results/STATIC_SUMMARY.tsv")

    all_by_id = {row["KLEE Alarm ID"]: row for row in properties}
    klee_by_id = {row["alarm_id"]: row for row in klee_rows}
    wp_by_id = {row["klee_target_id"]: row for row in wp_rows}
    observation_by_id = {row["KLEE Alarm ID"]: row for row in observations}
    all_ids, wp_ids = set(all_by_id), set(wp_by_id)
    selected_ids = all_ids - wp_ids
    no_witness_ids = {row["alarm_id"] for row in klee_rows if row["final_status"] == "NO_COUNTEREXAMPLE_FOUND"}
    timeout_ids = {row["alarm_id"] for row in klee_rows if row["final_status"] == "INCONCLUSIVE_TIMEOUT"}
    if not (
        len(all_ids) == 149 and len(wp_ids) == 48 and len(selected_ids) == 101
        and not (wp_ids & selected_ids) and wp_ids | selected_ids == all_ids
        and selected_ids == no_witness_ids | timeout_ids and not (no_witness_ids & timeout_ids)
        and len(no_witness_ids) == 15 and len(timeout_ids) == 86
    ):
        raise SystemExit("149/48/101 exact-set reconciliation failed")
    if set(observation_by_id) != selected_ids:
        raise SystemExit("historical observation set differs from selected 101")

    selection: list[dict[str, object]] = []
    targets: list[dict[str, object]] = []
    for alarm_id in sorted(all_ids):
        source = all_by_id[alarm_id]
        klee = klee_by_id[alarm_id]
        selected = alarm_id in selected_ids
        label = source["ACSL Label"]
        actual_lines = current_label_lines(source["Repaired Source File"], label)
        if len(actual_lines) != 1:
            raise SystemExit(f"{alarm_id}: current ACSL label is not unique")
        selection.append({
            "alarm_id": alarm_id,
            "property_label": label,
            "klee_status": klee["final_status"],
            "wp_status": wp_by_id[alarm_id]["proof_status"] if alarm_id in wp_ids else "NOT_WP_TARGET",
            "selected_for_eacsl": "YES" if selected else "NO",
            "selection_reason": "UNRESOLVED_AFTER_KLEE_WP" if selected else "WP_PROVED",
            "wp_evidence": wp_by_id[alarm_id]["report_json_path"] if alarm_id in wp_ids else "NOT_APPLICABLE",
        })
        if not selected:
            continue
        obs = observation_by_id[alarm_id]
        violated = obs["Classification"] == "VIOLATION_OBSERVED"
        targets.append({
            "alarm_id": alarm_id,
            "property_label": label,
            "function": source["Function"],
            "source_file": source["Repaired Source File"],
            "historical_source_line": source["Current Assertion Location"].rsplit(":", 1)[-1],
            "current_source_line": actual_lines[0],
            "property_category": source["Alarm Kind"],
            "source_expression": source["Original Expression"],
            "property_text": source["Inserted ACSL Property"],
            "eva_status": "REMAINING_HIGH_PRECISION_PROPERTY",
            "klee_status": klee["final_status"],
            "klee_witness_status": "NO_WITNESS" if alarm_id in no_witness_ids else "INCONCLUSIVE_TIMEOUT",
            "wp_target": "NO",
            "wp_status": "NOT_WP_TARGET",
            "wp_exclusion_reason": "NO_COMPLETED_WP_PROOF",
            "eacsl_selected": "YES",
            "instrumentation_label": label,
            "instrumentation_source": f"analysis/eacsl_phase/work/generated/selective/sources/{Path(source['Repaired Source File']).name}",
            "instrumentation_line": actual_lines[0],
            "runtime_scenario": "SELECTIVE_PROPERTY_OBSERVATION",
            "runtime_status": obs["Classification"],
            "violation_observed": "YES" if violated else "NO",
            "violation_count": 1 if violated else 0,
            "first_violation_input": obs["Inputs"] if violated else NOT_AVAILABLE,
            "violation_artifact": f"analysis/eacsl_phase/evidence/historical/violations/{obs['Case ID']}/stderr.txt" if violated else "NOT_APPLICABLE",
            "execution_count": 1,
            "instrumentation_time": NOT_AVAILABLE,
            "compile_time": NOT_AVAILABLE,
            "runtime_time": NOT_AVAILABLE,
            "binary_size": NOT_AVAILABLE,
            "instrumented_binary_size": NOT_AVAILABLE,
            "result_dir": obs["Evidence Directory"],
            "input_id": obs["Case ID"],
            "input_values": obs["Inputs"],
            "input_origin": obs["Input Origin"],
            "historical_evidence_commit": HISTORICAL_RUNTIME_COMMIT,
            "notes": obs["Notes"],
        })

    target_fields = list(targets[0])
    write_tsv(DATA / "eacsl_targets.tsv", targets, target_fields)
    write_json(DATA / "eacsl_targets.json", targets)
    write_tsv(DATA / "eacsl_selection_matrix.tsv", selection, list(selection[0]))

    # Recover exact raw output for the seven directly matched violations.
    violation_rows: list[dict[str, object]] = []
    violation_observations = [row for row in observations if row["Classification"] == "VIOLATION_OBSERVED"]
    for index, obs in enumerate(violation_observations, 1):
        case_id, alarm_id = obs["Case ID"], obs["KLEE Alarm ID"]
        base = f"analysis/eacsl_runtime/work/property_observation/20260821-084410Z/cases/{case_id}"
        evidence_dir = EVIDENCE / "violations" / case_id
        evidence_dir.mkdir(parents=True, exist_ok=True)
        for name in ("stdout.txt", "stderr.txt", "exit_code.txt"):
            (evidence_dir / name).write_bytes(git_bytes(RAW_ARTIFACT_COMMIT, f"{base}/{name}"))
        raw_stderr = (evidence_dir / "stderr.txt").read_text(encoding="utf-8")
        source = all_by_id[alarm_id]
        generated_line_match = re.search(r"sources/[^:]+:(\d+): Error", raw_stderr)
        violation_rows.append({
            "violation_id": f"EACSL-VIOLATION-{index:04d}",
            "alarm_id": alarm_id,
            "property_label": obs["ACSL Label"],
            "function": obs["Function"],
            "property_category": obs["Alarm Kind"],
            "property_text": obs["Predicate"],
            "prior_klee_status": klee_by_id[alarm_id]["final_status"],
            "prior_wp_status": "NOT_WP_TARGET",
            "scenario": "SELECTIVE_PROPERTY_OBSERVATION",
            "input_id": case_id,
            "input_values": obs["Inputs"],
            "event_type": "E_ACSL_ASSERTION_FAILURE",
            "runtime_message": obs["Stderr Excerpt"],
            "source_file": source["Repaired Source File"],
            "source_line": current_label_lines(source["Repaired Source File"], obs["ACSL Label"])[0],
            "generated_runtime_line": generated_line_match.group(1) if generated_line_match else NOT_AVAILABLE,
            "execution_log": f"analysis/eacsl_phase/evidence/historical/violations/{case_id}/stderr.txt",
            "raw_event": raw_stderr.strip(),
            "exit_status": obs["Exit Code"],
            "reaction_policy": "ABORT_ON_FIRST_FAILED_ASSERTION",
            "first_observed_at": "2026-08-21T08:44:10Z_CAMPAIGN",
            "occurrence_count": 1,
            "historical_source_commit": SOURCE_COMMIT,
            "raw_artifact_git_commit": RAW_ARTIFACT_COMMIT,
            "notes": "Direct target-label match; runtime evidence is distinct from a KLEE symbolic witness.",
        })
    write_tsv(DATA / "runtime_violations.tsv", violation_rows, list(violation_rows[0]))
    write_json(DATA / "runtime_violations.json", violation_rows)

    # Normalize both static instrumentation and dynamic runtime raw measurements.
    scenario_map = {
        "S0_CONTROL": ("UNINSTRUMENTED", 0), "S1_EVA_ALL_149": ("FULL", 149),
        "S2_WP_PRUNED_101": ("SELECTIVE", 101), "S0": ("UNINSTRUMENTED", 0),
        "S1": ("FULL", 149), "S2": ("SELECTIVE", 101),
    }
    executable_sizes = {"S0": "162408", "S1": "812360", "S2": "792200"}
    measurements: list[dict[str, object]] = []
    for static_index, row in enumerate(static_runs, 1):
        mode, count = scenario_map[row["Scenario"]]
        instrumentation = row["Instrumentation Wall Seconds"]
        if mode == "UNINSTRUMENTED":
            instrumentation = row["Control Generation Wall Seconds"]
        measurements.append({
            "measurement_kind": "STATIC_INSTRUMENTATION",
            "function_or_scenario": row["Scenario"],
            "run_index": row["Repeat"],
            "instrumentation_mode": mode,
            "property_count": count,
            "instrumentation_time_seconds": instrumentation,
            "compile_time_seconds": row["Compilation Wall Seconds"],
            "runtime_time_seconds": NOT_AVAILABLE,
            "max_rss_kib": row["Instrumentation Peak RSS KiB"],
            "binary_size_bytes": row["Object File Bytes"],
            "input_workload": "STATIC_TRANSLATION_AND_NATIVE_OBJECT_COMPILATION",
            "machine_environment": "HISTORICAL_2026-08-21_X86_64; instrumentation machdep=ppc_32",
            "source_revision": SOURCE_COMMIT,
            "status": row["Status"],
            "evidence_path": f"analysis/eacsl_phase/evidence/historical/static_raw_runs.tsv#row={static_index}",
            "notes": "Object size is a relocatable-object proxy, not executable size.",
        })
    for runtime_index, row in enumerate(runtime_runs, 1):
        mode, count = scenario_map[row["Scenario"]]
        measurements.append({
            "measurement_kind": "DYNAMIC_RUNTIME",
            "function_or_scenario": row["Scenario"],
            "run_index": row["Round"],
            "instrumentation_mode": mode,
            "property_count": count,
            "instrumentation_time_seconds": NOT_AVAILABLE,
            "compile_time_seconds": NOT_AVAILABLE,
            "runtime_time_seconds": row["Wall Seconds"],
            "max_rss_kib": row["Max RSS KiB"],
            "binary_size_bytes": executable_sizes[row["Scenario"]],
            "input_workload": "THESIS_CONTROLLED_WORKLOAD; seed=20260821; iterations=100000",
            "machine_environment": "HISTORICAL_2026-08-21_X86_64; native runtime model=x86_64",
            "source_revision": SOURCE_COMMIT,
            "status": row["Status"],
            "evidence_path": f"analysis/eacsl_phase/evidence/historical/runtime_raw_runs.tsv#row={runtime_index}",
            "notes": "Historical measured run; no performance-corpus violation.",
        })
    write_tsv(DATA / "performance_measurements.tsv", measurements, list(measurements[0]))

    stats: list[dict[str, object]] = []
    for kind, field in (("STATIC_INSTRUMENTATION", "instrumentation_time_seconds"), ("DYNAMIC_RUNTIME", "runtime_time_seconds")):
        for mode in ("UNINSTRUMENTED", "FULL", "SELECTIVE"):
            values = [float(row[field]) for row in measurements if row["measurement_kind"] == kind and row["instrumentation_mode"] == mode and row[field] != NOT_AVAILABLE]
            if values:
                result = statistics_row(f"{kind}:{mode}", values)
                result["value_semantics"] = field
                stats.append(result)
    write_tsv(DATA / "performance_summary.tsv", stats, list(stats[0]))

    summary: list[dict[str, object]] = []
    for row in targets:
        summary.append({
            "alarm_id": row["alarm_id"], "function": row["function"],
            "klee_status": row["klee_status"], "wp_status": row["wp_status"],
            "eacsl_selected": "YES", "runtime_status": row["runtime_status"],
            "violation_count": row["violation_count"], "scenario": row["runtime_scenario"],
            "elapsed_seconds": NOT_AVAILABLE, "evidence_path": row["violation_artifact"] if row["violation_observed"] == "YES" else f"analysis/eacsl_phase/evidence/historical/runtime_observations.tsv#{row['input_id']}",
        })
    write_tsv(RESULTS / "summary.tsv", summary, list(summary[0]))

    provenance = [{
        "upstream_wp_branch": "analysis/wp-verification",
        "upstream_wp_commit": UPSTREAM_WP_COMMIT,
        "source_commit": SOURCE_COMMIT,
        "source_equivalence": "src_repaired byte-identical between source_commit and upstream_wp_commit",
        "historical_static_branch": "analysis/eacsl-selective-instrumentation",
        "historical_static_commit": HISTORICAL_STATIC_COMMIT,
        "historical_runtime_branch": "analysis/eacsl-runtime-property-isolation",
        "historical_runtime_commit": HISTORICAL_RUNTIME_COMMIT,
        "historical_final_branch": "analysis/eacsl-selective-runtime",
        "historical_final_commit": HISTORICAL_FINAL_COMMIT,
        "eacsl_tool_type": "STOCK_FRAMA_C_E_ACSL",
        "eacsl_tool_repo": "OPAM_PACKAGE:frama-c",
        "eacsl_tool_commit": "NOT_APPLICABLE_TO_BINARY_PACKAGE",
        "eacsl_tool_tag": "33.0_Arsenic",
        "runtime_revision": "Frama-C/E-ACSL 33.0 installed runtime",
        "custom_eacsl2_used": "NO",
        "raw_artifact_commit": RAW_ARTIFACT_COMMIT,
        "analysis_branch": "analysis/eacsl-runtime-monitoring",
    }]
    write_tsv(DATA / "git_provenance.tsv", provenance, list(provenance[0]))

    # Preserve exact historical aggregate sources and the exact historical harness/corpora.
    source_copies = {
        "static_raw_runs.tsv": "analysis/eacsl_selective/results/STATIC_RAW_RUNS.tsv",
        "static_summary.tsv": "analysis/eacsl_selective/results/STATIC_SUMMARY.tsv",
        "runtime_raw_runs.tsv": "analysis/eacsl_runtime/results/PERFORMANCE_RAW_RUNS.tsv",
        "runtime_summary.tsv": "analysis/eacsl_runtime/results/PERFORMANCE_SUMMARY.tsv",
        "runtime_observations.tsv": "analysis/eacsl_runtime/results/RUNTIME_PROPERTY_OBSERVATIONS.tsv",
        "observation_cases.tsv": "analysis/eacsl_runtime/corpus/property_observation/RUNTIME_OBSERVATION_CASES.tsv",
        "performance_input_corpus.tsv": "analysis/eacsl_runtime/corpus/PERFORMANCE_INPUT_CORPUS.tsv",
        "historical_runtime_environment.md": "analysis/eacsl_runtime/environment/RUNTIME_ENVIRONMENT.md",
        "runtime_101_retention_audit.tsv": "analysis/eacsl_selective/results/RUNTIME_101_RETENTION_AUDIT.tsv",
        "wp_48_elimination_audit.tsv": "analysis/eacsl_selective/results/WP_48_INSTRUMENTATION_ELIMINATION_AUDIT.tsv",
        "property_count_metrics.tsv": "analysis/eacsl_selective/results/PROPERTY_COUNT_METRICS.tsv",
        "performance_run_order.tsv": "analysis/eacsl_runtime/results/PERFORMANCE_RUN_ORDER.tsv",
        "functional_equivalence_audit.tsv": "analysis/eacsl_runtime/results/FUNCTIONAL_EQUIVALENCE_AUDIT.tsv",
        "performance_campaign_metadata.txt": "analysis/eacsl_runtime/results/PERFORMANCE_CAMPAIGN_METADATA.txt",
    }
    EVIDENCE.mkdir(parents=True, exist_ok=True)
    for destination, source_path in source_copies.items():
        (EVIDENCE / destination).write_text(git_text(HISTORICAL_FINAL_COMMIT, source_path), encoding="utf-8")
    harness_path = PHASE / "scenarios" / "harness" / "thesis_runtime_harness.c"
    harness_path.parent.mkdir(parents=True, exist_ok=True)
    harness_path.write_text(git_text(HISTORICAL_FINAL_COMMIT, "analysis/eacsl_runtime/harness/thesis_runtime_harness.c"), encoding="utf-8")
    # Avoid unused local variables while making the exact source copies explicit.
    assert runtime_summary_source and static_summary_source

    (RESULTS / "environment.txt").write_text(
        "HISTORICAL_EXPERIMENT_DATE_UTC=2026-08-21\n"
        "TOOL_TYPE=STOCK_FRAMA_C_E_ACSL\nFRAMAC_VERSION=33.0 (Arsenic)\n"
        "EACSL_VERSION=Frama-C 33.0 bundled E-ACSL\nCUSTOM_EACSL2_USED=NO\n"
        "STATIC_INSTRUMENTATION_MACHDEP=ppc_32\nDYNAMIC_RUNTIME_MACHDEP=x86_64\n"
        "HOST_ARCH=x86_64\nGCC_VERSION=13.3.0\nSTATIC_REPEATS=10\n"
        "PERFORMANCE_WARMUPS_PER_SCENARIO=5\nPERFORMANCE_WARMUP_EXECUTIONS_TOTAL=15\n"
        "PERFORMANCE_MEASURED_RUNS=30 per scenario\nFUNCTIONAL_SANITY_EXECUTIONS=3\n"
        "PERFORMANCE_SEED=20260821\nPERFORMANCE_ITERATIONS=100000\nCPU_PINNING=CPU 0\n"
        "RUNTIME_REACTION=abort on first failed assertion\n"
        f"SOURCE_COMMIT={SOURCE_COMMIT}\nHISTORICAL_STATIC_COMMIT={HISTORICAL_STATIC_COMMIT}\n"
        f"HISTORICAL_RUNTIME_COMMIT={HISTORICAL_RUNTIME_COMMIT}\n",
        encoding="utf-8",
    )

    static_full = [float(row["Instrumentation Wall Seconds"]) for row in static_runs if row["Scenario"] == "S1_EVA_ALL_149"]
    static_selective = [float(row["Instrumentation Wall Seconds"]) for row in static_runs if row["Scenario"] == "S2_WP_PRUNED_101"]
    runtime_full = [float(row["Wall Seconds"]) for row in runtime_runs if row["Scenario"] == "S1"]
    runtime_selective = [float(row["Wall Seconds"]) for row in runtime_runs if row["Scenario"] == "S2"]
    static_reduction = (statistics.median(static_full) - statistics.median(static_selective)) / statistics.median(static_full) * 100
    runtime_reduction = (statistics.median(runtime_full) - statistics.median(runtime_selective)) / statistics.median(runtime_full) * 100
    classifications = Counter(row["Classification"] for row in observations)
    (VALIDATION / "EACSL_NUMERIC_RECONCILIATION.md").write_text(
        "# E-ACSL Numeric Reconciliation\n\n"
        "- High-Precision IDs: **149**\n- WP-proved IDs: **48**\n- E-ACSL selected IDs: **101**\n"
        "- Exact relation: `149 - 48 = 101`\n- KLEE completed/no-witness: **15**\n"
        "- KLEE timeout/inconclusive: **86**\n- Exact relation: `15 + 86 = 101`\n"
        "- `WP ∩ EACSL = ∅`: **PASS**\n- `WP ∪ EACSL = High Precision`: **PASS**\n"
        f"- Runtime executions (property-observation cases): **{len(observations)}**\n"
        f"- Unique violated targets/events: **{classifications['VIOLATION_OBSERVED']}/7**\n"
        f"- No violation observed: **{classifications['NO_VIOLATION_OBSERVED']}**\n"
        f"- Not reached because another check aborted first: **{classifications['NOT_REACHED']}**\n"
        f"- Ambiguous output: **{classifications['AMBIGUOUS_OUTPUT']}**\n\n"
        "Thus 94 targets had no direct target-matched violation, but only 48 were "
        "`NO_VIOLATION_OBSERVED`; 42 were `NOT_REACHED` and 4 were `AMBIGUOUS_OUTPUT`.\n\n"
        "`NO_VIOLATION_OBSERVED` is not a proof of safety.\n",
        encoding="utf-8",
    )
    (VALIDATION / "EACSL_PERFORMANCE_RECONCILIATION.md").write_text(
        "# E-ACSL Performance Reconciliation\n\n"
        f"- FULL instrumentation median: **{statistics.median(static_full):.6f} s**\n"
        f"- SELECTIVE instrumentation median: **{statistics.median(static_selective):.6f} s**\n"
        f"- Reduction of scenario medians: **{static_reduction:.6f}%**\n"
        f"- FULL runtime median: **{statistics.median(runtime_full):.9f} s**\n"
        f"- SELECTIVE runtime median: **{statistics.median(runtime_selective):.9f} s**\n"
        f"- Reduction of scenario medians: **{runtime_reduction:.6f}%**\n\n"
        "- Measured rows: **30 static + 90 dynamic = 120**\n"
        "- Warm-up executions outside the measured dataset: **15 (5 per scenario)**\n"
        "- Functional-sanity executions outside the measured dataset: **3**\n\n"
        "Formula: `(median(FULL) - median(SELECTIVE)) / median(FULL) × 100`. "
        "This is a reduction of scenario medians, not the median of paired per-run reductions.\n",
        encoding="utf-8",
    )

    hashes = [
        DATA / "eacsl_targets.tsv", DATA / "eacsl_targets.json",
        DATA / "eacsl_selection_matrix.tsv", DATA / "runtime_violations.tsv",
        DATA / "runtime_violations.json", DATA / "performance_measurements.tsv",
        DATA / "performance_summary.tsv", DATA / "git_provenance.tsv",
        RESULTS / "summary.tsv", RESULTS / "environment.txt",
        VALIDATION / "EACSL_NUMERIC_RECONCILIATION.md",
        VALIDATION / "EACSL_PERFORMANCE_RECONCILIATION.md",
    ]
    for retained in (
        VALIDATION / "current_representative_rerun.tsv",
        VALIDATION / "CURRENT_REPRESENTATIVE_RERUN.md",
    ):
        if retained.is_file():
            hashes.append(retained)
    hashes.extend(sorted((EVIDENCE / "violations").glob("*/stderr.txt")))
    hashes.extend([
        EVIDENCE / "performance_run_order.tsv",
        EVIDENCE / "functional_equivalence_audit.tsv",
        EVIDENCE / "performance_campaign_metadata.txt",
    ])
    (PHASE / "SHA256SUMS").write_text(
        "".join(f"{sha256(path)}  {path.relative_to(ROOT)}\n" for path in hashes), encoding="utf-8"
    )
    print("High-Precision properties: 149")
    print("WP proved: 48")
    print("Selected for E-ACSL: 101")
    print("KLEE completed/no-witness: 15")
    print("KLEE timeout/inconclusive: 86")
    print("Runtime violation targets/events: 7/7")
    print(f"Static median reduction: {static_reduction:.6f}%")
    print(f"Runtime median reduction: {runtime_reduction:.6f}%")


if __name__ == "__main__":
    main()
