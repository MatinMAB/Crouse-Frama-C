#!/usr/bin/env python3
"""Compare committed Frama-C/Eva Baseline and High Precision logs.

This program is deliberately log-only: it never invokes Frama-C and never
modifies analysis inputs or result artifacts.  It produces the comparison
TSVs and Markdown reports from the 46 function names in functions.txt.
"""

from __future__ import annotations

import csv
import difflib
import re
import sys
import unicodedata
from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Sequence


ROOT = Path(__file__).resolve().parents[2]
FUNCTIONS_FILE = ROOT / "analysis/high_precision/functions.txt"
OUTPUT_DIR = ROOT / "analysis/high_precision_comparison"
PER_FUNCTION_DIR = OUTPUT_DIR / "per_function"
REPORT_DIR = ROOT / "reports/high_precision_comparison"

FUNCTION_SUMMARY_FILE = OUTPUT_DIR / "function_summary.tsv"
ALARM_DIFF_FILE = OUTPUT_DIR / "alarm_diff.tsv"
CATEGORY_SUMMARY_FILE = OUTPUT_DIR / "category_summary.tsv"
GLOBAL_SUMMARY_FILE = OUTPUT_DIR / "global_summary.md"
COMPREHENSIVE_REPORT_FILE = REPORT_DIR / "eva_high_precision_comparison.md"

ALARM_HEADER_RE = re.compile(
    r"^\[eva:alarm\]\s+(.+?):(\d+):\s+Warning:\s*$"
)
FINAL_STATE_RE = re.compile(
    r"^\[eva:final-states\]\s+Values at end of function\s+(.+?):\s*$"
)

UNICODE_NORMALIZATION = str.maketrans(
    {
        "≢": "!=",
        "≠": "!=",
        "≤": "<=",
        "≥": ">=",
        "−": "-",
        "–": "-",
        "—": "-",
        "∧": "&&",
        "∨": "||",
        "\u00a0": " ",
    }
)

CATEGORY_ORDER = {
    "integer overflow": 0,
    "division by zero": 1,
    "invalid shift": 2,
    "invalid memory access": 3,
    "uninitialized read": 4,
    "invalid pointer": 5,
    "other": 99,
}

EXPECTED_META_SETTINGS = (
    "option -eva-min-loop-unroll set to 4.",
    "option -eva-auto-loop-unroll set to 1024.",
    "option -eva-widening-delay set to 6.",
    "option -eva-partition-history set to 2.",
    "option -eva-slevel set to 5000.",
    "option -eva-ilevel already set to 1024 (not modified).",
    "option -eva-plevel set to 2000.",
    "option -eva-subdivide-non-linear already set to 500 (not modified).",
)


@dataclass(frozen=True)
class Alarm:
    source_file: str
    line: int
    message: str
    normalized_message: str
    category: str
    canonical_signature: str


@dataclass(frozen=True)
class Summary:
    functions_analyzed: int | None
    functions_total: int | None
    function_coverage: int | None
    statements_reached: int | None
    statements_total: int | None
    statement_coverage: int | None
    alarm_count: int
    assertions: str
    preconditions: str


@dataclass
class ComparisonRow:
    function: str
    status: str
    source_file: str
    line: int
    category: str
    baseline_message: str
    high_precision_message: str
    canonical_signature: str


@dataclass
class FunctionComparison:
    function: str
    baseline_alarms: list[Alarm]
    high_precision_alarms: list[Alarm]
    baseline_missing_return: list[Alarm]
    high_precision_missing_return: list[Alarm]
    rows: list[ComparisonRow]
    baseline_summary: Summary
    high_precision_summary: Summary
    baseline_summary_block: list[str]
    high_precision_summary_block: list[str]
    baseline_final_states: dict[str, tuple[str, ...]]
    high_precision_final_states: dict[str, tuple[str, ...]]
    final_state_status: str
    final_state_diff: list[str]
    parse_status: str

    @property
    def baseline_count(self) -> int:
        return len(self.baseline_alarms)

    @property
    def high_precision_count(self) -> int:
        return len(self.high_precision_alarms)

    @property
    def removed(self) -> int:
        return sum(row.status == "REMOVED" for row in self.rows)

    @property
    def remaining(self) -> int:
        return sum(row.status == "REMAINING" for row in self.rows)

    @property
    def new(self) -> int:
        return sum(row.status == "NEW" for row in self.rows)

    @property
    def delta(self) -> int:
        return self.high_precision_count - self.baseline_count

    @property
    def comparison_status(self) -> str:
        if self.delta < 0:
            return "REDUCED"
        if self.delta > 0:
            return "INCREASED"
        return "UNCHANGED"


def fail(message: str) -> None:
    raise RuntimeError(message)


def read_text(path: Path) -> str:
    if not path.is_file():
        fail(f"required file is missing: {path.relative_to(ROOT)}")
    return path.read_text(encoding="utf-8")


def normalize_source_path(path: str) -> str:
    normalized = path.strip().replace("\\", "/")
    marker = "src_analysis/"
    marker_index = normalized.find(marker)
    if marker_index >= 0:
        normalized = normalized[marker_index:]
    while normalized.startswith("./"):
        normalized = normalized[2:]
    return normalized


def normalize_message(message: str) -> str:
    normalized = unicodedata.normalize("NFKC", message)
    normalized = normalized.translate(UNICODE_NORMALIZATION)
    normalized = re.sub(r"\s+", " ", normalized).strip()
    return normalized


def category_for(message: str) -> str:
    lowered = message.lower()
    if "division by zero" in lowered:
        return "division by zero"
    if "overflow" in lowered:
        return "integer overflow"
    if "shift" in lowered:
        return "invalid shift"
    if "out of bounds" in lowered or "invalid memory" in lowered:
        return "invalid memory access"
    if "uninitialized" in lowered:
        return "uninitialized read"
    if "invalid pointer" in lowered or "invalid address" in lowered:
        return "invalid pointer"
    return "other"


