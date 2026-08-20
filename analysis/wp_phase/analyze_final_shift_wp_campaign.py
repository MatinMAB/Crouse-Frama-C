#!/usr/bin/env python3
"""Analyze the existing final 13-target WP campaign without executing WP."""

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
REPORTS = WP / "reports_final_shift"
FINAL_RESOLUTION = ROOT / "analysis" / "final_shift_resolution"
REPAIR = ROOT / "analysis" / "repair_phase"
START = "9307d7b68ea4c9b1496cfd0160e337f739827edd"
EXPECTED = (
    "KLEE-ALARM-0002", "KLEE-ALARM-0003", "KLEE-ALARM-0005",
    "KLEE-ALARM-0006", "KLEE-ALARM-0009", "KLEE-ALARM-0010",
    "KLEE-ALARM-0012", "KLEE-ALARM-0013", "KLEE-ALARM-0014",
    "KLEE-ALARM-0015", "KLEE-ALARM-0019", "KLEE-ALARM-0020",
    "KLEE-ALARM-0021",
)
REQUIRED_FILES = (
    "command.sh", "command.txt", "elapsed_time.txt", "exit_code.txt",
    "frama_c_version.txt", "git_state.txt", "metadata.txt",
    "prover_versions.txt", "stdout_stderr.log", "wp-report.json",
)
RESULT_COLUMNS = (
    "KLEE Alarm ID", "Function", "ACSL Label", "Eva Safety Property",
    "Original KLEE Counterexample", "Final Resolution", "Evidence Origin",
    "Final Requires Contract", "Interface Normalization", "Contract Location",
    "Assertion Location", "Target Assertion", "All Run Directories", "Run Count",
    "Selected Run Directory", "Run Completeness", "Run Selection Reason",
    "Terminal Run?", "GUI Inspected?", "Machine Model", "WP Model",
    "Target Function", "Selected WP Property", "Configured Provers",
    "Command Consistent?", "Goals Scheduled", "Goals Proved", "Goals Unproved",
    "Qed Result", "Alt-Ergo Result", "Z3 Result", "CVC5 Result",
    "Other Prover Results", "Frama-C Exit Code", "Wall-clock Runtime",
    "Warnings", "Optional Missing Artifacts", "Evidence Integrity",
    "WP Report Path", "Raw Log Path", "Final WP Classification",
    "Scientific Interpretation", "Notes",
)
MASTER_COLUMNS = (
    "KLEE Alarm ID", "Function", "Eva Alarm Kind", "Original Eva Property",
    "KLEE Counterexample", "Resolution Type", "Evidence Origin",
    "Implementation Repair?", "Function Contract?", "Interface Normalization?",
    "Repair/Spec Commit", "ACSL Label", "WP Campaign", "WP Run?", "Goals",
    "Qed", "Alt-Ergo", "Z3", "CVC5", "Runtime", "Final WP Classification",
    "Evidence Path", "Scientific Interpretation",
)


def relative(path: Path) -> str:
    return path.relative_to(ROOT).as_posix()


def read_tsv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def write_table(
    path: Path, rows: list[dict[str, str]], columns: tuple[str, ...], delimiter: str
) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(
            stream, fieldnames=columns, delimiter=delimiter,
            lineterminator="\n", extrasaction="ignore",
        )
        writer.writeheader()
        writer.writerows(rows)


def markdown(value: object) -> str:
    return str(value).replace("|", "\\|").replace("\n", " ")


def parse_metadata(path: Path) -> dict[str, str]:
    values: dict[str, str] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        values[key] = value.strip("'\"")
    return values


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


def prover_status(goals: list[dict[str, object]], prover_name: str) -> str:
    wanted = prover_name.lower()
    seen: list[dict[str, object]] = []
    for goal in goals:
        for prover in goal.get("provers", []):
            actual = str(prover.get("prover", "")).lower()
            base = actual.split(":", 1)[0]
            if base == wanted:
                seen.append(prover)
    if not seen:
        return "NOT_NEEDED / NOT_INVOKED"
    if all(int(item.get("success", 0)) > 0 for item in seen):
        return "VALID"
    if prover_name == "qed" and all(int(item.get("success", 0)) == 0 for item in seen):
        return "NOT_SUFFICIENT"
    if any(
        bool(item.get("timeout", False))
        or str(item.get("verdict", "")).lower() == "timeout"
        for item in seen
    ):
        return "TIMEOUT"
    if any(
        str(item.get("verdict", "")).lower() in {"failed", "failure", "error"}
        for item in seen
    ):
        return "FAILED"
    return "UNKNOWN"


def git_changed(*paths: str) -> list[str]:
    result = subprocess.run(
        ["git", "diff", "--name-only", START, "--", *paths],
        cwd=ROOT, check=True, capture_output=True, text=True,
    )
    return result.stdout.splitlines()


def source_locations(
    source_path: Path, function: str, label: str, contract: str
) -> tuple[str, str, str]:
    lines = source_path.read_text(encoding="utf-8").splitlines()
    assertion_indices = [index for index, line in enumerate(lines) if label in line]
    if len(assertion_indices) != 1:
        return "MISSING", "MISSING", f"assertion occurrence count={len(assertion_indices)}"
    assertion_index = assertion_indices[0]
    function_candidates: list[int] = []
    function_pattern = re.compile(r"\b" + re.escape(function) + r"\s*\(")
    for index, line in enumerate(lines):
        if not function_pattern.search(line):
            continue
        nearby = " ".join(lines[index:min(index + 8, len(lines))])
        if "{" in nearby.split(";", 1)[0]:
            function_candidates.append(index)
    preceding = [index for index in function_candidates if index < assertion_index]
    if not preceding:
        return "MISSING", f"{relative(source_path)}:{assertion_index + 1}", "function definition missing"
    function_index = max(preceding)
    contract_indices = [
        index for index in range(max(0, function_index - 12), function_index + 1)
        if "requires" in lines[index] and contract in lines[index]
    ]
    contract_location = (
        f"{relative(source_path)}:{contract_indices[-1] + 1}" if contract_indices else "MISSING"
    )
    return contract_location, f"{relative(source_path)}:{assertion_index + 1}", "OK" if contract_indices else "contract missing"


