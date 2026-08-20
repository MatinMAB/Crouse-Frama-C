#!/usr/bin/env python3
"""Validate repair-policy accounting without running Eva, KLEE, or WP."""

from __future__ import annotations

import csv
import re
import stat
import subprocess
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
PHASE = ROOT / "analysis" / "repair_policy_phase"
START = "c6230ca7820bc2442d30ac9f8f4ee7ef2efe3070"
NEW = {"KLEE-ALARM-0061", "KLEE-ALARM-0066", "KLEE-ALARM-0144"}
AMBIGUOUS = {
    f"KLEE-ALARM-{number}"
    for number in (
        "0002", "0003", "0005", "0006", "0009", "0010", "0012",
        "0013", "0014", "0015", "0019", "0020", "0021",
    )
}


def read_tsv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def git_changed(*paths: str) -> list[str]:
    result = subprocess.run(
        ["git", "diff", "--name-only", START, "--", *paths],
        cwd=ROOT,
        check=True,
        capture_output=True,
        text=True,
    )
    return result.stdout.splitlines()


matrix = read_tsv(PHASE / "REPAIR_POLICY_MATRIX.tsv")
manifest = read_tsv(PHASE / "WP_SECOND_CAMPAIGN_MANIFEST.tsv")
current = read_tsv(PHASE / "CURRENT_48_CONFIRMED_REPAIR_STATUS.tsv")
properties = read_tsv(ROOT / "analysis" / "repair_phase" / "149_ACSL_PROPERTY_MAP.tsv")
runtime_only = read_tsv(ROOT / "analysis" / "repair_phase" / "101_RUNTIME_ONLY_PROPERTIES.tsv")

assert len(matrix) == 16
assert len({row["KLEE Alarm ID"] for row in matrix}) == 16
assert {row["KLEE Alarm ID"] for row in matrix if row["WP Ready?"] == "YES"} == NEW
assert {
    row["KLEE Alarm ID"]
    for row in matrix
    if row["Semantic Decision"] == "SEMANTICS_AMBIGUOUS"
} == AMBIGUOUS
assert all(row["ACSL Preserved?"] == "YES" for row in matrix if row["KLEE Alarm ID"] in NEW)
assert all(row["Parser Check"].startswith("PASS:") for row in matrix if row["KLEE Alarm ID"] in NEW)

assert len(manifest) == 3
assert {row["KLEE Alarm ID"] for row in manifest} == NEW
assert all(row["WP Status"] == "NOT_RUN" for row in manifest)
assert not NEW & {row["KLEE Alarm ID"] for row in runtime_only}

assert len(current) == 48
latest = Counter(row["Latest Repair Status"] for row in current)
assert latest["REPAIRED"] + latest["REPAIRED_SHARED"] == 35
assert latest["REPAIR_POLICY_REQUIRED"] == 13

# Validate all 149 labels and inserted predicates, not just the three changed paths.
source_text = "\n".join(
    path.read_text(encoding="utf-8", errors="replace")
    for path in (ROOT / "src_repaired").rglob("*")
    if path.suffix in {".c", ".h"}
)
pattern = re.compile(
    r"/\*@\s*assert\s+(eva_klee_alarm_\d{4})\s*:\s*(.*?)\s*;\s*\*/",
    re.DOTALL,
)
matches = pattern.findall(source_text)
assert len(matches) == 149
assert len({label for label, _ in matches}) == 149
inserted = {label: " ".join(predicate.split()) for label, predicate in matches}
assert len(properties) == 149
for row in properties:
    expected = " ".join(row["Inserted ACSL Property"].split())
    assert inserted.get(row["ACSL Label"]) == expected, row["KLEE Alarm ID"]

# Confirm each newly repaired assertion still guards the intended original operation.
expected_next = {
    "eva_klee_alarm_0061": "s32Temp2 = s32Temp2 << 1;",
    "eva_klee_alarm_0066": "s32Temp2 = s32Temp2 << 1;",
    "eva_klee_alarm_0144": "numerator = -numerator;",
}
for label, statement in expected_next.items():
    row = next(item for item in manifest if item["ACSL Label"] == label)
    lines = (ROOT / row["Source File"]).read_text(encoding="utf-8").splitlines()
    index = next(i for i, line in enumerate(lines) if label in line)
    label_line = index + 1
    index = next(i for i in range(index, len(lines)) if "*/" in lines[i]) + 1
    while index < len(lines):
        candidate = lines[index].strip()
        if candidate.startswith("/*"):
            index = next(i for i in range(index, len(lines)) if "*/" in lines[i]) + 1
            continue
        if candidate:
            assert candidate == statement, label
            break
        index += 1
    assert row["Current Assertion Location"] == f"{row['Source File']}:{label_line}"

# Metadata is ready only for the newly repaired targets, while the batch remains separate.
for alarm_id in NEW:
    metadata = (ROOT / "analysis" / "wp_phase" / "targets" / alarm_id / "metadata.env").read_text()
    assert "SCRIPT_STATUS=WP_READY\n" in metadata
    assert "WP_ELIGIBLE=YES\n" in metadata
    result_dir = ROOT / "analysis" / "wp_phase" / "results" / alarm_id
    assert not result_dir.exists() or not any(result_dir.iterdir())

second_script = ROOT / "analysis" / "wp_phase" / "run_second_campaign.sh"
assert second_script.stat().st_mode & stat.S_IXUSR
script_ids = set(re.findall(r"^  (KLEE-ALARM-\d{4})$", second_script.read_text(), re.MULTILINE))
assert script_ids == NEW
subprocess.run(["bash", "-n", str(second_script)], check=True)

first_script = (ROOT / "analysis" / "wp_phase" / "run_all_wp_ready.sh").read_text()
first_ids = set(re.findall(r"^  (KLEE-ALARM-\d{4})$", first_script, re.MULTILINE))
assert len(first_ids) == 32 and not first_ids & NEW

# Frozen sources, KLEE evidence, first-campaign results, and first-campaign reports are untouched.
frozen_changes = git_changed(
    "src_original",
    "src_analysis",
    "analysis/klee_phase_c",
    "analysis/wp_phase/results",
    "analysis/wp_phase/reports",
    "analysis/wp_phase/WP_RESULTS.tsv",
    "analysis/wp_phase/run_all_wp_ready.sh",
)
assert frozen_changes == [], frozen_changes

target_changes = set(git_changed("analysis/wp_phase/targets"))
expected_target_changes = {
    f"analysis/wp_phase/targets/{alarm_id}/{filename}"
    for alarm_id in NEW
    for filename in ("README.md", "metadata.env")
}
assert target_changes == expected_target_changes, target_changes ^ expected_target_changes

print("VALIDATED")
print("policy targets=16")
print("newly repaired=3")
print("semantics ambiguous=13")
print("total repaired and WP-ready=35/48")
print("ACSL labels and predicates preserved=149/149")
print("second campaign rows=3; WP results present=0")
print("frozen prior campaign/source/evidence changes=0")
