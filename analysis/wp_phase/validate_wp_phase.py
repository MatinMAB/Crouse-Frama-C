#!/usr/bin/env python3
"""Statically validate all target-only WP launchers without executing WP."""

from __future__ import annotations

import csv
import re
import subprocess
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
WP = ROOT / "analysis" / "wp_phase"
REPAIR = ROOT / "analysis" / "repair_phase"


def read_tsv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


errors: list[str] = []
confirmed = read_tsv(REPAIR / "48_CONFIRMED_REPAIR_TARGETS.tsv")
runtime = read_tsv(REPAIR / "101_RUNTIME_ONLY_PROPERTIES.tsv")
property_map = read_tsv(REPAIR / "149_ACSL_PROPERTY_MAP.tsv")
inputs = read_tsv(WP / "WP_TARGET_INPUTS.tsv")
results = read_tsv(WP / "WP_RESULTS.tsv")

confirmed_ids = {row["KLEE Alarm ID"] for row in confirmed}
runtime_ids = {row["KLEE Alarm ID"] for row in runtime}
input_ids = {row["KLEE Alarm ID"] for row in inputs}
result_ids = {row["KLEE Alarm ID"] for row in results}
if len(confirmed) != 48 or len(confirmed_ids) != 48:
    errors.append("authoritative confirmed manifest is not 48 unique targets")
if len(inputs) != 48 or input_ids != confirmed_ids:
    errors.append("WP_TARGET_INPUTS.tsv does not exactly match the 48 confirmed targets")
if len(results) != 48 or result_ids != confirmed_ids:
    errors.append("WP_RESULTS.tsv does not exactly match the 48 confirmed targets")
if input_ids & runtime_ids:
    errors.append("runtime-only target included in WP input manifest")

properties = {row["KLEE Alarm ID"]: row for row in property_map}
for row in inputs:
    prop = properties[row["KLEE Alarm ID"]]
    source = ROOT / row["Repaired Source File"]
    source_lines = source.read_text(encoding="utf-8").splitlines()
    line = int(row["Current Assertion Line"])
    if not (1 <= line <= len(source_lines)) or row["ACSL Label"] not in source_lines[line - 1]:
        errors.append(f"{row['KLEE Alarm ID']}: assertion label/line mapping differs from source")
    if row["ACSL Label"] != prop["ACSL Label"] or row["Eva Safety Property"] != prop["Raw Eva Property"]:
        errors.append(f"{row['KLEE Alarm ID']}: frozen property mapping differs")

status_counts = Counter(row["Script Status"] for row in inputs)
if status_counts != Counter({"WP_READY": 32, "REPAIR_POLICY_REQUIRED": 16}):
    errors.append(f"unexpected script status counts: {dict(status_counts)}")

targets = sorted((WP / "targets").glob("KLEE-ALARM-*"))
if len(targets) != 48 or {path.name for path in targets} != confirmed_ids:
    errors.append("target directories do not exactly match confirmed targets")

required = ["metadata.env", "README.md", "run_terminal.sh", "run_gui.sh"]
for name in required:
    count = sum((target / name).is_file() for target in targets)
    if count != 48:
        errors.append(f"{name}: expected 48, found {count}")
for target in targets:
    for name in ["run_terminal.sh", "run_gui.sh"]:
        if not (target / name).stat().st_mode & 0o111:
            errors.append(f"not executable: {target.relative_to(ROOT) / name}")

session_dirs = sorted((WP / "sessions").glob("KLEE-ALARM-*"))
if len(session_dirs) != 48 or {path.name for path in session_dirs} != confirmed_ids:
    errors.append("persistent session directories do not exactly match confirmed targets")

required_environment = [
    "FRAMAC_VERSION.txt",
    "WP_HELP.txt",
    "WP_AVAILABLE_PROVERS.txt",
    "TOOL_PATHS.txt",
    "WP_ENVIRONMENT.md",
]
for name in required_environment:
    if not (WP / "environment" / name).is_file():
        errors.append(f"missing environment record: {name}")

shell_files = sorted(WP.rglob("*.sh"))
for script in shell_files:
    completed = subprocess.run(["bash", "-n", str(script)], check=False)
    if completed.returncode:
        errors.append(f"bash -n failed: {script.relative_to(ROOT)}")
    text = script.read_text(encoding="utf-8")
    if re.search(r"(?:^|\s)-wp-rte(?:\s|$)", text):
        errors.append(f"forbidden RTE option in {script.relative_to(ROOT)}")
    if "-wp-prop @all" in text or "-wp-prop=\"@all\"" in text:
        errors.append(f"broad property selector in {script.relative_to(ROOT)}")

common = (WP / "lib" / "wp_common.sh").read_text(encoding="utf-8")
for required_fragment in [
    '-wp-fct "$WP_FUNCTION"',
    '-wp-prop "$ACSL_LABEL"',
    '-wp-model "$WP_MODEL"',
    '-wp-par 1',
    '-wp-run-all-provers',
    '-wp-report-json "$report_json"',
]:
    if required_fragment not in common:
        errors.append(f"common launcher missing: {required_fragment}")

batch = (WP / "run_all_wp_ready.sh").read_text(encoding="utf-8")
batch_ids = re.findall(r"^\s+(KLEE-ALARM-\d{4})$", batch, re.MULTILINE)
ready_ids = {row["KLEE Alarm ID"] for row in inputs if row["Script Status"] == "WP_READY"}
if len(batch_ids) != 32 or set(batch_ids) != ready_ids:
    errors.append("batch launcher does not contain exactly the 32 WP_READY targets")

for row in results:
    expected_eligible = "YES" if row["Repair Status"].startswith("REPAIRED") else "NO"
    expected_class = "NOT_RUN" if expected_eligible == "YES" else "REPAIR_POLICY_REQUIRED"
    if row["WP Eligible?"] != expected_eligible:
        errors.append(f"{row['KLEE Alarm ID']}: incorrect WP eligibility")
    if row["Terminal Run?"] != "NO" or row["GUI Inspected?"] != "NO":
        errors.append(f"{row['KLEE Alarm ID']}: preparation incorrectly records execution")
    if row["Final WP Classification"] != expected_class:
        errors.append(f"{row['KLEE Alarm ID']}: incorrect initial classification")

if errors:
    raise SystemExit("\n".join(errors))

print("Confirmed KLEE targets=48")
print("Target directories=48")
print("metadata.env=48")
print("README.md=48")
print("run_terminal.sh=48")
print("run_gui.sh=48")
print("Persistent session directories=48")
print("WP_READY=32")
print("REPAIR_POLICY_REQUIRED=16")
print("Runtime-only targets included=0")
print(f"Shell scripts passing bash -n={len(shell_files)}")
print("Shellcheck=NOT_INSTALLED")
print("WP target executions=0")
print("GUI target executions=0")