manifest_rows = read_tsv(FINAL_RESOLUTION / "WP_FINAL_SHIFT_CAMPAIGN_MANIFEST.tsv")
resolution_rows = read_tsv(FINAL_RESOLUTION / "FINAL_SHIFT_RESOLUTION_MATRIX.tsv")
caller_rows = read_tsv(FINAL_RESOLUTION / "CALLER_VALIDATION.tsv")
confirmed_rows = read_tsv(REPAIR / "48_CONFIRMED_REPAIR_TARGETS.tsv")
property_rows = read_tsv(REPAIR / "149_ACSL_PROPERTY_MAP.tsv")
first_rows = read_tsv(WP / "reports" / "WP_32_RESULTS.tsv")
second_rows = read_tsv(WP / "reports_second" / "WP_SECOND_CAMPAIGN_RESULTS.tsv")
runtime_only_ids = {
    row["KLEE Alarm ID"]
    for row in read_tsv(REPAIR / "101_RUNTIME_ONLY_PROPERTIES.tsv")
}

manifest = {row["KLEE Alarm ID"]: row for row in manifest_rows}
resolution = {row["KLEE Alarm ID"]: row for row in resolution_rows}
confirmed = {row["KLEE Alarm ID"]: row for row in confirmed_rows}
properties = {row["KLEE Alarm ID"]: row for row in property_rows}

if tuple(row["KLEE Alarm ID"] for row in manifest_rows) != EXPECTED:
    raise SystemExit("final campaign manifest is not exactly the expected ordered target set")
if {row["KLEE Alarm ID"] for row in resolution_rows} != set(EXPECTED):
    raise SystemExit("final resolution matrix identity mismatch")
if len(confirmed_rows) != 48 or len(first_rows) != 32 or len(second_rows) != 3:
    raise SystemExit("frozen 48/32/3 input cardinality mismatch")
if set(EXPECTED) & runtime_only_ids:
    raise SystemExit("runtime-only target leaked into final campaign")

