#!/usr/bin/env python3
"""Materialize the frozen 149 Eva safety predicates in ``src_repaired``.

This is a report/specification transformation only.  It reads the validated
Phase-B target metadata and Phase-C report matrix, verifies each original
source statement exactly, inserts occurrence-aware ACSL assertions, and emits
the repair-phase manifests.  It never invokes Eva, KLEE, or WP.
"""

from __future__ import annotations

import csv
import re
from collections import Counter, defaultdict
from pathlib import Path
from typing import Callable, Iterable


REPO = Path(__file__).resolve().parents[2]
PHASE_DIR = Path(__file__).resolve().parent
TARGETS_PATH = REPO / "analysis/klee_phase_b/data/klee_alarm_targets.tsv"
MATRIX_PATH = REPO / "analysis/klee_phase_c/reports/04_KLEE_149_ALARM_TRACEABILITY_MATRIX.csv"
SOURCE_ROOT = REPO / "src_analysis"
REPAIRED_ROOT = REPO / "src_repaired"


def read_table(path: Path, delimiter: str) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter=delimiter))


def write_tsv(path: Path, headers: list[str], rows: Iterable[dict[str, str]]) -> None:
    with path.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(
            stream,
            fieldnames=headers,
            delimiter="\t",
            lineterminator="\n",
            extrasaction="ignore",
        )
        writer.writeheader()
        writer.writerows(rows)


def alarm_number(alarm_id: str) -> int:
    return int(alarm_id.rsplit("-", 1)[1])


def repaired_path(original: str) -> Path:
    path = Path(original)
    if not path.parts or path.parts[0] != "src_analysis":
        raise ValueError(f"unexpected frozen source path: {original}")
    return REPO / "src_repaired" / Path(*path.parts[1:])


def find_matching_paren(text: str, open_index: int) -> int:
    depth = 0
    for index in range(open_index, len(text)):
        if text[index] == "(":
            depth += 1
        elif text[index] == ")":
            depth -= 1
            if depth == 0:
                return index
    raise ValueError(f"unbalanced expression: {text}")


def split_top_level_arguments(text: str) -> list[str]:
    arguments: list[str] = []
    start = 0
    depth = 0
    for index, character in enumerate(text):
        if character == "(":
            depth += 1
        elif character == ")":
            depth -= 1
        elif character == "," and depth == 0:
            arguments.append(text[start:index].strip())
            start = index + 1
    arguments.append(text[start:].strip())
    return arguments


def replace_calls(text: str, name: str, replacement: Callable[[list[str]], str]) -> str:
    needle = name + "("
    while needle in text:
        start = text.index(needle)
        open_index = start + len(name)
        close_index = find_matching_paren(text, open_index)
        arguments = split_top_level_arguments(text[open_index + 1 : close_index])
        text = text[:start] + replacement(arguments) + text[close_index + 1 :]
    return text


def to_acsl(raw_property: str) -> tuple[str, str]:
    """Return a valid equivalent ACSL predicate and conversion note."""
    if raw_property == "MATHEMATICAL_LEFT_SHIFT(1,INT_BITS) <= INT32_MAX":
        return (
            "INT_BITS <= 30",
            "For nonnegative unsigned INT_BITS, 1*2^INT_BITS <= INT32_MAX iff INT_BITS <= 30.",
        )

    converted = replace_calls(
        raw_property,
        "MATHEMATICAL_LEFT_SHIFT",
        lambda arguments: f"(2 * ({arguments[0]}))"
        if len(arguments) == 2 and arguments[1] == "1"
        else (_ for _ in ()).throw(ValueError(f"unsupported mathematical shift: {arguments}")),
    )
    converted = replace_calls(
        converted,
        "MATHEMATICAL",
        lambda arguments: f"({arguments[0]})"
        if len(arguments) == 1
        else (_ for _ in ()).throw(ValueError(f"unsupported mathematical wrapper: {arguments}")),
    )
    converted = converted.replace("INT32_MIN", "(-2147483647 - 1)")
    converted = converted.replace("INT32_MAX", "2147483647")
    if "MATHEMATICAL" in converted or "INT32_" in converted:
        raise ValueError(f"incomplete ACSL conversion: {raw_property} -> {converted}")
    note = "Pseudo-mathematical wrappers removed; ACSL integer arithmetic retains the same unbounded bound check."
    return converted, note


targets = read_table(TARGETS_PATH, "\t")
matrix = read_table(MATRIX_PATH, ",")
matrix_by_id = {row["KLEE Alarm ID"]: row for row in matrix}

expected_ids = [f"KLEE-ALARM-{number:04d}" for number in range(1, 150)]
target_ids = [row["klee_target_id"] for row in targets]
if target_ids != expected_ids or len(set(target_ids)) != 149:
    raise SystemExit("Phase-B target IDs are not the unique ordered 0001-0149 sequence")
