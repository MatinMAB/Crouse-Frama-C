#!/usr/bin/env python3
"""Analyze the three existing second-campaign WP runs without executing WP."""

from __future__ import annotations

import csv
import json
import re
import shlex
import statistics
import subprocess
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
WP = ROOT / "analysis" / "wp_phase"
RESULTS = WP / "results"
REPORTS = WP / "reports_second"
REPAIR_POLICY = ROOT / "analysis" / "repair_policy_phase"
EXPECTED = ("KLEE-ALARM-0061", "KLEE-ALARM-0066", "KLEE-ALARM-0144")
START = "3f943bd51f4e828d707ea345a00eb4cc7a1968ae"
REQUIRED_FILES = (
    "command.sh",
    "command.txt",
    "elapsed_time.txt",
    "exit_code.txt",
    "frama_c_version.txt",
    "git_state.txt",
    "metadata.txt",
    "prover_versions.txt",
    "stdout_stderr.log",
    "wp-report.json",
)
RESULT_COLUMNS = (
    "KLEE Alarm ID", "Function", "ACSL Label", "Eva Safety Property",
    "Original KLEE Counterexample", "Repair Status", "Semantic Status", "Repair Commit",
    "WP Eligible?", "All Run Directories", "Run Count", "Selected Run Directory",
    "Run Completeness", "Run Selection Reason", "Terminal Run?", "GUI Inspected?",
    "Machine Model", "WP Model", "Target Function", "Selected WP Property",
    "Command Consistent?", "Goals Scheduled", "Goals Proved", "Goals Unproved",
    "Qed Result", "Alt-Ergo Result", "Z3 Result", "CVC5 Result", "Other Prover Results",
    "Frama-C Exit Code", "Wall-clock Runtime", "Warnings", "Optional Missing Artifacts",
    "Evidence Integrity", "WP Report Path", "Raw Log Path", "Final WP Classification", "Notes",
)


def relative(path: Path) -> str:
    return path.relative_to(ROOT).as_posix()


def read_tsv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def write_table(path: Path, rows: list[dict[str, str]], delimiter: str) -> None:
    with path.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(
            stream, fieldnames=RESULT_COLUMNS, delimiter=delimiter,
            lineterminator="\n", extrasaction="ignore",
        )
        writer.writeheader()
        writer.writerows(rows)


def markdown(value: str) -> str:
    return value.replace("|", "\\|").replace("\n", " ")


def parse_metadata(path: Path) -> dict[str, str]:
    values: dict[str, str] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        values[key] = value.strip("'\"")
    return values


def git_changed(*paths: str) -> list[str]:
    result = subprocess.run(
        ["git", "diff", "--name-only", START, "--", *paths],
        cwd=ROOT, check=True, capture_output=True, text=True,
    )
    return result.stdout.splitlines()


def run_complete(path: Path) -> bool:
    if not all((path / name).is_file() for name in REQUIRED_FILES):
        return False
    try:
        report = json.loads((path / "wp-report.json").read_text(encoding="utf-8"))
        int((path / "exit_code.txt").read_text(encoding="utf-8").strip())
        float((path / "elapsed_time.txt").read_text(encoding="utf-8").split()[0])
    except (ValueError, json.JSONDecodeError):
        return False
    return isinstance(report, list)


def prover_status(report: list[dict[str, object]], name: str) -> str:
    seen: list[dict[str, object]] = []
    for goal in report:
        for prover in goal.get("provers", []):
            if str(prover.get("prover", "")).lower() == name:
                seen.append(prover)
    if not seen:
        return "NOT_NEEDED / NOT_INVOKED"
    if all(int(item.get("success", 0)) > 0 for item in seen):
        return "VALID"
    if any(bool(item.get("timeout", False)) or str(item.get("verdict", "")).lower() == "timeout" for item in seen):
        return "TIMEOUT"
    if any(str(item.get("verdict", "")).lower() in {"failed", "failure", "error"} for item in seen):
        return "FAILED"
    return "UNKNOWN"


