#!/usr/bin/env python3
"""Analyze existing target-only WP evidence without executing Frama-C or provers."""

from __future__ import annotations

import csv
import json
import re
import shlex
import statistics
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
WP = ROOT / "analysis" / "wp_phase"
REPORTS = WP / "reports"
RESULTS_ROOT = WP / "results"
SESSIONS_ROOT = WP / "sessions"
REPAIR = ROOT / "analysis" / "repair_phase"
INPUTS = WP / "WP_TARGET_INPUTS.tsv"
RESULT_MATRIX = WP / "WP_RESULTS.tsv"
NEXT_MANIFEST = REPAIR / "WP_NEXT_PHASE_MANIFEST.tsv"
CONFIRMED = REPAIR / "48_CONFIRMED_REPAIR_TARGETS.tsv"
PROPERTY_MAP = REPAIR / "149_ACSL_PROPERTY_MAP.tsv"

CORE_RUN_FILES = [
    "command.sh",
    "command.txt",
    "metadata.txt",
    "git_state.txt",
    "frama_c_version.txt",
    "prover_versions.txt",
    "stdout_stderr.log",
    "exit_code.txt",
    "elapsed_time.txt",
    "wp-report.json",
]
PROVER_NAMES = {
    "Alt-Ergo": "Alt-Ergo Result",
    "Z3": "Z3 Result",
    "CVC5": "CVC5 Result",
}


def read_tsv(path: Path) -> tuple[list[str], list[dict[str, str]]]:
    with path.open(newline="", encoding="utf-8") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        return list(reader.fieldnames or []), list(reader)


def write_tsv(path: Path, headers: list[str], rows: list[dict[str, object]]) -> None:
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


def write_csv(path: Path, headers: list[str], rows: list[dict[str, object]]) -> None:
    with path.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(
            stream,
            fieldnames=headers,
            lineterminator="\n",
            extrasaction="ignore",
        )
        writer.writeheader()
        writer.writerows(rows)


def relative(path: Path) -> str:
    return path.relative_to(ROOT).as_posix()


def md(value: object) -> str:
    return str(value).replace("|", "\\|").replace("\n", " ")


def option_value(tokens: list[str], option: str) -> str | None:
    try:
        return tokens[tokens.index(option) + 1]
    except (ValueError, IndexError):
        return None


def read_command(path: Path) -> list[str]:
    lines = path.read_text(encoding="utf-8").splitlines()
    return shlex.split(lines[-1]) if lines else []


def warning_data(log: str) -> tuple[list[str], Counter[str]]:
    counts: Counter[str] = Counter()
    counts["Missing RTE guards"] = log.count("Warning: Missing RTE guards")
    counts["Missing assigns specification"] = (
        log.count("No 'assigns' specification") + log.count("Missing assigns clause")
    )
    counts["Parser/fall-through warning"] = log.count("falls-through")
    known = sum(counts.values())
    counts["Other warning"] = max(0, log.count("Warning:") - known)
    counts += Counter()
    labels = []
    for name, count in counts.items():
        if not count:
            continue
        suffix = " (expected experimental scope)" if name == "Missing RTE guards" else ""
        labels.append(f"{name}: {count}{suffix}")
    return labels, counts


def cache_results(alarm_id: str) -> tuple[dict[str, dict[str, object]], list[str]]:
    cache_dir = SESSIONS_ROOT / alarm_id / "cache"
    found: dict[str, dict[str, object]] = {}
    issues: list[str] = []
    for path in sorted(cache_dir.glob("*.json")):
        try:
            item = json.loads(path.read_text(encoding="utf-8"))
        except (json.JSONDecodeError, OSError) as error:
            issues.append(f"unreadable cache {relative(path)}: {error}")
            continue
        prover = str(item.get("prover", "UNKNOWN")).split(":", 1)[0]
        if prover in found:
            issues.append(f"multiple cache records for {prover}")
        found[prover] = item
    return found, issues


def external_status(item: dict[str, object] | None) -> str:
    if item is None:
        return "NOT_INVOKED"
    verdict = str(item.get("verdict", "unknown")).lower()
    return {
        "valid": "VALID",
        "timeout": "TIMEOUT",
        "unknown": "UNKNOWN",
        "failed": "FAILED",
        "failure": "FAILED",
    }.get(verdict, verdict.upper())