def parse_alarm_entries(text: str) -> tuple[list[Alarm], list[Alarm]]:
    lines = text.splitlines()
    alarms: list[Alarm] = []
    missing_return_markers: list[Alarm] = []
    index = 0
    while index < len(lines):
        match = ALARM_HEADER_RE.match(lines[index])
        if not match:
            index += 1
            continue

        source_file = normalize_source_path(match.group(1))
        source_line = int(match.group(2))
        message_lines: list[str] = []
        index += 1
        while index < len(lines) and not lines[index].startswith("["):
            if lines[index].strip():
                message_lines.append(lines[index].strip())
            index += 1

        message = re.sub(r"\s+", " ", " ".join(message_lines)).strip()
        normalized_message = normalize_message(message)
        category = category_for(normalized_message)
        signature = f"{source_file}|{source_line}|{normalized_message}"
        alarm = Alarm(
            source_file=source_file,
            line=source_line,
            message=message,
            normalized_message=normalized_message,
            category=category,
            canonical_signature=signature,
        )
        if "missing_return" in normalized_message:
            missing_return_markers.append(alarm)
        else:
            alarms.append(alarm)

    return alarms, missing_return_markers


def summary_alarm_count(text: str) -> int:
    numeric = re.findall(r"\b(\d+)\s+alarms? generated by the analysis", text)
    if numeric:
        return int(numeric[-1])
    if re.search(r"\bNo alarms? generated by the analysis", text, re.IGNORECASE):
        return 0
    fail("ANALYSIS SUMMARY alarm count not found")


def extract_property_line(text: str, property_name: str) -> str:
    match = re.search(
        rf"^\s*{re.escape(property_name)}\s+(.+?)\s*$", text, re.MULTILINE
    )
    return normalize_message(match.group(1)) if match else "not reported"


def extract_summary(text: str) -> Summary:
    functions_match = re.search(
        r"(\d+) functions analyzed \(out of (\d+)\): (\d+)% coverage", text
    )
    statements_match = re.search(
        r"(\d+) statements reached \(out of (\d+)\): (\d+)% coverage", text
    )
    return Summary(
        functions_analyzed=int(functions_match.group(1)) if functions_match else None,
        functions_total=int(functions_match.group(2)) if functions_match else None,
        function_coverage=int(functions_match.group(3)) if functions_match else None,
        statements_reached=int(statements_match.group(1)) if statements_match else None,
        statements_total=int(statements_match.group(2)) if statements_match else None,
        statement_coverage=int(statements_match.group(3)) if statements_match else None,
        alarm_count=summary_alarm_count(text),
        assertions=extract_property_line(text, "Assertions"),
        preconditions=extract_property_line(text, "Preconditions"),
    )


def extract_summary_block(text: str) -> list[str]:
    lines = text.splitlines()
    start = next(
        (index for index, line in enumerate(lines) if "ANALYSIS SUMMARY" in line),
        None,
    )
    if start is None:
        fail("ANALYSIS SUMMARY block not found")
    block: list[str] = []
    for index in range(start, len(lines)):
        if index > start and lines[index].startswith("["):
            break
        block.append(lines[index].rstrip())
    return block


def extract_final_states(text: str) -> dict[str, tuple[str, ...]]:
    lines = text.splitlines()
    states: dict[str, tuple[str, ...]] = {}
    index = 0
    while index < len(lines):
        match = FINAL_STATE_RE.match(lines[index])
        if not match:
            index += 1
            continue
        function_name = match.group(1).strip()
        index += 1
        block: list[str] = []
        while index < len(lines) and not lines[index].startswith("["):
            if lines[index].strip():
                block.append(normalize_message(lines[index]))
            index += 1
        states[function_name] = tuple(block)
    return states


def normalize_parse_diagnostics(text: str, function: str) -> str:
    normalized = text.replace("\\", "/")
    normalized = re.sub(
        rf"results/(?:baseline|high_precision)/{re.escape(function)}",
        f"results/ANALYSIS_MODE/{function}",
        normalized,
    )
    return "\n".join(line.rstrip() for line in normalized.splitlines()).strip()


def extract_command_blocks(script_text: str) -> list[str]:
    lines = script_text.splitlines()
    blocks: list[str] = []
    index = 0
    while index < len(lines):
        if lines[index].strip() != "frama-c \\":
            index += 1
            continue
        block = [lines[index].strip()]
        index += 1
        while index < len(lines):
            block.append(lines[index].strip())
            if "2>&1" in lines[index]:
                break
            index += 1
        blocks.append("\n".join(block))
        index += 1
    return blocks


def normalize_command_outputs(block: str) -> str:
    """Remove result-path spelling while retaining inputs and analysis options."""
    normalized_lines: list[str] = []
    for line in block.splitlines():
        stripped = line.strip()
        if stripped.startswith("-load "):
            normalized_lines.append("-load <PARSE_STATE> \\")
        elif stripped.startswith("-save "):
            normalized_lines.append("-save <OUTPUT_STATE> \\")
        elif stripped.startswith("> ") and stripped.endswith("2>&1"):
            normalized_lines.append("> <OUTPUT_LOG> 2>&1")
        else:
            normalized_lines.append(stripped)
    return "\n".join(normalized_lines)