if set(matrix_by_id) != set(expected_ids):
    raise SystemExit("validated report matrix does not contain exactly the Phase-B target IDs")

records: list[dict[str, str]] = []
by_source_line: dict[Path, dict[int, list[dict[str, str]]]] = defaultdict(lambda: defaultdict(list))

for target in targets:
    alarm_id = target["klee_target_id"]
    short_id = alarm_id[-4:]
    result = matrix_by_id[alarm_id]
    raw_property = target["predicate_text"]
    acsl_property, conversion_note = to_acsl(raw_property)
    label = f"eva_klee_alarm_{short_id}"
    target_error = "; ".join(
        path for path in result["Evidence Path"].split("; ") if path.endswith(f".klee-alarm-{short_id}.err")
    )
    is_counterexample = result["KLEE Outcome"] == "CONFIRMED_COUNTEREXAMPLE"
    record = {
        "KLEE Alarm ID": alarm_id,
        "Function": target["eva_function"],
        "Original Source File": target["eva_source_file"],
        "Original Source Line": target["eva_source_line"],
        "Occurrence": target["eva_occurrence_index"],
        "Alarm Kind": target["eva_category"],
        "Original Expression": target["source_expression"],
        "Original Statement": target["source_statement"],
        "Raw Eva Property": raw_property,
        "Inserted ACSL Property": acsl_property,
        "ACSL Conversion Note": conversion_note,
        "KLEE Target Assertion": result["Target Assertion Inserted for KLEE"],
        "KLEE Outcome": result["KLEE Outcome"],
        "Counterexample?": "YES" if is_counterexample else "NO",
        "KTest": result["KTest Path"],
        "Concrete Inputs": result["Concrete Inputs"],
        "Target Error Evidence": target_error,
        "Timeout After Witness?": result["Timeout?"] if is_counterexample else "NO",
        "Repaired Source File": repaired_path(target["eva_source_file"]).relative_to(REPO).as_posix(),
        "ACSL Label": label,
        "Current Assertion Location": "",
        "Future Verification Mode": "WP" if is_counterexample else "RUNTIME_ONLY",
    }
    records.append(record)
    by_source_line[repaired_path(target["eva_source_file"])][int(target["eva_source_line"])].append(record)

if Counter(record["KLEE Outcome"] for record in records) != Counter(
    {"CONFIRMED_COUNTEREXAMPLE": 48, "NO_COUNTEREXAMPLE_SEARCH_COMPLETED": 15, "TIMEOUT": 86}
):
    raise SystemExit("validated KLEE primary classification no longer reconciles")

for source_path, insertions in by_source_line.items():
    if not source_path.is_file():
        raise SystemExit(f"missing repaired source: {source_path}")
    source_text = source_path.read_text(encoding="utf-8")
    if "eva_klee_alarm_" in source_text:
        expected_records = [record for line_records in insertions.values() for record in line_records]
        for record in expected_records:
            pattern = re.compile(
                rf"/\*@\s+assert\s+{re.escape(record['ACSL Label'])}\s*:\s*(.*?)\s*;\s*\*/",
                re.DOTALL,
            )
            match = pattern.search(source_text)
            if not match:
                raise SystemExit(f"missing existing assertion {record['ACSL Label']} in {source_path}")
            observed = " ".join(match.group(1).split())
            expected = " ".join(record["Inserted ACSL Property"].split())
            if observed != expected:
                raise SystemExit(
                    f"existing assertion changed for {record['KLEE Alarm ID']}: {observed!r} != {expected!r}"
                )
            record["Current Assertion Location"] = (
                f"{record['Repaired Source File']}:{source_text[:match.start()].count(chr(10)) + 1}"
            )
        continue
    source_lines = source_text.splitlines(keepends=True)
    output: list[str] = []
    for original_line, line in enumerate(source_lines, start=1):
        line_records = sorted(insertions.get(original_line, []), key=lambda row: alarm_number(row["KLEE Alarm ID"]))
        if line_records:
            actual_statement = line.strip()
            for record in line_records:
                if actual_statement != record["Original Statement"].strip():
                    raise SystemExit(
                        f"{record['KLEE Alarm ID']}: exact statement mismatch at "
                        f"{record['Original Source File']}:{record['Original Source Line']}"
                    )
                indentation = line[: len(line) - len(line.lstrip())]
                assertion_line = len(output) + 1
                output.extend(
                    [
                        f"{indentation}/*@ assert {record['ACSL Label']}:\n",
                        f"{indentation}      {record['Inserted ACSL Property']};\n",
                        f"{indentation}*/\n",
                    ]
                )
                record["Current Assertion Location"] = (
                    f"{record['Repaired Source File']}:{assertion_line}"
                )
        output.append(line)
    source_path.write_text("".join(output), encoding="utf-8", newline="")