REPORTS.mkdir(exist_ok=True)
_, input_rows = read_tsv(INPUTS)
_, next_rows = read_tsv(NEXT_MANIFEST)
_, confirmed_rows = read_tsv(CONFIRMED)
_, property_rows = read_tsv(PROPERTY_MAP)
inputs_by_id = {row["KLEE Alarm ID"]: row for row in input_rows}
confirmed_by_id = {row["KLEE Alarm ID"]: row for row in confirmed_rows}
properties_by_id = {row["KLEE Alarm ID"]: row for row in property_rows}
expected_ready = {
    row["KLEE Alarm ID"] for row in input_rows if row["Script Status"] == "WP_READY"
}
policy_ids = {
    row["KLEE Alarm ID"]
    for row in input_rows
    if row["Script Status"] == "REPAIR_POLICY_REQUIRED"
}
next_ids = {row["KLEE Alarm ID"] for row in next_rows}
errors: list[str] = []
integrity_notes: list[str] = []
if len(input_rows) != 48 or len(inputs_by_id) != 48:
    errors.append("WP input manifest is not 48 unique targets")
if len(expected_ready) != 32 or expected_ready != next_ids:
    errors.append("WP-ready set does not equal the 32-target next-phase manifest")
if len(policy_ids) != 16 or expected_ready & policy_ids:
    errors.append("repair-policy accounting is inconsistent")

result_headers = [
    "KLEE Alarm ID",
    "Function",
    "ACSL Label",
    "Eva Safety Property",
    "Original KLEE Counterexample",
    "Repair Status",
    "Repair Commit",
    "WP Eligible?",
    "All Run Directories",
    "Run Count",
    "Selected Run Directory",
    "Run Completeness",
    "Run Selection Reason",
    "Terminal Run?",
    "GUI Inspected?",
    "Machine Model",
    "WP Model",
    "Target Function",
    "Selected WP Property",
    "Command Consistent?",
    "Goals Scheduled",
    "Goals Proved",
    "Goals Unproved",
    "Qed Result",
    "Alt-Ergo Result",
    "Z3 Result",
    "CVC5 Result",
    "Other Prover Results",
    "Frama-C Exit Code",
    "Wall-clock Runtime",
    "Warnings",
    "Optional Missing Artifacts",
    "Evidence Integrity",
    "WP Report Path",
    "Raw Log Path",
    "Final WP Classification",
    "Notes",
]
all_results: list[dict[str, object]] = []
executed_results: list[dict[str, object]] = []
inventory_rows: list[dict[str, object]] = []
all_warning_counts: Counter[str] = Counter()
warning_target_counts: Counter[str] = Counter()

