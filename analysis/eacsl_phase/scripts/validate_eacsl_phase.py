#!/usr/bin/env python3
"""Validate the frozen E-ACSL selection, runtime, and performance evidence."""

from __future__ import annotations

import csv
import hashlib
import json
import re
import subprocess
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
PHASE = ROOT / "analysis" / "eacsl_phase"
DATA = PHASE / "data"
EVIDENCE = PHASE / "evidence" / "historical"
NOT_AVAILABLE = "NOT_AVAILABLE_IN_RETAINED_EVIDENCE"


def read_tsv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def path_without_fragment(value: str) -> Path:
    return ROOT / value.split("#", 1)[0]


errors: list[str] = []
properties = read_tsv(ROOT / "analysis/repair_phase/149_ACSL_PROPERTY_MAP.tsv")
klee = read_tsv(ROOT / "analysis/klee_phase_c/results/summary.tsv")
wp = read_tsv(ROOT / "analysis/wp_phase/data/wp_targets.tsv")
selection = read_tsv(DATA / "eacsl_selection_matrix.tsv")
targets = read_tsv(DATA / "eacsl_targets.tsv")
violations = read_tsv(DATA / "runtime_violations.tsv")
measurements = read_tsv(DATA / "performance_measurements.tsv")
summary = read_tsv(PHASE / "results/summary.tsv")
observations = read_tsv(EVIDENCE / "runtime_observations.tsv")
observation_cases = read_tsv(EVIDENCE / "observation_cases.tsv")
retention = read_tsv(EVIDENCE / "runtime_101_retention_audit.tsv")
elimination = read_tsv(EVIDENCE / "wp_48_elimination_audit.tsv")
run_order = read_tsv(EVIDENCE / "performance_run_order.tsv")
functional_audit = read_tsv(EVIDENCE / "functional_equivalence_audit.tsv")

all_ids = {row["KLEE Alarm ID"] for row in properties}
wp_ids = {row["klee_target_id"] for row in wp}
selected_ids = {row["alarm_id"] for row in selection if row["selected_for_eacsl"] == "YES"}
excluded_ids = {row["alarm_id"] for row in selection if row["selected_for_eacsl"] == "NO"}
target_ids = {row["alarm_id"] for row in targets}
no_witness_ids = {row["alarm_id"] for row in klee if row["final_status"] == "NO_COUNTEREXAMPLE_FOUND"}
timeout_ids = {row["alarm_id"] for row in klee if row["final_status"] == "INCONCLUSIVE_TIMEOUT"}
violation_ids = {row["alarm_id"] for row in violations}

expected_counts = {
    "High Precision": (len(properties), len(all_ids), 149),
    "WP": (len(wp), len(wp_ids), 48),
    "selection matrix": (len(selection), len({row["alarm_id"] for row in selection}), 149),
    "E-ACSL targets": (len(targets), len(target_ids), 101),
    "KLEE no-witness": (len(no_witness_ids), len(no_witness_ids), 15),
    "KLEE timeout": (len(timeout_ids), len(timeout_ids), 86),
}
for name, (rows, unique, expected) in expected_counts.items():
    if rows != expected or unique != expected:
        errors.append(f"{name}: expected {expected} rows/unique IDs, found {rows}/{unique}")
if wp_ids & selected_ids:
    errors.append("WP and E-ACSL selected sets overlap")
if wp_ids | selected_ids != all_ids:
    errors.append("WP union E-ACSL differs from High Precision set")
if excluded_ids != wp_ids:
    errors.append("selection exclusions differ from WP-proved set")
if selected_ids != target_ids or selected_ids != no_witness_ids | timeout_ids:
    errors.append("selected 101 differs from target/KLEE unresolved sets")
if no_witness_ids & timeout_ids:
    errors.append("KLEE no-witness and timeout sets overlap")

case_ids = {row["KLEE Alarm ID"] for row in observation_cases}
if len(observation_cases) != 101 or len(case_ids) != 101 or case_ids != selected_ids:
    errors.append("property-observation corpus is not one unique case per selected target")