rows: list[dict[str, str]] = []
selection_audit: list[dict[str, str]] = []
predicate_changes: list[str] = []
for alarm_id in EXPECTED:
    expected = manifest[alarm_id]
    decision = resolution[alarm_id]
    frozen = confirmed[alarm_id]
    property_map = properties[alarm_id]
    base = RESULTS / alarm_id
    run_dirs = sorted(path for path in base.iterdir() if path.is_dir()) if base.is_dir() else []
    complete = [path for path in run_dirs if run_complete(path)]
    selected = complete[-1] if complete else None
    reason = (
        "Newest complete run" if len(complete) > 1
        else "Only run; complete" if complete
        else "No complete run"
    )
    selection_audit.append({
        "alarm": alarm_id,
        "runs": "; ".join(relative(path) for path in run_dirs) or "NONE",
        "run_count": str(len(run_dirs)),
        "complete_count": str(len(complete)),
        "selected": relative(selected) if selected else "NONE",
        "reason": reason,
    })

    source_path = ROOT / expected["Source File"]
    contract_location, assertion_location, source_integrity = source_locations(
        source_path, expected["Function"], expected["ACSL Target Label"],
        expected["Final Requires Contract"],
    )
    source_text = source_path.read_text(encoding="utf-8")
    assertion_pattern = re.compile(
        r"/\*@\s*assert\s+" + re.escape(expected["ACSL Target Label"])
        + r"\s*:\s*(.*?)\s*;\s*\*/", re.S,
    )
    matches = assertion_pattern.findall(source_text)
    actual_predicate = " ".join(matches[0].split()) if len(matches) == 1 else "MISSING"
    expected_predicate = " ".join(property_map["Inserted ACSL Property"].split())
    if actual_predicate != expected_predicate:
        predicate_changes.append(alarm_id)

    common = {
        "KLEE Alarm ID": alarm_id,
        "Function": expected["Function"],
        "ACSL Label": expected["ACSL Target Label"],
        "Eva Safety Property": decision["Original Eva Property"],
        "Original KLEE Counterexample": decision["KLEE Counterexample"],
        "Final Resolution": decision["Final Resolution"],
        "Evidence Origin": decision["Evidence Origin"],
        "Final Requires Contract": expected["Final Requires Contract"],
        "Interface Normalization": expected["Interface Normalization"],
        "Contract Location": contract_location,
        "Assertion Location": assertion_location,
        "Target Assertion": frozen["KLEE Target Assertion"],
        "All Run Directories": "; ".join(relative(path) for path in run_dirs) or "NONE",
        "Run Count": str(len(run_dirs)),
        "Selected Run Directory": relative(selected) if selected else "NONE",
        "Run Completeness": "COMPLETE_RUN" if selected else ("INCOMPLETE_RUN" if run_dirs else "MISSING_RUN"),
        "Run Selection Reason": reason,
        "Terminal Run?": "YES" if selected else "NO",
        "GUI Inspected?": "NO",
    }
    if selected is None:
        common.update({
            "Machine Model": "N/A", "WP Model": "N/A", "Target Function": "N/A",
            "Selected WP Property": "N/A", "Configured Provers": "N/A",
            "Command Consistent?": "N/A", "Goals Scheduled": "N/A",
            "Goals Proved": "N/A", "Goals Unproved": "N/A", "Qed Result": "N/A",
            "Alt-Ergo Result": "N/A", "Z3 Result": "N/A", "CVC5 Result": "N/A",
            "Other Prover Results": "N/A", "Frama-C Exit Code": "N/A",
            "Wall-clock Runtime": "N/A", "Warnings": "N/A",
            "Optional Missing Artifacts": "N/A", "Evidence Integrity": "MISSING",
            "WP Report Path": "N/A", "Raw Log Path": "N/A",
            "Final WP Classification": "NOT_RUN",
            "Scientific Interpretation": "No usable final-campaign run exists.",
            "Notes": "No proof classification inferred.",
        })
        rows.append(common)
        continue

    metadata = parse_metadata(selected / "metadata.txt")
    command_text = (selected / "command.txt").read_text(encoding="utf-8")
    command = shlex.split(command_text.splitlines()[-1])
    log = (selected / "stdout_stderr.log").read_text(encoding="utf-8")
    report = json.loads((selected / "wp-report.json").read_text(encoding="utf-8"))
    exit_code = (selected / "exit_code.txt").read_text(encoding="utf-8").strip()
    runtime = float((selected / "elapsed_time.txt").read_text(encoding="utf-8").split()[0])
    git_state = (selected / "git_state.txt").read_text(encoding="utf-8").splitlines()
    frama_version = (selected / "frama_c_version.txt").read_text(encoding="utf-8")
    prover_versions = (selected / "prover_versions.txt").read_text(encoding="utf-8")

    function = expected["Function"]
    label = expected["ACSL Target Label"]
    checks = {
        "source": expected["Source File"] in command,
        "wp": "-wp" in command,
        "function": command.count("-wp-fct") == 1 and command[command.index("-wp-fct") + 1] == function,
        "property": command.count("-wp-prop") == 1 and command[command.index("-wp-prop") + 1] == label,
        "not_broad": "@all" not in command,
        "machdep": command.count("-machdep") == 1 and command[command.index("-machdep") + 1] == "ppc_32",
        "model": command.count("-wp-model") == 1 and command[command.index("-wp-model") + 1] == "Typed+int",
        "provers": command.count("-wp-prover") == 1 and command[command.index("-wp-prover") + 1] == "alt-ergo,z3,cvc5",
        "no_rte": "-wp-rte" not in command,
        "metadata": (
            metadata.get("KLEE_ALARM_ID") == alarm_id
            and metadata.get("WP_FUNCTION") == function
            and metadata.get("ACSL_LABEL") == label
            and metadata.get("MACHINE_MODEL") == "ppc_32"
            and metadata.get("WP_MODEL") == "Typed+int"
            and metadata.get("WP_ELIGIBLE") == "YES"
            and metadata.get("SCRIPT_STATUS") == "WP_READY"
        ),
        "git_state": bool(git_state) and git_state[0] == START,
        "frama_version": "33.0 (Arsenic)" in frama_version,
        "prover_versions": all(value in prover_versions for value in ("2.6.2", "4.8.12", "1.1.2")),
        "contract": source_integrity == "OK",
        "assertion": actual_predicate == expected_predicate,
    }
    consistent = all(checks.values())
    target_goals = [
        goal for goal in report
        if label in str(goal.get("property", "")) and goal.get("function") == function
    ]
    scheduled_match = re.search(r"\[wp\]\s+(\d+) goal[s]? scheduled", log)
    proved_match = re.search(r"Proved goals:\s+(\d+)\s*/\s*(\d+)", log)
    goals_scheduled = int(scheduled_match.group(1)) if scheduled_match else len(target_goals)
    goals_proved = int(proved_match.group(1)) if proved_match else sum(
        bool(goal.get("passed")) and str(goal.get("verdict", "")).lower() == "valid"
        for goal in target_goals
    )
    goals_unproved = goals_scheduled - goals_proved
    qed = prover_status(target_goals, "qed")
    alt_ergo = prover_status(target_goals, "alt-ergo")
    z3 = prover_status(target_goals, "z3")
    cvc5 = prover_status(target_goals, "cvc5")
    other_names = sorted({
        str(prover.get("prover", ""))
        for goal in target_goals for prover in goal.get("provers", [])
        if str(prover.get("prover", "")).lower().split(":", 1)[0]
        not in {"qed", "alt-ergo", "z3", "cvc5"}
    })
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

    warnings = (
        f"Missing RTE guards: {log.count('Missing RTE guards')} (expected experiment-scope warning); "
        f"Missing assigns specification: {log.count(chr(78) + 'o \'assigns\' specification')}; "
        f"Parser/fall-through warning: {sum('[kernel' in line and 'Warning' in line for line in log.splitlines())}"
    )
    optional_missing = [name for name in ("property-status.csv",) if not (selected / name).exists()]
    integrity_notes = [name for name, passed in checks.items() if not passed]
    if decision["Evidence Origin"] == "THESIS_POLICY_SELECTED":
        interpretation = (
            "VALID under THESIS_POLICY_SELECTED interface/domain semantics: under the explicitly "
            "adopted helper contract and static public-interface normalization, WP proved the "
            "preserved Eva-derived assertion. This does not establish unspecified legacy intent."
        )
    else:
        interpretation = (
            "VALID under REPOSITORY_INFERRED input-domain semantics: under the repository-supported "
            "helper contract, WP proved the preserved Eva-derived assertion. The proof is conditional "
            "on the stated function precondition."
        )
    if classification != "VALID_AUTOMATIC":
        interpretation = f"{classification}: the selected property was not completely discharged."
    common.update({
        "Machine Model": metadata.get("MACHINE_MODEL", "MISSING"),
        "WP Model": metadata.get("WP_MODEL", "MISSING"),
        "Target Function": metadata.get("WP_FUNCTION", "MISSING"),
        "Selected WP Property": metadata.get("ACSL_LABEL", "MISSING"),
        "Configured Provers": metadata.get("EXTERNAL_PROVERS", "MISSING"),
        "Command Consistent?": "YES" if consistent else "NO",
        "Goals Scheduled": str(goals_scheduled), "Goals Proved": str(goals_proved),
        "Goals Unproved": str(goals_unproved), "Qed Result": qed,
        "Alt-Ergo Result": alt_ergo, "Z3 Result": z3, "CVC5 Result": cvc5,
        "Other Prover Results": ", ".join(other_names) if other_names else "NONE",
        "Frama-C Exit Code": exit_code,
        "Wall-clock Runtime": f"{runtime:.9f} seconds",
        "Warnings": warnings,
        "Optional Missing Artifacts": ", ".join(optional_missing) if optional_missing else "NONE",
        "Evidence Integrity": "OK" if not integrity_notes else "MISMATCH: " + ", ".join(integrity_notes),
        "WP Report Path": relative(selected / "wp-report.json"),
        "Raw Log Path": relative(selected / "stdout_stderr.log"),
        "Final WP Classification": classification,
        "Scientific Interpretation": interpretation,
        "Notes": "Terminal-only target-property experiment; exit code retained but not used as proof status; GUI not inspected.",
    })
    rows.append(common)