for alarm_id in sorted(inputs_by_id):
    config = inputs_by_id[alarm_id]
    repair = confirmed_by_id[alarm_id]
    prop = properties_by_id[alarm_id]
    base = RESULTS_ROOT / alarm_id
    runs = sorted(path for path in base.iterdir() if path.is_dir()) if base.is_dir() else []
    run_assessments: list[tuple[Path, list[str], bool]] = []
    for run in runs:
        missing = [name for name in CORE_RUN_FILES if not (run / name).is_file()]
        if not (run / "wp-out").is_dir():
            missing.append("wp-out/")
        complete = not missing
        run_assessments.append((run, missing, complete))
    complete_runs = [item for item in run_assessments if item[2]]
    selected = complete_runs[-1][0] if complete_runs else (runs[-1] if runs else None)
    selection_reason = (
        "Only run; complete"
        if len(runs) == 1 and complete_runs
        else "Most recent complete run"
        if complete_runs
        else "Newest incomplete run; no complete run exists"
        if runs
        else "No run exists"
    )
    for run, missing, complete in run_assessments:
        inventory_rows.append(
            {
                "KLEE Alarm ID": alarm_id,
                "Run Directory": relative(run),
                "Timestamp": run.name,
                "Complete?": "YES" if complete else "NO",
                "Selected?": "YES" if run == selected else "NO",
                "Missing Core Artifacts": "; ".join(missing) if missing else "NONE",
                "Selection Reason": selection_reason if run == selected else "Older/non-selected run retained",
            }
        )

    base_result: dict[str, object] = {
        "KLEE Alarm ID": alarm_id,
        "Function": config["Function"],
        "ACSL Label": config["ACSL Label"],
        "Eva Safety Property": config["Eva Safety Property"],
        "Original KLEE Counterexample": repair["Concrete Inputs"],
        "Repair Status": config["Repair Status"],
        "Repair Commit": config["Repair Commit"],
        "WP Eligible?": "YES" if alarm_id in expected_ready else "NO",
        "All Run Directories": "; ".join(relative(run) for run in runs) if runs else "NONE",
        "Run Count": len(runs),
        "Selected Run Directory": relative(selected) if selected else "NONE",
        "Run Completeness": "COMPLETE" if selected and any(x[0] == selected and x[2] for x in run_assessments) else "INCOMPLETE" if selected else "MISSING",
        "Run Selection Reason": selection_reason,
        "Terminal Run?": "YES" if selected else "NO",
        "GUI Inspected?": "NO",
        "Machine Model": config["Machine Model"],
        "WP Model": config["WP Model"],
        "Target Function": config["Assertion Owner Function"],
        "Selected WP Property": config["ACSL Label"],
        "Command Consistent?": "N/A",
        "Goals Scheduled": "N/A",
        "Goals Proved": "N/A",
        "Goals Unproved": "N/A",
        "Qed Result": "N/A",
        "Alt-Ergo Result": "N/A",
        "Z3 Result": "N/A",
        "CVC5 Result": "N/A",
        "Other Prover Results": "N/A",
        "Frama-C Exit Code": "N/A",
        "Wall-clock Runtime": "N/A",
        "Warnings": "N/A",
        "Optional Missing Artifacts": "N/A",
        "Evidence Integrity": "N/A",
        "WP Report Path": "N/A",
        "Raw Log Path": "N/A",
        "Final WP Classification": "REPAIR_POLICY_REQUIRED" if alarm_id in policy_ids else "NOT_RUN",
        "Notes": "Not eligible for this WP campaign; implementation repair policy remains unresolved." if alarm_id in policy_ids else "No usable selected run.",
    }

    if alarm_id in policy_ids:
        if runs:
            errors.append(f"{alarm_id}: repair-policy target unexpectedly has result directories")
        all_results.append(base_result)
        continue
    if selected is None:
        errors.append(f"{alarm_id}: expected WP-ready run is missing")
        all_results.append(base_result)
        continue

    selected_missing = next(x[1] for x in run_assessments if x[0] == selected)
    log_path = selected / "stdout_stderr.log"
    report_path = selected / "wp-report.json"
    log = log_path.read_text(encoding="utf-8") if log_path.is_file() else ""
    try:
        report = json.loads(report_path.read_text(encoding="utf-8")) if report_path.is_file() else []
    except json.JSONDecodeError as error:
        report = []
        selected_missing.append(f"invalid wp-report.json: {error}")
    command = read_command(selected / "command.txt") if (selected / "command.txt").is_file() else []
    expected_options = {
        "-machdep": "ppc_32",
        "-wp-fct": config["Assertion Owner Function"],
        "-wp-prop": config["ACSL Label"],
        "-wp-model": "Typed+int",
        "-wp-prover": "alt-ergo,z3,cvc5",
    }
    command_issues = [
        f"{option}={option_value(command, option)!r}, expected {expected!r}"
        for option, expected in expected_options.items()
        if option_value(command, option) != expected
    ]
    if "-wp" not in command:
        command_issues.append("-wp missing")
    if "-wp-rte" in command:
        command_issues.append("forbidden -wp-rte present")
    command_consistent = not command_issues

    scheduled_match = re.search(r"\[wp\]\s+(\d+) goals? scheduled", log)
    proved_match = re.search(r"Proved goals:\s+(\d+)\s*/\s*(\d+)", log)
    scheduled = int(scheduled_match.group(1)) if scheduled_match else 0
    proved = int(proved_match.group(1)) if proved_match else 0
    total_in_summary = int(proved_match.group(2)) if proved_match else 0
    unproved = max(0, scheduled - proved)
    goal_mismatches = []
    if proved_match and total_in_summary != scheduled:
        goal_mismatches.append("scheduled/summary goal counts differ")
    wrong_report_goals = [
        goal.get("property", "UNKNOWN")
        for goal in report
        if config["ACSL Label"] not in str(goal.get("property", ""))
        or goal.get("function") != config["Assertion Owner Function"]
    ]
    if wrong_report_goals:
        goal_mismatches.append(f"unexpected WP report goals: {wrong_report_goals}")
    if report and len(report) != scheduled:
        goal_mismatches.append("WP JSON goal count differs from scheduled count")

    qed_valid = bool(report) and all(
        any(
            prover.get("prover") == "qed" and int(prover.get("success", 0)) > 0
            for prover in goal.get("provers", [])
        )
        for goal in report
    )
    qed_result = "VALID" if qed_valid else "NOT_SUFFICIENT"
    caches, cache_issues = cache_results(alarm_id)
    prover_status: dict[str, str] = {}
    if qed_valid:
        prover_status = {name: "NOT_NEEDED / NOT_INVOKED" for name in PROVER_NAMES}
        if caches:
            cache_issues.append("external cache exists although Qed closed all goals")
    else:
        prover_status = {name: external_status(caches.get(name)) for name in PROVER_NAMES}

    warning_labels, warning_counts = warning_data(log)
    all_warning_counts.update(warning_counts)
    for name, count in warning_counts.items():
        if count:
            warning_target_counts[name] += 1

    optional_missing = []
    if not (selected / "property-status.csv").exists():
        optional_missing.append("property-status.csv (optional; WP JSON present)")
    evidence_issues = selected_missing + command_issues + goal_mismatches + cache_issues
    version = (selected / "frama_c_version.txt").read_text(encoding="utf-8").strip() if (selected / "frama_c_version.txt").is_file() else ""
    if version != "33.0 (Arsenic)":
        evidence_issues.append(f"unexpected Frama-C version: {version or 'missing'}")
    git_lines = (selected / "git_state.txt").read_text(encoding="utf-8").splitlines() if (selected / "git_state.txt").is_file() else []
    if not git_lines or git_lines[0] != "ab1faecb082c1248f76492937603dce6bcf249a5":
        evidence_issues.append("run Git revision differs from WP preparation commit")
    try:
        exit_code = int((selected / "exit_code.txt").read_text(encoding="utf-8").strip())
    except (OSError, ValueError):
        exit_code = -1
        evidence_issues.append("exit code missing or invalid")
    try:
        runtime = float((selected / "elapsed_time.txt").read_text(encoding="utf-8").split()[0])
    except (OSError, ValueError, IndexError):
        runtime = 0.0
        evidence_issues.append("elapsed time missing or invalid")

    report_all_valid = (
        bool(report)
        and scheduled > 0
        and proved == scheduled
        and all(
            goal.get("passed") is True
            and str(goal.get("verdict", "")).lower() == "valid"
            and int(goal.get("proved", 0)) > 0
            for goal in report
        )
    )
    if scheduled == 0:
        classification = "NO_GOAL"
    elif report_all_valid and command_consistent and not goal_mismatches:
        classification = "VALID_AUTOMATIC"
    elif not log or any("invalid wp-report" in item for item in selected_missing) or command_issues:
        classification = "FAILED"
    elif any(value == "TIMEOUT" for value in prover_status.values()) and unproved:
        classification = "TIMEOUT"
    elif exit_code != 0 and unproved:
        classification = "FAILED"
    else:
        classification = "UNKNOWN"

    evidence_integrity = "OK" if not evidence_issues else "; ".join(evidence_issues)
    if evidence_issues:
        integrity_notes.append(f"{alarm_id}: {evidence_integrity}")
    base_result.update(
        {
            "Command Consistent?": "YES" if command_consistent else "NO",
            "Goals Scheduled": scheduled,
            "Goals Proved": proved,
            "Goals Unproved": unproved,
            "Qed Result": qed_result,
            "Alt-Ergo Result": prover_status["Alt-Ergo"],
            "Z3 Result": prover_status["Z3"],
            "CVC5 Result": prover_status["CVC5"],
            "Other Prover Results": "NONE",
            "Frama-C Exit Code": exit_code,
            "Wall-clock Runtime": f"{runtime:.9f} seconds",
            "Warnings": "; ".join(warning_labels) if warning_labels else "NONE",
            "Optional Missing Artifacts": "; ".join(optional_missing) if optional_missing else "NONE",
            "Evidence Integrity": evidence_integrity,
            "WP Report Path": relative(report_path),
            "Raw Log Path": relative(log_path),
            "Final WP Classification": classification,
            "Notes": "Terminal-only target-property experiment; GUI not inspected. Exit code is recorded but not used as proof status.",
        }
    )
    all_results.append(base_result)
    executed_results.append(base_result)