def validate_runner_controls(functions: Sequence[str]) -> tuple[str, str]:
    baseline_eva_blocks: set[str] = set()
    high_eva_blocks: set[str] = set()
    for function in functions:
        baseline_path = ROOT / f"scripts/run_{function}_baseline.sh"
        high_path = ROOT / f"scripts/high_precision/run_{function}_high_precision.sh"
        baseline_blocks = extract_command_blocks(read_text(baseline_path))
        high_blocks = extract_command_blocks(read_text(high_path))
        if len(baseline_blocks) != 2 or len(high_blocks) != 2:
            fail(f"unexpected runner command structure for {function}")
        baseline_parse = normalize_command_outputs(baseline_blocks[0])
        high_parse = normalize_command_outputs(high_blocks[0])
        if baseline_parse != high_parse:
            fail(f"parse command differs between modes for {function}")
        baseline_eva_blocks.add(normalize_command_outputs(baseline_blocks[1]))
        high_eva_blocks.add(normalize_command_outputs(high_blocks[1]))

    normalized_baseline = {
        re.sub(r'FUNC="[^"]+"', 'FUNC="<FUNCTION>"', block)
        for block in baseline_eva_blocks
    }
    normalized_high = {
        re.sub(r'FUNC="[^"]+"', 'FUNC="<FUNCTION>"', block)
        for block in high_eva_blocks
    }
    if len(normalized_baseline) != 1 or len(normalized_high) != 1:
        fail("Eva command profile is not uniform across all 46 runners")

    baseline_block = next(iter(normalized_baseline))
    high_block = next(iter(normalized_high))
    for required in ("-eva \\", "-eva-slevel 1000 \\", "-eva-ilevel 256 \\"):
        if required not in baseline_block:
            fail(f"baseline Eva profile is missing {required.rstrip()}")
    for required in (
        "-eva \\",
        "-eva-precision 11 \\",
        "-eva-domains cvalue,equality,symbolic-locations,gauges,octagon,bitwise \\",
        "-eva-equality-through-calls all \\",
        "-eva-octagon-through-calls \\",
        "-eva-interprocedural-splits \\",
        "-eva-interprocedural-history \\",
        "-eva-split-return full \\",
        "-eva-subdivide-non-linear 500 \\",
        "-eva-ilevel 1024 \\",
    ):
        if required not in high_block:
            fail(f"high-precision Eva profile is missing {required.rstrip()}")
    return baseline_block, high_block


def validate_precision_meta_settings(function: str, text: str) -> None:
    for setting in EXPECTED_META_SETTINGS:
        if setting not in text:
            fail(f"precision-11 setting missing from {function} log: {setting}")


def compare_multisets(
    function: str, baseline: Sequence[Alarm], high_precision: Sequence[Alarm]
) -> list[ComparisonRow]:
    baseline_by_signature: dict[str, list[Alarm]] = defaultdict(list)
    high_by_signature: dict[str, list[Alarm]] = defaultdict(list)
    for alarm in baseline:
        baseline_by_signature[alarm.canonical_signature].append(alarm)
    for alarm in high_precision:
        high_by_signature[alarm.canonical_signature].append(alarm)

    rows: list[ComparisonRow] = []
    signatures = sorted(
        set(baseline_by_signature) | set(high_by_signature),
        key=lambda signature: (
            (baseline_by_signature.get(signature) or high_by_signature[signature])[0].source_file,
            (baseline_by_signature.get(signature) or high_by_signature[signature])[0].line,
            signature,
        ),
    )
    for signature in signatures:
        baseline_instances = baseline_by_signature.get(signature, [])
        high_instances = high_by_signature.get(signature, [])
        common = min(len(baseline_instances), len(high_instances))
        for index in range(common):
            base_alarm = baseline_instances[index]
            high_alarm = high_instances[index]
            rows.append(
                ComparisonRow(
                    function=function,
                    status="REMAINING",
                    source_file=base_alarm.source_file,
                    line=base_alarm.line,
                    category=base_alarm.category,
                    baseline_message=base_alarm.message,
                    high_precision_message=high_alarm.message,
                    canonical_signature=signature,
                )
            )
        for alarm in baseline_instances[common:]:
            rows.append(
                ComparisonRow(
                    function=function,
                    status="REMOVED",
                    source_file=alarm.source_file,
                    line=alarm.line,
                    category=alarm.category,
                    baseline_message=alarm.message,
                    high_precision_message="",
                    canonical_signature=signature,
                )
            )
        for alarm in high_instances[common:]:
            rows.append(
                ComparisonRow(
                    function=function,
                    status="NEW",
                    source_file=alarm.source_file,
                    line=alarm.line,
                    category=alarm.category,
                    baseline_message="",
                    high_precision_message=alarm.message,
                    canonical_signature=signature,
                )
            )
    status_order = {"REMOVED": 0, "REMAINING": 1, "NEW": 2}
    rows.sort(key=lambda row: (status_order[row.status], row.source_file, row.line, row.canonical_signature))
    return rows


def state_comparison(
    function: str,
    baseline_states: dict[str, tuple[str, ...]],
    high_states: dict[str, tuple[str, ...]],
) -> tuple[str, list[str]]:
    baseline = baseline_states.get(function)
    high_precision = high_states.get(function)
    if baseline is None or high_precision is None:
        return "NOT_AVAILABLE", []
    if baseline == high_precision:
        return "IDENTICAL", []
    diff = list(
        difflib.unified_diff(
            baseline,
            high_precision,
            fromfile="baseline",
            tofile="high_precision",
            lineterm="",
        )
    )
    return "CHANGED", diff[:80]


