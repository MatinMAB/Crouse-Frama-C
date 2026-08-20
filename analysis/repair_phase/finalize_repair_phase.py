#!/usr/bin/env python3
"""Finalize and validate repair-phase traceability without running Eva, KLEE, or WP."""

from __future__ import annotations

import csv
import re
import subprocess
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
PHASE = ROOT / "analysis" / "repair_phase"
MASTER = PHASE / "149_TARGET_REPAIR_MANIFEST.tsv"
PROPERTY_MAP = PHASE / "149_ACSL_PROPERTY_MAP.tsv"
CONFIRMED = PHASE / "48_CONFIRMED_REPAIR_TARGETS.tsv"
RUNTIME = PHASE / "101_RUNTIME_ONLY_PROPERTIES.tsv"
RECORDS = PHASE / "repairs"
CUSTOM_RECORDS = {
    "KLEE-ALARM-0001",
    "KLEE-ALARM-0007",
    "KLEE-ALARM-0022",
    "KLEE-ALARM-0044",
}


def read_tsv(path: Path) -> tuple[list[str], list[dict[str, str]]]:
    with path.open(newline="", encoding="utf-8") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        return list(reader.fieldnames or []), list(reader)


def write_tsv(path: Path, headers: list[str], rows: list[dict[str, str]]) -> None:
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


def normalized(value: str) -> str:
    return re.sub(r"\s+", "", value.rstrip(";"))


master_headers, master_rows = read_tsv(MASTER)
map_headers, map_rows = read_tsv(PROPERTY_MAP)
confirmed_headers, confirmed_rows = read_tsv(CONFIRMED)
runtime_headers, runtime_rows = read_tsv(RUNTIME)

source_text: dict[str, str] = {}
label_occurrences: dict[str, list[tuple[str, int, str]]] = {}
assertion_pattern = re.compile(
    r"/\*@\s*assert\s+(eva_klee_alarm_\d{4}):\s*(.*?)\s*;\s*\*/",
    re.DOTALL,
)
for source in sorted((ROOT / "src_repaired").rglob("*.c")):
    relative = source.relative_to(ROOT).as_posix()
    text = source.read_text(encoding="utf-8")
    source_text[relative] = text
    for match in assertion_pattern.finditer(text):
        line = text.count("\n", 0, match.start()) + 1
        label_occurrences.setdefault(match.group(1), []).append(
            (relative, line, match.group(2).strip())
        )

errors: list[str] = []
if len(master_rows) != 149:
    errors.append(f"master target rows: expected 149, found {len(master_rows)}")
if len({row['KLEE Alarm ID'] for row in master_rows}) != len(master_rows):
    errors.append("master target IDs are not unique")

for row in master_rows:
    label = row["ACSL Label"]
    occurrences = label_occurrences.get(label, [])
    if len(occurrences) != 1:
        errors.append(f"{label}: expected one assertion, found {len(occurrences)}")
        continue
    source, line, inserted = occurrences[0]
    row["Current Assertion Location"] = f"{source}:{line}"
    if normalized(inserted) != normalized(row["Inserted ACSL Property"]):
        errors.append(f"{label}: source assertion differs from manifest property")

master_by_id = {row["KLEE Alarm ID"]: row for row in master_rows}
for row in map_rows:
    target = master_by_id[row["KLEE Alarm ID"]]
    row["Current Assertion Location"] = target["Current Assertion Location"]
    if row["Raw Eva Property"] != target["Raw Eva Property"]:
        errors.append(f"{row['KLEE Alarm ID']}: raw Eva property mismatch")

confirmed_by_id = {row["KLEE Alarm ID"]: row for row in confirmed_rows}
if len(confirmed_rows) != 48 or len(confirmed_by_id) != 48:
    errors.append("confirmed-target manifest is not 48 unique rows")
if len(runtime_rows) != 101:
    errors.append(f"runtime-only rows: expected 101, found {len(runtime_rows)}")

status_counts = Counter(row["Repair Status"] for row in confirmed_rows)
repaired_rows = [row for row in confirmed_rows if row["Repair Status"].startswith("REPAIRED")]
policy_rows = [row for row in confirmed_rows if row["Repair Status"] == "REPAIR_POLICY_REQUIRED"]
if len(repaired_rows) + len(policy_rows) != 48:
    errors.append("confirmed targets have unresolved or unknown repair status")

for row in confirmed_rows:
    target = master_by_id[row["KLEE Alarm ID"]]
    if not row["Concrete Inputs"] or not row["KTest"] or not row["Target Error Evidence"]:
        errors.append(f"{row['KLEE Alarm ID']}: confirmed witness evidence is incomplete")
    if not target["Current Assertion Location"]:
        errors.append(f"{row['KLEE Alarm ID']}: current assertion location missing")