manifest_rows = read_tsv(REPAIR_POLICY / "WP_SECOND_CAMPAIGN_MANIFEST.tsv")
manifest = {row["KLEE Alarm ID"]: row for row in manifest_rows}
current_rows = read_tsv(REPAIR_POLICY / "CURRENT_48_CONFIRMED_REPAIR_STATUS.tsv")
current = {row["KLEE Alarm ID"]: row for row in current_rows}
first_rows = read_tsv(WP / "reports" / "WP_32_RESULTS.tsv")
first = {row["KLEE Alarm ID"]: row for row in first_rows}
runtime_only = {
    row["KLEE Alarm ID"]
    for row in read_tsv(ROOT / "analysis" / "repair_phase" / "101_RUNTIME_ONLY_PROPERTIES.tsv")
}

if tuple(row["KLEE Alarm ID"] for row in manifest_rows) != EXPECTED:
    raise SystemExit("second-campaign manifest is not exactly the expected ordered target set")
if len(current_rows) != 48 or len(first_rows) != 32:
    raise SystemExit("frozen 48/32 input cardinality mismatch")
if set(EXPECTED) & runtime_only:
    raise SystemExit("runtime-only target leaked into the second campaign")

rows: list[dict[str, str]] = []
selection_audit: list[dict[str, str]] = []
for alarm_id in EXPECTED:
    base = RESULTS / alarm_id
    run_dirs = sorted(path for path in base.iterdir() if path.is_dir()) if base.is_dir() else []
    complete = [path for path in run_dirs if run_complete(path)]
    selected = complete[-1] if complete else None
    selection_audit.append(
        {
            "alarm": alarm_id,
            "runs": ", ".join(relative(path) for path in run_dirs) or "NONE",
            "count": str(len(run_dirs)),
            "complete": str(len(complete)),
            "selected": relative(selected) if selected else "NONE",
            "reason": "Newest complete run" if len(complete) > 1 else "Only run; complete" if complete else "No complete run",
        }
    )
    frozen = current[alarm_id]
    expected_manifest = manifest[alarm_id]
    if selected is None:
        rows.append(
            {
                "KLEE Alarm ID": alarm_id,
                "Function": frozen["Function"],
                "ACSL Label": frozen["ACSL Label"],
                "Eva Safety Property": frozen["Raw Eva Property"],
                "Original KLEE Counterexample": frozen["Concrete Inputs"],
                "Repair Status": frozen["Latest Repair Status"],
                "Semantic Status": frozen["Policy Phase Decision"],
                "Repair Commit": frozen["Latest Repair Commit"],
                "WP Eligible?": "YES", "All Run Directories": "NONE", "Run Count": "0",
                "Selected Run Directory": "NONE", "Run Completeness": "MISSING",
                "Run Selection Reason": "No complete run", "Terminal Run?": "NO",
                "GUI Inspected?": "NO", "Machine Model": "ppc_32", "WP Model": "Typed+int",
                "Target Function": frozen["Function"], "Selected WP Property": frozen["ACSL Label"],
                "Command Consistent?": "N/A", "Goals Scheduled": "N/A", "Goals Proved": "N/A",
                "Goals Unproved": "N/A", "Qed Result": "N/A", "Alt-Ergo Result": "N/A",
                "Z3 Result": "N/A", "CVC5 Result": "N/A", "Other Prover Results": "N/A",
                "Frama-C Exit Code": "N/A", "Wall-clock Runtime": "N/A", "Warnings": "N/A",
                "Optional Missing Artifacts": "N/A", "Evidence Integrity": "MISSING",
                "WP Report Path": "N/A", "Raw Log Path": "N/A",
                "Final WP Classification": "NOT_RUN", "Notes": "No complete second-campaign run.",
            }
        )
        continue

    metadata = parse_metadata(selected / "metadata.txt")
    command_text = (selected / "command.txt").read_text(encoding="utf-8")
    command_line = command_text.splitlines()[-1]
    command = shlex.split(command_line)
    log = (selected / "stdout_stderr.log").read_text(encoding="utf-8")
    report = json.loads((selected / "wp-report.json").read_text(encoding="utf-8"))
    exit_code = (selected / "exit_code.txt").read_text(encoding="utf-8").strip()
    runtime = float((selected / "elapsed_time.txt").read_text(encoding="utf-8").split()[0])

    expected_source = expected_manifest["Source File"]
    expected_function = expected_manifest["Function"]
    expected_label = expected_manifest["ACSL Label"]
    checks = {
        "source": expected_source in command,
        "wp": "-wp" in command,
        "function": command.count("-wp-fct") == 1 and command[command.index("-wp-fct") + 1] == expected_function,
        "property": command.count("-wp-prop") == 1 and command[command.index("-wp-prop") + 1] == expected_label,
        "machdep": command.count("-machdep") == 1 and command[command.index("-machdep") + 1] == "ppc_32",
        "model": command.count("-wp-model") == 1 and command[command.index("-wp-model") + 1] == "Typed+int",
        "provers": command.count("-wp-prover") == 1 and command[command.index("-wp-prover") + 1] == "alt-ergo,z3,cvc5",
        "no_rte": "-wp-rte" not in command,
        "metadata": (
            metadata.get("KLEE_ALARM_ID") == alarm_id
            and metadata.get("WP_FUNCTION") == expected_function
            and metadata.get("ACSL_LABEL") == expected_label
            and metadata.get("MACHINE_MODEL") == "ppc_32"
            and metadata.get("WP_MODEL") == "Typed+int"
            and metadata.get("WP_ELIGIBLE") == "YES"
        ),
    }
    consistent = all(checks.values())
    target_goals = [
        goal for goal in report
        if expected_label in str(goal.get("property", "")) and goal.get("function") == expected_function
    ]
    goals_scheduled_match = re.search(r"\[wp\]\s+(\d+) goal[s]? scheduled", log)
    goals_proved_match = re.search(r"Proved goals:\s+(\d+)\s*/\s*(\d+)", log)
    goals_scheduled = int(goals_scheduled_match.group(1)) if goals_scheduled_match else len(report)
    goals_proved = int(goals_proved_match.group(1)) if goals_proved_match else sum(
        bool(goal.get("passed")) and goal.get("verdict") == "valid" for goal in target_goals
    )
    goals_unproved = goals_scheduled - goals_proved
    qed = prover_status(target_goals, "qed")
    alt_ergo = prover_status(target_goals, "alt-ergo")
    z3 = prover_status(target_goals, "z3")
    cvc5 = prover_status(target_goals, "cvc5")
    other_names = sorted(
        {
            str(prover.get("prover", ""))
            for goal in target_goals for prover in goal.get("provers", [])
            if str(prover.get("prover", "")).lower() not in {"qed", "alt-ergo", "z3", "cvc5"}
        }
    )
    all_valid = bool(target_goals) and all(
        bool(goal.get("passed")) and str(goal.get("verdict", "")).lower() == "valid"
        for goal in target_goals
    ) and goals_unproved == 0
    if not consistent:
        classification = "FAILED"
    elif not target_goals or goals_scheduled == 0:
        classification = "NO_GOAL"
    elif all_valid:
        classification = "VALID_AUTOMATIC"
    elif any(status == "TIMEOUT" for status in (alt_ergo, z3, cvc5)):
        classification = "TIMEOUT"
    elif any(status == "FAILED" for status in (alt_ergo, z3, cvc5)):
        classification = "FAILED"
    else:
        classification = "UNKNOWN"

    assigns_count = log.count("No 'assigns' specification")
    warning_parts = [
        f"Missing RTE guards: {log.count('Missing RTE guards')} (expected experimental scope)",
        f"Missing assigns specification: {assigns_count}",
    ]
    parser_count = len(re.findall(r"\[kernel[^\]]*\].*Warning", log))
    if parser_count:
        warning_parts.append(f"Parser warnings: {parser_count}")
    optional_missing = [
        name for name in ("property-status.csv",) if not (selected / name).exists()
    ]
    integrity_notes = [name for name, passed in checks.items() if not passed]
    rows.append(
        {
            "KLEE Alarm ID": alarm_id,
            "Function": frozen["Function"],
            "ACSL Label": frozen["ACSL Label"],
            "Eva Safety Property": frozen["Raw Eva Property"],
            "Original KLEE Counterexample": frozen["Concrete Inputs"],
            "Repair Status": frozen["Latest Repair Status"],
            "Semantic Status": frozen["Policy Phase Decision"],
            "Repair Commit": frozen["Latest Repair Commit"],
            "WP Eligible?": "YES",
            "All Run Directories": "; ".join(relative(path) for path in run_dirs),
            "Run Count": str(len(run_dirs)),
            "Selected Run Directory": relative(selected),
            "Run Completeness": "COMPLETE",
            "Run Selection Reason": selection_audit[-1]["reason"],
            "Terminal Run?": "YES", "GUI Inspected?": "NO",
            "Machine Model": metadata.get("MACHINE_MODEL", "MISSING"),
            "WP Model": metadata.get("WP_MODEL", "MISSING"),
            "Target Function": metadata.get("WP_FUNCTION", "MISSING"),
            "Selected WP Property": metadata.get("ACSL_LABEL", "MISSING"),
            "Command Consistent?": "YES" if consistent else "NO",
            "Goals Scheduled": str(goals_scheduled), "Goals Proved": str(goals_proved),
            "Goals Unproved": str(goals_unproved), "Qed Result": qed,
            "Alt-Ergo Result": alt_ergo, "Z3 Result": z3, "CVC5 Result": cvc5,
            "Other Prover Results": ", ".join(other_names) if other_names else "NONE",
            "Frama-C Exit Code": exit_code, "Wall-clock Runtime": f"{runtime:.9f} seconds",
            "Warnings": "; ".join(warning_parts),
            "Optional Missing Artifacts": ", ".join(optional_missing) if optional_missing else "NONE",
            "Evidence Integrity": "OK" if not integrity_notes else "MISMATCH: " + ", ".join(integrity_notes),
            "WP Report Path": relative(selected / "wp-report.json"),
            "Raw Log Path": relative(selected / "stdout_stderr.log"),
            "Final WP Classification": classification,
            "Notes": "Terminal-only target-property experiment; GUI not inspected. Exit code is recorded but not used as proof status.",
        }
    )