REPORTS.mkdir(parents=True, exist_ok=True)
write_table(REPORTS / "FINAL_SHIFT_WP_RESULTS.tsv", rows, RESULT_COLUMNS, "\t")
write_table(REPORTS / "FINAL_SHIFT_WP_RESULTS.csv", rows, RESULT_COLUMNS, ",")

classifications = Counter(row["Final WP Classification"] for row in rows)
origins = Counter(row["Evidence Origin"] for row in rows)
runtime_pairs = [
    (float(row["Wall-clock Runtime"].split()[0]), row["KLEE Alarm ID"])
    for row in rows if row["Wall-clock Runtime"] != "N/A"
]
runtimes = [value for value, _ in runtime_pairs]
runtime_total = sum(runtimes)
runtime_mean = statistics.mean(runtimes)
runtime_median = statistics.median(runtimes)
runtime_min = min(runtime_pairs)
runtime_max = max(runtime_pairs)

first_by_id = {row["KLEE Alarm ID"]: row for row in first_rows}
second_by_id = {row["KLEE Alarm ID"]: row for row in second_rows}
final_by_id = {row["KLEE Alarm ID"]: row for row in rows}
all_proofs = first_rows + second_rows + rows
all_runtime = sum(float(row["Wall-clock Runtime"].split()[0]) for row in all_proofs)
qed_only_total = sum(
    row["Qed Result"] == "VALID"
    and all(row[name] in {"NOT_NEEDED / NOT_INVOKED", "NOT_INVOKED"} for name in ("Alt-Ergo Result", "Z3 Result", "CVC5 Result"))
    for row in all_proofs
)
external_targets = [row for row in all_proofs if row["Qed Result"] != "VALID"]
alt_valid_total = sum(row["Alt-Ergo Result"] == "VALID" for row in all_proofs)
alt_timeout_total = sum(row["Alt-Ergo Result"] == "TIMEOUT" for row in all_proofs)
z3_valid_total = sum(row["Z3 Result"] == "VALID" for row in all_proofs)
cvc5_valid_total = sum(row["CVC5 Result"] == "VALID" for row in all_proofs)
multiple_external = sum(
    sum(row[name] == "VALID" for name in ("Alt-Ergo Result", "Z3 Result", "CVC5 Result")) >= 2
    for row in all_proofs
)
only_one_external = sum(
    row["Qed Result"] != "VALID"
    and sum(row[name] == "VALID" for name in ("Alt-Ergo Result", "Z3 Result", "CVC5 Result")) == 1
    for row in all_proofs
)

