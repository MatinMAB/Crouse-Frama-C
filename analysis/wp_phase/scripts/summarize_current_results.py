#!/usr/bin/env python3
"""Summarize the latest result directory for each normalized WP target."""

from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
WP = ROOT / "analysis" / "wp_phase"


def read_targets() -> list[dict[str, str]]:
    with (WP / "data" / "wp_targets.tsv").open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def classify(result_dir: Path) -> tuple[str, str, str]:
    report = result_dir / "wp-report.json"
    exit_file = result_dir / "exit_code.txt"
    log = result_dir / "stdout_stderr.log"
    elapsed = (result_dir / "elapsed_time.txt")
    elapsed_value = elapsed.read_text(encoding="utf-8").strip().removesuffix(" seconds") if elapsed.exists() else ""
    if not report.exists():
        if exit_file.exists() and exit_file.read_text().strip() != "0":
            return "BUILD_OR_PARSE_FAILURE", "", elapsed_value
        return "MISSING_RESULT", "", elapsed_value
    try:
        goals = json.loads(report.read_text(encoding="utf-8"))
    except (json.JSONDecodeError, OSError):
        return "CONFIGURATION_ERROR", "", elapsed_value
    if goals and all(goal.get("passed") is True for goal in goals):
        successful = [
            str(prover["prover"])
            for goal in goals for prover in goal.get("provers", [])
            if int(prover.get("success", 0)) == 1
        ]
        status = "VALID_QED" if successful and all(name == "qed" for name in successful) else "VALID_EXTERNAL_PROVER"
        return status, ";".join(successful), elapsed_value
    log_text = log.read_text(encoding="utf-8", errors="replace") if log.exists() else ""
    if "timeout" in log_text.lower():
        return "TIMEOUT", "", elapsed_value
    if exit_file.exists() and exit_file.read_text().strip() != "0":
        return "PROVER_FAILURE", "", elapsed_value
    return "UNKNOWN", "", elapsed_value


parser = argparse.ArgumentParser()
parser.add_argument("--output", type=Path, default=WP / "results" / "current_summary.tsv")
args = parser.parse_args()
rows = []
for target in read_targets():
    alarm_id = target["klee_target_id"]
    directories = sorted(path for path in (WP / "results" / alarm_id).glob("*") if path.is_dir())
    if not directories:
        rows.append([alarm_id, target["function"], "MISSING_RESULT", "", "", ""])
        continue
    latest = directories[-1]
    status, prover, elapsed = classify(latest)
    rows.append([alarm_id, target["function"], status, prover, elapsed, str(latest.relative_to(ROOT))])

args.output.parent.mkdir(parents=True, exist_ok=True)
with args.output.open("w", newline="", encoding="utf-8") as stream:
    writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
    writer.writerow(["klee_target_id", "function", "status", "successful_prover", "elapsed_seconds", "result_dir"])
    writer.writerows(rows)

counts: dict[str, int] = {}
for row in rows:
    counts[row[2]] = counts.get(row[2], 0) + 1
print(f"Targets: {len(rows)}")
for status in ("VALID_QED", "VALID_EXTERNAL_PROVER", "TIMEOUT", "UNKNOWN", "PROVER_FAILURE", "BUILD_OR_PARSE_FAILURE", "CONFIGURATION_ERROR", "MISSING_RESULT"):
    print(f"{status}: {counts.get(status, 0)}")
print(f"Summary: {args.output}")