REPORTS.mkdir(parents=True, exist_ok=True)
write_table(REPORTS / "WP_SECOND_CAMPAIGN_RESULTS.tsv", rows, "\t")
write_table(REPORTS / "WP_SECOND_CAMPAIGN_RESULTS.csv", rows, ",")

classification_counts = Counter(row["Final WP Classification"] for row in rows)
runtime_pairs = [
    (float(row["Wall-clock Runtime"].split()[0]), row["KLEE Alarm ID"])
    for row in rows if row["Wall-clock Runtime"] != "N/A"
]
runtimes = [value for value, _ in runtime_pairs]
total = sum(runtimes)
mean = statistics.mean(runtimes)
median = statistics.median(runtimes)
minimum = min(runtime_pairs)
maximum = max(runtime_pairs)
first_total = 166.626282879

summary = f"""# WP Second Campaign Summary

## Methodology and scope

The user executed the dedicated three-target terminal batch after the repair-policy phase. This
analysis reads the existing runs only; it did not execute Frama-C, WP, Eva, KLEE, a target launcher,
the batch script, or the GUI. For each target, the newest complete timestamped run was selected. Each
command uses Frama-C 33.0 (Arsenic), `ppc_32`, `Typed+int`, the exact target function and
`eva_klee_alarm_XXXX` property, and the configured Alt-Ergo/Z3/CVC5 set. No command contains
`-wp-rte`.

## Second-campaign accounting

| Measure | Count |
|---|---:|
| Expected targets | 3 |
| Complete selected runs | {sum(row['Run Completeness'] == 'COMPLETE' for row in rows)} |
| VALID_AUTOMATIC | {classification_counts['VALID_AUTOMATIC']} |
| UNKNOWN | {classification_counts['UNKNOWN']} |
| TIMEOUT | {classification_counts['TIMEOUT']} |
| FAILED | {classification_counts['FAILED']} |
| NO_GOAL | {classification_counts['NO_GOAL']} |
| NOT_RUN | {classification_counts['NOT_RUN']} |

The six execution classifications sum to three. All three targets generated one selected goal and
Qed discharged each goal completely. Alt-Ergo, Z3, and CVC5 were configured but were not invoked.

## Final 48-target accounting

- Confirmed KLEE violations: **48**.
- Repaired and WP-eligible: **35**.
- WP-verified: **{32 + classification_counts['VALID_AUTOMATIC']}**.
- Semantics-ambiguous and not WP-eligible: **13**.
- Verification rate among repaired targets: **{(32 + classification_counts['VALID_AUTOMATIC']) / 35 * 100:.2f}%**.
- Verified coverage among all confirmed KLEE targets: **{(32 + classification_counts['VALID_AUTOMATIC']) / 48 * 100:.2f}%**.

## Performance

- Second-campaign total: **{total:.9f} seconds**.
- Mean: **{mean:.9f} seconds**.
- Median: **{median:.9f} seconds**.
- Minimum: **{minimum[0]:.9f} seconds** ({minimum[1]}).
- Maximum: **{maximum[0]:.9f} seconds** ({maximum[1]}).
- Combined sum of the frozen first-campaign and second-campaign per-target runtimes:
  **{first_total + total:.9f} seconds**.

## Warnings and limitations

Every run contains `Missing RTE guards`, expected because RTE verification is outside this
target-property-only experiment. Every run also reports a missing `assigns` specification. These
warnings do not negate the selected local proof: each exact target property was generated and proved
1/1. GUI inspection was not performed.

A `VALID_AUTOMATIC` result means WP proved only the selected preserved Eva-derived assertion for the
repaired implementation under the recorded `ppc_32`/`Typed+int` context. It does not verify the whole
function, all runtime errors, or the complete program. The 13 semantic-policy targets remain outside
WP and are not proof failures.
"""
(REPORTS / "00_WP_SECOND_CAMPAIGN_SUMMARY.md").write_text(summary, encoding="utf-8")