case_identity_fields = ("Case ID", "ACSL Label", "KLEE Alarm ID", "Function", "Inputs")
case_identity = {tuple(row[field] for field in case_identity_fields) for row in observation_cases}
observation_identity = {tuple(row[field] for field in case_identity_fields) for row in observations}
if case_identity != observation_identity:
    errors.append("property-observation results do not preserve corpus identity")

selection_by_id = {row["alarm_id"]: row for row in selection}
for alarm_id in wp_ids:
    row = selection_by_id[alarm_id]
    if row["selection_reason"] != "WP_PROVED" or row["wp_status"] != "VALID":
        errors.append(f"{alarm_id}: WP exclusion reason/status is incorrect")
    if not path_without_fragment(row["wp_evidence"]).is_file():
        errors.append(f"{alarm_id}: missing WP evidence {row['wp_evidence']}")

property_by_id = {row["KLEE Alarm ID"]: row for row in properties}
for row in targets:
    alarm_id, label = row["alarm_id"], row["property_label"]
    source = ROOT / row["source_file"]
    if not source.is_file():
        errors.append(f"{alarm_id}: missing source {row['source_file']}")
        continue
    lines = [index for index, text in enumerate(source.read_text(encoding="utf-8").splitlines(), 1) if label in text]
    if lines != [int(row["current_source_line"])]:
        errors.append(f"{alarm_id}: current assertion mapping differs: {lines}")
    original = property_by_id[alarm_id]
    if original["ACSL Label"] != label or original["Inserted ACSL Property"] != row["property_text"]:
        errors.append(f"{alarm_id}: property identity mismatch")
    if row["instrumentation_label"] != label or row["eacsl_selected"] != "YES":
        errors.append(f"{alarm_id}: instrumentation identity/selection mismatch")

selected_labels = {selection_by_id[alarm_id]["property_label"] for alarm_id in selected_ids}
wp_labels = {selection_by_id[alarm_id]["property_label"] for alarm_id in wp_ids}
if set(row["Label"] for row in retention) != selected_labels or len(retention) != 101:
    errors.append("historical 101 retention audit does not equal selected set")
if set(row["Label"] for row in elimination) != wp_labels or len(elimination) != 48:
    errors.append("historical 48 elimination audit does not equal WP set")

if len(violations) != 7 or len(violation_ids) != 7:
    errors.append(f"runtime violations: expected 7 unique targets, found {len(violations)}/{len(violation_ids)}")
if not violation_ids <= selected_ids or violation_ids & wp_ids:
    errors.append("runtime violation set is outside selective targets or overlaps WP")
for row in violations:
    if row["prior_klee_status"] != "INCONCLUSIVE_TIMEOUT":
        errors.append(f"{row['alarm_id']}: historical runtime violation was not a KLEE timeout")
    for field in ("execution_log",):
        if not path_without_fragment(row[field]).is_file():
            errors.append(f"{row['alarm_id']}: missing raw runtime evidence {row[field]}")
    log = path_without_fragment(row["execution_log"]).read_text(encoding="utf-8")
    if row["property_label"] not in log:
        errors.append(f"{row['alarm_id']}: raw event does not contain target label")
    if row["exit_status"] != "134" or row["reaction_policy"] != "ABORT_ON_FIRST_FAILED_ASSERTION":
        errors.append(f"{row['alarm_id']}: exit/reaction classification mismatch")

classification_counts = Counter(row["Classification"] for row in observations)
if classification_counts != Counter({
    "NO_VIOLATION_OBSERVED": 48, "NOT_REACHED": 42,
    "VIOLATION_OBSERVED": 7, "AMBIGUOUS_OUTPUT": 4,
}):
    errors.append(f"unexpected runtime observation taxonomy: {dict(classification_counts)}")
if len(summary) != 101 or {row["alarm_id"] for row in summary} != selected_ids:
    errors.append("summary does not cover exact selected set")