repair_commits = sorted({row["Repair Commit"] for row in repaired_rows})
for commit in repair_commits:
    check = subprocess.run(
        ["git", "cat-file", "-e", f"{commit}^{{commit}}"], cwd=ROOT, check=False
    )
    if check.returncode:
        errors.append(f"repair commit does not exist: {commit}")
        continue
    names = subprocess.run(
        ["git", "show", "--format=", "--name-only", commit],
        cwd=ROOT,
        check=True,
        capture_output=True,
        text=True,
    ).stdout.splitlines()
    if not any(name.startswith("src_repaired/") for name in names):
        errors.append(f"repair commit has no src_repaired diff: {commit}")

runtime_outcomes = Counter(row["KLEE Outcome"] for row in runtime_rows)
if runtime_outcomes != Counter(
    {"NO_COUNTEREXAMPLE_SEARCH_COMPLETED": 15, "TIMEOUT": 86}
):
    errors.append(f"runtime-only outcome breakdown differs: {dict(runtime_outcomes)}")
for row in runtime_rows:
    if row["Future Verification Mode"] != "RUNTIME_ONLY":
        errors.append(f"{row['KLEE Alarm ID']}: runtime-only mode differs")
    if row["Implementation Repair?"] != "NO" or row["WP Planned Now?"] != "NO":
        errors.append(f"{row['KLEE Alarm ID']}: runtime-only phase flags differ")
    target = master_by_id[row["KLEE Alarm ID"]]
    repaired_source = target["Repaired Source File"]
    if normalized(target["Original Statement"]) not in normalized(source_text[repaired_source]):
        errors.append(f"{row['KLEE Alarm ID']}: original runtime-only statement not found")

for row in master_rows:
    expected_mode = "WP" if row["Counterexample?"] == "YES" else "RUNTIME_ONLY"
    if row["Future Verification Mode"] != expected_mode:
        errors.append(f"{row['KLEE Alarm ID']}: future mode differs")

write_tsv(MASTER, master_headers, master_rows)
write_tsv(PROPERTY_MAP, map_headers, map_rows)

wp_headers = [
    "KLEE Alarm ID",
    "Function",
    "Repaired Source File",
    "Original Source Line",
    "Current Assertion Location",
    "ACSL Label",
    "Eva Safety Property",
    "Repair Commit",
    "Original Counterexample Inputs",
    "WP Status",
]
wp_rows: list[dict[str, str]] = []
for repair in repaired_rows:
    target = master_by_id[repair["KLEE Alarm ID"]]
    wp_rows.append(
        {
            "KLEE Alarm ID": repair["KLEE Alarm ID"],
            "Function": repair["Function"],
            "Repaired Source File": target["Repaired Source File"],
            "Original Source Line": repair["Original Source Line"],
            "Current Assertion Location": target["Current Assertion Location"],
            "ACSL Label": repair["ACSL Label"],
            "Eva Safety Property": repair["Raw Eva Property"],
            "Repair Commit": repair["Repair Commit"],
            "Original Counterexample Inputs": repair["Concrete Inputs"],
            "WP Status": "NOT_RUN",
        }
    )
write_tsv(PHASE / "WP_NEXT_PHASE_MANIFEST.tsv", wp_headers, wp_rows)

RECORDS.mkdir(exist_ok=True)
for repair in confirmed_rows:
    record = RECORDS / f"{repair['KLEE Alarm ID']}.md"
    if repair["KLEE Alarm ID"] in CUSTOM_RECORDS and record.exists():
        continue
    target = master_by_id[repair["KLEE Alarm ID"]]
    status = repair["Repair Status"]
    strategy_header = "Implemented repair" if status.startswith("REPAIRED") else "Policy decision required"
    record.write_text(
        f"# {repair['KLEE Alarm ID']} Repair Record\n\n"
        "## Frozen occurrence and property\n\n"
        f"- Function: `{repair['Function']}`\n"
        f"- Original occurrence: `{repair['Original Source File']}:{repair['Original Source Line']}` "
        f"(occurrence {repair['Occurrence']})\n"
        f"- Original statement: `{target['Original Statement']}`\n"
        f"- Original expression: `{repair['Original Expression']}`\n"
        f"- Eva safety property: `{repair['Raw Eva Property']}`\n"
        f"- Inserted ACSL property: `{repair['Inserted ACSL Property']}`\n"
        f"- ACSL label: `{repair['ACSL Label']}`\n"
        f"- Current assertion: `{target['Current Assertion Location']}`\n\n"
        "## Concrete KLEE witness\n\n"
        f"- Decoded inputs: `{repair['Concrete Inputs']}`\n"
        f"- Target assertion: `{repair['KLEE Target Assertion']}`\n"
        f"- KTest: `{repair['KTest']}`\n"
        f"- Target `.err`: `{repair['Target Error Evidence']}`\n"
        f"- Timeout after witness: `{repair['Timeout After Witness?']}`\n\n"
        "The frozen target-specific error proves that these concrete inputs reach the "
        "selected operation and falsify its Eva-derived safety predicate under the "
        "configured KLEE model.\n\n"
        f"## {strategy_header}\n\n"
        f"{repair['Repair Rationale']}\n\n"
        f"- Status: `{status}`\n"
        f"- Repair commit: `{repair['Repair Commit']}`\n"
        f"- Additionally affected alarms: `{repair['Additionally Affected Alarm IDs']}`\n",
        encoding="utf-8",
    )