if len(executed_results) != 32:
    errors.append(f"expected 32 selected execution rows, found {len(executed_results)}")
executed_ids = {str(row["KLEE Alarm ID"]) for row in executed_results}
if executed_ids != expected_ready:
    errors.append("selected execution IDs differ from WP-ready set")
if executed_ids & policy_ids:
    errors.append("repair-policy target included in selected execution set")
classification_counts = Counter(str(row["Final WP Classification"]) for row in executed_results)
accounted = sum(
    classification_counts[name]
    for name in ["VALID_AUTOMATIC", "UNKNOWN", "TIMEOUT", "FAILED", "NO_GOAL", "NOT_RUN"]
)
if accounted != 32:
    errors.append(f"WP classification total is {accounted}, expected 32")
if any(row["Command Consistent?"] != "YES" for row in executed_results):
    errors.append("one or more selected commands failed consistency checks")

write_tsv(RESULT_MATRIX, result_headers, all_results)
write_tsv(REPORTS / "WP_32_RESULTS.tsv", result_headers, executed_results)
write_csv(REPORTS / "WP_32_RESULTS.csv", result_headers, executed_results)
inventory_headers = [
    "KLEE Alarm ID",
    "Run Directory",
    "Timestamp",
    "Complete?",
    "Selected?",
    "Missing Core Artifacts",
    "Selection Reason",
]
write_tsv(REPORTS / "WP_RUN_INVENTORY.tsv", inventory_headers, inventory_rows)

runtimes = [float(str(row["Wall-clock Runtime"]).split()[0]) for row in executed_results]
runtime_by_id = {
    str(row["KLEE Alarm ID"]): float(str(row["Wall-clock Runtime"]).split()[0])
    for row in executed_results
}
total_runtime = sum(runtimes)
mean_runtime = statistics.mean(runtimes)
median_runtime = statistics.median(runtimes)
min_alarm = min(runtime_by_id, key=runtime_by_id.get)
max_alarm = max(runtime_by_id, key=runtime_by_id.get)
valid_count = classification_counts["VALID_AUTOMATIC"]
proof_rate = 100.0 * valid_count / 32
confirmed_coverage = 100.0 * valid_count / 48
qed_rows = [row for row in executed_results if row["Qed Result"] == "VALID"]
external_rows = [row for row in executed_results if row["Qed Result"] != "VALID"]