for row in summary:
    if not path_without_fragment(row["evidence_path"]).is_file():
        errors.append(f"{row['alarm_id']}: missing summary evidence path")

recognized_modes = {"UNINSTRUMENTED", "FULL", "SELECTIVE"}
recognized_kinds = {"STATIC_INSTRUMENTATION", "DYNAMIC_RUNTIME"}
if len(measurements) != 120:
    errors.append(f"expected 120 normalized performance rows, found {len(measurements)}")
for row in measurements:
    if row["instrumentation_mode"] not in recognized_modes or row["measurement_kind"] not in recognized_kinds:
        errors.append("performance row uses unrecognized scenario/kind")
    if row["status"] != "PASS":
        errors.append("historical performance row is not PASS")
    if not path_without_fragment(row["evidence_path"]).is_file():
        errors.append(f"performance evidence path missing: {row['evidence_path']}")
performance_inventory = Counter((row["measurement_kind"], row["instrumentation_mode"]) for row in measurements)
expected_inventory = Counter({
    ("STATIC_INSTRUMENTATION", "UNINSTRUMENTED"): 10,
    ("STATIC_INSTRUMENTATION", "FULL"): 10,
    ("STATIC_INSTRUMENTATION", "SELECTIVE"): 10,
    ("DYNAMIC_RUNTIME", "UNINSTRUMENTED"): 30,
    ("DYNAMIC_RUNTIME", "FULL"): 30,
    ("DYNAMIC_RUNTIME", "SELECTIVE"): 30,
})
if performance_inventory != expected_inventory:
    errors.append(f"unexpected performance inventory: {dict(performance_inventory)}")

run_order_inventory = Counter((row["Kind"], row["Scenario"]) for row in run_order)
expected_run_order = Counter({
    ("WARMUP", "S0"): 5, ("WARMUP", "S1"): 5, ("WARMUP", "S2"): 5,
    ("MEASURED", "S0"): 30, ("MEASURED", "S1"): 30, ("MEASURED", "S2"): 30,
})
if run_order_inventory != expected_run_order:
    errors.append(f"unexpected warm-up/measured execution inventory: {dict(run_order_inventory)}")
if len(functional_audit) != 3:
    errors.append(f"expected 3 functional-sanity executions, found {len(functional_audit)}")
elif any(row["Exit Code"] != "0" or row["Violation?"] != "NO" for row in functional_audit):
    errors.append("functional-sanity audit contains a failed/violating scenario")
elif len({row["Checksum"] for row in functional_audit}) != 1:
    errors.append("CONTROL/FULL/SELECTIVE functional checksums differ")

for line in (PHASE / "SHA256SUMS").read_text(encoding="utf-8").splitlines():
    expected, relative = line.split("  ", 1)
    path = ROOT / relative
    actual = hashlib.sha256(path.read_bytes()).hexdigest() if path.is_file() else "MISSING"
    if expected != actual:
        errors.append(f"SHA256 mismatch: {relative}")

for script in sorted((PHASE / "scripts").glob("*.sh")):
    if subprocess.run(["bash", "-n", str(script)], check=False).returncode:
        errors.append(f"bash syntax failure: {script.relative_to(ROOT)}")

if errors:
    print("E-ACSL VALIDATION: FAIL")
    raise SystemExit("\n".join(f"- {error}" for error in errors))

print("High-Precision IDs=149")
print("WP-proved IDs=48")
print("E-ACSL selected IDs=101")
print("WP intersection E-ACSL=0")
print("WP union E-ACSL=149")
print("KLEE completed/no-witness=15")
print("KLEE timeout/inconclusive=86")
print("Assertion/property mappings=101")
print("Historical FULL generated checks=149")
print("Historical SELECTIVE generated checks=101")
print("Property-observation executions=101")
print("Runtime violation targets/events=7/7")
print("WP-proved runtime violations=0")
print("Performance measurements=120")
print("Performance warm-up executions=15 (5 per scenario)")
print("Functional-sanity executions=3")
print("E-ACSL VALIDATION: PASS")