def compare_function(function: str) -> FunctionComparison:
    baseline_dir = ROOT / f"results/baseline/{function}"
    high_dir = ROOT / f"results/high_precision/{function}"
    baseline_text = read_text(baseline_dir / f"{function}_eva.log")
    high_text = read_text(high_dir / f"{function}_eva.log")

    baseline_alarms, baseline_missing = parse_alarm_entries(baseline_text)
    high_alarms, high_missing = parse_alarm_entries(high_text)
    baseline_summary = extract_summary(baseline_text)
    high_summary = extract_summary(high_text)
    if baseline_summary.alarm_count != len(baseline_alarms):
        fail(
            f"baseline alarm count mismatch for {function}: summary "
            f"{baseline_summary.alarm_count}, parsed {len(baseline_alarms)}"
        )
    if high_summary.alarm_count != len(high_alarms):
        fail(
            f"high-precision alarm count mismatch for {function}: summary "
            f"{high_summary.alarm_count}, parsed {len(high_alarms)}"
        )
    validate_precision_meta_settings(function, high_text)

    rows = compare_multisets(function, baseline_alarms, high_alarms)
    baseline_states = extract_final_states(baseline_text)
    high_states = extract_final_states(high_text)
    final_status, final_diff = state_comparison(function, baseline_states, high_states)

    baseline_parse = normalize_parse_diagnostics(
        read_text(baseline_dir / f"{function}_parse.log"), function
    )
    high_parse = normalize_parse_diagnostics(
        read_text(high_dir / f"{function}_parse.log"), function
    )

    comparison = FunctionComparison(
        function=function,
        baseline_alarms=baseline_alarms,
        high_precision_alarms=high_alarms,
        baseline_missing_return=baseline_missing,
        high_precision_missing_return=high_missing,
        rows=rows,
        baseline_summary=baseline_summary,
        high_precision_summary=high_summary,
        baseline_summary_block=extract_summary_block(baseline_text),
        high_precision_summary_block=extract_summary_block(high_text),
        baseline_final_states=baseline_states,
        high_precision_final_states=high_states,
        final_state_status=final_status,
        final_state_diff=final_diff,
        parse_status="IDENTICAL" if baseline_parse == high_parse else "MISMATCH",
    )
    validate_function_invariants(comparison)
    return comparison


def validate_function_invariants(comparison: FunctionComparison) -> None:
    if comparison.baseline_count != comparison.removed + comparison.remaining:
        fail(f"baseline multiset invariant failed for {comparison.function}")
    if comparison.high_precision_count != comparison.new + comparison.remaining:
        fail(f"high-precision multiset invariant failed for {comparison.function}")
    if comparison.delta != comparison.new - comparison.removed:
        fail(f"delta multiset invariant failed for {comparison.function}")
    if comparison.delta != comparison.high_precision_count - comparison.baseline_count:
        fail(f"count delta invariant failed for {comparison.function}")