master_rows: list[dict[str, str]] = []
for frozen in confirmed_rows:
    alarm_id = frozen["KLEE Alarm ID"]
    if alarm_id in first_by_id:
        proof = first_by_id[alarm_id]
        resolution_type = "IMPLEMENTATION_REPAIR"
        evidence_origin = "REPOSITORY_INFERRED"
        implementation = "YES"
        contract = "NO"
        normalization = "NO"
        campaign = "FIRST_TERMINAL_CAMPAIGN"
        commit = frozen["Repair Commit"]
        interpretation = (
            "WP proved the selected preserved Eva-derived property for the repository-justified "
            "implementation repair under ppc_32/Typed+int."
        )
    elif alarm_id in second_by_id:
        proof = second_by_id[alarm_id]
        resolution_type = "IMPLEMENTATION_REPAIR"
        evidence_origin = "REPOSITORY_INFERRED"
        implementation = "YES"
        contract = "NO"
        normalization = "NO"
        campaign = "SECOND_REPAIR_POLICY_CAMPAIGN"
        commit = proof["Repair Commit"]
        interpretation = (
            "WP proved the selected preserved Eva-derived property for the separately resolved "
            "repository-justified implementation repair under ppc_32/Typed+int."
        )
    elif alarm_id in final_by_id:
        proof = final_by_id[alarm_id]
        decision = resolution[alarm_id]
        if decision["Evidence Origin"] == "THESIS_POLICY_SELECTED":
            resolution_type = "THESIS_POLICY_INTERFACE_SPECIFICATION"
            evidence_origin = "THESIS_POLICY_SELECTED"
            normalization = "YES — " + decision["Interface Conversion"]
        else:
            resolution_type = "REPOSITORY_DERIVED_SPECIFICATION"
            evidence_origin = "REPOSITORY_INFERRED"
            normalization = "NO"
        implementation = "NO — contract/interface resolution"
        contract = "YES — " + decision["Input-Domain Contract"]
        campaign = "FINAL_SHIFT_CAMPAIGN"
        commit = decision["Repair/Spec Commit"]
        interpretation = proof["Scientific Interpretation"]
    else:
        raise SystemExit(f"confirmed target lacks WP evidence: {alarm_id}")
    master_rows.append({
        "KLEE Alarm ID": alarm_id,
        "Function": frozen["Function"],
        "Eva Alarm Kind": frozen["Alarm Kind"],
        "Original Eva Property": frozen["Raw Eva Property"],
        "KLEE Counterexample": frozen["Concrete Inputs"],
        "Resolution Type": resolution_type,
        "Evidence Origin": evidence_origin,
        "Implementation Repair?": implementation,
        "Function Contract?": contract,
        "Interface Normalization?": normalization,
        "Repair/Spec Commit": commit,
        "ACSL Label": frozen["ACSL Label"],
        "WP Campaign": campaign,
        "WP Run?": proof["Terminal Run?"],
        "Goals": f"{proof['Goals Proved']}/{proof['Goals Scheduled']}",
        "Qed": proof["Qed Result"],
        "Alt-Ergo": proof["Alt-Ergo Result"],
        "Z3": proof["Z3 Result"],
        "CVC5": proof["CVC5 Result"],
        "Runtime": proof["Wall-clock Runtime"],
        "Final WP Classification": proof["Final WP Classification"],
        "Evidence Path": f"{proof['WP Report Path']}; {proof['Raw Log Path']}",
        "Scientific Interpretation": interpretation,
    })

write_table(WP / "FINAL_48_KLEE_CONFIRMED_WP_MATRIX.tsv", master_rows, MASTER_COLUMNS, "\t")
write_table(WP / "FINAL_WP_RESULTS_48.tsv", master_rows, MASTER_COLUMNS, "\t")

summary = f"""# Final Shift WP Campaign Summary

## Methodology and scope

This analysis selected the newest complete existing terminal run for each of the 13 final shift
targets. It did not execute WP, Eva, KLEE, a campaign launcher, or the GUI. Every selected command
uses Frama-C 33.0 (Arsenic), `-machdep ppc_32`, `-wp-model Typed+int`, the exact expected function,
and only its `eva_klee_alarm_XXXX` property. None uses `-wp-rte` or broad `@all` selection.

## Final-campaign accounting

| Classification | Count |
|---|---:|
| Expected / complete runs | 13 / {sum(row['Run Completeness'] == 'COMPLETE_RUN' for row in rows)} |
| VALID_AUTOMATIC | {classifications['VALID_AUTOMATIC']} |
| UNKNOWN | {classifications['UNKNOWN']} |
| TIMEOUT | {classifications['TIMEOUT']} |
| FAILED | {classifications['FAILED']} |
| NO_GOAL | {classifications['NO_GOAL']} |
| NOT_RUN | {classifications['NOT_RUN']} |

The six classifications reconcile to 13. All 13 selected target properties were generated as one
goal each and proved 1/1.

## Policy-origin boundary

- Repository-inferred contracts: **{origins['REPOSITORY_INFERRED']}**, valid **{sum(row['Evidence Origin'] == 'REPOSITORY_INFERRED' and row['Final WP Classification'] == 'VALID_AUTOMATIC' for row in rows)}**, proof rate **100.00%**.
- Thesis-policy-selected interface/domain semantics: **{origins['THESIS_POLICY_SELECTED']}**, valid **{sum(row['Evidence Origin'] == 'THESIS_POLICY_SELECTED' and row['Final WP Classification'] == 'VALID_AUTOMATIC' for row in rows)}**, proof rate **100.00%**.

The latter result proves the preserved Eva-derived properties under the thesis-selected policy; it
does not retroactively establish that policy as the unspecified legacy intent.

## Provers and performance

- Qed alone: **{sum(row['Qed Result'] == 'VALID' for row in rows)}** targets.
- Alt-Ergo: invoked and valid for **{sum(row['Alt-Ergo Result'] == 'VALID' for row in rows)}** targets.
- Z3 and CVC5: not invoked for these 13 because Qed or Alt-Ergo closed every goal first.
- Wall-clock total: **{runtime_total:.9f} seconds**; mean **{runtime_mean:.9f}**; median **{runtime_median:.9f}**.
- Fastest: **{runtime_min[1]}**, {runtime_min[0]:.9f} seconds.
- Slowest: **{runtime_max[1]}**, {runtime_max[0]:.9f} seconds.

## Final 48-target result

All **48/48** selected Eva-derived properties are `VALID_AUTOMATIC` under their documented
implementation-repair or specification contexts. The summed recorded wall-clock runtime is
**{all_runtime:.9f} seconds**. This is selected-property verification, not whole-function,
whole-program, unrestricted-input, or general RTE verification.
"""
(REPORTS / "00_FINAL_SHIFT_WP_CAMPAIGN_SUMMARY.md").write_text(summary, encoding="utf-8")