manifest_headers = [
    "KLEE Alarm ID",
    "Function",
    "Original Source File",
    "Original Source Line",
    "Occurrence",
    "Alarm Kind",
    "Original Expression",
    "Original Statement",
    "Raw Eva Property",
    "Inserted ACSL Property",
    "ACSL Conversion Note",
    "KLEE Target Assertion",
    "KLEE Outcome",
    "Counterexample?",
    "KTest",
    "Concrete Inputs",
    "Target Error Evidence",
    "Timeout After Witness?",
    "Repaired Source File",
    "ACSL Label",
    "Current Assertion Location",
    "Future Verification Mode",
]
write_tsv(PHASE_DIR / "149_TARGET_REPAIR_MANIFEST.tsv", manifest_headers, records)

map_headers = [
    "KLEE Alarm ID",
    "Function",
    "Original Source File",
    "Original Source Line",
    "Occurrence",
    "Alarm Kind",
    "Original Expression",
    "Raw Eva Property",
    "Inserted ACSL Property",
    "Repaired Source File",
    "Current Assertion Location",
    "ACSL Label",
    "Counterexample?",
    "KLEE Outcome",
    "Future Verification Mode",
]
write_tsv(PHASE_DIR / "149_ACSL_PROPERTY_MAP.tsv", map_headers, records)

confirmed_headers = [
    "KLEE Alarm ID",
    "Function",
    "Original Source File",
    "Original Source Line",
    "Occurrence",
    "Alarm Kind",
    "Original Expression",
    "ACSL Label",
    "Raw Eva Property",
    "Inserted ACSL Property",
    "KLEE Target Assertion",
    "Concrete Inputs",
    "KTest",
    "Target Error Evidence",
    "Timeout After Witness?",
    "Repair Status",
    "Repair Commit",
    "Additionally Affected Alarm IDs",
    "Repair Rationale",
]
confirmed_rows = []
for record in records:
    if record["Counterexample?"] != "YES":
        continue
    confirmed_rows.append(
        record
        | {
            "Repair Status": "PENDING_EVIDENCE_REVIEW",
            "Repair Commit": "NOT_ASSIGNED",
            "Additionally Affected Alarm IDs": "NONE_IDENTIFIED",
            "Repair Rationale": "Pending per-target evidence and repair-policy review.",
        }
    )
write_tsv(PHASE_DIR / "48_CONFIRMED_REPAIR_TARGETS.tsv", confirmed_headers, confirmed_rows)

runtime_headers = [
    "KLEE Alarm ID",
    "Function",
    "Original Source File",
    "Original Source Line",
    "Occurrence",
    "Alarm Kind",
    "Original Expression",
    "Raw Eva Property",
    "Inserted ACSL Property",
    "Repaired Source File",
    "ACSL Label",
    "KLEE Outcome",
    "Counterexample?",
    "Future Verification Mode",
    "Implementation Repair?",
    "WP Planned Now?",
]
runtime_rows = [
    record | {"Implementation Repair?": "NO", "WP Planned Now?": "NO"}
    for record in records
    if record["Counterexample?"] == "NO"
]
write_tsv(PHASE_DIR / "101_RUNTIME_ONLY_PROPERTIES.tsv", runtime_headers, runtime_rows)

labels = [record["ACSL Label"] for record in records]
inserted_label_counts = Counter()
for source_path in by_source_line:
    inserted_label_counts.update(re.findall(r"assert\s+(eva_klee_alarm_\d{4})\s*:", source_path.read_text(encoding="utf-8")))

checks = {
    "targets": len(records),
    "unique_labels": len(set(labels)),
    "inserted_labels": sum(inserted_label_counts.values()),
    "missing_labels": len(set(labels) - set(inserted_label_counts)),
    "duplicate_labels": sum(count - 1 for count in inserted_label_counts.values() if count > 1),
    "confirmed": len(confirmed_rows),
    "runtime_only": len(runtime_rows),
    "no_counterexample_completed": sum(
        record["KLEE Outcome"] == "NO_COUNTEREXAMPLE_SEARCH_COMPLETED" for record in runtime_rows
    ),
    "timeout": sum(record["KLEE Outcome"] == "TIMEOUT" for record in runtime_rows),
}
expected_checks = {
    "targets": 149,
    "unique_labels": 149,
    "inserted_labels": 149,
    "missing_labels": 0,
    "duplicate_labels": 0,
    "confirmed": 48,
    "runtime_only": 101,
    "no_counterexample_completed": 15,
    "timeout": 86,
}
for name, expected in expected_checks.items():
    if checks[name] != expected:
        raise SystemExit(f"materialization invariant failed: {name}={checks[name]}, expected {expected}")
for name, value in checks.items():
    print(f"{name}={value}")
print("materialized=VALIDATED")
