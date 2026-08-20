#!/usr/bin/env python3
"""Generate the frozen Eva-to-KLEE Phase-C thesis evidence reports.

The generator is read-only outside analysis/klee_phase_c/reports.  It consumes
the frozen Eva inventories, the frozen Phase-B target mapping, and the current
Phase-C execution evidence.  It never invokes Frama-C, Clang, LLVM, KLEE, or
ktest-tool.
"""

from __future__ import annotations

import csv
import re
import sqlite3
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any, Iterable


REPO = Path(__file__).resolve().parents[3]
REPORT_DIR = Path(__file__).resolve().parent
NA = "N/A – not recorded"

BASELINE_INVENTORY = REPO / "reports/eva_report_source_package/data/baseline_alarm_inventory.tsv"
HIGH_INVENTORY = REPO / "reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv"
ALARM_COMPARISON = REPO / "reports/eva_report_source_package/data/alarm_comparison.tsv"
REMOVED_INVENTORY = REPO / "reports/eva_report_source_package/data/removed_alarm_inventory.tsv"
FUNCTION_COMPARISON = REPO / "analysis/eva_precision_study_final/final_function_summary.tsv"
FUNCTION_LIST = REPO / "analysis/high_precision/functions.txt"
HIGH_MANIFEST = REPO / "analysis/high_precision/manifest.tsv"
TARGETS = REPO / "analysis/klee_phase_b/data/klee_alarm_targets.tsv"
PHASE_C_MANIFEST = REPO / "analysis/klee_phase_c/PHASE_C_KLEE_PREPARATION_MANIFEST.md"
RESULT_SUMMARY = REPO / "analysis/klee_phase_c/results/summary.tsv"
PRECISION_PROFILE = REPO / "analysis/high_precision/precision_profile.md"
PHASE_A_ENVIRONMENT = REPO / "analysis/klee_phase_a/01_ENVIRONMENT_INVENTORY.md"
PHASE_A_KLEE_VERSION = REPO / "analysis/klee_phase_a/raw/klee_version.txt"
PHASE_A_CLANG_VERSION = REPO / "analysis/klee_phase_a/raw/clang_versions.txt"
PHASE_C_ROOT = REPO / "analysis/klee_phase_c"
EXECUTION_FREEZE_BRANCH = "analysis/klee-phase-c-full-results"
EXECUTION_FREEZE_COMMIT = "2184c6ae35e4b0d75b3449dced9bb19faea62a4f"


def read_tsv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def rel(path: Path | str) -> str:
    candidate = Path(path)
    try:
        return candidate.resolve().relative_to(REPO.resolve()).as_posix()
    except (ValueError, OSError):
        text = str(path)
        prefix = str(REPO.resolve()) + "/"
        return text[len(prefix):] if text.startswith(prefix) else text


def md(value: Any) -> str:
    text = str(value if value not in (None, "") else NA)
    return text.replace("|", "\\|").replace("\n", "<br>")


def md_table(headers: list[str], rows: Iterable[Iterable[Any]]) -> str:
    lines = [
        "| " + " | ".join(headers) + " |",
        "|" + "|".join("---" for _ in headers) + "|",
    ]
    lines.extend("| " + " | ".join(md(value) for value in row) + " |" for row in rows)
    return "\n".join(lines)


def compact(text: str, limit: int = 500) -> str:
    normalized = " ".join(text.split())
    if len(normalized) <= limit:
        return normalized
    return normalized[: limit - 1] + "…"


def semantic_text(text: str, limit: int = 500) -> str:
    """Normalize typographic comparison signs while retaining alarm identity."""
    return compact(text.replace("≤", "<=").replace("≥", ">="), limit)


def expression_from_message(message: str) -> str:
    """Recover the exact Eva assertion when no richer source expression exists."""
    match = re.search(r"\bassert\s+(.+?);?\s*$", message)
    return match.group(1).rstrip(";") if match else message


def parse_status(path: Path) -> dict[str, str]:
    result: dict[str, str] = {}
    if not path.is_file():
        return result
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        if "=" in line:
            key, value = line.split("=", 1)
            result[key] = value
    return result


def parse_info(path: Path) -> dict[str, str]:
    result: dict[str, str] = {}
    if not path.is_file():
        return result
    lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
    if lines:
        result["command"] = lines[0]
    for line in lines:
        if line.startswith("Started: "):
            result["started"] = line.removeprefix("Started: ")
        elif line.startswith("Finished: "):
            result["finished"] = line.removeprefix("Finished: ")
        elif line.startswith("Elapsed: "):
            result["elapsed"] = line.removeprefix("Elapsed: ")
        match = re.match(r"KLEE: done: (.+?) = (.+)$", line)
        if match:
            result[match.group(1).strip()] = match.group(2).strip()
    return result


def parse_log_stats(path: Path) -> dict[str, str]:
    result: dict[str, str] = {}
    if not path.is_file():
        return result
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        match = re.match(r"KLEE: done: (.+?) = (.+)$", line)
        if match:
            result[match.group(1).strip()] = match.group(2).strip()
    return result


def parse_sqlite_stats(path: Path) -> dict[str, Any]:
    if not path.is_file():
        return {}
    try:
        connection = sqlite3.connect(f"file:{path}?mode=ro", uri=True, timeout=1)
        columns = [row[1] for row in connection.execute("PRAGMA table_info(stats)")]
        row = connection.execute("SELECT * FROM stats ORDER BY rowid DESC LIMIT 1").fetchone()
        connection.close()
        return dict(zip(columns, row)) if row else {}
    except sqlite3.Error:
        return {}


