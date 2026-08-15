#!/usr/bin/env python3
"""Validate all deterministic Phase-B occurrence-mapping invariants."""

from __future__ import annotations

import csv
import hashlib
import json
import re
import sys
import unicodedata
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
PHASE = ROOT / "analysis/klee_phase_b"
DATA = PHASE / "data"
FROZEN = ROOT / "reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv"
COMPARISON = ROOT / "reports/eva_report_source_package/data/alarm_comparison.tsv"
TARGETS = DATA / "klee_alarm_targets.tsv"
IDENTITY = DATA / "klee_alarm_identity.tsv"
PREDICATES = DATA / "klee_predicate_inventory.tsv"
JSON_FILE = DATA / "klee_alarm_targets.json"
POC_FILE = DATA / "poc_candidate_validation.tsv"
HASHES = DATA / "SHA256SUMS"

EXPECTED = {"integer overflow": 100, "division by zero": 16, "invalid shift": 33}
CRITICAL = {
    "klee_target_id", "eva_function", "eva_source_file", "eva_source_line", "eva_category",
    "eva_normalized_message", "eva_canonical_signature", "eva_occurrence_index",
    "source_expression", "source_statement", "operation_kind", "predicate_text",
    "predicate_normal_form", "violation_condition", "companion_signed_division_overflow", "operand_1_expression",
    "operand_1_declared_type", "operand_1_effective_type", "operand_1_width",
    "operand_1_signedness", "operand_2_expression", "operand_2_declared_type",
    "operand_2_effective_type", "operand_2_width", "operand_2_signedness",
    "result_effective_type", "result_width", "result_signedness", "input_parameters",
    "input_domains", "harness_path", "high_precision_log_path", "input_dependencies",
    "helper_dependencies", "helper_argument_mapping", "call_chain",
    "control_flow_guards", "semantic_sensitivity", "recommended_future_check",
    "mapping_confidence", "mapping_status", "evidence_reference", "notes",
}