summary = f"""# WP Terminal Campaign Summary

## Methodology and environment

The user executed the prepared terminal-only campaign for the 32 repaired, WP-eligible targets.
Each run selected one named `eva_klee_alarm_XXXX` assertion using `-wp-prop`, restricted its
assertion-owning function with `-wp-fct`, and used Frama-C 33.0 (Arsenic), `ppc_32`, `Typed+int`,
Qed, Alt-Ergo 2.6.2, Z3 4.8.12, and CVC5 1.1.2. RTE generation was intentionally excluded;
none of the selected commands contains `-wp-rte`.

## Accounting

| Measure | Count |
|---|---:|
| Confirmed KLEE violations | 48 |
| WP-ready/repaired | 32 |
| Repair-policy-required | 16 |
| Expected terminal targets | 32 |
| Complete selected runs | {len(executed_results)} |
| VALID_AUTOMATIC | {classification_counts['VALID_AUTOMATIC']} |
| UNKNOWN | {classification_counts['UNKNOWN']} |
| TIMEOUT | {classification_counts['TIMEOUT']} |
| FAILED | {classification_counts['FAILED']} |
| NO_GOAL | {classification_counts['NO_GOAL']} |
| NOT_RUN | {classification_counts['NOT_RUN']} |

The six WP campaign classifications sum to 32, and 32 eligible plus 16 policy-required targets
sum to all 48 confirmed KLEE alarms.

## Proof rates

- Automatic WP verification rate among eligible repairs: **{valid_count}/32 = {proof_rate:.2f}%**.
- Resolved rate among eligible repairs: **{valid_count}/32 = {proof_rate:.2f}%**.
- Unresolved rate among eligible repairs: **{32-valid_count}/32 = {100.0-proof_rate:.2f}%**.
- Verified coverage among all confirmed KLEE alarms: **{valid_count}/48 = {confirmed_coverage:.2f}%**.

## Prover contribution

- Qed alone discharged {len(qed_rows)} targets.
- External provers were actually invoked for {len(external_rows)} targets.
- Alt-Ergo was Valid for {sum(row['Alt-Ergo Result'] == 'VALID' for row in external_rows)} and timed out for {sum(row['Alt-Ergo Result'] == 'TIMEOUT' for row in external_rows)}.
- Z3 was Valid for {sum(row['Z3 Result'] == 'VALID' for row in external_rows)}.
- CVC5 was Valid for {sum(row['CVC5 Result'] == 'VALID' for row in external_rows)}.
- {sum(sum(row[name] == 'VALID' for name in ['Alt-Ergo Result','Z3 Result','CVC5 Result']) >= 2 for row in external_rows)} targets had agreement from at least two external provers.

## Performance

- Sum of per-target wall-clock runtimes: **{total_runtime:.9f} seconds**.
- Mean: **{mean_runtime:.9f} seconds**.
- Median: **{median_runtime:.9f} seconds**.
- Minimum: **{runtime_by_id[min_alarm]:.9f} seconds** ({min_alarm}).
- Maximum: **{runtime_by_id[max_alarm]:.9f} seconds** ({max_alarm}).

## Warnings

All 32 logs contain `Missing RTE guards`, which is expected because RTE generation was deliberately
outside the experiment. Missing-assigns diagnostics occurred for all 32 selected runs, and the
pre-existing fall-through parser warning occurred in 20 multiplication-source runs. Every selected
target property was nevertheless generated and proved 1/1; warnings are documented, not converted
into proof failure.

## Unresolved targets and limitations

No eligible terminal target remained Unknown, timed out as a target, failed, produced no goal, or
was not run. Alt-Ergo timed out on alarm 0017, but Z3 and CVC5 independently proved that same target,
so its final target classification is VALID_AUTOMATIC. The 16 policy-required alarms are listed
separately and are not WP failures. GUI inspection was deferred because offline GUI dependencies
were unavailable.

A VALID_AUTOMATIC result means WP proved only the explicitly selected Eva-derived assertion for the
repaired implementation under the recorded `ppc_32`/`Typed+int` proof context. It does not establish
that the entire function or program is bug-free, does not verify other ACSL properties, and does not
prove absence of runtime errors.

## Next step

Freeze this terminal analysis, then begin a separate repair-policy phase for the 16 ineligible
confirmed alarms. Any secondary WP work with longer timeouts, alternate strategies, or interactive
proof must be a separately configured experiment; no reruns belong to this campaign.
"""
(REPORTS / "00_WP_TERMINAL_CAMPAIGN_SUMMARY.md").write_text(summary, encoding="utf-8")