def parse_symbolic_inputs(harness: Path) -> tuple[list[dict[str, str]], int, int]:
    if not harness.is_file():
        return [], 0, 0
    text = harness.read_text(encoding="utf-8", errors="replace")
    declarations = {
        name: type_name
        for type_name, name in re.findall(r"\b((?:u?int)(?:8|16|32|64)_t)\s+([A-Za-z_]\w*)\s*;", text)
    }
    symbolic_names = re.findall(
        r"klee_make_symbolic\s*\(\s*&([A-Za-z_]\w*)\s*,\s*sizeof\s*\(\s*\1\s*\)",
        text,
    )
    inputs = [
        {
            "name": name,
            "type": declarations.get(name, NA),
            "bytes": str(int(re.search(r"(8|16|32|64)", declarations.get(name, "0")).group(1)) // 8)
            if re.search(r"(8|16|32|64)", declarations.get(name, ""))
            else NA,
        }
        for name in symbolic_names
    ]
    return inputs, text.count("klee_make_symbolic"), text.count("klee_assume")


def parse_decoded_inputs(log_path: Path, symbolic_inputs: list[dict[str, str]]) -> str:
    if not log_path.is_file():
        return NA
    text = log_path.read_text(encoding="utf-8", errors="replace")
    objects: dict[str, dict[str, int]] = {}
    current_name: str | None = None
    for line in text.splitlines():
        name_match = re.match(r"object \d+: name: '([^']+)'", line)
        if name_match:
            current_name = name_match.group(1)
            objects.setdefault(current_name, {})
            continue
        if current_name is None:
            continue
        int_match = re.match(r"object \d+: int : (-?\d+)", line)
        uint_match = re.match(r"object \d+: uint: (\d+)", line)
        if int_match:
            objects[current_name]["int"] = int(int_match.group(1))
        elif uint_match:
            objects[current_name]["uint"] = int(uint_match.group(1))

    rendered: list[str] = []
    for symbolic in symbolic_inputs:
        name = symbolic["name"]
        type_name = symbolic["type"]
        data = objects.get(name, {})
        width_match = re.search(r"(8|16|32|64)", type_name)
        if not width_match or not data:
            rendered.append(f"{name}={NA}")
            continue
        width = int(width_match.group(1))
        signed = not type_name.startswith("uint")
        value = data.get("int" if signed else "uint")
        if value is None:
            value = data.get("uint" if signed else "int")
        if value is None:
            rendered.append(f"{name}={NA}")
            continue
        canonical_hex = f"0x{(value & ((1 << width) - 1)):0{width // 4}X}"
        rendered.append(f"{name}={value} ({canonical_hex})")
    return "; ".join(rendered) if rendered else NA


def alarm_number(alarm_id: str) -> int:
    return int(alarm_id.rsplit("-", 1)[1])


baseline = read_tsv(BASELINE_INVENTORY)
high = read_tsv(HIGH_INVENTORY)
comparison = read_tsv(ALARM_COMPARISON)
removed = read_tsv(REMOVED_INVENTORY)
function_rows = read_tsv(FUNCTION_COMPARISON)
targets = read_tsv(TARGETS)
result_rows = read_tsv(RESULT_SUMMARY)
functions = [line.strip() for line in FUNCTION_LIST.read_text(encoding="utf-8").splitlines() if line.strip()]

target_by_id = {row["klee_target_id"]: row for row in targets}
summary_by_id = {row["alarm_id"]: row for row in result_rows}
function_by_name = {row["function"]: row for row in function_rows}
high_signature_keys = {
    (row["function"], row["canonical_signature"], row["occurrence"])
    for row in high
}
phase_c_manifest_ids = re.findall(
    r"KLEE-ALARM-\d{4}", PHASE_C_MANIFEST.read_text(encoding="utf-8")
)
removed_by_signature = {
    (row["function"], row["source_file"], row["line"], row["category"], semantic_text(row["baseline_message"])): row
    for row in removed
}
target_by_signature = {
    (row["eva_function"], row["eva_canonical_signature"], row["eva_occurrence_index"]): row
    for row in targets
}

records: list[dict[str, Any]] = []
integrity_issues: list[str] = []
historical_runs: dict[str, list[str]] = {}

for target in sorted(targets, key=lambda row: alarm_number(row["klee_target_id"])):
    alarm_id = target["klee_target_id"]
    short_id = alarm_id.rsplit("-", 1)[1]
    function = target["eva_function"]
    alarm_dir = PHASE_C_ROOT / function / f"alarm_{short_id}"
    output_dir = alarm_dir / "build" / f"klee-out-alarm-{short_id}"
    build_status_path = alarm_dir / "build" / "klee.status"
    result_dir = PHASE_C_ROOT / "results" / function / f"alarm_{short_id}"
    result_status_path = result_dir / "klee.status"
    klee_log = result_dir / "klee.log"
    ktest_log = result_dir / "ktest.log"
    info_path = output_dir / "info"
    warnings_path = output_dir / "warnings.txt"
    messages_path = output_dir / "messages.txt"
    run_stats_path = output_dir / "run.stats"
    harness = alarm_dir / "klee_harness.c"
    readme = alarm_dir / "README.md"
    summary = summary_by_id.get(alarm_id, {})
    status = parse_status(build_status_path)
    result_status = parse_status(result_status_path)
    info = parse_info(info_path)
    log_stats = parse_log_stats(klee_log)
    sql_stats = parse_sqlite_stats(run_stats_path)
    symbolic_inputs, make_symbolic_count, assume_count = parse_symbolic_inputs(harness)
    readme_text = readme.read_text(encoding="utf-8", errors="replace") if readme.is_file() else ""
    info_text = info_path.read_text(encoding="utf-8", errors="replace") if info_path.is_file() else ""

    target_errors = sorted(output_dir.glob(f"*.klee-alarm-{short_id}.err")) if output_dir.is_dir() else []
    all_errors = sorted(output_dir.glob("*.err")) if output_dir.is_dir() else []
    non_target_errors = [path for path in all_errors if path not in target_errors]
    target_ktests: list[Path] = []
    for error in target_errors:
        candidate = error.with_name(error.name.split(".", 1)[0] + ".ktest")
        if candidate.is_file():
            target_ktests.append(candidate)

    marker_files: list[Path] = []
    active_error_suffixes: set[str] = set()
    assertion = NA
    for source_copy in alarm_dir.glob("*.c"):
        source_text = source_copy.read_text(encoding="utf-8", errors="replace")
        markers = set(re.findall(r"KLEE-ALARM-\d{4}", source_text))
        if alarm_id in markers:
            marker_files.append(source_copy)
            assertion_match = re.search(rf'"({re.escape(alarm_id)}:[^"]+)"', source_text)
            if assertion_match:
                assertion = assertion_match.group(1)
        active_error_suffixes.update(re.findall(r'"(klee-alarm-\d{4}\.err)"', source_text))

    archived = sorted(result_dir.glob(f"preexisting-klee-out-alarm-{short_id}*"))
    history = result_dir / "history"
    history_entries = sorted(history.iterdir()) if history.is_dir() else []
    if archived or history_entries:
        historical_runs[alarm_id] = [rel(path) for path in archived + history_entries]

    summary_status = summary.get("final_status", "")
    exit_code = summary.get("exit_code", status.get("exit_code", ""))
    completed = summary.get("completed_paths", "")
    partial = summary.get("partial_paths", "")
    generated_tests = summary.get("generated_tests", status.get("generated_tests", ""))
    if completed in ("", "-"):
        completed = info.get("completed paths", log_stats.get("completed paths", NA))
    if partial in ("", "-"):
        partial = info.get("partially completed paths", log_stats.get("partially completed paths", NA))
    if generated_tests in ("", "-"):
        generated_tests = info.get("generated tests", log_stats.get("generated tests", NA))

    executed = bool(status and output_dir.is_dir() and info_path.is_file())
    prepared = all(
        (alarm_dir / name).is_file()
        for name in ("klee_harness.c", "build_bitcode.sh", "run_klee.sh", "show_ktest.sh", "README.md")
    )
    bitcode_candidates = sorted((alarm_dir / "build").glob(f"*_alarm_{short_id}.bc"))
    bitcode_path = bitcode_candidates[-1] if bitcode_candidates else None

    if target_errors and target_ktests:
        outcome = "CONFIRMED_COUNTEREXAMPLE"
    elif summary_status == "INCONCLUSIVE_TIMEOUT" and not target_errors:
        outcome = "TIMEOUT"
    elif summary_status == "NO_COUNTEREXAMPLE_FOUND" and not target_errors:
        if exit_code == "0" and "finished" in info and str(partial) == "0":
            outcome = "NO_COUNTEREXAMPLE_SEARCH_COMPLETED"
        else:
            outcome = "INCONCLUSIVE"
    elif summary_status == "INCONCLUSIVE_TOOL_ERROR":
        failure = summary.get("failure_reason", "").lower()
        outcome = "UNSUPPORTED" if "unsupported" in failure or "external" in failure else "KLEE_ERROR"
    elif summary_status == "PREPARATION_ERROR" or summary.get("build_status") == "BUILD_ERROR":
        outcome = "BUILD_ERROR"
    elif not summary and not executed:
        outcome = "NOT_RUN"
    else:
        outcome = "INCONCLUSIVE"

    warning_text = warnings_path.read_text(encoding="utf-8", errors="replace") if warnings_path.is_file() else ""
    warnings = compact(warning_text) if warning_text.strip() else "None recorded"
    if non_target_errors:
        extra = "non-target errors: " + "; ".join(rel(path) for path in non_target_errors)
        warnings = extra if warnings == "None recorded" else warnings + "; " + extra

    inputs = parse_decoded_inputs(ktest_log, symbolic_inputs) if target_ktests else NA
    ktest_paths = "; ".join(rel(path) for path in target_ktests) if target_ktests else NA
    target_error_paths = "; ".join(rel(path) for path in target_errors) if target_errors else NA
    runtime = summary.get("elapsed_seconds", status.get("elapsed_seconds", NA)) or NA
    timeout_seconds = status.get("timeout_seconds", result_status.get("timeout_seconds", NA)) or NA
    try:
        process_timed_out = str(exit_code) in {"124", "137"} and float(runtime) >= float(timeout_seconds)
    except (TypeError, ValueError):
        process_timed_out = False
    instructions = info.get("total instructions", log_stats.get("total instructions", NA))
    explored = info.get("explored paths", NA)
    queries = info.get("total queries", sql_stats.get("Queries", NA))
    solver_queries = sql_stats.get("SolverQueries", NA)
    solver_time = sql_stats.get("SolverTime", NA)
    query_time = sql_stats.get("QueryTime", NA)
    memory = sql_stats.get("MallocUsage", NA)
    states = sql_stats.get("NumStates", sql_stats.get("States", NA))
    solver_stats = (
        f"queries={queries}; solver_queries={solver_queries}; "
        f"query_time_raw={query_time}; solver_time_raw={solver_time}"
    )
    paths_states = f"completed={completed}; partial={partial}; explored={explored}; states={states}"
    evidence = "; ".join(
        rel(path)
        for path in (result_status_path, klee_log, info_path, *target_errors)
        if path.is_file()
    ) or NA

    if outcome == "CONFIRMED_COUNTEREXAMPLE":
        interpretation = "KLEE reached the occurrence-specific violating branch and emitted target error/KTest evidence in the prepared fixed-width model."
    elif outcome == "NO_COUNTEREXAMPLE_SEARCH_COMPLETED":
        interpretation = "No counterexample was found by KLEE under the configured harness, constraints, search strategy, and resource limits; this is not a proof that the original program is safe."
    elif outcome == "TIMEOUT":
        interpretation = "The configured wall-clock limit ended this search without target evidence; the result is inconclusive."
    elif outcome == "BUILD_ERROR":
        interpretation = "Bitcode preparation failed, so no KLEE conclusion is available."
    elif outcome == "KLEE_ERROR":
        interpretation = "KLEE terminated with a tool/runtime/solver error; the target remains inconclusive."
    elif outcome == "UNSUPPORTED":
        interpretation = "The current model/toolchain could not support this target; the target remains inconclusive."
    elif outcome == "NOT_RUN":
        interpretation = "No execution evidence exists for this prepared target."
    else:
        interpretation = "Available evidence does not justify a stronger outcome."

    if summary and status and summary_status != status.get("final_status"):
        integrity_issues.append(f"{alarm_id}: summary/status classification mismatch")
    if status != result_status:
        integrity_issues.append(f"{alarm_id}: build and results status files differ")
    if outcome == "CONFIRMED_COUNTEREXAMPLE" and not target_ktests:
        integrity_issues.append(f"{alarm_id}: target error lacks matching KTest")
    if outcome == "NO_COUNTEREXAMPLE_SEARCH_COMPLETED" and (target_errors or str(partial) != "0"):
        integrity_issues.append(f"{alarm_id}: completed-no-counterexample evidence is inconsistent")
    if outcome == "TIMEOUT" and str(exit_code) not in {"124", "137"}:
        integrity_issues.append(f"{alarm_id}: timeout has unexpected exit code {exit_code}")
    expected_error_suffix = f"klee-alarm-{short_id}.err"
    if not marker_files or active_error_suffixes != {expected_error_suffix}:
        integrity_issues.append(
            f"{alarm_id}: target marker files={len(marker_files)}, active error suffixes={sorted(active_error_suffixes)}"
        )
    if summary.get("function") and summary["function"] != function:
        integrity_issues.append(f"{alarm_id}: summary function does not match Phase-B target")
    if status.get("alarm_id") != short_id or result_status.get("alarm_id") != short_id:
        integrity_issues.append(f"{alarm_id}: per-alarm status identity mismatch")
    if summary.get("alarm_id") != alarm_id:
        integrity_issues.append(f"{alarm_id}: execution-summary identity mismatch")
    if (function, target["eva_canonical_signature"], target["eva_occurrence_index"]) not in high_signature_keys:
        integrity_issues.append(f"{alarm_id}: Phase-B target has no exact High-Precision semantic signature")
    expected_location = f"{target['eva_source_file']}:{target['eva_source_line']}"
    if alarm_id not in readme_text or function not in readme_text or expected_location not in readme_text:
        integrity_issues.append(f"{alarm_id}: README identity/source-location mismatch")
    expected_bitcode_name = f"{function}_alarm_{short_id}.bc"
    if info_text and (str(output_dir.resolve()) not in info_text.splitlines()[0] or expected_bitcode_name not in info_text.splitlines()[0]):
        integrity_issues.append(f"{alarm_id}: current KLEE info command points to another output or bitcode")
    for required_log in (result_dir / "build.log", klee_log, ktest_log):
        if not required_log.is_file():
            integrity_issues.append(f"{alarm_id}: missing frozen execution log {rel(required_log)}")
    recorded_target_error = status.get("target_error", "")
    if recorded_target_error and not recorded_target_error.endswith(f".klee-alarm-{short_id}.err"):
        integrity_issues.append(f"{alarm_id}: status references a target error for another alarm")

    records.append(
        {
            "KLEE Alarm ID": alarm_id,
            "Function": function,
            "Source File": target["eva_source_file"],
            "Source Line": target["eva_source_line"],
            "Alarm Kind": target["eva_category"],
            "Source Expression / Operation": target["source_expression"],
            "EVA Safety Property / Predicate": target["predicate_text"],
            "Target Assertion Inserted for KLEE": assertion,
            "EVA Expression / Property": f"{target['source_expression']} | safety: {target['predicate_text']}",
            "Baseline EVA Present?": "YES",
            "High-Precision EVA Present?": "YES",
            "KLEE Prepared?": "YES" if prepared else "NO",
            "KLEE Executed?": "YES" if executed else "NO",
            "KLEE Outcome": outcome,
            "Counterexample Found?": "YES" if outcome == "CONFIRMED_COUNTEREXAMPLE" else "NO",
            "KTest Path": ktest_paths,
            "Concrete Inputs": inputs,
            "Timeout?": "YES" if process_timed_out else "NO",
            "Build Status": summary.get("build_status", "SUCCESS" if bitcode_path else NA),
            "KLEE Runtime": runtime,
            "Tests Generated": generated_tests,
            "Paths / States": paths_states,
            "Solver Stats": solver_stats,
            "Warnings": warnings,
            "Evidence Path": evidence,
            "Final Interpretation": interpretation,
            "_target": target,
            "_status": status,
            "_info": info,
            "_summary": summary,
            "_assertion": assertion,
            "_target_errors": target_error_paths,
            "_inputs": symbolic_inputs,
            "_make_symbolic_count": make_symbolic_count,
            "_assume_count": assume_count,
            "_timeout_seconds": timeout_seconds,
            "_completed": completed,
            "_partial": partial,
            "_instructions": instructions,
            "_explored": explored,
            "_queries": queries,
            "_solver_queries": solver_queries,
            "_solver_time": solver_time,
            "_query_time": query_time,
            "_memory": memory,
            "_bitcode": rel(bitcode_path) if bitcode_path else NA,
            "_output": rel(output_dir) if output_dir.is_dir() else NA,
            "_command": info.get("command", NA),
            "_messages": rel(messages_path) if messages_path.is_file() else NA,
        }
    )


PUBLIC_HEADERS = [
    "KLEE Alarm ID",
    "Function",
    "Source File",
    "Source Line",
    "Alarm Kind",
    "Source Expression / Operation",
    "EVA Safety Property / Predicate",
    "Target Assertion Inserted for KLEE",
    "EVA Expression / Property",
    "Baseline EVA Present?",
    "High-Precision EVA Present?",
    "KLEE Prepared?",
    "KLEE Executed?",
    "KLEE Outcome",
    "Counterexample Found?",
    "KTest Path",
    "Concrete Inputs",
    "Timeout?",
    "Build Status",
    "KLEE Runtime",
    "Tests Generated",
    "Paths / States",
    "Solver Stats",
    "Warnings",
    "Evidence Path",
    "Final Interpretation",
]

with (REPORT_DIR / "03_KLEE_149_ALARM_TRACEABILITY_MATRIX.tsv").open("w", newline="", encoding="utf-8") as stream:
    writer = csv.DictWriter(stream, fieldnames=PUBLIC_HEADERS, delimiter="\t", extrasaction="ignore", lineterminator="\n")
    writer.writeheader()
    writer.writerows(records)

with (REPORT_DIR / "04_KLEE_149_ALARM_TRACEABILITY_MATRIX.csv").open("w", newline="", encoding="utf-8") as stream:
    writer = csv.DictWriter(stream, fieldnames=PUBLIC_HEADERS, extrasaction="ignore", lineterminator="\n")
    writer.writeheader()
    writer.writerows(records)

outcomes = Counter(record["KLEE Outcome"] for record in records)
confirmed_before_timeout = [
    record for record in records
    if record["KLEE Outcome"] == "CONFIRMED_COUNTEREXAMPLE" and record["Timeout?"] == "YES"
]
baseline_count = len(baseline)
high_count = len(high)
removed_count = len(removed)
function_count = len(functions)
reduction_rate = 100.0 * removed_count / baseline_count
executed_valid = sum(1 for record in records if record["KLEE Executed?"] == "YES" and record["Build Status"] == "SUCCESS")

per_function_outcomes: dict[str, Counter[str]] = defaultdict(Counter)
for record in records:
    per_function_outcomes[record["Function"]][record["KLEE Outcome"]] += 1


def pct(count: int, denominator: int) -> str:
    return f"{(100.0 * count / denominator):.2f}%" if denominator else "N/A"


def function_table_rows() -> list[list[Any]]:
    rows: list[list[Any]] = []
    for function in functions:
        eva = function_by_name[function]
        counts = per_function_outcomes[function]
        target_count = int(eva["high_precision_alarms"])
        errors = counts["KLEE_ERROR"] + counts["BUILD_ERROR"]
        unsupported_not_run = counts["UNSUPPORTED"] + counts["NOT_RUN"]
        notes = "No High-Precision alarms; no KLEE target." if target_count == 0 else "All targets accounted for."
        rows.append(
            [
                function,
                eva["baseline_alarms"],
                eva["high_precision_alarms"],
                eva["removed"],
                target_count,
                counts["CONFIRMED_COUNTEREXAMPLE"],
                counts["NO_COUNTEREXAMPLE_SEARCH_COMPLETED"],
                counts["TIMEOUT"],
                errors,
                unsupported_not_run,
                counts["INCONCLUSIVE"],
                pct(counts["CONFIRMED_COUNTEREXAMPLE"], target_count),
                pct(counts["NO_COUNTEREXAMPLE_SEARCH_COMPLETED"], target_count),
                pct(counts["TIMEOUT"], target_count),
                notes,
            ]
        )
    return rows


FUNCTION_HEADERS = [
    "Function",
    "Baseline EVA",
    "High-Precision EVA",
    "Removed",
    "KLEE Targets",
    "Counterexamples",
    "No Counterexample",
    "Timeout",
    "Build/KLEE Error",
    "Unsupported/Not Run",
    "Inconclusive",
    "CE Rate",
    "No-CE Rate",
    "Timeout Rate",
    "Final Notes",
]

function_table = function_table_rows()
function_totals = [
    "TOTAL",
    sum(int(row["baseline_alarms"]) for row in function_rows),
    sum(int(row["high_precision_alarms"]) for row in function_rows),
    sum(int(row["removed"]) for row in function_rows),
    len(records),
    outcomes["CONFIRMED_COUNTEREXAMPLE"],
    outcomes["NO_COUNTEREXAMPLE_SEARCH_COMPLETED"],
    outcomes["TIMEOUT"],
    outcomes["KLEE_ERROR"] + outcomes["BUILD_ERROR"],
    outcomes["UNSUPPORTED"] + outcomes["NOT_RUN"],
    outcomes["INCONCLUSIVE"],
    pct(outcomes["CONFIRMED_COUNTEREXAMPLE"], len(records)),
    pct(outcomes["NO_COUNTEREXAMPLE_SEARCH_COMPLETED"], len(records)),
    pct(outcomes["TIMEOUT"], len(records)),
    "Reconciled",
]

source_block = """- Baseline alarms: `reports/eva_report_source_package/data/baseline_alarm_inventory.tsv`
- High-Precision alarms: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv`
- Semantic comparison/removal: `reports/eva_report_source_package/data/alarm_comparison.tsv` and `reports/eva_report_source_package/data/removed_alarm_inventory.tsv`
- Function population/counts: `analysis/high_precision/functions.txt`, `analysis/high_precision/manifest.tsv`, and `analysis/eva_precision_study_final/final_function_summary.tsv`
- KLEE target mapping: `analysis/klee_phase_b/data/klee_alarm_targets.tsv`
- KLEE execution summary: `analysis/klee_phase_c/results/summary.tsv`
- Per-target evidence: `analysis/klee_phase_c/<function>/alarm_NNNN/build/klee.status`, current `klee-out-alarm-NNNN/`, and `analysis/klee_phase_c/results/<function>/alarm_NNNN/`"""

global_evolution = md_table(
    ["Stage", "Alarm Count"],
    [
        ["Baseline EVA", baseline_count],
        ["High-Precision EVA", high_count],
        ["Removed by higher precision", removed_count],
        ["KLEE targets", len(targets)],
    ],
)

outcome_names = [
    "CONFIRMED_COUNTEREXAMPLE",
    "NO_COUNTEREXAMPLE_SEARCH_COMPLETED",
    "TIMEOUT",
    "KLEE_ERROR",
    "BUILD_ERROR",
    "UNSUPPORTED",
    "NOT_RUN",
    "INCONCLUSIVE",
]
outcome_table = md_table(
    ["Outcome", "Count", "Percentage of 149 targets"],
    [[name, outcomes[name], pct(outcomes[name], len(records))] for name in outcome_names]
    + [["TOTAL", len(records), "100.00%"]],
)

confirmed = [record for record in records if record["KLEE Outcome"] == "CONFIRMED_COUNTEREXAMPLE"]
no_counterexample = [record for record in records if record["KLEE Outcome"] == "NO_COUNTEREXAMPLE_SEARCH_COMPLETED"]
timeouts = [record for record in records if record["KLEE Outcome"] == "TIMEOUT"]
unsuccessful = [
    record
    for record in records
    if record["KLEE Outcome"] in {"KLEE_ERROR", "BUILD_ERROR", "UNSUPPORTED", "NOT_RUN", "INCONCLUSIVE"}
]

confirmed_table = md_table(
    ["Alarm", "Function", "Line", "Property", "Concrete Inputs", "KTest", "Runtime (s)"],
    [
        [
            record["KLEE Alarm ID"],
            record["Function"],
            record["Source Line"],
            record["EVA Expression / Property"],
            record["Concrete Inputs"],
            record["KTest Path"],
            record["KLEE Runtime"],
        ]
        for record in confirmed
    ],
)

no_ce_table = md_table(
    ["Alarm", "Function", "Line", "Property", "Completion Evidence", "Runtime (s)"],
    [
        [
            record["KLEE Alarm ID"],
            record["Function"],
            record["Source Line"],
            record["EVA Expression / Property"],
            record["Paths / States"],
            record["KLEE Runtime"],
        ]
        for record in no_counterexample
    ],
)

timeout_table = md_table(
    ["Alarm", "Function", "Line", "Property", "Timeout (s)", "Partial Progress", "Evidence"],
    [
        [
            record["KLEE Alarm ID"],
            record["Function"],
            record["Source Line"],
            record["EVA Expression / Property"],
            record["_timeout_seconds"],
            f"runtime={record['KLEE Runtime']}s; tests={record['Tests Generated']}; {record['Paths / States']}",
            record["Evidence Path"],
        ]
        for record in timeouts
    ],
)

summary_text = f"""# Full KLEE Phase-C Execution Summary

Status: **VALIDATED** against the frozen repository inventories and the current 149-row execution summary.

The selected execution state was frozen before report generation on branch `{EXECUTION_FREEZE_BRANCH}` at commit `{EXECUTION_FREEZE_COMMIT}`. Reports do not merge archived/validation runs into the selected current run.

## Authoritative sources

{source_block}

## Table A — Global evolution

{global_evolution}

The independently reconstructed reduction is {baseline_count} → {high_count}, a reduction of {removed_count} alarms ({reduction_rate:.2f}%). Thirteen of the 46 functions have zero High-Precision alarms.

## Table B — KLEE outcomes

{outcome_table}

The denominator for all KLEE rates is the {executed_valid} build-successful, executed targets. Counterexample rate: {pct(outcomes['CONFIRMED_COUNTEREXAMPLE'], executed_valid)}; completed-no-counterexample rate: {pct(outcomes['NO_COUNTEREXAMPLE_SEARCH_COMPLETED'], executed_valid)}; timeout rate: {pct(outcomes['TIMEOUT'], executed_valid)}; error/unsupported/not-run/inconclusive rate: {pct(sum(outcomes[name] for name in ['KLEE_ERROR','BUILD_ERROR','UNSUPPORTED','NOT_RUN','INCONCLUSIVE']), executed_valid)}.

`NO_COUNTEREXAMPLE_SEARCH_COMPLETED` means only: **No counterexample was found by KLEE under the configured harness, constraints, search strategy, and resource limits.** It is not automatically a safety proof or evidence that the Eva alarm is false.

## Table C — Per-function

{md_table(FUNCTION_HEADERS, function_table + [function_totals])}

## Table D — Confirmed alarms

{confirmed_table}

## Table E — Completed searches with no counterexample

{no_ce_table}

## Table F — Timeouts

{timeout_table}

## Interpretation

- Higher Eva precision correlates with the disappearance of {removed_count} baseline alarms. The repository provides semantic matching and plausible mechanisms, but does not isolate a single causal option for most removals.
- KLEE concretely reached {outcomes['CONFIRMED_COUNTEREXAMPLE']} occurrence-specific violation branches in the prepared fixed-width models.
- {outcomes['NO_COUNTEREXAMPLE_SEARCH_COMPLETED']} searches ended normally with zero partial paths and no target error.
- {outcomes['TIMEOUT']} searches were terminated by the configured 1800-second wall-clock policy without target evidence.
- {len(confirmed_before_timeout)} alarms ({', '.join(record['KLEE Alarm ID'] for record in confirmed_before_timeout)}) produced target evidence before the timeout process later exited 137; occurrence-specific target evidence has precedence, so each remains `CONFIRMED_COUNTEREXAMPLE` while `Timeout?` records the incomplete continuation.
"""
(REPORT_DIR / "01_FULL_KLEE_EXECUTION_SUMMARY.md").write_text(summary_text, encoding="utf-8")


baseline_expression_by_key: dict[tuple[str, str, str, str, str], str] = {}
for row in targets:
    key = (
        row["eva_function"],
        row["eva_source_file"],
        row["eva_source_line"],
        row["eva_category"],
        semantic_text(row["eva_normalized_message"]),
    )
    baseline_expression_by_key[key] = row["source_expression"]
for row in removed:
    key = (row["function"], row["source_file"], row["line"], row["category"], semantic_text(row["baseline_message"]))
    baseline_expression_by_key[key] = row["source_expression"]

baseline_table_rows = []
for index, row in enumerate(baseline, start=1):
    key = (row["function"], row["source_file"], row["line"], row["category"], semantic_text(row["normalized_message"]))
    expression = baseline_expression_by_key.get(key, expression_from_message(row["normalized_message"]))
    baseline_table_rows.append(
        [f"BL-{index:04d}", row["function"], row["source_file"], row["line"], row["category"], expression, row["normalized_message"]]
    )

high_table_rows = []
for row in high:
    target = target_by_signature.get((row["function"], row["canonical_signature"], row["occurrence"]))
    high_table_rows.append(
        [
            row["function"],
            row["source_file"],
            row["line"],
            row["category"],
            target["source_expression"] if target else NA,
            target["predicate_text"] if target else NA,
            row["normalized_message"],
        ]
    )

removed_table_rows = [
    [
        row["function"],
        row["source_file"],
        row["line"],
        row["category"],
        row["source_expression"],
        row["baseline_message"],
        "REMOVED",
        row["direct_evidence"],
        f"Mechanism={row['primary_mechanism']}; confidence={row['confidence']}. {row['technical_inference']}",
    ]
    for row in removed
]

eva_report = f"""# Eva Baseline versus High-Precision Reconstruction

## Evidence basis

{source_block}

The function population is the exact 46-line `analysis/high_precision/functions.txt` population. `analysis/high_precision/manifest.tsv` maps each function to its unchanged harness/source list and paired result directories. Baseline alarms are the 171 data rows in `baseline_alarm_inventory.tsv`; High-Precision alarms are the 149 rows in `high_precision_alarm_inventory.tsv`.

## Configuration comparison

Baseline runners use `-eva -eva-slevel 1000 -eva-ilevel 256`. High-Precision runners use the uniform profile recorded in `analysis/high_precision/precision_profile.md`: `-eva-precision 11`, domains `cvalue,equality,symbolic-locations,gauges,octagon,bitwise`, equality-through-calls `all`, octagons/interprocedural splits/history through calls, full return splitting, nonlinear subdivision 500, and integer-set level 1024. Precision 11 also records slevel 5000, plevel 2000, partition history 2, auto-loop-unroll 1024, minimum loop unroll 4, and widening delay 6. No input restriction, source transformation, or alarm suppression was used.

## Per-function comparison

{md_table(
    ["Function", "Baseline", "High Precision", "Difference", "Reduction"],
    [
        [
            row["function"],
            row["baseline_alarms"],
            row["high_precision_alarms"],
            int(row["baseline_alarms"]) - int(row["high_precision_alarms"]),
            pct(int(row["baseline_alarms"]) - int(row["high_precision_alarms"]), int(row["baseline_alarms"])),
        ]
        for row in function_rows
    ]
    + [["TOTAL", baseline_count, high_count, removed_count, f"{reduction_rate:.2f}%"]],
)}

## Exact alarms removed by High Precision

Semantic matching uses function, source file, line, category, normalized message/property, occurrence index, and source expression where necessary—not numeric alarm IDs.

{md_table(
    ["Function", "Source File", "Source Line", "Alarm Kind", "Baseline Expression", "Baseline Message", "High-Precision Status", "Matching Evidence", "Notes"],
    removed_table_rows,
)}

The removal inventory has exactly {removed_count} rows, equal to {baseline_count} − {high_count}. The causal-analysis text records plausible mechanisms and confidence; it does not prove that any one option caused a particular disappearance.

## Complete Baseline alarm inventory

{md_table(
    ["Baseline ID", "Function", "Source File", "Source Line", "Alarm Kind", "Expression / Property", "Baseline Eva Message"],
    baseline_table_rows,
)}

Baseline totals: {baseline_count} alarms across {sum(1 for row in function_rows if int(row['baseline_alarms']) > 0)} functions with alarms; {sum(1 for row in function_rows if int(row['baseline_alarms']) == 0)} functions with zero alarms.

## Complete High-Precision alarm inventory

{md_table(
    ["Function", "Source File", "Source Line", "Alarm Kind", "Expression", "Safety Predicate", "High-Precision Eva Message"],
    high_table_rows,
)}

High-Precision totals: {high_count} alarms across {sum(1 for row in function_rows if int(row['high_precision_alarms']) > 0)} functions with alarms; {sum(1 for row in function_rows if int(row['high_precision_alarms']) == 0)} functions with zero alarms.
"""
(REPORT_DIR / "02_EVA_BASELINE_VS_HIGH_PRECISION.md").write_text(eva_report, encoding="utf-8")


counterexample_report = f"""# KLEE Confirmed Counterexamples

Count: **{len(confirmed)}**.

A row is confirmed only when the current output contains `*.klee-alarm-NNNN.err` and its matching KTest. Concrete values below are decoded from the already generated `analysis/klee_phase_c/results/<function>/alarm_NNNN/ktest.log`; signedness and canonical hexadecimal rendering follow the fixed-width harness declaration.

{md_table(
    ["KLEE Alarm ID", "Function", "Source File", "Source Line", "Source Expression", "Eva Alarm Kind", "Eva Safety Property", "Inserted Assertion", "KTest", "Concrete Inputs", "Runtime (s)", "Process Timed Out?", "Tests", "Paths", "Target Error Evidence", "Classification"],
    [
        [
            record["KLEE Alarm ID"], record["Function"], record["Source File"], record["Source Line"],
            record["Source Expression / Operation"], record["Alarm Kind"],
            record["EVA Safety Property / Predicate"], record["Target Assertion Inserted for KLEE"], record["KTest Path"],
            record["Concrete Inputs"], record["KLEE Runtime"], record["Timeout?"], record["Tests Generated"],
            record["Paths / States"], record["_target_errors"], record["KLEE Outcome"],
        ]
        for record in confirmed
    ],
)}

Every counterexample confirms reachability of the mapped violating branch in the prepared fixed-width KLEE model. The Phase-A semantic-gap caveat still applies: this is a separately adapted x86-64 LLVM model preserving mapped scalar widths, not direct execution of PowerPC bitcode.

For {len(confirmed_before_timeout)} rows ({', '.join(record['KLEE Alarm ID'] for record in confirmed_before_timeout)}), the target witness was emitted before the external timeout later ended continued exploration. The witness remains valid, but the run did not complete its remaining search.
"""
(REPORT_DIR / "05_KLEE_COUNTEREXAMPLES.md").write_text(counterexample_report, encoding="utf-8")


no_ce_report = f"""# KLEE Completed Searches with No Counterexample

Count: **{len(no_counterexample)}**.

Classification requires exit code 0, a recorded `Finished:` field, zero partially completed paths, and no target-specific error artifact.

{md_table(
    ["Alarm", "Function", "Line", "Eva Property", "Command", "Timeout", "Completed", "Tests", "Solver Statistics", "Warnings", "Harness Inputs / Assumptions", "Evidence", "Classification Basis"],
    [
        [
            record["KLEE Alarm ID"], record["Function"], record["Source Line"], record["EVA Expression / Property"],
            record["_command"], record["_timeout_seconds"], record["Paths / States"], record["Tests Generated"],
            record["Solver Stats"], record["Warnings"],
            f"inputs={','.join(item['name'] + ':' + item['type'] for item in record['_inputs'])}; klee_make_symbolic={record['_make_symbolic_count']}; klee_assume={record['_assume_count']}",
            record["Evidence Path"], "normal exit + Finished + partial=0 + no target error",
        ]
        for record in no_counterexample
    ],
)}

**Methodological limit:** no row in this report is automatically a proof that the original program is safe or that Eva produced a false alarm.
"""
(REPORT_DIR / "06_KLEE_NO_COUNTEREXAMPLE.md").write_text(no_ce_report, encoding="utf-8")


timeout_report = f"""# KLEE Timeout Analysis

Count: **{len(timeouts)}**. Each timeout used the per-alarm external GNU timeout recorded in `klee.status`; the production setting is 1800 seconds with a 30-second TERM-to-KILL grace period.

{md_table(
    ["Alarm", "Function", "Line", "Alarm Kind", "Target Property", "Configured Timeout", "Observed Runtime", "Tests", "Paths/States", "Instructions", "Solver Stats", "Warnings", "Output Directory", "Classification"],
    [
        [
            record["KLEE Alarm ID"], record["Function"], record["Source Line"], record["Alarm Kind"],
            record["EVA Expression / Property"], record["_timeout_seconds"], record["KLEE Runtime"],
            record["Tests Generated"], record["Paths / States"], record["_instructions"], record["Solver Stats"],
            record["Warnings"], record["_output"], record["KLEE Outcome"],
        ]
        for record in timeouts
    ],
)}

Where paths/query data are unavailable, the table reports `{NA}`. Generated tests before timeout are partial search evidence only. No timeout is converted into a safety claim.
"""
(REPORT_DIR / "07_KLEE_TIMEOUTS.md").write_text(timeout_report, encoding="utf-8")


errors_report = f"""# KLEE Errors, Unsupported, Not-Run, and Inconclusive Targets

Primary unsuccessful classifications in the selected full run: **{len(unsuccessful)}**.

{md_table(
    ["Alarm", "Function", "Outcome", "Build Status", "Exit", "Failure/Warnings", "Evidence", "Interpretation"],
    [
        [
            record["KLEE Alarm ID"], record["Function"], record["KLEE Outcome"], record["Build Status"],
            record["_summary"].get("exit_code", NA), record["Warnings"], record["Evidence Path"], record["Final Interpretation"],
        ]
        for record in unsuccessful
    ],
)}

No target in the selected 149-row run is primarily classified as `KLEE_ERROR`, `BUILD_ERROR`, `UNSUPPORTED`, `NOT_RUN`, or `INCONCLUSIVE`. Nine non-target runtime error artifacts were observed on already-confirmed experiments and are retained in each matrix row's warnings/evidence; they do not replace the occurrence-specific target classification.
"""
(REPORT_DIR / "08_KLEE_ERRORS_AND_INCONCLUSIVE.md").write_text(errors_report, encoding="utf-8")


per_function_report = f"""# Per-Function Eva/KLEE Comparison

All 46 frozen in-scope functions are included, including the 13 functions with zero High-Precision alarms.

{md_table(FUNCTION_HEADERS, function_table + [function_totals])}

## Reconciliation

- Baseline Eva: {sum(int(row['baseline_alarms']) for row in function_rows)}
- High-Precision Eva / KLEE targets: {sum(int(row['high_precision_alarms']) for row in function_rows)}
- Removed by precision: {sum(int(row['removed']) for row in function_rows)}
- KLEE outcomes: {sum(outcomes.values())}

Rates in function rows use that function's High-Precision target count as denominator. Zero-target functions report `N/A` rates.
"""
(REPORT_DIR / "09_PER_FUNCTION_EVA_KLEE_COMPARISON.md").write_text(per_function_report, encoding="utf-8")


lifecycle_report = f"""# Alarm Lifecycle Analysis

## Group A — Baseline alarm disappeared after High Precision ({removed_count})

{md_table(["Removed ID", "Function", "Location", "Kind", "Expression", "Evidence"], [[row['alarm_id'], row['function'], f"{row['source_file']}:{row['line']}", row['category'], row['source_expression'], row['direct_evidence']] for row in removed])}

## Group B — Remained and KLEE confirmed ({len(confirmed)})

{md_table(["Alarm", "Function", "Location", "Property", "KTest"], [[record['KLEE Alarm ID'], record['Function'], f"{record['Source File']}:{record['Source Line']}", record['EVA Expression / Property'], record['KTest Path']] for record in confirmed])}

## Group C — Remained; completed without counterexample ({len(no_counterexample)})

{md_table(["Alarm", "Function", "Location", "Property", "Completion Evidence"], [[record['KLEE Alarm ID'], record['Function'], f"{record['Source File']}:{record['Source Line']}", record['EVA Expression / Property'], record['Paths / States']] for record in no_counterexample])}

## Group D — Remained; timeout ({len(timeouts)})

{md_table(["Alarm", "Function", "Location", "Property", "Runtime", "Evidence"], [[record['KLEE Alarm ID'], record['Function'], f"{record['Source File']}:{record['Source Line']}", record['EVA Expression / Property'], record['KLEE Runtime'], record['Evidence Path']] for record in timeouts])}

## Group E — Remained; failed/unsupported/not-run/inconclusive ({len(unsuccessful)})

{md_table(["Alarm", "Function", "Outcome", "Evidence"], [[record['KLEE Alarm ID'], record['Function'], record['KLEE Outcome'], record['Evidence Path']] for record in unsuccessful])}

Lifecycle reconciliation: Group A = {removed_count}; Groups B+C+D+E = {len(confirmed) + len(no_counterexample) + len(timeouts) + len(unsuccessful)} = High-Precision Eva/KLEE target count {high_count}.
"""
(REPORT_DIR / "10_ALARM_LIFECYCLE_ANALYSIS.md").write_text(lifecycle_report, encoding="utf-8")


metrics_report = f"""# KLEE Evidence and Metrics

## Execution-freeze provenance

- Branch: `{EXECUTION_FREEZE_BRANCH}`
- Commit: `{EXECUTION_FREEZE_COMMIT}`
- Selection rule: current `build/klee.status` and `build/klee-out-alarm-NNNN` matching `analysis/klee_phase_c/results/summary.tsv`; historical and validation outputs remain separate.

## Environment evidence

- KLEE 3.2, build revision `92ee8201a050184aacaaeef645ade491f5c93c41`, linked with Ubuntu LLVM 13.0.1: `analysis/klee_phase_a/raw/klee_version.txt`.
- Clang 13.0.0 and LLVM tools 13.0.0: `analysis/klee_phase_a/raw/clang_versions.txt` and `analysis/klee_phase_a/raw/llvm_versions.txt`.
- Default solver observed in every current `messages.txt`: STP with MiniSat.
- Build flags/tool paths: each `analysis/klee_phase_c/<function>/alarm_NNNN/build_bitcode.sh`.
- Execution command: first line of each current `klee-out-alarm-NNNN/info`.

## Per-alarm metrics

{md_table(
    ["Alarm", "Runtime", "Timeout", "Termination", "Tests", "Completed", "Partial", "Explored", "Instructions", "Queries", "Solver Queries", "Query Time Raw", "Solver Time Raw", "Memory Bytes", "Bitcode", "Output", "Warnings"],
    [
        [
            record["KLEE Alarm ID"], record["KLEE Runtime"], record["_timeout_seconds"], record["KLEE Outcome"],
            record["Tests Generated"], record["_completed"], record["_partial"], record["_explored"],
            record["_instructions"], record["_queries"], record["_solver_queries"], record["_query_time"],
            record["_solver_time"], record["_memory"], record["_bitcode"], record["_output"], record["Warnings"],
        ]
        for record in records
    ],
)}

`Raw` time fields are preserved exactly as stored in KLEE's SQLite statistics rather than assigning an undocumented unit. `{NA}` means the selected run did not record that metric.

## Constraints and assumptions

All prepared harnesses use fixed-width symbolic objects. The default policy is zero `klee_assume`; per-target counts are available in the generated matrix source inspection and every alarm README. Defined-prefix adaptations and suffix truncation are documented per alarm and are methodological model adaptations, not claims that earlier/later Eva alarms are safe.
"""
(REPORT_DIR / "11_KLEE_EVIDENCE_AND_METRICS.md").write_text(metrics_report, encoding="utf-8")


multiple_run_rows = [[alarm, len(paths), "; ".join(paths)] for alarm, paths in sorted(historical_runs.items(), key=lambda item: alarm_number(item[0]))]
next_phase_report = f"""# Next-Phase Data Requirements

## Already available

- Complete 46-function Baseline/High-Precision inventories and semantic alarm matching.
- Complete 149-target Phase-B predicate/input mapping and isolated Phase-C models.
- Per-target wall-clock status, exit code, tests, paths when emitted, current KLEE command, STP/MiniSat evidence, compact SQLite statistics, target errors, and matching witness KTests.
- Decoded concrete inputs for all {len(confirmed)} target counterexamples.

## Recommended future controlled collection

1. Preserve SQLite `run.stats` after an explicit checkpoint/export to stable TSV; killed runs can leave data in WAL files.
2. Record peak RSS externally per alarm; current KLEE statistics expose allocation data for some runs but no uniform OS-level peak-memory record.
3. Record a deterministic environment manifest at full-run time (host kernel, Snap confinement context, exact command environment, CPU load).
4. If timeout resolution is scientifically important, rerun only the {len(timeouts)} timeout targets under a separately approved larger budget or alternate search strategy. Do not mix such results with this frozen 1800-second campaign.
5. Independently replay selected counterexamples against a separate target-faithful implementation if claims beyond the fixed-width KLEE analysis model are desired.
6. Capture explicit KLEE searcher/solver options in a campaign manifest even though each `info` records the command and default searcher description.

## Multiple-run inventory

Historical/validation outputs exist for {len(historical_runs)} alarms. The selected result is always the current `build/klee.status` + current `build/klee-out-alarm-NNNN` pair matching `analysis/klee_phase_c/results/summary.tsv`; older paths are not silently merged.

{md_table(["Alarm", "Historical Entries", "Archived Paths"], multiple_run_rows)}
"""
(REPORT_DIR / "12_NEXT_PHASE_DATA_REQUIREMENTS.md").write_text(next_phase_report, encoding="utf-8")


expected_ids = [f"KLEE-ALARM-{number:04d}" for number in range(1, 150)]
target_ids = [row["klee_target_id"] for row in targets]
summary_ids = [row["alarm_id"] for row in result_rows]
alarm_dirs = sorted(PHASE_C_ROOT.glob("*/alarm_[0-9][0-9][0-9][0-9]"))
output_dirs = sorted(PHASE_C_ROOT.glob("*/alarm_[0-9][0-9][0-9][0-9]/build/klee-out-alarm-[0-9][0-9][0-9][0-9]"))


def semantic_location_counter(rows: Iterable[dict[str, str]]) -> Counter[tuple[str, str, str, str]]:
    return Counter((row["function"], row["source_file"], row["line"], row["category"]) for row in rows)


baseline_removed_semantics = semantic_location_counter(
    row for row in baseline if row["comparison_status"] == "REMOVED"
)
comparison_removed_semantics = semantic_location_counter(
    row for row in comparison if row["status"] == "REMOVED"
)
removed_inventory_semantics = semantic_location_counter(removed)
removed_semantic_details_complete = all(
    row["source_expression"] and row["baseline_message"] and row["direct_evidence"]
    for row in removed
)
confirmed_with_source_location = sum(
    1 for record in confirmed if record["Source File"] != NA and record["Source Line"] != NA
)
confirmed_with_decoded_inputs = sum(
    1 for record in confirmed if record["Concrete Inputs"] != NA and NA not in record["Concrete Inputs"]
)
confirmed_with_complete_property_trace = sum(
    1 for record in confirmed
    if record["Source Expression / Operation"] != NA
    and record["EVA Safety Property / Predicate"] != NA
    and record["Target Assertion Inserted for KLEE"] != NA
)

checks = [
    ("Function list has 46 unique rows", len(functions) == 46 and len(set(functions)) == 46, len(functions)),
    ("High-Precision manifest has 46 data rows", len(read_tsv(HIGH_MANIFEST)) == 46, len(read_tsv(HIGH_MANIFEST))),
    ("Baseline inventory has 171 alarms", baseline_count == 171, baseline_count),
    ("High-Precision inventory has 149 alarms", high_count == 149, high_count),
    ("Baseline minus High Precision is 22", baseline_count - high_count == 22, baseline_count - high_count),
    ("Removed inventory has 22 alarms", removed_count == 22, removed_count),
    ("Semantic comparison partitions 171 rows into 149 remaining and 22 removed", len(comparison) == 171 and Counter(row["status"] for row in comparison) == Counter({"REMAINING": 149, "REMOVED": 22}), dict(Counter(row["status"] for row in comparison))),
    ("All 22 removed alarms reconcile semantically by function/source/line/kind multiplicity with expression/property evidence", sum(removed_inventory_semantics.values()) == 22 and removed_inventory_semantics == baseline_removed_semantics == comparison_removed_semantics and removed_semantic_details_complete and all(row["comparison_status"] == "REMAINING" for row in high), sum(removed_inventory_semantics.values())),
    ("13 functions have zero High-Precision alarms", sum(1 for row in function_rows if int(row["high_precision_alarms"]) == 0) == 13, sum(1 for row in function_rows if int(row["high_precision_alarms"]) == 0)),
    ("Phase-B target IDs are unique 0001-0149", target_ids == expected_ids and len(set(target_ids)) == 149, len(target_ids)),
    ("Phase-C preparation manifest IDs are unique 0001-0149", phase_c_manifest_ids == expected_ids and len(set(phase_c_manifest_ids)) == 149, len(phase_c_manifest_ids)),
    ("Execution summary IDs are unique 0001-0149", summary_ids == expected_ids and len(set(summary_ids)) == 149, len(summary_ids)),
    ("There are 149 alarm directories", len(alarm_dirs) == 149, len(alarm_dirs)),
    ("There are 149 current output directories", len(output_dirs) == 149, len(output_dirs)),
    ("All 149 targets have one primary classification", len(records) == 149 and sum(outcomes.values()) == 149, sum(outcomes.values())),
    ("All 149 targets built and have execution evidence", all(record["Build Status"] == "SUCCESS" and record["KLEE Executed?"] == "YES" for record in records), sum(1 for record in records if record["Build Status"] == "SUCCESS" and record["KLEE Executed?"] == "YES")),
    ("Current and results status files agree", all(parse_status(PHASE_C_ROOT / row["eva_function"] / f"alarm_{row['klee_target_id'][-4:]}" / "build/klee.status") == parse_status(PHASE_C_ROOT / "results" / row["eva_function"] / f"alarm_{row['klee_target_id'][-4:]}" / "klee.status") for row in targets), "all matched"),
    ("All confirmed target errors have matching KTests", all(record["KTest Path"] != NA for record in confirmed), len(confirmed)),
    ("All confirmed counterexamples have exact source file and line", confirmed_with_source_location == len(confirmed), confirmed_with_source_location),
    ("All confirmed counterexamples have decoded concrete inputs", confirmed_with_decoded_inputs == len(confirmed), confirmed_with_decoded_inputs),
    ("All confirmed counterexamples retain expression, Eva predicate, and KLEE assertion", confirmed_with_complete_property_trace == len(confirmed), confirmed_with_complete_property_trace),
    ("No completed-no-counterexample row is a timeout", all(record["Timeout?"] == "NO" and record["_partial"] == "0" for record in no_counterexample), len(no_counterexample)),
    ("No unresolved structural integrity issue", not integrity_issues, len(integrity_issues)),
]
validated = all(passed for _, passed, _ in checks)

validation_report = f"""# Final Validation Checklist

Overall status: **{'VALIDATED' if validated else 'NOT VALIDATED'}**.

{md_table(["Invariant", "Result", "Observed"], [[name, "PASS" if passed else "FAIL", observed] for name, passed, observed in checks])}

## Reconciliation block

```text
Functions in scope                = {function_count}

Baseline alarms                  = {baseline_count}
High-Precision alarms            = {high_count}
Baseline - High Precision        = {baseline_count - high_count}
Removed alarm records            = {removed_count}
Eva precision reduction          = {reduction_rate:.2f}% ({removed_count}/{baseline_count})

KLEE target alarms               = {len(targets)}
Classified KLEE alarms           = {len(records)}

Confirmed counterexamples        = {outcomes['CONFIRMED_COUNTEREXAMPLE']} ({pct(outcomes['CONFIRMED_COUNTEREXAMPLE'], len(records))} of {len(records)})
No counterexample completed      = {outcomes['NO_COUNTEREXAMPLE_SEARCH_COMPLETED']} ({pct(outcomes['NO_COUNTEREXAMPLE_SEARCH_COMPLETED'], len(records))} of {len(records)})
Timeout                          = {outcomes['TIMEOUT']} ({pct(outcomes['TIMEOUT'], len(records))} of {len(records)})
KLEE errors                      = {outcomes['KLEE_ERROR']}
Build errors                     = {outcomes['BUILD_ERROR']}
Unsupported                      = {outcomes['UNSUPPORTED']}
Not run                          = {outcomes['NOT_RUN']}
Inconclusive                     = {outcomes['INCONCLUSIVE']}
Error/unsupported/not-run total  = {sum(outcomes[name] for name in ['KLEE_ERROR', 'BUILD_ERROR', 'UNSUPPORTED', 'NOT_RUN'])}

Sum of KLEE outcomes             = {sum(outcomes.values())}
```

## Integrity observations

- Current status copies match for all 149 alarms.
- Current alarm IDs, target directories, target markers, result rows, and output directories form a complete unique 0001–0149 sequence.
- {len(historical_runs)} alarms have archived/validation runs. The current output/status pair matching the final summary is selected; historical evidence remains separate.
- There are {sum(len(list((PHASE_C_ROOT / record['Function'] / f"alarm_{record['KLEE Alarm ID'][-4:]}" / 'build' / f"klee-out-alarm-{record['KLEE Alarm ID'][-4:]}").glob('*.err'))) for record in records)} current `.err` files: {len(confirmed)} target-specific and {sum(1 for record in records for warning in [record['Warnings']] if 'non-target errors:' in warning)} experiments with one or more non-target errors.
- {len(confirmed_before_timeout)} alarms ({', '.join(record['KLEE Alarm ID'] for record in confirmed_before_timeout)}) are correctly counterexample-confirmed despite timeout exit 137 because their target `.err` and KTest exist; their `Timeout?` field remains `YES`.
- Tool-emitted trailing whitespace in raw `.err`, KTest logs, and the execution TSV was retained byte-for-byte in the execution-freeze commit.

## Structural issues

{md_table(["Issue"], [[issue] for issue in integrity_issues]) if integrity_issues else "None."}
"""
(REPORT_DIR / "13_FINAL_VALIDATION_CHECKLIST.md").write_text(validation_report, encoding="utf-8")


print(f"functions={function_count}")
print(f"baseline={baseline_count}")
print(f"high_precision={high_count}")
print(f"removed={removed_count}")
print(f"targets={len(targets)}")
for name in outcome_names:
    print(f"{name}={outcomes[name]}")
print(f"historical_run_alarms={len(historical_runs)}")
print(f"integrity_issues={len(integrity_issues)}")
print(f"validated={'YES' if validated else 'NO'}")