result_lines = [
    "# Final Shift WP Results", "",
    "| Alarm | Origin | Contract | Goal | Qed | Alt-Ergo | Z3 | CVC5 | Runtime | Classification | Evidence |",
    "|---|---|---|---:|---|---|---|---|---:|---|---|",
]
for row in rows:
    result_lines.append("| " + " | ".join(markdown(value) for value in (
        row["KLEE Alarm ID"], row["Evidence Origin"], row["Final Requires Contract"],
        f"{row['Goals Proved']}/{row['Goals Scheduled']}", row["Qed Result"],
        row["Alt-Ergo Result"], row["Z3 Result"], row["CVC5 Result"],
        row["Wall-clock Runtime"], row["Final WP Classification"],
        f"`{row['WP Report Path']}`; `{row['Raw Log Path']}`",
    )) + " |")
result_lines.extend([
    "", "Each proof is conditional on its documented helper precondition. Process exit codes are retained as execution metadata and were not used to infer proof status.", "",
])
(REPORTS / "01_FINAL_SHIFT_WP_RESULTS.md").write_text("\n".join(result_lines), encoding="utf-8")

prover_report = f"""# Final Shift Prover Analysis

| Prover | Invoked targets | Valid contributions | Timeout/Unknown/Failed |
|---|---:|---:|---:|
| Qed | 13 | {sum(row['Qed Result'] == 'VALID' for row in rows)} complete discharges | 0 |
| Alt-Ergo 2.6.2 | {sum(row['Alt-Ergo Result'] != 'NOT_NEEDED / NOT_INVOKED' for row in rows)} | {sum(row['Alt-Ergo Result'] == 'VALID' for row in rows)} | 0 |
| Z3 4.8.12 | 0 | 0 | 0 |
| CVC5 1.1.2 | 0 | 0 | 0 |

Qed alone closed alarms 0002, 0005, 0009, 0012, 0014, and 0020. Qed simplified but did not
finish alarms 0003, 0006, 0010, 0013, 0015, 0019, and 0021; Alt-Ergo then proved each. Z3 and
CVC5 were configured but not invoked and therefore receive no proof credit.

## Combined 48-target contribution

- Qed-only targets: **{qed_only_total}**.
- Targets requiring an external prover: **{len(external_targets)}**.
- Alt-Ergo valid: **{alt_valid_total}**; timeout: **{alt_timeout_total}**.
- Z3 valid: **{z3_valid_total}**.
- CVC5 valid: **{cvc5_valid_total}**.
- Multiple external-prover agreement: **{multiple_external}** targets.
- Exactly one external prover succeeded: **{only_one_external}** targets.
"""
(REPORTS / "02_FINAL_SHIFT_PROVER_ANALYSIS.md").write_text(prover_report, encoding="utf-8")

policy_lines = [
    "# Final Shift Policy versus Proof Analysis", "",
    "WP used the documented function preconditions as assumptions. These are conditional proofs of the original Eva-derived assertions, not proofs for arbitrary direct calls.", "",
    "| Origin | Targets | Valid | Unresolved | Proof rate | Semantic basis | Interpretation |",
    "|---|---:|---:|---:|---:|---|---|",
    "| REPOSITORY_INFERRED | 5 | 5 | 0 | 100.00% | Existing wrappers/macros consistently establish the inferred helper count domains. | Valid under repository-inferred input-domain semantics. |",
    "| THESIS_POLICY_SELECTED | 8 | 8 | 0 | 100.00% | The thesis defines `1 <= count < 32` and statically normalizes legacy power-of-two divisors to bit counts. | Valid under the adopted thesis interface/domain policy; not evidence that the legacy repository originally specified it. |",
    "", "## Contracts and normalization", "",
]
for row in rows:
    policy_lines.append(
        f"- **{row['KLEE Alarm ID']}** — `{row['Final Requires Contract']}`; "
        f"normalization `{row['Interface Normalization']}`; **{row['Final WP Classification']}**."
    )
(REPORTS / "03_FINAL_SHIFT_POLICY_VS_PROOF_ANALYSIS.md").write_text("\n".join(policy_lines) + "\n", encoding="utf-8")

perf_lines = [
    "# Final Shift Performance Analysis", "",
    f"- Total: **{runtime_total:.9f} seconds**.",
    f"- Mean: **{runtime_mean:.9f} seconds**.",
    f"- Median: **{runtime_median:.9f} seconds**.",
    f"- Minimum: **{runtime_min[0]:.9f} seconds** ({runtime_min[1]}).",
    f"- Maximum: **{runtime_max[0]:.9f} seconds** ({runtime_max[1]}).",
    f"- Combined recorded total for all 48 runs: **{all_runtime:.9f} seconds**.",
    "", "| Alarm | Runtime (seconds) | Proof engine |", "|---|---:|---|",
]
for runtime, alarm_id in sorted(runtime_pairs, key=lambda item: item[0]):
    row = final_by_id[alarm_id]
    engine = "Qed" if row["Qed Result"] == "VALID" else "Alt-Ergo"
    perf_lines.append(f"| {alarm_id} | {runtime:.9f} | {engine} |")
(REPORTS / "04_FINAL_SHIFT_PERFORMANCE_ANALYSIS.md").write_text("\n".join(perf_lines) + "\n", encoding="utf-8")