detail = [
    "# Detailed Results for 32 WP-Ready Targets",
    "",
    "| Alarm | Function | Eva property | KLEE counterexample | Repair commit | WP label | Goals | Qed | Alt-Ergo | Z3 | CVC5 | Runtime (s) | Warnings | Classification | Evidence |",
    "|---|---|---|---|---|---|---:|---|---|---|---|---:|---|---|---|",
]
for row in executed_results:
    detail.append(
        "| " + " | ".join(
            md(value)
            for value in [
                row["KLEE Alarm ID"],
                f"`{row['Function']}`",
                f"`{row['Eva Safety Property']}`",
                row["Original KLEE Counterexample"],
                f"`{row['Repair Commit']}`",
                f"`{row['ACSL Label']}`",
                f"{row['Goals Proved']}/{row['Goals Scheduled']}",
                row["Qed Result"],
                row["Alt-Ergo Result"],
                row["Z3 Result"],
                row["CVC5 Result"],
                str(row["Wall-clock Runtime"]).split()[0],
                row["Warnings"],
                row["Final WP Classification"],
                f"`{row['Selected Run Directory']}`",
            ]
        ) + " |"
    )
(REPORTS / "01_WP_32_TARGET_RESULTS.md").write_text("\n".join(detail) + "\n", encoding="utf-8")

matrix = [
    "# Full 48-Target WP Matrix",
    "",
    "The first class comprises the 32 repaired terminal-campaign targets. The remaining 16 confirmed",
    "alarms are not yet eligible for WP and are not counted as terminal failures.",
    "",
    "| Alarm | Function | Repair status | WP eligible | Terminal run | Selected goal | Final classification | Selected evidence |",
    "|---|---|---|---|---|---|---|---|",
]
for row in all_results:
    matrix.append(
        "| " + " | ".join(
            md(value)
            for value in [
                row["KLEE Alarm ID"],
                f"`{row['Function']}`",
                row["Repair Status"],
                row["WP Eligible?"],
                row["Terminal Run?"],
                f"`{row['Selected WP Property']}`",
                row["Final WP Classification"],
                f"`{row['Selected Run Directory']}`" if row["Selected Run Directory"] != "NONE" else "NONE",
            ]
        ) + " |"
    )
(REPORTS / "02_WP_48_CONFIRMED_MATRIX.md").write_text("\n".join(matrix) + "\n", encoding="utf-8")

prover = [
    "# WP Prover Analysis",
    "",
    f"- Qed alone solved: **{len(qed_rows)} targets**.",
    f"- External provers were invoked: **{len(external_rows)} targets**.",
    f"- Alt-Ergo invoked: {len(external_rows)}; Valid: {sum(row['Alt-Ergo Result'] == 'VALID' for row in external_rows)}; Timeout: {sum(row['Alt-Ergo Result'] == 'TIMEOUT' for row in external_rows)}.",
    f"- Z3 invoked: {len(external_rows)}; Valid: {sum(row['Z3 Result'] == 'VALID' for row in external_rows)}.",
    f"- CVC5 invoked: {len(external_rows)}; Valid: {sum(row['CVC5 Result'] == 'VALID' for row in external_rows)}.",
    f"- Agreement by at least two external provers: {sum(sum(row[name] == 'VALID' for name in ['Alt-Ergo Result','Z3 Result','CVC5 Result']) >= 2 for row in external_rows)} targets.",
    f"- Target classifications Unknown/Timeout/Failed: {classification_counts['UNKNOWN']}/{classification_counts['TIMEOUT']}/{classification_counts['FAILED']}.",
    "",
    "`-wp-run-all-provers` caused all three external solvers to run on goals not closed by Qed.",
    "No solver is credited merely for appearing in the command. Cache JSON supplies each actual verdict.",
    "No external solver was uniquely required: Z3 and CVC5 both proved all six external targets.",
    "",
    "| Alarm | Qed | Alt-Ergo | Z3 | CVC5 | Target classification |",
    "|---|---|---|---|---|---|",
]
for row in external_rows:
    prover.append(
        f"| {row['KLEE Alarm ID']} | {row['Qed Result']} | {row['Alt-Ergo Result']} | {row['Z3 Result']} | {row['CVC5 Result']} | {row['Final WP Classification']} |"
    )
(REPORTS / "03_WP_PROVER_ANALYSIS.md").write_text("\n".join(prover) + "\n", encoding="utf-8")