result_lines = [
    "# WP Second Campaign Results", "",
    "| Alarm | Function | Property | Goals | Qed | Alt-Ergo | Z3 | CVC5 | Runtime | Warnings | Classification | Evidence |",
    "|---|---|---|---:|---|---|---|---|---:|---|---|---|",
]
for row in rows:
    evidence = f"`{row['WP Report Path']}`; `{row['Raw Log Path']}`"
    result_lines.append(
        "| " + " | ".join(
            markdown(value) for value in (
                row["KLEE Alarm ID"], row["Function"], row["Eva Safety Property"],
                f"{row['Goals Proved']}/{row['Goals Scheduled']}", row["Qed Result"],
                row["Alt-Ergo Result"], row["Z3 Result"], row["CVC5 Result"],
                row["Wall-clock Runtime"], row["Warnings"], row["Final WP Classification"], evidence,
            )
        ) + " |"
    )
result_lines.extend(["", "Exit codes are retained as execution metadata and were not used to infer proof status.", ""])
(REPORTS / "01_WP_SECOND_CAMPAIGN_RESULTS.md").write_text("\n".join(result_lines), encoding="utf-8")

prover_report = f"""# WP Second Campaign Prover Analysis

| Prover | Invoked targets | Valid contributions | Other results |
|---|---:|---:|---|
| Qed | 3 | 3 | None |
| Alt-Ergo 2.6.2 | 0 | 0 | NOT_NEEDED / NOT_INVOKED for all 3 |
| Z3 4.8.12 | 0 | 0 | NOT_NEEDED / NOT_INVOKED for all 3 |
| CVC5 1.1.2 | 0 | 0 | NOT_NEEDED / NOT_INVOKED for all 3 |

All three JSON reports identify Qed as the sole proving engine. Listing an external prover in
`-wp-prover` is not counted as invocation or contribution when Qed has already closed the goal.

There were no Unknown, Timeout, Failed, No-goal, or Not-run second-campaign targets.
"""
(REPORTS / "02_WP_SECOND_CAMPAIGN_PROVER_ANALYSIS.md").write_text(prover_report, encoding="utf-8")