summary: list[str] = [
    "# Eva/KLEE ACSL Repair Phase Summary",
    "",
    "## Scope and outcome",
    "",
    "The prior validated state contains 149 High-Precision Eva alarms: 48 with",
    "confirmed KLEE counterexamples and 101 without a confirmed counterexample.",
    "All 149 Eva-derived properties were materialized before implementation repair.",
    "",
    f"- High-Precision targets: {len(master_rows)}",
    f"- ACSL properties present with unique labels: {len(label_occurrences)}",
    f"- Confirmed-counterexample targets: {len(confirmed_rows)}",
    f"- Successfully repaired targets: {len(repaired_rows)}",
    f"- Repair-policy-required targets: {len(policy_rows)}",
    f"- Distinct implementation repair commits: {len(repair_commits)}",
    f"- Runtime-only properties: {len(runtime_rows)}",
    f"- Runtime-only completed/no-counterexample: {runtime_outcomes['NO_COUNTEREXAMPLE_SEARCH_COMPLETED']}",
    f"- Runtime-only timeout/inconclusive: {runtime_outcomes['TIMEOUT']}",
    f"- WP-ready targets: {len(wp_rows)}",
    "- WP execution in this phase: NOT RUN",
    "",
    "The state is intentionally partial: policy-required targets were not given an "
    "invented fallback. The 101 runtime-only target operations retain their original "
    "statements and are not included in the WP-next manifest.",
    "",
    "## Repaired target to commit mapping",
    "",
    "| Alarm | Status | Repair commit | ACSL label |",
    "|---|---|---|---|",
]
for row in repaired_rows:
    summary.append(
        f"| {row['KLEE Alarm ID']} | {row['Repair Status']} | `{row['Repair Commit']}` | "
        f"`{row['ACSL Label']}` |"
    )
summary.extend(
    [
        "",
        "## Targets requiring a repair-policy decision",
        "",
        "| Alarm | Function | Reason |",
        "|---|---|---|",
    ]
)
for row in policy_rows:
    summary.append(
        f"| {row['KLEE Alarm ID']} | `{row['Function']}` | {row['Repair Rationale']} |"
    )
summary.extend(
    [
        "",
        "## Complete target-to-ACSL mapping",
        "",
        "| Alarm | ACSL label | Current assertion | Future mode |",
        "|---|---|---|---|",
    ]
)
for row in master_rows:
    summary.append(
        f"| {row['KLEE Alarm ID']} | `{row['ACSL Label']}` | "
        f"`{row['Current Assertion Location']}` | {row['Future Verification Mode']} |"
    )
summary.extend(
    [
        "",
        "## Validation",
        "",
        f"Validation status: **{'NOT VALIDATED' if errors else 'VALIDATED PARTIAL STATE'}**",
        "",
        f"- {len(repaired_rows)} repaired + {len(policy_rows)} policy-required = "
        f"{len(confirmed_rows)} confirmed targets",
        f"- 15 completed/no-counterexample + 86 timeout = {len(runtime_rows)} runtime-only targets",
        f"- {len(confirmed_rows)} confirmed + {len(runtime_rows)} runtime-only = {len(master_rows)} total targets",
        "- All assertions were parsed separately with Frama-C's kernel only; Eva and WP were not invoked.",
    ]
)
if errors:
    summary.extend(["", "### Validation errors", ""] + [f"- {error}" for error in errors])
(PHASE / "REPAIR_PHASE_SUMMARY.md").write_text("\n".join(summary) + "\n", encoding="utf-8")

if errors:
    raise SystemExit("\n".join(errors))

print(f"High-Precision targets={len(master_rows)}")
print(f"Unique ACSL labels={len(label_occurrences)}")
print(f"Confirmed targets={len(confirmed_rows)}")
print(f"Repaired targets={len(repaired_rows)}")
print(f"Policy-required targets={len(policy_rows)}")
print(f"Runtime-only targets={len(runtime_rows)}")
print(f"Distinct repair commits={len(repair_commits)}")
print(f"WP-ready targets={len(wp_rows)}")
print("Validation=VALIDATED PARTIAL STATE")