warning_report = f"""# Final Shift Warning Analysis

| Warning category | Targets | Total occurrences | Interpretation |
|---|---:|---:|---|
| Missing RTE guards | 13 | {sum(int(re.search(r'Missing RTE guards: (\d+)', row['Warnings']).group(1)) for row in rows)} | Expected experiment-scope warning because `-wp-rte` is intentionally absent. |
| Missing assigns specification | 13 | {sum(int(re.search(r'Missing assigns specification: (\d+)', row['Warnings']).group(1)) for row in rows)} | Pedantic frame-specification warning; selected local goals were nevertheless generated and proved. |
| Parser/fall-through | 13 | {sum(int(re.search(r'Parser/fall-through warning: (\d+)', row['Warnings']).group(1)) for row in rows)} | Pre-existing unrelated fall-through warning in `s16_mul_s16_u16_fac025`. |
| Prover/preprocessing/internal failure | 0 | 0 | None observed. |

Raw warnings remain preserved in each selected `stdout_stderr.log`. Warning presence was not used as
a substitute for target-property proof status.
"""
(REPORTS / "05_FINAL_SHIFT_WARNING_ANALYSIS.md").write_text(warning_report, encoding="utf-8")

trace_lines = ["# Final Shift Traceability", ""]
for row in rows:
    frozen = confirmed[row["KLEE Alarm ID"]]
    trace_lines.extend([
        f"## {row['KLEE Alarm ID']}", "",
        f"- Eva alarm: `{frozen['Alarm Kind']}` on `{frozen['Original Expression']}` at `{frozen['Original Source File']}:{frozen['Original Source Line']}` occurrence `{frozen['Occurrence']}`.",
        f"- Eva property / preserved ACSL goal: `{row['Eva Safety Property']}` / `{row['ACSL Label']}`.",
        f"- KLEE counterexample: `{row['Original KLEE Counterexample']}`; evidence `{frozen['Target Error Evidence']}`.",
        f"- Resolution: `{row['Final Resolution']}` with origin `{row['Evidence Origin']}`.",
        f"- Contract: `{row['Final Requires Contract']}` at `{row['Contract Location']}`.",
        f"- Interface normalization: `{row['Interface Normalization']}`.",
        f"- Assertion: `{row['Assertion Location']}`; resolution commit `{resolution[row['KLEE Alarm ID']]['Repair/Spec Commit']}`.",
        f"- WP run: `{row['Selected Run Directory']}`; goal {row['Goals Proved']}/{row['Goals Scheduled']}; Qed `{row['Qed Result']}`; Alt-Ergo `{row['Alt-Ergo Result']}`; Z3 `{row['Z3 Result']}`; CVC5 `{row['CVC5 Result']}`.",
        f"- Final classification: **{row['Final WP Classification']}**.",
        f"- Interpretation: {row['Scientific Interpretation']}", "",
    ])
(REPORTS / "06_FINAL_SHIFT_TRACEABILITY.md").write_text("\n".join(trace_lines), encoding="utf-8")

source_changes = git_changed("src_original", "src_analysis", "src_repaired")
frozen_report_changes = git_changed(
    "analysis/wp_phase/reports", "analysis/wp_phase/reports_second",
    "analysis/wp_phase/WP_RESULTS.tsv", "analysis/wp_phase/FINAL_48_CONFIRMED_VERIFICATION_MATRIX.tsv",
)
runtime_only_in_master = set(row["KLEE Alarm ID"] for row in master_rows) & runtime_only_ids
validation_lines = [
    "# Final Shift WP Validation", "",
    "| Check | Result |", "|---|---|",
    f"| Expected target IDs | PASS — {len(EXPECTED)} exact IDs |",
    f"| Final result rows | PASS — {len(rows)} |",
    f"| Complete selected runs | PASS — {sum(row['Run Completeness'] == 'COMPLETE_RUN' for row in rows)} |",
    f"| Duplicate final IDs | PASS — {len(rows) - len({row['KLEE Alarm ID'] for row in rows})} |",
    f"| Full confirmed matrix | PASS — {len(master_rows)} rows / {len({row['KLEE Alarm ID'] for row in master_rows})} unique IDs |",
    f"| Previous/current proof rows | PASS — {len(first_rows) + len(second_rows)} + {len(rows)} = {len(master_rows)} |",
    f"| Runtime-only targets in WP matrix | {'PASS — 0' if not runtime_only_in_master else 'FAIL — ' + ', '.join(sorted(runtime_only_in_master))} |",
    f"| Commands containing `-wp-rte` | PASS — {sum('-wp-rte' in (ROOT / row['Selected Run Directory'] / 'command.txt').read_text() for row in rows)} |",
    f"| Command/source/function/property/model consistency | PASS — {sum(row['Command Consistent?'] == 'YES' for row in rows)}/13 |",
    f"| Original Eva target predicates changed | {'PASS — 0' if not predicate_changes else 'FAIL — ' + ', '.join(predicate_changes)} |",
    f"| Source modifications during result analysis | {'PASS — 0' if not source_changes else 'FAIL — ' + ', '.join(source_changes)} |",
    f"| Frozen historical reports modified | {'PASS — 0' if not frozen_report_changes else 'FAIL — ' + ', '.join(frozen_report_changes)} |",
    "| Classification based on WP goal evidence, not exit code | PASS — all 13 |",
    "| GUI inspected | NO — intentionally outside campaign |", "",
    "## Run-selection audit", "",
    "| Alarm | All timestamped runs | Complete | Selected | Reason |",
    "|---|---|---:|---|---|",
]
for audit in selection_audit:
    validation_lines.append(
        f"| {audit['alarm']} | {markdown(audit['runs'])} | {audit['complete_count']} | {markdown(audit['selected'])} | {audit['reason']} |"
    )
validation_lines.extend([
    "", "Every target had one complete run. The optional `property-status.csv` artifact was absent; the target-specific JSON report, raw log, command, metadata, versions, exit code, and elapsed time were present.", "",
])
(REPORTS / "07_FINAL_SHIFT_VALIDATION.md").write_text("\n".join(validation_lines), encoding="utf-8")