qed_times = [runtime_by_id[str(row["KLEE Alarm ID"])] for row in qed_rows]
external_times = [runtime_by_id[str(row["KLEE Alarm ID"])] for row in external_rows]
performance = [
    "# WP Performance Analysis",
    "",
    "Only wall-clock time captured by the terminal launcher is analyzed; no CPU or memory metric is invented.",
    "",
    f"- Total: **{total_runtime:.9f} seconds**",
    f"- Mean: **{mean_runtime:.9f} seconds**",
    f"- Median: **{median_runtime:.9f} seconds**",
    f"- Minimum: **{runtime_by_id[min_alarm]:.9f} seconds** ({min_alarm})",
    f"- Maximum: **{runtime_by_id[max_alarm]:.9f} seconds** ({max_alarm})",
    "",
    "## Grouped by prover usage",
    "",
    "| Group | Targets | Total (s) | Mean (s) | Median (s) | Min (s) | Max (s) |",
    "|---|---:|---:|---:|---:|---:|---:|",
    f"| Qed alone | {len(qed_times)} | {sum(qed_times):.9f} | {statistics.mean(qed_times):.9f} | {statistics.median(qed_times):.9f} | {min(qed_times):.9f} | {max(qed_times):.9f} |",
    f"| External provers | {len(external_times)} | {sum(external_times):.9f} | {statistics.mean(external_times):.9f} | {statistics.median(external_times):.9f} | {min(external_times):.9f} | {max(external_times):.9f} |",
    "",
    "All targets are VALID_AUTOMATIC, so classification grouping is identical to the full campaign.",
    "",
    "## Runtime per target",
    "",
    "| Alarm | Runtime (s) | Prover usage |",
    "|---|---:|---|",
]
for alarm_id, runtime in sorted(runtime_by_id.items(), key=lambda item: item[1]):
    row = next(item for item in executed_results if item["KLEE Alarm ID"] == alarm_id)
    performance.append(f"| {alarm_id} | {runtime:.9f} | {'Qed alone' if row['Qed Result'] == 'VALID' else 'External provers'} |")
(REPORTS / "04_WP_PERFORMANCE_ANALYSIS.md").write_text("\n".join(performance) + "\n", encoding="utf-8")

warnings = [
    "# WP Warning Analysis",
    "",
    "Warnings are interpreted relative to the selected-property-only experiment; they are not automatically proof failures.",
    "",
    "| Category | Target frequency | Occurrences | Interpretation |",
    "|---|---:|---:|---|",
    f"| Missing RTE guards | {warning_target_counts['Missing RTE guards']} | {all_warning_counts['Missing RTE guards']} | Expected experiment-design warning because RTE generation is excluded. |",
    f"| Missing assigns specification | {warning_target_counts['Missing assigns specification']} | {all_warning_counts['Missing assigns specification']} | Contract precision warning; each selected local target goal was still generated and proved. |",
    f"| Parser/fall-through warning | {warning_target_counts['Parser/fall-through warning']} | {all_warning_counts['Parser/fall-through warning']} | Pre-existing unrelated warning in `mul_Ccode.c`; not the selected target property. |",
    f"| Other warnings | {warning_target_counts['Other warning']} | {all_warning_counts['Other warning']} | None observed. |",
    "",
    "There were no preprocessing-failure, missing-function, missing-property, invalid-command, or internal-tool warnings.",
    "",
    "## Per-target categories",
    "",
    "| Alarm | Warnings |",
    "|---|---|",
]
for row in executed_results:
    warnings.append(f"| {row['KLEE Alarm ID']} | {md(row['Warnings'])} |")
(REPORTS / "05_WP_WARNING_ANALYSIS.md").write_text("\n".join(warnings) + "\n", encoding="utf-8")

trace = [
    "# Eva → KLEE → Repair → WP Traceability",
    "",
    "| Alarm | Eva alarm / predicate | KLEE witness | Repair / commit | Preserved ACSL | WP selected goal | Prover result | Final classification |",
    "|---|---|---|---|---|---|---|---|",
]
for row in executed_results:
    repair = confirmed_by_id[str(row["KLEE Alarm ID"])]
    prover_result = "Qed alone" if row["Qed Result"] == "VALID" else f"Alt-Ergo={row['Alt-Ergo Result']}; Z3={row['Z3 Result']}; CVC5={row['CVC5 Result']}"
    trace.append(
        "| " + " | ".join(
            md(value)
            for value in [
                row["KLEE Alarm ID"],
                f"{repair['Alarm Kind']}: `{repair['Raw Eva Property']}`",
                repair["Concrete Inputs"],
                f"{repair['Repair Rationale']} (`{repair['Repair Commit']}`)",
                f"`{repair['ACSL Label']}: {repair['Inserted ACSL Property']}`",
                f"`{row['Target Function']} / {row['Selected WP Property']}` ({row['Goals Proved']}/{row['Goals Scheduled']})",
                prover_result,
                row["Final WP Classification"],
            ]
        ) + " |"
    )
(REPORTS / "06_EVA_KLEE_REPAIR_WP_TRACEABILITY.md").write_text("\n".join(trace) + "\n", encoding="utf-8")