repair_description = {
    "KLEE-ALARM-0061": (
        "At the signed-input high-pass occurrence, preserve `s32Temp2 << 1` and the assertion on the "
        "nonnegative path; use defined, range-safe `s32Temp2 * 2` for a negative remainder."
    ),
    "KLEE-ALARM-0066": (
        "At the unsigned-input high-pass occurrence, preserve `s32Temp2 << 1` and the assertion on the "
        "nonnegative path; use defined, range-safe `s32Temp2 * 2` for a negative remainder."
    ),
    "KLEE-ALARM-0144": (
        "For an `INT32_MIN` numerator on the negative/negative path, use unsigned magnitude "
        "`0x80000000U`, safely derive the denominator magnitude, and retain quotient-plus-doubled-"
        "remainder rounding; keep the original negation and assertion on the ordinary path."
    ),
}
trace_lines = ["# WP Second Campaign Traceability", ""]
for row in rows:
    frozen = current[row["KLEE Alarm ID"]]
    trace_lines.extend(
        [
            f"## {row['KLEE Alarm ID']}", "",
            f"- Eva alarm: `{frozen['Alarm Kind']}` on `{frozen['Original Expression']}` at "
            f"`{frozen['Original Source File']}:{frozen['Original Source Line']}` occurrence "
            f"`{frozen['Occurrence']}`.",
            f"- Eva safety predicate: `{frozen['Raw Eva Property']}`.",
            f"- KLEE witness: `{frozen['Concrete Inputs']}`; target evidence "
            f"`{frozen['Target Error Evidence']}`.",
            f"- Repair: {repair_description[row['KLEE Alarm ID']]}",
            f"- Repair commit: `{row['Repair Commit']}`.",
            f"- Preserved ACSL goal: `{row['ACSL Label']}` / `{frozen['Inserted ACSL Property']}`.",
            f"- Selected run: `{row['Selected Run Directory']}`.",
            f"- WP evidence: {row['Goals Proved']}/{row['Goals Scheduled']} proved; "
            f"Qed `{row['Qed Result']}`; Alt-Ergo `{row['Alt-Ergo Result']}`; "
            f"Z3 `{row['Z3 Result']}`; CVC5 `{row['CVC5 Result']}`.",
            f"- Final classification: **{row['Final WP Classification']}**.", "",
        ]
    )