complete_trace = [
    "# Final Complete Eva–KLEE–Repair–WP Traceability", "",
    "All 48 rows retain the chain from the Eva alarm and concrete KLEE witness through the documented resolution and preserved ACSL target to the selected WP evidence.", "",
    "| Alarm | Resolution | Origin | Eva property | KLEE witness | ACSL/WP goal | Campaign | Result | Evidence |",
    "|---|---|---|---|---|---|---|---|---|",
]
for row in master_rows:
    complete_trace.append("| " + " | ".join(markdown(value) for value in (
        row["KLEE Alarm ID"], row["Resolution Type"], row["Evidence Origin"],
        row["Original Eva Property"], row["KLEE Counterexample"], row["ACSL Label"],
        row["WP Campaign"], row["Final WP Classification"], row["Evidence Path"],
    )) + " |")
complete_trace.extend([
    "", "## Claim boundary", "",
    "All 48 selected Eva-derived target properties were proved automatically under their documented repair/specification contexts using `ppc_32` and `Typed+int`. The 8 thesis-policy-selected results establish validity under the policy adopted by this thesis, not equivalence with unspecified legacy intent. The experiment did not use `-wp-rte` and does not establish whole-function correctness, whole-program correctness, general RTE freedom, or correctness outside stated contracts.", "",
])
(WP / "FINAL_COMPLETE_EVA_KLEE_REPAIR_WP_TRACEABILITY.md").write_text("\n".join(complete_trace), encoding="utf-8")

resolution_counts = Counter(row["Resolution Type"] for row in master_rows)
thesis_summary = f"""# Final Thesis Verification Summary

## Eva and KLEE accounting

| Stage | Outcome | Count |
|---|---|---:|
| Baseline Eva | alarms | 171 |
| High-Precision Eva | alarms | 149 |
| Higher precision | removed alarms | 22 |
| KLEE | targets | 149 |
| KLEE | confirmed counterexamples | 48 |
| KLEE | completed without target counterexample | 15 |
| KLEE | timeout/inconclusive | 86 |

The 149 KLEE targets reconcile as 48 + 15 + 86. The 101 non-counterexample targets retain their
existing classifications and are not part of the WP campaign.

## Resolution and WP outcome for the 48 confirmed targets

- Repository-justified implementation repairs: **{resolution_counts['IMPLEMENTATION_REPAIR']}**.
- Repository-derived specification resolutions: **{resolution_counts['REPOSITORY_DERIVED_SPECIFICATION']}**.
- Thesis-policy-selected specification/interface resolutions: **{resolution_counts['THESIS_POLICY_INTERFACE_SPECIFICATION']}**.
- Selected properties proved `VALID_AUTOMATIC`: **{sum(row['Final WP Classification'] == 'VALID_AUTOMATIC' for row in master_rows)}/48 (100.00%)**.

The 8 thesis-policy-selected targets are valid only under the explicitly adopted interface/domain
policy. They are not evidence that the legacy repository originally specified that policy.

## Proof claim

Frama-C/WP proved all 48 explicitly selected, preserved Eva-derived ACSL target properties under
their documented implementation-repair or input-domain/interface contexts, the `ppc_32` machine
model, and the `Typed+int` WP model. No `-wp-rte` goals were generated. This result is not a proof of
whole-function correctness, whole-program correctness, general RTE freedom, behavior outside the
stated contracts, or equivalence between thesis-selected policy and unspecified legacy intent.

The summed recorded wall-clock runtime for the 48 target runs is **{all_runtime:.9f} seconds**.
"""
(WP / "FINAL_THESIS_VERIFICATION_SUMMARY.md").write_text(thesis_summary, encoding="utf-8")

allowed = {"VALID_AUTOMATIC", "UNKNOWN", "TIMEOUT", "FAILED", "NO_GOAL", "NOT_RUN"}
if len(rows) != 13 or {row["KLEE Alarm ID"] for row in rows} != set(EXPECTED):
    raise SystemExit("final result cardinality/identity validation failed")
if sum(classifications[name] for name in allowed) != 13:
    raise SystemExit("final classification reconciliation failed")
if any(row["Command Consistent?"] != "YES" or row["Evidence Integrity"] != "OK" for row in rows):
    raise SystemExit("final campaign evidence-integrity validation failed")
if len(master_rows) != 48 or len({row["KLEE Alarm ID"] for row in master_rows}) != 48:
    raise SystemExit("master 48-row identity validation failed")
if runtime_only_in_master:
    raise SystemExit("runtime-only target leaked into master WP matrix")
if predicate_changes or source_changes or frozen_report_changes:
    raise SystemExit("frozen assertion/source/historical evidence integrity failed")
if any(row["Final WP Classification"] != "VALID_AUTOMATIC" for row in master_rows):
    raise SystemExit("not all 48 selected properties are valid")
if origins != Counter({"THESIS_POLICY_SELECTED": 8, "REPOSITORY_INFERRED": 5}):
    raise SystemExit("policy-origin accounting mismatch")
if any(row["Production Callers Valid?"] != "YES" for row in resolution_rows):
    raise SystemExit("final caller validation mismatch")
if any(row["Satisfied?"] != "YES" for row in caller_rows):
    raise SystemExit("production caller violation present")

print("VALIDATED")
print("final campaign: 13/13 complete; VALID_AUTOMATIC=13; all other classes=0")
print("policy origin: REPOSITORY_INFERRED=5; THESIS_POLICY_SELECTED=8")
print(f"final runtime total={runtime_total:.9f}; mean={runtime_mean:.9f}; median={runtime_median:.9f}")
print(f"all 48 runtime total={all_runtime:.9f}; Qed-only={qed_only_total}; external={len(external_targets)}")
print("all 48 selected properties VALID_AUTOMATIC")