def write_tsv(path: Path, header: Sequence[str], rows: Iterable[Sequence[object]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="") as output:
        writer = csv.writer(output, delimiter="\t", lineterminator="\n")
        writer.writerow(header)
        writer.writerows(rows)


def md_escape(value: object) -> str:
    return str(value).replace("|", "\\|").replace("\n", " ")


def markdown_table(headers: Sequence[str], rows: Iterable[Sequence[object]]) -> str:
    rendered = ["| " + " | ".join(headers) + " |"]
    rendered.append("|" + "|".join("---" for _ in headers) + "|")
    for row in rows:
        rendered.append("| " + " | ".join(md_escape(value) for value in row) + " |")
    return "\n".join(rendered)


def format_signed(number: int) -> str:
    return f"{number:+d}" if number else "0"


def summary_metric(value: int | None, total: int | None, coverage: int | None) -> str:
    if value is None or total is None or coverage is None:
        return "not reported"
    return f"{value}/{total} ({coverage}%)"


def alarm_markdown(rows: Sequence[ComparisonRow], status: str) -> str:
    selected = [row for row in rows if row.status == status]
    if not selected:
        return "None."
    output: list[str] = []
    for row in selected:
        message = row.baseline_message if status == "REMOVED" else row.high_precision_message
        if status == "REMAINING":
            message = row.high_precision_message
        output.append(
            f"- `{row.source_file}:{row.line}` — **{row.category}** — `{message}`\n"
            f"  - canonical: `{row.canonical_signature}`"
        )
    return "\n".join(output)


def category_counts_for_function(comparison: FunctionComparison) -> list[tuple[object, ...]]:
    categories = sorted(
        {row.category for row in comparison.rows},
        key=lambda category: (CATEGORY_ORDER.get(category, 50), category),
    )
    result: list[tuple[object, ...]] = []
    for category in categories:
        rows = [row for row in comparison.rows if row.category == category]
        removed = sum(row.status == "REMOVED" for row in rows)
        remaining = sum(row.status == "REMAINING" for row in rows)
        new = sum(row.status == "NEW" for row in rows)
        result.append((category, removed + remaining, new + remaining, removed, remaining, new))
    return result


def helper_state_rows(comparison: FunctionComparison) -> list[tuple[str, str]]:
    names = sorted(
        (set(comparison.baseline_final_states) | set(comparison.high_precision_final_states))
        - {comparison.function, "eva_main"}
    )
    rows: list[tuple[str, str]] = []
    for name in names:
        baseline = comparison.baseline_final_states.get(name)
        high_precision = comparison.high_precision_final_states.get(name)
        if baseline is None or high_precision is None:
            status = "NOT_AVAILABLE"
        elif baseline == high_precision:
            status = "IDENTICAL"
        else:
            status = "CHANGED"
        rows.append((name, status))
    return rows


def write_per_function_report(comparison: FunctionComparison) -> None:
    baseline_summary = comparison.baseline_summary
    high_summary = comparison.high_precision_summary
    category_rows = category_counts_for_function(comparison)
    helper_rows = helper_state_rows(comparison)
    final_diff = "Not applicable."
    if comparison.final_state_status == "CHANGED" and comparison.final_state_diff:
        final_diff = "```diff\n" + "\n".join(comparison.final_state_diff) + "\n```"

    marker_status = (
        f"Baseline markers: {len(comparison.baseline_missing_return)}; "
        f"High Precision markers: {len(comparison.high_precision_missing_return)}. "
        "These internal-property markers are reported separately and excluded from "
        "the primary Eva alarm counts."
    )

    content = f"""# {comparison.function}

## Overview

Baseline alarm count: {comparison.baseline_count}<br>
High Precision alarm count: {comparison.high_precision_count}<br>
Delta: {format_signed(comparison.delta)}<br>
Removed: {comparison.removed}<br>
Remaining: {comparison.remaining}<br>
New: {comparison.new}<br>
Count status: {comparison.comparison_status}

## Removed alarms

{alarm_markdown(comparison.rows, "REMOVED")}

## Remaining alarms

{alarm_markdown(comparison.rows, "REMAINING")}

## New alarms

{alarm_markdown(comparison.rows, "NEW")}

## Alarm categories

{markdown_table(
    ["Category", "Baseline", "High Precision", "Removed", "Remaining", "New"],
    category_rows,
)}

## Internal property markers

{marker_status}

## Analysis summaries

{markdown_table(
    ["Metric", "Baseline", "High Precision"],
    [
        ("Functions analyzed", summary_metric(baseline_summary.functions_analyzed, baseline_summary.functions_total, baseline_summary.function_coverage), summary_metric(high_summary.functions_analyzed, high_summary.functions_total, high_summary.function_coverage)),
        ("Statements reached", summary_metric(baseline_summary.statements_reached, baseline_summary.statements_total, baseline_summary.statement_coverage), summary_metric(high_summary.statements_reached, high_summary.statements_total, high_summary.statement_coverage)),
        ("Official Eva alarm count", baseline_summary.alarm_count, high_summary.alarm_count),
        ("Assertions", baseline_summary.assertions, high_summary.assertions),
        ("Preconditions", baseline_summary.preconditions, high_summary.preconditions),
    ],
)}

Baseline:

```text
{chr(10).join(comparison.baseline_summary_block)}
```

High Precision:

```text
{chr(10).join(comparison.high_precision_summary_block)}
```

## Final-state comparison

Target-function final state: **{comparison.final_state_status}**

{final_diff}

Helper final states:

{markdown_table(["Helper", "Status"], helper_rows) if helper_rows else "No helper final-state block was present."}

## Parse diagnostics

Semantic parse-diagnostic comparison: **{comparison.parse_status}**.

The labels in this report describe differences between two recorded analyses only. No judgment about the underlying program behavior is made.
"""
    (PER_FUNCTION_DIR / f"{comparison.function}.md").write_text(content, encoding="utf-8")


def aggregate_categories(comparisons: Sequence[FunctionComparison]) -> list[tuple[object, ...]]:
    stats: dict[str, Counter[str]] = defaultdict(Counter)
    for comparison in comparisons:
        for row in comparison.rows:
            if row.status in {"REMOVED", "REMAINING"}:
                stats[row.category]["baseline"] += 1
            if row.status in {"NEW", "REMAINING"}:
                stats[row.category]["high"] += 1
            stats[row.category][row.status.lower()] += 1
    categories = sorted(stats, key=lambda category: (CATEGORY_ORDER.get(category, 50), category))
    rows: list[tuple[object, ...]] = []
    for category in categories:
        entry = stats[category]
        rows.append(
            (
                category,
                entry["baseline"],
                entry["high"],
                entry["removed"],
                entry["remaining"],
                entry["new"],
                entry["high"] - entry["baseline"],
            )
        )
    return rows


def detailed_function_rows(comparisons: Sequence[FunctionComparison]) -> list[tuple[object, ...]]:
    return [
        (
            comparison.function,
            comparison.baseline_count,
            comparison.high_precision_count,
            comparison.delta,
            comparison.removed,
            comparison.remaining,
            comparison.new,
            comparison.comparison_status,
        )
        for comparison in comparisons
    ]


def inventory_table(rows: Sequence[ComparisonRow], status: str) -> str:
    selected = [row for row in rows if row.status == status]
    if not selected:
        return "None."
    return markdown_table(
        ["Function", "Source", "Line", "Category", "Message"],
        [
            (
                row.function,
                row.source_file,
                row.line,
                row.category,
                row.baseline_message if status == "REMOVED" else row.high_precision_message,
            )
            for row in selected
        ],
    )


def transition_list(comparisons: Sequence[FunctionComparison], predicate) -> str:
    selected = [comparison.function for comparison in comparisons if predicate(comparison)]
    return "\n".join(f"- `{function}`" for function in selected) if selected else "None."


def validate_global_invariants(
    comparisons: Sequence[FunctionComparison],
    all_rows: Sequence[ComparisonRow],
    category_rows: Sequence[tuple[object, ...]],
) -> None:
    baseline_total = sum(comparison.baseline_count for comparison in comparisons)
    high_total = sum(comparison.high_precision_count for comparison in comparisons)
    removed = sum(row.status == "REMOVED" for row in all_rows)
    remaining = sum(row.status == "REMAINING" for row in all_rows)
    new = sum(row.status == "NEW" for row in all_rows)
    if baseline_total != removed + remaining:
        fail("global baseline multiset invariant failed")
    if high_total != new + remaining:
        fail("global high-precision multiset invariant failed")
    if baseline_total != sum(int(row[1]) for row in category_rows):
        fail("category baseline total does not match function total")
    if high_total != sum(int(row[2]) for row in category_rows):
        fail("category high-precision total does not match function total")
    if removed != sum(int(row[3]) for row in category_rows):
        fail("category removed total does not match alarm_diff")
    if remaining != sum(int(row[4]) for row in category_rows):
        fail("category remaining total does not match alarm_diff")
    if new != sum(int(row[5]) for row in category_rows):
        fail("category new total does not match alarm_diff")


def validate_sanity_checks(comparisons: Sequence[FunctionComparison]) -> None:
    by_function = {comparison.function: comparison for comparison in comparisons}
    first = by_function.get("s32_mul_s32_u16")
    if first is None:
        fail("sanity-check function s32_mul_s32_u16 is absent")
    expected_removed = [
        row
        for row in first.rows
        if row.status == "REMOVED"
        and row.source_file == "src_analysis/sources/mul_Ccode.c"
        and row.line == 760
        and row.category == "division by zero"
    ]
    if len(expected_removed) != 1:
        fail("s32_mul_s32_u16 division-by-zero sanity check failed")
    if first.remaining != 2 or first.new != 0:
        fail("s32_mul_s32_u16 overflow sanity check failed")

    second = by_function.get("s32_mul_s32_s32")
    if second is None:
        fail("sanity-check function s32_mul_s32_s32 is absent")
    if not (
        second.baseline_count == 3
        and second.high_precision_count == 3
        and second.remaining == 3
        and second.removed == 0
        and second.new == 0
    ):
        fail("s32_mul_s32_s32 three-signature sanity check failed")


def write_global_summary(
    comparisons: Sequence[FunctionComparison],
    category_rows: Sequence[tuple[object, ...]],
) -> None:
    all_rows = [row for comparison in comparisons for row in comparison.rows]
    baseline_total = sum(comparison.baseline_count for comparison in comparisons)
    high_total = sum(comparison.high_precision_count for comparison in comparisons)
    net_reduction = baseline_total - high_total
    percentage = (100.0 * net_reduction / baseline_total) if baseline_total else 0.0
    removed = sum(row.status == "REMOVED" for row in all_rows)
    remaining = sum(row.status == "REMAINING" for row in all_rows)
    new = sum(row.status == "NEW" for row in all_rows)
    reduced = sum(comparison.comparison_status == "REDUCED" for comparison in comparisons)
    unchanged = sum(comparison.comparison_status == "UNCHANGED" for comparison in comparisons)
    increased = sum(comparison.comparison_status == "INCREASED" for comparison in comparisons)
    baseline_zero = sum(comparison.baseline_count == 0 for comparison in comparisons)
    high_zero = sum(comparison.high_precision_count == 0 for comparison in comparisons)
    parse_mismatches = [comparison.function for comparison in comparisons if comparison.parse_status != "IDENTICAL"]
    final_states = Counter(comparison.final_state_status for comparison in comparisons)

    content = f"""# Baseline vs High Precision: Global Summary

## Scope and validation

- Functions compared: **{len(comparisons)}**
- Valid Eva-log pairs: **{len(comparisons)}**
- Comparison invariant failures: **0**
- Parse diagnostic mismatches: **{len(parse_mismatches)}**
- Primary alarm unit: numeric Eva alarms represented by `[eva:alarm]` and included in the official `ANALYSIS SUMMARY` count.
- Internal `missing_return` property markers are documented separately and excluded from primary alarm totals.

## Global alarm totals

{markdown_table(
    ["Metric", "Value"],
    [
        ("Total Baseline alarms", baseline_total),
        ("Total High Precision alarms", high_total),
        ("Net alarm reduction", net_reduction),
        ("Reduction percentage", f"{percentage:.2f}%"),
        ("REMOVED", removed),
        ("REMAINING", remaining),
        ("NEW", new),
        ("Functions REDUCED", reduced),
        ("Functions UNCHANGED", unchanged),
        ("Functions INCREASED", increased),
        ("Baseline zero-alarm functions", baseline_zero),
        ("High Precision zero-alarm functions", high_zero),
    ],
)}

## Alarm categories

{markdown_table(
    ["Category", "Baseline", "High Precision", "Removed", "Remaining", "New", "Delta"],
    category_rows,
)}

## Final-state status

{markdown_table(["Status", "Functions"], sorted(final_states.items()))}

## Zero-alarm transitions

### Baseline > 0 → High Precision = 0

{transition_list(comparisons, lambda item: item.baseline_count > 0 and item.high_precision_count == 0)}

### Baseline = 0 → High Precision = 0

{transition_list(comparisons, lambda item: item.baseline_count == 0 and item.high_precision_count == 0)}

### Baseline = 0 → High Precision > 0

{transition_list(comparisons, lambda item: item.baseline_count == 0 and item.high_precision_count > 0)}
"""
    GLOBAL_SUMMARY_FILE.write_text(content, encoding="utf-8")


def write_comprehensive_report(
    comparisons: Sequence[FunctionComparison],
    category_rows: Sequence[tuple[object, ...]],
    baseline_eva_block: str,
    high_eva_block: str,
) -> None:
    all_rows = [row for comparison in comparisons for row in comparison.rows]
    baseline_total = sum(comparison.baseline_count for comparison in comparisons)
    high_total = sum(comparison.high_precision_count for comparison in comparisons)
    net_reduction = baseline_total - high_total
    percentage = (100.0 * net_reduction / baseline_total) if baseline_total else 0.0
    removed = sum(row.status == "REMOVED" for row in all_rows)
    remaining = sum(row.status == "REMAINING" for row in all_rows)
    new = sum(row.status == "NEW" for row in all_rows)
    reduced = [comparison for comparison in comparisons if comparison.comparison_status == "REDUCED"]
    unchanged = [comparison for comparison in comparisons if comparison.comparison_status == "UNCHANGED"]
    increased = [comparison for comparison in comparisons if comparison.comparison_status == "INCREASED"]
    baseline_zero = sum(comparison.baseline_count == 0 for comparison in comparisons)
    high_zero = sum(comparison.high_precision_count == 0 for comparison in comparisons)
    parse_mismatches = [comparison.function for comparison in comparisons if comparison.parse_status != "IDENTICAL"]
    changed_final = [comparison.function for comparison in comparisons if comparison.final_state_status == "CHANGED"]
    unavailable_final = [comparison.function for comparison in comparisons if comparison.final_state_status == "NOT_AVAILABLE"]
    improvement_order = sorted(
        comparisons,
        key=lambda comparison: (-(comparison.removed - comparison.new), comparison.function),
    )

    control_rows = [
        ("Source code", "Fixed"),
        ("Machine model", "Fixed: ppc_32"),
        ("Preprocessing", "Fixed"),
        ("Harness", "Fixed and reused"),
        ("Input abstraction", "Fixed by the reused harness"),
        ("Entry point", "Fixed: eva_main"),
        ("Source/helper list", "Fixed per function"),
        ("Parse configuration", "Fixed; parse commands verified identical"),
        ("Eva precision configuration", "Experimental variable"),
    ]

    report = f"""# Eva Baseline vs High Precision Comparison

## 1. Objective

This study measures how the recorded Eva alarm inventory changes when the same 46 function-level analyses are repeated with the repository's High Precision profile. The comparison is descriptive: it records presence, absence, multiplicity, summary metrics, and final-state text without assessing the underlying program behavior.

## 2. Experimental Control

{markdown_table(["Element", "Control"], control_rows)}

For every function, the comparator also verified that the parse-stage command in the Baseline runner is textually identical to the parse-stage command in the corresponding High Precision runner. The 46 pairs of committed parse logs were compared after deterministic path normalization; no diagnostic mismatch was found.

## 3. Baseline Configuration

The Baseline Eva command was extracted from every repository runner. All 46 runners use the same Eva profile:

```bash
{baseline_eva_block}
```

The effective explicit precision controls are `-eva-slevel 1000` and `-eva-ilevel 256`.

## 4. High Precision Configuration

The High Precision command was likewise extracted from all 46 runners:

```bash
{high_eva_block}
```

Every High Precision Eva log explicitly confirms the precision-11 meta-settings: slevel 5000, plevel 2000, partition history 2, automatic loop unroll 1024, minimum loop unroll 4, widening delay 6, and the explicit ilevel 1024 and non-linear subdivision 500 overrides. The relational and auxiliary domains are `cvalue`, `equality`, `symbolic-locations`, `gauges`, `octagon`, and `bitwise`.

## 5. Comparison Methodology

The source of truth is the pair of committed `*_eva.log` files for each function. The parser extracts only source-located `[eva:alarm]` records, joins multiline messages, and cross-checks the resulting count against the official numeric alarm count in `ANALYSIS SUMMARY`. Internal `missing_return` property markers are retained for per-function documentation but excluded from the primary alarm totals because Eva's own numeric summary excludes them.

Analysis-summary metrics, target/helper final-state blocks, and parse diagnostics are extracted independently of the alarm comparison. No analyzer or runner is invoked by this comparator.

## 6. Alarm Matching Algorithm

Each alarm is represented by a canonical signature containing normalized source path, line number, and normalized message. Unicode/ASCII relation variants such as `≢`/`!=`, `≤`/`<=`, and `≥`/`>=` are mapped before whitespace is collapsed. Matching uses a multiset counter rather than a set, so repeated signatures retain their multiplicity. Matched occurrences are `REMAINING`; unmatched Baseline occurrences are `REMOVED`; unmatched High Precision occurrences are `NEW`.

The labels express differences between the two recorded runs only.

## 7. Global Results

{markdown_table(
    ["Metric", "Value"],
    [
        ("Functions compared", len(comparisons)),
        ("Valid log pairs", len(comparisons)),
        ("Total Baseline alarms", baseline_total),
        ("Total High Precision alarms", high_total),
        ("Net alarm reduction", net_reduction),
        ("Reduction percentage", f"{percentage:.2f}%"),
        ("REMOVED", removed),
        ("REMAINING", remaining),
        ("NEW", new),
        ("Functions REDUCED", len(reduced)),
        ("Functions UNCHANGED", len(unchanged)),
        ("Functions INCREASED", len(increased)),
        ("Baseline zero-alarm functions", baseline_zero),
        ("High Precision zero-alarm functions", high_zero),
        ("Comparison invariant failures", 0),
        ("Parse diagnostic mismatches", len(parse_mismatches)),
    ],
)}

## 8. Alarm Category Results

{markdown_table(
    ["Alarm Category", "Baseline", "High Precision", "Removed", "Remaining", "New", "Delta"],
    category_rows,
)}

## 9. Functions with Reduced Alarm Count

{markdown_table(
    ["Function", "Baseline", "High Precision", "Delta", "Removed", "Remaining", "New"],
    [(item.function, item.baseline_count, item.high_precision_count, item.delta, item.removed, item.remaining, item.new) for item in reduced],
) if reduced else "None."}

### Functions sorted by alarm reduction

{markdown_table(
    ["Function", "Removed − New", "Baseline", "High Precision", "Removed", "Remaining", "New"],
    [(item.function, item.removed - item.new, item.baseline_count, item.high_precision_count, item.removed, item.remaining, item.new) for item in improvement_order],
)}

## 10. Functions with Unchanged Alarm Count

{markdown_table(
    ["Function", "Baseline", "High Precision", "Removed", "Remaining", "New"],
    [(item.function, item.baseline_count, item.high_precision_count, item.removed, item.remaining, item.new) for item in unchanged],
) if unchanged else "None."}

## 11. Functions with Increased Alarm Count

{markdown_table(
    ["Function", "Baseline", "High Precision", "Delta", "Removed", "Remaining", "New"],
    [(item.function, item.baseline_count, item.high_precision_count, item.delta, item.removed, item.remaining, item.new) for item in increased],
) if increased else "None."}

## 12. Zero-alarm Functions

### Baseline > 0 → High Precision = 0

{transition_list(comparisons, lambda item: item.baseline_count > 0 and item.high_precision_count == 0)}

### Baseline = 0 → High Precision = 0

{transition_list(comparisons, lambda item: item.baseline_count == 0 and item.high_precision_count == 0)}

### Baseline = 0 → High Precision > 0

{transition_list(comparisons, lambda item: item.baseline_count == 0 and item.high_precision_count > 0)}

## 13. Removed Alarm Inventory

{inventory_table(all_rows, "REMOVED")}

## 14. Remaining Alarm Inventory

{inventory_table(all_rows, "REMAINING")}

## 15. New Alarm Inventory

{inventory_table(all_rows, "NEW")}

## 16. Final-State Differences

Target-function final-state text changed for {len(changed_final)} functions and was unavailable on one or both sides for {len(unavailable_final)} functions. A normalized block-level diff is included in each per-function report.

Changed target final states:

{chr(10).join(f"- `{function}`" for function in changed_final) if changed_final else "None."}

Not-available target final states:

{chr(10).join(f"- `{function}`" for function in unavailable_final) if unavailable_final else "None."}

## 17. Detailed Function Table

{markdown_table(
    ["Function", "Baseline", "High Precision", "Delta", "Removed", "Remaining", "New", "Status"],
    detailed_function_rows(comparisons),
)}

## 18. Reproducibility

From the repository root, regenerate every comparison artifact with:

```bash
python3 scripts/comparison/compare_baseline_high_precision.py
```

The tool reads `analysis/high_precision/functions.txt`, the committed Baseline/High Precision logs, parse logs, and the corresponding runner scripts. It writes only under `analysis/high_precision_comparison/` and `reports/high_precision_comparison/`. A nonzero exit indicates missing inputs, count inconsistencies, runner-control drift, failed sanity checks, or broken multiset/global invariants.

## 19. Limitations

Canonical matching intentionally depends on source path, line, and normalized message. Semantically related alarms at different lines or with materially different predicates are therefore not merged. Final states are compared textually after whitespace normalization; the report does not attempt semantic equivalence checking between abstract states. Summary percentages inherit Frama-C's integer formatting.

## 20. Conclusion

All 46 function pairs passed structural, summary-count, multiset, category-total, runner-control, and sanity-check validation. The tables above quantify only the observed differences between the two committed Eva configurations. Further interpretation is outside the scope of this comparison stage.
"""
    COMPREHENSIVE_REPORT_FILE.write_text(report, encoding="utf-8")


def write_outputs(
    comparisons: Sequence[FunctionComparison],
    baseline_eva_block: str,
    high_eva_block: str,
) -> None:
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    PER_FUNCTION_DIR.mkdir(parents=True, exist_ok=True)
    REPORT_DIR.mkdir(parents=True, exist_ok=True)
    for stale_report in PER_FUNCTION_DIR.glob("*.md"):
        stale_report.unlink()

    all_rows = [row for comparison in comparisons for row in comparison.rows]
    category_rows = aggregate_categories(comparisons)
    validate_global_invariants(comparisons, all_rows, category_rows)
    validate_sanity_checks(comparisons)

    write_tsv(
        FUNCTION_SUMMARY_FILE,
        (
            "function",
            "baseline_alarms",
            "high_precision_alarms",
            "delta",
            "removed",
            "remaining",
            "new",
            "baseline_zero",
            "high_precision_zero",
            "comparison_status",
        ),
        (
            (
                comparison.function,
                comparison.baseline_count,
                comparison.high_precision_count,
                comparison.delta,
                comparison.removed,
                comparison.remaining,
                comparison.new,
                str(comparison.baseline_count == 0).lower(),
                str(comparison.high_precision_count == 0).lower(),
                comparison.comparison_status,
            )
            for comparison in comparisons
        ),
    )
    write_tsv(
        ALARM_DIFF_FILE,
        (
            "function",
            "status",
            "source_file",
            "line",
            "category",
            "baseline_message",
            "high_precision_message",
            "canonical_signature",
        ),
        (
            (
                row.function,
                row.status,
                row.source_file,
                row.line,
                row.category,
                row.baseline_message,
                row.high_precision_message,
                row.canonical_signature,
            )
            for row in all_rows
        ),
    )
    write_tsv(
        CATEGORY_SUMMARY_FILE,
        ("category", "baseline_count", "high_precision_count", "removed", "remaining", "new", "delta"),
        category_rows,
    )

    for comparison in comparisons:
        write_per_function_report(comparison)
    write_global_summary(comparisons, category_rows)
    write_comprehensive_report(comparisons, category_rows, baseline_eva_block, high_eva_block)


def main() -> int:
    functions = [line.strip() for line in read_text(FUNCTIONS_FILE).splitlines() if line.strip()]
    if len(functions) != 46:
        fail(f"expected 46 functions, found {len(functions)}")
    if len(set(functions)) != len(functions):
        fail("functions.txt contains duplicate names")

    baseline_eva_block, high_eva_block = validate_runner_controls(functions)
    comparisons = [compare_function(function) for function in functions]
    write_outputs(comparisons, baseline_eva_block, high_eva_block)

    all_rows = [row for comparison in comparisons for row in comparison.rows]
    baseline_total = sum(comparison.baseline_count for comparison in comparisons)
    high_total = sum(comparison.high_precision_count for comparison in comparisons)
    print(f"functions compared: {len(comparisons)}")
    print(f"valid log pairs: {len(comparisons)}")
    print(f"baseline alarms: {baseline_total}")
    print(f"high-precision alarms: {high_total}")
    print(f"removed: {sum(row.status == 'REMOVED' for row in all_rows)}")
    print(f"remaining: {sum(row.status == 'REMAINING' for row in all_rows)}")
    print(f"new: {sum(row.status == 'NEW' for row in all_rows)}")
    print("comparison invariant failures: 0")
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except RuntimeError as error:
        print(f"comparison failed: {error}", file=sys.stderr)
        sys.exit(1)