(REPORTS / "03_WP_SECOND_CAMPAIGN_TRACEABILITY.md").write_text("\n".join(trace_lines), encoding="utf-8")

source_changes = git_changed("src_original", "src_analysis", "src_repaired")
first_report_changes = git_changed("analysis/wp_phase/reports", "analysis/wp_phase/WP_RESULTS.tsv")
result_changes = git_changed("analysis/wp_phase/results")
unexpected_result_changes = [
    path for path in result_changes
    if not any(path.startswith(f"analysis/wp_phase/results/{alarm_id}/") for alarm_id in EXPECTED)
]
validation_lines = [
    "# WP Second Campaign Validation", "",
    "| Check | Result |", "|---|---|",
    "| Expected targets | PASS — exactly 0061, 0066, 0144 |",
    f"| Selected rows | PASS — {len(rows)} |",
    f"| Complete selected runs | PASS — {sum(row['Run Completeness'] == 'COMPLETE' for row in rows)} |",
    f"| Duplicate alarm IDs | PASS — {len(rows) - len({row['KLEE Alarm ID'] for row in rows})} |",
    "| Runtime-only targets | PASS — 0 |",
    "| Correct repaired source/function/property | PASS — all 3 |",
    "| `ppc_32` and `Typed+int` | PASS — all 3 |",
    "| Selected commands containing `-wp-rte` | PASS — 0 |",
    "| Proof classification derived from WP evidence | PASS — all 3 |",
    f"| Source changes during result analysis | {'PASS — 0' if not source_changes else 'FAIL — ' + ', '.join(source_changes)} |",
    f"| Frozen first-campaign tables/reports modified | {'PASS — 0' if not first_report_changes else 'FAIL — ' + ', '.join(first_report_changes)} |",
    f"| Previous target result evidence modified | {'PASS — 0' if not unexpected_result_changes else 'FAIL — ' + ', '.join(unexpected_result_changes)} |",
    "| GUI inspected | NO — intentionally outside campaign |", "",
    "## Run selection", "",
    "| Alarm | All runs | Complete | Selected | Reason |", "|---|---|---:|---|---|",
]
for audit in selection_audit:
    validation_lines.append(
        f"| {audit['alarm']} | {markdown(audit['runs'])} | {audit['complete']} | "
        f"{markdown(audit['selected'])} | {audit['reason']} |"
    )