def read(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8", newline="") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def normalize(value: str) -> str:
    value = unicodedata.normalize("NFKC", value).translate(
        str.maketrans({"≢": "!=", "≠": "!=", "≤": "<=", "≥": ">=", "−": "-", "\u00a0": " "})
    )
    return re.sub(r"\s+", " ", value).strip()


def main() -> int:
    failures: list[str] = []
    frozen = read(FROZEN)
    comparison = read(COMPARISON)
    targets = read(TARGETS)
    identity = read(IDENTITY)
    predicates = read(PREDICATES)
    poc_rows = read(POC_FILE)

    def check(condition: bool, message: str) -> None:
        if not condition:
            failures.append(message)

    check(len(frozen) == 149, f"frozen rows={len(frozen)}")
    check(sum(row["status"] == "REMAINING" for row in comparison) == 149, "comparison REMAINING count mismatch")
    check(len(targets) == 149, f"target rows={len(targets)}")
    check(len(identity) == 149, f"identity rows={len(identity)}")
    check(len(predicates) == 149, f"predicate rows={len(predicates)}")

    ids = [row["klee_target_id"] for row in targets]
    expected_ids = [f"KLEE-ALARM-{index:04d}" for index in range(1, 150)]
    check(ids == expected_ids, "target IDs are not the exact deterministic sequence")
    check(len(set(ids)) == 149, "duplicate target IDs")

    frozen_identity = [(row["function"], row["canonical_signature"], row["occurrence"]) for row in frozen]
    target_identity = [(row["eva_function"], row["eva_canonical_signature"], row["eva_occurrence_index"]) for row in targets]
    check(target_identity == frozen_identity, "round-trip occurrence identity/order mismatch")
    check(len(set(target_identity)) == 149, "multiply mapped frozen occurrence")

    categories = Counter(row["eva_category"] for row in targets)
    check(dict(categories) == EXPECTED, f"category totals={dict(categories)}")
    check(all(row["comparison_status"] == "REMAINING" for row in targets), "non-REMAINING target mapped")
    check(not any(row["comparison_status"] in {"REMOVED", "NEW"} for row in targets), "REMOVED/NEW target mapped")

    by_function: dict[str, list[dict[str, str]]] = {}
    for row in targets:
        by_function.setdefault(row["eva_function"], []).append(row)
    log_marker_total = 0
    for function, function_rows in by_function.items():
        log_path = ROOT / f"results/high_precision/{function}/{function}_eva.log"
        log_text = normalize(log_path.read_text(encoding="utf-8", errors="replace"))
        markers = len(re.findall(r"\[eva:alarm\]", log_text))
        check(markers == len(function_rows), f"{function} log marker count {markers}!={len(function_rows)}")
        log_marker_total += markers
        for row in function_rows:
            check(
                f"{row['eva_source_file']}:{row['eva_source_line']}" in log_text
                and normalize(row["eva_normalized_message"]) in log_text,
                f"{row['klee_target_id']} missing exact log evidence",
            )
    check(log_marker_total == 149, f"High Precision log markers={log_marker_total}")

    for row_number, row in enumerate(targets, 2):
        for field in CRITICAL:
            check(field in row and row[field].strip() != "", f"row {row_number} empty critical field {field}")
        check(row["violation_condition"] == f"NOT({row['predicate_text']})", f"row {row_number} predicate polarity mismatch")
        if row["eva_category"] == "division by zero":
            check(row["companion_signed_division_overflow"].startswith("SEPARATE_MIN_DIV_MINUS_ONE_CASE"), f"row {row_number} conflates signed division obligations")
        path = ROOT / row["eva_source_file"]
        check((ROOT / row["harness_path"]).is_file(), f"row {row_number} harness evidence missing")
        check((ROOT / row["high_precision_log_path"]).is_file(), f"row {row_number} log evidence missing")
        line = int(row["eva_source_line"])
        actual = " ".join(path.read_text(encoding="utf-8", errors="replace").splitlines()[line - 1].strip().split())
        check(actual == row["source_statement"], f"row {row_number} source statement drift")

    identity_projection = [{key: row[key] for key in identity[0]} for row in targets]
    predicate_projection = [{key: row[key] for key in predicates[0]} for row in targets]
    check(identity == identity_projection, "identity TSV projection mismatch")
    check(predicates == predicate_projection, "predicate TSV projection mismatch")

    json_rows = json.loads(JSON_FILE.read_text(encoding="utf-8"))
    check(json_rows == targets, "JSON/TSV semantic mismatch")

    expected_hashes = {}
    for line in HASHES.read_text(encoding="utf-8").splitlines():
        value, name = line.split(None, 1)
        expected_hashes[name.strip()] = value
    for path in (TARGETS, IDENTITY, PREDICATES):
        check(expected_hashes.get(path.name) == digest(path), f"hash mismatch for {path.name}")

    poc_keys = {
        ("s32_mul_s32_s32", "src_analysis/sources/MulHword.c", "47", "integer overflow"),
        ("s16_div_s32_s16", "src_analysis/sources/div_Ccode.c", "274", "division by zero"),
        ("root_s32_mul_s32_s16_fac_less1", "src_analysis/sources/mul_Ccode.c", "5089", "invalid shift"),
    }
    mapped_keys = {(row["eva_function"], row["eva_source_file"], row["eva_source_line"], row["eva_category"]) for row in targets}
    check(poc_keys <= mapped_keys, "one or more Phase-A POC candidates missing")
    check(len(poc_rows) == 3, f"POC validation rows={len(poc_rows)}")
    check(all(row["decision"] == "KEEP" for row in poc_rows), "Phase-A POC decision changed")
    check({row["klee_target_id"] for row in poc_rows} <= set(ids), "POC target ID missing from target dataset")

    report = [
        "KLEE Phase B mapping validation",
        f"frozen_remaining={len(frozen)}",
        f"target_rows={len(targets)}",
        f"unique_target_ids={len(set(ids))}",
        f"unmapped={len(set(frozen_identity) - set(target_identity))}",
        f"multiply_mapped={len(target_identity) - len(set(target_identity))}",
        f"integer_overflow={categories['integer overflow']}",
        f"division_by_zero={categories['division by zero']}",
        f"invalid_shift={categories['invalid shift']}",
        f"removed_mapped={sum(row['comparison_status'] == 'REMOVED' for row in targets)}",
        f"new_mapped={sum(row['comparison_status'] == 'NEW' for row in targets)}",
        f"high_precision_log_markers={log_marker_total}",
        f"validator_failures={len(failures)}",
        "status=" + ("PASS" if not failures else "FAIL"),
    ]
    if failures:
        report.extend("FAILURE=" + failure for failure in failures)
    output = "\n".join(report) + "\n"
    print(output, end="")
    validation_path = PHASE / "validation/mapping_validation.txt"
    validation_path.parent.mkdir(parents=True, exist_ok=True)
    validation_path.write_text(output, encoding="utf-8")
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