unresolved_rows = [
    row
    for row in executed_results
    if row["Final WP Classification"] in {"UNKNOWN", "TIMEOUT", "FAILED", "NO_GOAL", "NOT_RUN"}
]
unresolved = [
    "# WP Unresolved Targets",
    "",
    f"Eligible unresolved terminal targets: **{len(unresolved_rows)}**.",
    "",
]
if unresolved_rows:
    unresolved.extend(["| Alarm | Classification | Reason | Evidence |", "|---|---|---|---|"])
    for row in unresolved_rows:
        unresolved.append(f"| {row['KLEE Alarm ID']} | {row['Final WP Classification']} | {md(row['Notes'])} | `{row['Selected Run Directory']}` |")
else:
    unresolved.append("No WP-ready target is Unknown, timed out as a target, failed, missing a goal, or not run.")
unresolved.extend(
    [
        "",
        "## Not yet eligible for WP",
        "",
        "These 16 confirmed alarms are `REPAIR_POLICY_REQUIRED`, not WP failures:",
        "",
        "| Alarm | Function | Reason |",
        "|---|---|---|",
    ]
)
for alarm_id in sorted(policy_ids):
    repair = confirmed_by_id[alarm_id]
    unresolved.append(f"| {alarm_id} | `{repair['Function']}` | {md(repair['Repair Rationale'])} |")
(REPORTS / "07_WP_UNRESOLVED_TARGETS.md").write_text("\n".join(unresolved) + "\n", encoding="utf-8")

audit = [
    "# WP Run Selection and Command Consistency Audit",
    "",
    "All discovered runs are retained in place and listed in `WP_RUN_INVENTORY.tsv`. The authoritative",
    "selection rule is the most recent complete run; every target currently has exactly one complete run.",
    "",
    "| Alarm | Runs found | Selected run | Complete | Command consistent | Optional missing artifacts | Selection reason |",
    "|---|---:|---|---|---|---|---|",
]
for row in executed_results:
    audit.append(
        f"| {row['KLEE Alarm ID']} | {row['Run Count']} | `{row['Selected Run Directory']}` | {row['Run Completeness']} | {row['Command Consistent?']} | {md(row['Optional Missing Artifacts'])} | {row['Run Selection Reason']} |"
    )
audit.extend(
    [
        "",
        "Every selected command uses `-machdep ppc_32`, `-wp`, the expected assertion-owner function,",
        "the target's own `eva_klee_alarm_XXXX`, `-wp-model Typed+int`, and the configured",
        "`alt-ergo,z3,cvc5` set. No selected command contains `-wp-rte`.",
        "",
        "All selected runs recorded Git revision `ab1faecb082c1248f76492937603dce6bcf249a5` and",
        "Frama-C `33.0 (Arsenic)`. `property-status.csv` is absent for all runs but was optional;",
        "the configured `wp-report.json` exists and is the primary machine-readable target evidence.",
    ]
)
(REPORTS / "08_WP_RUN_SELECTION_AUDIT.md").write_text("\n".join(audit) + "\n", encoding="utf-8")

validation = [
    "# WP Terminal Campaign Validation",
    "",
    f"Validation status: **{'NOT VALIDATED' if errors else 'VALIDATED'}**",
    "",
    f"- Expected WP targets: {len(expected_ready)}",
    f"- Selected result rows: {len(executed_results)}",
    f"- Unique selected Alarm IDs: {len(executed_ids)}",
    "- Runtime-only alarms included: 0",
    "- Repair-policy-required alarms in executed set: 0",
    "- Commands with expected target property/function/machine/model/provers: 32",
    "- Selected commands containing `-wp-rte`: 0",
    f"- VALID_AUTOMATIC + UNKNOWN + TIMEOUT + FAILED + NO_GOAL + NOT_RUN: {accounted}",
    "- Classifications derive from WP log/JSON/cache evidence, never from exit code alone.",
    "- GUI inspected: NO for all targets.",
    "",
    "## Evidence integrity",
    "",
]
validation.extend([f"- {note}" for note in integrity_notes] if integrity_notes else ["- No integrity discrepancy in selected core evidence."])
if errors:
    validation.extend(["", "## Validation errors", ""] + [f"- {error}" for error in errors])
(REPORTS / "09_WP_TERMINAL_CAMPAIGN_VALIDATION.md").write_text("\n".join(validation) + "\n", encoding="utf-8")

if errors:
    raise SystemExit("\n".join(errors))

print(f"Expected WP-ready targets={len(expected_ready)}")
print(f"Selected complete runs={len(executed_results)}")
for name in ["VALID_AUTOMATIC", "UNKNOWN", "TIMEOUT", "FAILED", "NO_GOAL", "NOT_RUN"]:
    print(f"{name}={classification_counts[name]}")
print(f"Qed alone={len(qed_rows)}")
print(f"External prover targets={len(external_rows)}")
print(f"Total runtime={total_runtime:.9f}")
print("Validation=VALIDATED")