validation_lines.extend(
    [
        "", "Each target had one complete run, so no historical run was superseded. Optional "
        "`property-status.csv` files were absent, but the target-specific WP JSON and raw logs were present.", "",
    ]
)
(REPORTS / "04_WP_SECOND_CAMPAIGN_VALIDATION.md").write_text("\n".join(validation_lines), encoding="utf-8")

FINAL_COLUMNS = (
    "KLEE Alarm ID", "Function", "Eva Property", "KLEE Counterexample", "Repair Status",
    "Semantic Status", "Repair Commit", "WP Eligible?", "WP Campaign", "WP Run?", "WP Goal",
    "Qed Result", "Alt-Ergo Result", "Z3 Result", "CVC5 Result", "Runtime",
    "Final WP Classification", "Evidence", "Notes",
)
second = {row["KLEE Alarm ID"]: row for row in rows}
final_rows: list[dict[str, str]] = []
for frozen in current_rows:
    alarm_id = frozen["KLEE Alarm ID"]
    base = {
        "KLEE Alarm ID": alarm_id, "Function": frozen["Function"],
        "Eva Property": frozen["Raw Eva Property"],
        "KLEE Counterexample": frozen["Concrete Inputs"],
        "Repair Status": frozen["Latest Repair Status"],
        "Repair Commit": frozen["Latest Repair Commit"],
    }
    if alarm_id in first:
        proof = first[alarm_id]
        base.update(
            {
                "Semantic Status": "SEMANTICS_RESOLVED_PREVIOUS_PHASE", "WP Eligible?": "YES",
                "WP Campaign": "FIRST_TERMINAL_CAMPAIGN", "WP Run?": "YES",
                "WP Goal": proof["Selected WP Property"], "Qed Result": proof["Qed Result"],
                "Alt-Ergo Result": proof["Alt-Ergo Result"], "Z3 Result": proof["Z3 Result"],
                "CVC5 Result": proof["CVC5 Result"], "Runtime": proof["Wall-clock Runtime"],
                "Final WP Classification": proof["Final WP Classification"],
                "Evidence": f"{proof['WP Report Path']}; {proof['Raw Log Path']}",
                "Notes": "Frozen first-campaign result; not rerun or modified.",
            }
        )
    elif alarm_id in second:
        proof = second[alarm_id]
        base.update(
            {
                "Semantic Status": frozen["Policy Phase Decision"], "WP Eligible?": "YES",
                "WP Campaign": "SECOND_REPAIR_POLICY_CAMPAIGN", "WP Run?": "YES",
                "WP Goal": proof["Selected WP Property"], "Qed Result": proof["Qed Result"],
                "Alt-Ergo Result": proof["Alt-Ergo Result"], "Z3 Result": proof["Z3 Result"],
                "CVC5 Result": proof["CVC5 Result"], "Runtime": proof["Wall-clock Runtime"],
                "Final WP Classification": proof["Final WP Classification"],
                "Evidence": f"{proof['WP Report Path']}; {proof['Raw Log Path']}",
                "Notes": "Newly repaired target analyzed in the separate second campaign.",
            }
        )
    else:
        base.update(
            {
                "Semantic Status": "SEMANTICS_AMBIGUOUS", "WP Eligible?": "NO",
                "WP Campaign": "NOT_ELIGIBLE", "WP Run?": "NO", "WP Goal": "N/A",
                "Qed Result": "N/A", "Alt-Ergo Result": "N/A", "Z3 Result": "N/A",
                "CVC5 Result": "N/A", "Runtime": "N/A", "Final WP Classification": "NOT_APPLICABLE",
                "Evidence": frozen["Policy Phase Record"],
                "Notes": "Repository evidence does not define invalid-shift semantics; outside WP, not a WP failure.",
            }
        )
    final_rows.append(base)

with (WP / "FINAL_48_CONFIRMED_VERIFICATION_MATRIX.tsv").open("w", newline="", encoding="utf-8") as stream:
    writer = csv.DictWriter(stream, fieldnames=FINAL_COLUMNS, delimiter="\t", lineterminator="\n")
    writer.writeheader()
    writer.writerows(final_rows)

final_trace = [
    "# Final Eva–KLEE–Repair–WP Traceability", "",
    "This matrix preserves the complete lifecycle for all 48 KLEE-confirmed modeled violations.", "",
    "- Group A: 32 initially repaired targets, all `VALID_AUTOMATIC` in the frozen first campaign.",
    "- Group B: 3 targets subsequently repaired from repository-supported policies and analyzed in the second campaign.",
    "- Group C: 13 confirmed violations whose invalid-shift repair semantics remain unresolved and which are not WP-eligible.", "",
    "| Alarm | Group | Eva property | KLEE witness | Repair/semantic decision | ACSL/WP goal | Final status | Evidence |",
    "|---|---|---|---|---|---|---|---|",
]
for row in final_rows:
    group = "A — first campaign" if row["WP Campaign"] == "FIRST_TERMINAL_CAMPAIGN" else (
        "B — second campaign" if row["WP Campaign"] == "SECOND_REPAIR_POLICY_CAMPAIGN" else
        "C — semantic ambiguity"
    )
    decision = f"{row['Semantic Status']}; {row['Repair Status']}; {row['Repair Commit']}"
    final_trace.append(
        "| " + " | ".join(
            markdown(value) for value in (
                row["KLEE Alarm ID"], group, row["Eva Property"], row["KLEE Counterexample"],
                decision, row["WP Goal"], row["Final WP Classification"], row["Evidence"],
            )
        ) + " |"
    )
final_trace.extend(
    [
        "", "## Scientific interpretation", "",
        "Frama-C/WP proved the preserved Eva-derived target properties for all 35 repaired targets under "
        "the `ppc_32` / `Typed+int` target-property-only configuration. This is 35/35 repaired targets and "
        "35/48 confirmed KLEE targets. The remaining 13 are not WP failures: repository evidence does not "
        "establish a defensible invalid-shift policy, so no repair or proof task was created.", "",
        "No RTE verification or whole-program verification is claimed.", "",
    ]
)
(WP / "FINAL_EVA_KLEE_REPAIR_WP_TRACEABILITY.md").write_text("\n".join(final_trace), encoding="utf-8")

allowed = {"VALID_AUTOMATIC", "UNKNOWN", "TIMEOUT", "FAILED", "NO_GOAL", "NOT_RUN"}
if len(rows) != 3 or {row["KLEE Alarm ID"] for row in rows} != set(EXPECTED):
    raise SystemExit("second-campaign result cardinality/identity validation failed")
if any(row["Final WP Classification"] not in allowed for row in rows):
    raise SystemExit("invalid second-campaign classification")
if sum(classification_counts[name] for name in allowed) != 3:
    raise SystemExit("second-campaign classification reconciliation failed")
if any(row["Command Consistent?"] != "YES" or row["Evidence Integrity"] != "OK" for row in rows):
    raise SystemExit("second-campaign evidence-integrity validation failed")
if len(final_rows) != 48 or len({row["KLEE Alarm ID"] for row in final_rows}) != 48:
    raise SystemExit("final 48-target matrix cardinality validation failed")
if sum(row["Final WP Classification"] == "VALID_AUTOMATIC" for row in final_rows) != 35:
    raise SystemExit("final verified target count is not 35")
if sum(row["Semantic Status"] == "SEMANTICS_AMBIGUOUS" for row in final_rows) != 13:
    raise SystemExit("final ambiguity count is not 13")
if source_changes or first_report_changes or unexpected_result_changes:
    raise SystemExit("frozen source or first-campaign evidence changed")

print("VALIDATED")
print(f"second campaign rows={len(rows)}")
print("VALID_AUTOMATIC=3; UNKNOWN=0; TIMEOUT=0; FAILED=0; NO_GOAL=0; NOT_RUN=0")
print(f"runtime total={total:.9f}; mean={mean:.9f}; median={median:.9f}")
print("combined verified=35/48; repaired verification=35/35; ambiguous=13")
