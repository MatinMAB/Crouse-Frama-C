#!/usr/bin/env python3
"""Generate the deterministic Phase-B Eva-alarm-to-predicate dataset.

This program is intentionally text-only.  It reads the frozen Eva inventories,
logs, source, and harness metadata.  It never invokes Frama-C, Clang, LLVM, or
KLEE and writes only below analysis/klee_phase_b and reports/klee_phase_b.
"""

from __future__ import annotations

import csv
import hashlib
import json
import re
import unicodedata
from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Sequence


ROOT = Path(__file__).resolve().parents[2]
PHASE_DIR = ROOT / "analysis/klee_phase_b"
DATA_DIR = PHASE_DIR / "data"
RAW_DIR = PHASE_DIR / "raw"
VALIDATION_DIR = PHASE_DIR / "validation"
REPORT_DIR = ROOT / "reports/klee_phase_b"

INPUT_ALARMS = ROOT / "reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv"
INPUT_COMPARISON = ROOT / "reports/eva_report_source_package/data/alarm_comparison.tsv"
INPUT_FUNCTIONS = ROOT / "reports/eva_report_source_package/data/functions.tsv"
INPUT_LOCATIONS = ROOT / "reports/eva_report_source_package/data/source_locations.tsv"

TARGETS_TSV = DATA_DIR / "klee_alarm_targets.tsv"
IDENTITY_TSV = DATA_DIR / "klee_alarm_identity.tsv"
PREDICATES_TSV = DATA_DIR / "klee_predicate_inventory.tsv"
TARGETS_JSON = DATA_DIR / "klee_alarm_targets.json"
STATS_TSV = DATA_DIR / "mapping_statistics.tsv"
POC_TSV = DATA_DIR / "poc_candidate_validation.tsv"
HASHES_FILE = DATA_DIR / "SHA256SUMS"
HUMAN_INVENTORY = REPORT_DIR / "KLEE_ALARM_TARGET_INVENTORY.md"

EXPECTED_CATEGORIES = {
    "integer overflow": 100,
    "division by zero": 16,
    "invalid shift": 33,
}

TYPE_INFO = {
    "s8": ("signed char", 8, "SIGNED"),
    "u8": ("unsigned char", 8, "UNSIGNED"),
    "s16": ("signed short", 16, "SIGNED"),
    "u16": ("unsigned short", 16, "UNSIGNED"),
    "s32": ("signed long", 32, "SIGNED"),
    "u32": ("unsigned long", 32, "UNSIGNED"),
    "int": ("signed int", 32, "SIGNED"),
    "signed int": ("signed int", 32, "SIGNED"),
    "unsigned int": ("unsigned int", 32, "UNSIGNED"),
    "long": ("signed long", 32, "SIGNED"),
    "signed long": ("signed long", 32, "SIGNED"),
    "unsigned long": ("unsigned long", 32, "UNSIGNED"),
}

TARGET_COLUMNS = [
    "klee_target_id",
    "frozen_row_index",
    "analysis_mode",
    "comparison_status",
    "eva_function",
    "eva_source_file",
    "eva_source_line",
    "eva_category",
    "eva_normalized_message",
    "eva_canonical_signature",
    "eva_occurrence_index",
    "containing_function",
    "target_scope",
    "source_expression",
    "source_statement",
    "operation_kind",
    "predicate_text",
    "predicate_normal_form",
    "violation_condition",
    "companion_signed_division_overflow",
    "operand_1_expression",
    "operand_1_declared_type",
    "operand_1_effective_type",
    "operand_1_width",
    "operand_1_signedness",
    "operand_2_expression",
    "operand_2_declared_type",
    "operand_2_effective_type",
    "operand_2_width",
    "operand_2_signedness",
    "result_effective_type",
    "result_width",
    "result_signedness",
    "input_parameters",
    "input_domains",
    "harness_path",
    "high_precision_log_path",
    "input_dependencies",
    "helper_dependencies",
    "helper_argument_mapping",
    "call_chain",
    "control_flow_guards",
    "control_flow_context_kind",
    "ppc32_relevant",
    "semantic_sensitivity",
    "layout_sensitive",
    "endianness_sensitive",
    "abi_sensitive",
    "recommended_future_check",
    "mapping_confidence",
    "mapping_status",
    "evidence_reference",
    "notes",
]

IDENTITY_COLUMNS = [
    "klee_target_id",
    "eva_function",
    "eva_source_file",
    "eva_source_line",
    "eva_category",
    "eva_canonical_signature",
    "eva_occurrence_index",
]

PREDICATE_COLUMNS = [
    "klee_target_id",
    "eva_function",
    "eva_category",
    "operation_kind",
    "source_expression",
    "predicate_text",
    "predicate_normal_form",
    "violation_condition",
    "companion_signed_division_overflow",
    "operand_1_effective_type",
    "operand_1_width",
    "operand_1_signedness",
    "operand_2_effective_type",
    "operand_2_width",
    "operand_2_signedness",
    "result_effective_type",
    "result_width",
    "result_signedness",
    "recommended_future_check",
    "mapping_confidence",
    "mapping_status",
]


def fail(message: str) -> None:
    raise RuntimeError(message)


def read_tsv(path: Path) -> list[dict[str, str]]:
    if not path.is_file():
        fail(f"missing required input: {path.relative_to(ROOT)}")
    with path.open(encoding="utf-8", newline="") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def write_tsv(path: Path, columns: Sequence[str], rows: Iterable[dict[str, object]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=columns, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        for row in rows:
            writer.writerow({column: row[column] for column in columns})


def normalize_text(value: str) -> str:
    table = str.maketrans({"≢": "!=", "≠": "!=", "≤": "<=", "≥": ">=", "−": "-", "–": "-", "—": "-", "\u00a0": " "})
    value = unicodedata.normalize("NFKC", value).translate(table)
    return re.sub(r"\s+", " ", value).strip()


def collapse_source(value: str) -> str:
    return re.sub(r"\s+", " ", value.strip())


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def split_parameters(signature: str) -> list[tuple[str, str]]:
    match = re.search(r"\((.*)\)", signature)
    if not match:
        fail(f"cannot parse signature: {signature}")
    result: list[tuple[str, str]] = []
    for parameter in match.group(1).split(","):
        clean = re.sub(r"\bregister\b", "", parameter).strip()
        pieces = clean.split()
        if len(pieces) < 2:
            fail(f"cannot parse parameter in signature: {signature}")
        result.append((pieces[-1], " ".join(pieces[:-1])))
    return result


def function_body(source: Path, definition_line: int) -> list[str]:
    lines = source.read_text(encoding="utf-8", errors="replace").splitlines()
    start = definition_line - 1
    depth = 0
    started = False
    body: list[str] = []
    for line in lines[start:]:
        body.append(line)
        code = re.sub(r"//.*", "", line)
        if "{" in code:
            started = True
        if started:
            depth += code.count("{") - code.count("}")
            if depth == 0:
                break
    return body


def parse_local_types(lines: Sequence[str]) -> dict[str, str]:
    symbols: dict[str, str] = {}
    declaration_re = re.compile(r"^\s*(?:register\s+)?(s8|u8|s16|u16|s32|u32|int|signed int|unsigned int|signed long|unsigned long)\s+([^;]+);\s*(?://.*)?$")
    for raw in lines:
        line = re.sub(r"/\*.*?\*/", "", raw)
        match = declaration_re.match(line)
        if not match:
            continue
        declared_type, declarations = match.groups()
        for declaration in declarations.split(","):
            name_part = declaration.split("=", 1)[0].strip()
            name_match = re.search(r"([A-Za-z_]\w*)$", name_part)
            if name_match:
                symbols[name_match.group(1)] = declared_type
    return symbols


def build_symbol_tables(function_rows: dict[str, dict[str, str]]) -> dict[str, dict[str, str]]:
    tables: dict[str, dict[str, str]] = {}
    for function, row in function_rows.items():
        symbols = {name: typ for name, typ in split_parameters(row["signature"])}
        body = function_body(ROOT / row["definition_file"], int(row["definition_line"]))
        symbols.update(parse_local_types(body))
        tables[function] = symbols
    tables["MulHighWord"] = {
        "arg1": "u32", "arg2": "u32",
        "arg1_LW": "u16", "arg1_HW": "u16",
        "arg2_LW": "u16", "arg2_HW": "u16",
        "MulTemp1": "u32", "MulTemp2": "u32", "MulTemp3": "u32", "MulTemp4": "u32",
        "HIGHWORD": "u32", "OverFlow": "u32",
    }
    return tables


def strip_balanced_outer_parentheses(expression: str) -> str:
    expression = expression.strip()
    changed = True
    while changed and expression.startswith("(") and expression.endswith(")"):
        changed = False
        depth = 0
        for index, char in enumerate(expression):
            if char == "(":
                depth += 1
            elif char == ")":
                depth -= 1
                if depth == 0:
                    if index == len(expression) - 1:
                        expression = expression[1:-1].strip()
                        changed = True
                    break
    return expression


def strip_casts(expression: str) -> str:
    expression = expression.strip()
    cast_re = re.compile(r"^\((s8|u8|s16|u16|s32|u32|int|signed int|unsigned int|signed long|unsigned long)\)\s*")
    while True:
        match = cast_re.match(expression)
        if not match:
            break
        expression = expression[match.end():].strip()
        expression = strip_balanced_outer_parentheses(expression)
    return strip_balanced_outer_parentheses(expression)


def top_level_split(expression: str, operator: str) -> tuple[str, str] | None:
    depth = 0
    index = 0
    while index <= len(expression) - len(operator):
        char = expression[index]
        if char == "(":
            depth += 1
        elif char == ")":
            depth -= 1
        elif depth == 0 and expression.startswith(operator, index):
            if operator == "-" and index == 0:
                index += 1
                continue
            return expression[:index].strip(), expression[index + len(operator):].strip()
        index += 1
    return None


def find_operation(expression: str) -> tuple[str, str, str]:
    candidate = expression.strip()
    for _ in range(4):
        for operator, kind in (("<<", "SIGNED_LEFT_SHIFT"), ("+", "SIGNED_ADD"), ("-", "SIGNED_SUB"), ("*", "SIGNED_MUL"), ("/", "SIGNED_DIV")):
            split = top_level_split(candidate, operator)
            if split:
                return kind, split[0], split[1]
        if candidate.startswith("-"):
            return "SIGNED_NEG", candidate[1:].strip(), "NOT_APPLICABLE"
        stripped = strip_casts(candidate)
        if stripped == candidate:
            break
        candidate = stripped
    fail(f"cannot identify signed operation: {expression}")


def assertion_body(message: str) -> str:
    match = re.search(r"\bassert\s+(.+?);?$", normalize_text(message))
    if not match:
        fail(f"assertion body missing: {message}")
    return match.group(1).rstrip(";").strip()


def type_label(type_name: str) -> str:
    base, width, signedness = TYPE_INFO[type_name]
    return f"{base} ({type_name}, {width}-bit {signedness.lower()} under ppc_32)"


def leading_cast(expression: str) -> str | None:
    match = re.match(r"^\((s8|u8|s16|u16|s32|u32|int|signed int|unsigned int|signed long|unsigned long)\)", expression.strip())
    return match.group(1) if match else None


def underlying_symbol(expression: str) -> str | None:
    clean = strip_casts(expression)
    clean = strip_balanced_outer_parentheses(clean)
    return clean if re.fullmatch(r"[A-Za-z_]\w*", clean) else None


def declared_type(expression: str, symbols: dict[str, str]) -> str:
    symbol = underlying_symbol(expression)
    if symbol and symbol in symbols:
        cast = leading_cast(expression)
        if cast and cast != symbols[symbol]:
            return f"{symbols[symbol]} (source object; explicit cast to {cast})"
        return symbols[symbol]
    clean = strip_balanced_outer_parentheses(expression.strip())
    if re.fullmatch(r"(?:0[xX][0-9A-Fa-f]+|\d+)[uU]?[lL]?", clean):
        return "integer literal"
    if clean == "NOT_APPLICABLE":
        return "NOT_APPLICABLE"
    return "NOT_APPLICABLE_COMPOSITE_EXPRESSION"


def effective_from_expression(expression: str, symbols: dict[str, str], *, promote: bool = True) -> tuple[str, int, str]:
    cast = leading_cast(expression)
    if cast:
        base, width, sign = TYPE_INFO[cast]
        return type_label(cast), width, sign
    symbol = underlying_symbol(expression)
    if symbol and symbol in symbols:
        typ = symbols[symbol]
        if promote and typ in {"s8", "u8", "s16", "u16"}:
            return type_label("int"), 32, "SIGNED"
        base, width, sign = TYPE_INFO[typ]
        return type_label(typ), width, sign
    clean = strip_balanced_outer_parentheses(expression.strip())
    if clean == "NOT_APPLICABLE":
        return "NOT_APPLICABLE", 0, "NOT_APPLICABLE"
    if re.fullmatch(r"(?:0[xX][0-9A-Fa-f]+|\d+)[uU]?[lL]?", clean):
        if re.search(r"[uU]", clean):
            return type_label("unsigned int"), 32, "UNSIGNED"
        return type_label("int"), 32, "SIGNED"
    return "DERIVED_COMPOSITE_32_BIT_EXPRESSION", 32, "SIGNED"


def source_line(path: str, line: int) -> str:
    lines = (ROOT / path).read_text(encoding="utf-8", errors="replace").splitlines()
    if line < 1 or line > len(lines):
        fail(f"source line out of range: {path}:{line}")
    return collapse_source(lines[line - 1])


def invalid_rhs_operation(statement: str, count_expression: str) -> tuple[str, str, str]:
    compact = statement.replace(" ", "")
    count_compact = strip_casts(count_expression).replace(" ", "")
    candidates = re.findall(r"([A-Za-z_]\w*)\s*(<<|>>)\s*(\([^;]+?\)|[A-Za-z_]\w*)", statement)
    for lhs, operator, rhs in candidates:
        rhs_compact = rhs.replace(" ", "")
        if count_compact.strip("()") == rhs_compact.strip("()"):
            kind = "LEFT_SHIFT" if operator == "<<" else "RIGHT_SHIFT"
            return kind, lhs, rhs
    if ">>" in compact:
        match = re.search(r"([A-Za-z_]\w*)\s*>>\s*(\([^;]+\)|[A-Za-z_]\w*)", statement)
        if match:
            return "RIGHT_SHIFT", match.group(1), match.group(2)
    if "<<" in compact:
        match = re.search(r"([A-Za-z_]\w*)\s*<<\s*(\([^;]+\)|[A-Za-z_]\w*)", statement)
        if match:
            return "LEFT_SHIFT", match.group(1), match.group(2)
    fail(f"cannot identify invalid-RHS shift in: {statement}")


def shift_count_from_statement(statement: str) -> str:
    matches = re.findall(r"<<\s*(\([^;]+?\)|[A-Za-z_]\w*|\d+)", statement)
    if not matches:
        fail(f"left-shift count missing in: {statement}")
    return matches[-1].strip()


def division_expressions(statement: str) -> list[tuple[str, str, str]]:
    """Return simple source-order division subexpressions from one C statement."""
    expressions: list[tuple[str, str, str]] = []
    for match in re.finditer(r"/", statement):
        position = match.start()
        # There are no comments on the mapped division lines.  Reject comment
        # delimiters defensively rather than treating them as operators.
        if position + 1 < len(statement) and statement[position + 1] in {"/", "*"}:
            continue
        right_match = re.match(r"\s*([A-Za-z_]\w*)", statement[position + 1:])
        if not right_match:
            continue
        denominator = right_match.group(1)
        cursor = position - 1
        while cursor >= 0 and statement[cursor].isspace():
            cursor -= 1
        if cursor >= 0 and statement[cursor] == ")":
            depth = 1
            cursor -= 1
            while cursor >= 0 and depth:
                if statement[cursor] == ")":
                    depth += 1
                elif statement[cursor] == "(":
                    depth -= 1
                cursor -= 1
            start = cursor + 1
            numerator = statement[start:position].strip()
        else:
            end = cursor + 1
            while cursor >= 0 and (statement[cursor].isalnum() or statement[cursor] == "_"):
                cursor -= 1
            numerator = statement[cursor + 1:end].strip()
        if numerator:
            expressions.append((f"{numerator} / {denominator}", numerator, denominator))
    return expressions


def helper_argument_mapping(function_row: dict[str, str]) -> str:
    body = function_body(ROOT / function_row["definition_file"], int(function_row["definition_line"]))
    for raw in body:
        code = raw.split("//", 1)[0]
        match = re.search(r"\bMulHighWord\s*\(\s*([^,]+?)\s*,\s*([^\)]+?)\s*\)", code)
        if match:
            return f"MulHighWord.arg1 <- {collapse_source(match.group(1))}; MulHighWord.arg2 <- {collapse_source(match.group(2))}"
    return "NOT_APPLICABLE"


def signed_result_type(expression: str, statement: str) -> tuple[str, int, str]:
    # A nested `(int)` does not determine the type of an enclosing operation.
    # The relevant promoted-int operations in this dataset begin with the cast
    # (narrow operands promoted to int), or are rotateRight's literal shift.
    if expression.strip().startswith("(int)") or "1 << INT_BITS" in expression:
        return type_label("int"), 32, "SIGNED"
    return type_label("s32"), 32, "SIGNED"


def signed_predicate(kind: str, bound: str, lhs: str, rhs: str) -> tuple[str, str]:
    if kind == "SIGNED_NEG":
        return f"{lhs} != INT32_MIN", f"SIGNED_NEG_VALID(32,{lhs})"
    if kind == "SIGNED_DIV":
        return f"!({lhs} == INT32_MIN && {rhs} == -1)", f"SIGNED_DIV_REPRESENTABLE(32,{lhs},{rhs})"
    operation_name = {
        "SIGNED_ADD": "ADD",
        "SIGNED_SUB": "SUB",
        "SIGNED_MUL": "MUL",
        "SIGNED_LEFT_SHIFT": "LEFT_SHIFT_RESULT",
    }[kind]
    math_expr = {
        "SIGNED_ADD": f"MATHEMATICAL({lhs}) + MATHEMATICAL({rhs})",
        "SIGNED_SUB": f"MATHEMATICAL({lhs}) - MATHEMATICAL({rhs})",
        "SIGNED_MUL": f"MATHEMATICAL({lhs}) * MATHEMATICAL({rhs})",
        "SIGNED_LEFT_SHIFT": f"MATHEMATICAL_LEFT_SHIFT({lhs},{rhs})",
    }[kind]
    if bound == "LOWER":
        return f"INT32_MIN <= {math_expr}", f"SIGNED_{operation_name}_LOWER_BOUND(32,{lhs},{rhs})"
    return f"{math_expr} <= INT32_MAX", f"SIGNED_{operation_name}_UPPER_BOUND(32,{lhs},{rhs})"


def guard_for(function: str, line: int, source_file: str) -> tuple[str, str]:
    if source_file.endswith("MulHword.c"):
        return "NO_DIRECT_GUARD_IN_HELPER; caller magnitude/sign preparation precedes call", "NO_DIRECT_SOURCE_GUARD"
    root_neg = {
        5071: "value < 0", 5147: "value < 0", 5223: "value < 0", 5534: "value < 0",
        5364: "factor < 0", 1993: "val1 < 0", 2223: "value < 0", 2232: "factor < 0",
        2454: "value < 0", 2463: "factor < 0", 2600: "value < 0", 2672: "val1 < 0",
        2681: "val2 < 0", 1762: "val2 < 0",
    }
    if line in root_neg:
        return root_neg[line], "DIRECT_SOURCE_GUARDS"
    if function.startswith("root_"):
        return "NONE_BEFORE_SHIFT_COUNT_OPERATION", "NO_DIRECT_SOURCE_GUARD"
    if function == "rotateRight":
        return "rotation %= INT_BITS; while (rotation--)", "DIRECT_SOURCE_GUARDS"
    if function == "s16_div_s32_s16":
        if 274 <= line <= 276:
            return "denominator != 0; numerator != 0x80000000", "DIRECT_SOURCE_GUARDS"
        return "denominator != 0; numerator == 0x80000000; denominator != -1", "DIRECT_SOURCE_GUARDS"
    if function == "s16_fac05_div_s16_s16":
        if line == 173:
            return "NONE_BEFORE_OPERATION", "NO_DIRECT_SOURCE_GUARD"
        return "denominator != 0; s32Temp1 != 0x80000000", "DIRECT_SOURCE_GUARDS"
    if function == "s16_fac05_div_s16_u16":
        if line == 348:
            return "NONE_BEFORE_OPERATION", "NO_DIRECT_SOURCE_GUARD"
        return "u16Temp1 != 0", "DIRECT_SOURCE_GUARDS"
    if function.startswith("s16_hip1_"):
        return "NONE_BEFORE_OPERATION", "NO_DIRECT_SOURCE_GUARD"
    if function in {"s16_mul_s16_s16_div_s16", "s16_mul_s16_s16_div_u16", "s16_mul_s16_u16_div_s16", "s16_mul_u16_s16_div_u16", "u16_mul_s16_u16_div_s16", "u16_mul_s16_u16_div_u16"}:
        divisor = "div" if function == "s16_mul_s16_s16_div_s16" else "denominator"
        return f"{divisor} != 0", "DIRECT_SOURCE_GUARDS"
    if function == "u16_div_s32_u16":
        return "(y_value & 0xFFFF) != 0 after y_value mask", "DIRECT_SOURCE_GUARDS"
    if function == "u32_div_s32_s32":
        if line == 1168:
            return "denominator != 0; numerator > 0; denominator > 0", "DIRECT_SOURCE_GUARDS"
        if line in {1182, 1183, 1184}:
            return "denominator != 0; numerator < 0; denominator <= 0 (therefore denominator < 0)", "DIRECT_SOURCE_GUARDS"
    if function == "s32_div_s32_s32":
        if line in {1394, 1395}:
            return "numerator < 0; denominator < 0", "DIRECT_SOURCE_GUARDS"
        if line in {1410, 1413}:
            return "numerator < 0; denominator > 0", "DIRECT_SOURCE_GUARDS"
        if line in {1426, 1429}:
            return "numerator >= 0; denominator < 0", "DIRECT_SOURCE_GUARDS"
        return "numerator >= 0; denominator > 0", "DIRECT_SOURCE_GUARDS"
    if function == "s32_div_s32_u32":
        return "denominator != 0; numerator <= 0", "DIRECT_SOURCE_GUARDS"
    if function == "s32_div_u32_s32":
        return "denominator < 0", "DIRECT_SOURCE_GUARDS"
    if function == "s16_div_s32_u32":
        return "denominator != 0; numerator < 0", "DIRECT_SOURCE_GUARDS"
    if function == "s32_mul_s32_u16":
        if line == 767:
            return "factor != 0; value < 0; s32Temp2 / s32Factor < value", "DIRECT_SOURCE_GUARDS"
        return "factor != 0; value >= 0; 0x7FFFFFFFU / factor > value", "DIRECT_SOURCE_GUARDS"
    if function == "u16_mmv_u16_u16_s16_fac1":
        return "s32mmv <= 0; s32mmv < 0", "DIRECT_SOURCE_GUARDS"
    return "NONE_BEFORE_OPERATION", "NO_DIRECT_SOURCE_GUARD"


def division_companion(function: str, line: int, category: str, operation_kind: str) -> str:
    if operation_kind == "SIGNED_DIV" and category == "integer overflow":
        return "THIS_TARGET_IS_SIGNED_DIVISION_REPRESENTABILITY"
    if category != "division by zero":
        return "NOT_APPLICABLE"
    if function == "s16_div_s32_s16" and line in {274, 276}:
        return "SEPARATE_MIN_DIV_MINUS_ONE_CASE; SOURCE_GUARD_EXCLUDES_INPUT_NUMERATOR_INT32_MIN"
    if function == "s16_div_s32_s16" and line in {297, 298, 299}:
        return "SEPARATE_MIN_DIV_MINUS_ONE_CASE; SOURCE_GUARD_EXCLUDES_DENOMINATOR_MINUS_ONE"
    if function == "s16_fac05_div_s16_s16" and line in {190, 192}:
        return "SEPARATE_MIN_DIV_MINUS_ONE_CASE; SOURCE_RELATION_GUARDS_SCALED_NUMERATOR_FROM_INT32_MIN"
    return "SEPARATE_MIN_DIV_MINUS_ONE_CASE; NOT_EXCLUDED_BY_RECORDED_DIRECT_GUARD"


def input_dependencies_for(function: str, source_file: str, expression: str, parameters: list[tuple[str, str]]) -> str:
    parameter_names = [name for name, _ in parameters]
    direct = [name for name in parameter_names if re.search(rf"\b{re.escape(name)}\b", expression)]
    if source_file.endswith("MulHword.c"):
        return "TRANSITIVE_VIA_MulHighWord_CALL:" + ",".join(parameter_names)
    if direct:
        return "DIRECT_OR_EXPRESSION_VISIBLE:" + ",".join(direct) + "; TRANSITIVE_CONSERVATIVE:" + ",".join(parameter_names)
    return "TRANSITIVE_CONSERVATIVE:" + ",".join(parameter_names)


@dataclass
class Mapping:
    row: dict[str, str]


def map_alarm(index: int, alarm: dict[str, str], function_row: dict[str, str], symbols_by_function: dict[str, dict[str, str]]) -> Mapping:
    function = alarm["function"]
    source_file = alarm["source_file"]
    line = int(alarm["line"])
    category = alarm["category"]
    message = normalize_text(alarm["normalized_message"])
    statement = source_line(source_file, line)
    containing_function = "MulHighWord" if source_file.endswith("MulHword.c") else function
    symbols = dict(symbols_by_function.get(function, {}))
    symbols.update(symbols_by_function.get(containing_function, {}))
    parameters = split_parameters(function_row["signature"])
    assert_expr = assertion_body(message)

    operand1 = operand2 = "NOT_APPLICABLE"
    operation_kind = ""
    source_expression = ""
    predicate_text = ""
    predicate_normal = ""
    future_check = ""
    result_type = ""
    result_width = 0
    result_signedness = ""

    if category == "division by zero":
        match = re.fullmatch(r"(.+?)\s*!=\s*0", assert_expr)
        if not match:
            fail(f"unexpected division assertion: {message}")
        divisor = match.group(1).strip()
        divisions = division_expressions(statement)
        if not divisions:
            fail(f"source division not found for divisor alarm: {function}:{line}")
        occurrence_index = int(alarm["occurrence"])
        selected_index = occurrence_index - 1 if occurrence_index <= len(divisions) else 0
        selected_expression, numerator_expression, source_divisor = divisions[selected_index]
        operand1, operand2 = numerator_expression, source_divisor
        operation_kind = "SIGNED_DIV"
        source_expression = selected_expression
        predicate_text = f"{divisor} != 0"
        predicate_normal = f"DIVISOR_NONZERO(32,{divisor})"
        future_check = "BEFORE_OPERATION"
        result_type, result_width, result_signedness = signed_result_type(divisor, statement)
    elif category == "invalid shift" and message.startswith("invalid RHS"):
        match = re.fullmatch(r"0\s*<=\s*(.+?)\s*<\s*32", assert_expr)
        if not match:
            fail(f"unexpected shift-count assertion: {message}")
        count_expression = match.group(1).strip()
        operation_kind, operand1, source_count = invalid_rhs_operation(statement, count_expression)
        operand2 = count_expression
        source_expression = f"{operand1} {'<<' if operation_kind == 'LEFT_SHIFT' else '>>'} {source_count}"
        predicate_text = f"0 <= {count_expression} && {count_expression} < 32"
        predicate_normal = f"SHIFT_COUNT_VALID(32,{count_expression})"
        future_check = "BEFORE_SHIFT"
        result_type, result_width, result_signedness = type_label("u32"), 32, "UNSIGNED"
    elif category == "invalid shift" and message.startswith("invalid LHS"):
        match = re.fullmatch(r"0\s*<=\s*(.+)", assert_expr)
        if not match:
            fail(f"unexpected left-shift assertion: {message}")
        operand1 = match.group(1).strip()
        operand2 = shift_count_from_statement(statement)
        operation_kind = "LEFT_SHIFT"
        source_expression = f"{operand1} << {operand2}"
        predicate_text = f"{operand1} >= 0"
        predicate_normal = f"SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,{operand1})"
        future_check = "BEFORE_SHIFT"
        result_type, result_width, result_signedness = signed_result_type(operand1, statement)
    elif category == "integer overflow":
        if assert_expr.startswith("-2147483648 <= "):
            bound = "LOWER"
            expression = assert_expr[len("-2147483648 <= "):].strip()
        elif assert_expr.endswith(" <= 2147483647"):
            bound = "UPPER"
            expression = assert_expr[:-len(" <= 2147483647")].strip()
        else:
            fail(f"unrecognized overflow bound: {message}")
        operation_kind, operand1, operand2 = find_operation(expression)
        source_expression = expression
        predicate_text, predicate_normal = signed_predicate(operation_kind, bound, operand1, operand2)
        future_check = "BEFORE_SHIFT" if operation_kind == "SIGNED_LEFT_SHIFT" else "BEFORE_OPERATION"
        result_type, result_width, result_signedness = signed_result_type(expression, statement)
    else:
        fail(f"unsupported category/message: {category}: {message}")

    op1_declared = declared_type(operand1, symbols)
    op2_declared = declared_type(operand2, symbols)
    if operation_kind in {"SIGNED_ADD", "SIGNED_SUB", "SIGNED_MUL", "SIGNED_DIV"}:
        op1_effective, op1_width, op1_sign = result_type, result_width, result_signedness
        op2_effective, op2_width, op2_sign = result_type, result_width, result_signedness
    elif operation_kind == "SIGNED_NEG":
        op1_effective, op1_width, op1_sign = result_type, result_width, result_signedness
        op2_effective, op2_width, op2_sign = "NOT_APPLICABLE", 0, "NOT_APPLICABLE"
    elif operation_kind in {"SIGNED_LEFT_SHIFT", "LEFT_SHIFT", "RIGHT_SHIFT"}:
        op1_effective, op1_width, op1_sign = result_type, result_width, result_signedness
        op2_effective, op2_width, op2_sign = effective_from_expression(operand2, symbols)
    else:
        fail(f"unsupported operation kind: {operation_kind}")

    helper = function_row["active_helper_calls"] or "none"
    helper_dependencies = "NONE" if helper.lower() == "none" else helper
    argument_mapping = helper_argument_mapping(function_row) if containing_function == "MulHighWord" else "NOT_APPLICABLE"
    if containing_function == "MulHighWord":
        call_chain = f"{function} -> MulHighWord"
        target_scope = "HELPER_FUNCTION"
        confidence = "MEDIUM"
        mapping_status = "MAPPED_WITH_SEMANTIC_NOTE"
        note = "Helper source location is shared; the frozen caller function and harness remain part of target identity."
    else:
        call_chain = function
        target_scope = "TARGET_FUNCTION"
        confidence = "HIGH"
        mapping_status = "MAPPED"
        note = "Direct source/message/type match."
    if int(alarm["occurrence"]) > 1:
        confidence = "MEDIUM"
        mapping_status = "MAPPED_WITH_SEMANTIC_NOTE"
        note = "Frozen occurrence index >1 is preserved and resolves to the second matching division expression in source order; the same-divisor safety predicate remains unchanged."

    guards, guard_kind = guard_for(function, line, source_file)
    parameter_summary = "; ".join(f"{name}:{typ}" for name, typ in parameters)
    evidence = (
        f"{INPUT_ALARMS.relative_to(ROOT)}:row{index + 1}; "
        f"results/high_precision/{function}/{function}_eva.log; "
        f"{source_file}:{line}; {function_row['harness']}"
    )

    values: dict[str, object] = {
        "klee_target_id": f"KLEE-ALARM-{index:04d}",
        "frozen_row_index": index,
        "analysis_mode": alarm["analysis_mode"],
        "comparison_status": alarm["comparison_status"],
        "eva_function": function,
        "eva_source_file": source_file,
        "eva_source_line": line,
        "eva_category": category,
        "eva_normalized_message": message,
        "eva_canonical_signature": alarm["canonical_signature"],
        "eva_occurrence_index": alarm["occurrence"],
        "containing_function": containing_function,
        "target_scope": target_scope,
        "source_expression": source_expression,
        "source_statement": statement,
        "operation_kind": operation_kind,
        "predicate_text": predicate_text,
        "predicate_normal_form": predicate_normal,
        "violation_condition": f"NOT({predicate_text})",
        "companion_signed_division_overflow": division_companion(function, line, category, operation_kind),
        "operand_1_expression": operand1,
        "operand_1_declared_type": op1_declared,
        "operand_1_effective_type": op1_effective,
        "operand_1_width": op1_width,
        "operand_1_signedness": op1_sign,
        "operand_2_expression": operand2,
        "operand_2_declared_type": op2_declared,
        "operand_2_effective_type": op2_effective,
        "operand_2_width": op2_width if op2_width else "NOT_APPLICABLE",
        "operand_2_signedness": op2_sign,
        "result_effective_type": result_type,
        "result_width": result_width,
        "result_signedness": result_signedness,
        "input_parameters": parameter_summary,
        "input_domains": collapse_source(function_row["input_model"]),
        "harness_path": function_row["harness"],
        "high_precision_log_path": f"results/high_precision/{function}/{function}_eva.log",
        "input_dependencies": input_dependencies_for(function, source_file, source_expression, parameters),
        "helper_dependencies": helper_dependencies,
        "helper_argument_mapping": argument_mapping,
        "call_chain": call_chain,
        "control_flow_guards": guards,
        "control_flow_context_kind": guard_kind,
        "ppc32_relevant": "YES",
        "semantic_sensitivity": "SCALAR_WIDTH_SEMANTICS",
        "layout_sensitive": "NO",
        "endianness_sensitive": "NO",
        "abi_sensitive": "NO",
        "recommended_future_check": future_check if containing_function != "MulHighWord" else "BEFORE_OPERATION_IN_HELPER_WITH_CALLER_CONTEXT",
        "mapping_confidence": confidence,
        "mapping_status": mapping_status,
        "evidence_reference": evidence,
        "notes": note + " The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.",
    }
    return Mapping({key: str(values[key]) for key in TARGET_COLUMNS})


def validate_inputs(alarms: list[dict[str, str]], comparisons: list[dict[str, str]], functions: list[dict[str, str]]) -> str:
    if len(alarms) != 149:
        fail(f"expected 149 frozen alarm rows, found {len(alarms)}")
    if any(row["comparison_status"] != "REMAINING" for row in alarms):
        fail("high-precision inventory contains a non-REMAINING row")
    categories = Counter(row["category"] for row in alarms)
    if dict(categories) != EXPECTED_CATEGORIES:
        fail(f"category mismatch: {dict(categories)}")
    remaining_comparison = [row for row in comparisons if row["status"] == "REMAINING"]
    if len(remaining_comparison) != 149:
        fail(f"comparison REMAINING mismatch: {len(remaining_comparison)}")
    function_names = {row["function"] for row in functions}
    if any(row["function"] not in function_names for row in alarms):
        fail("alarm references a function absent from functions.tsv")
    identities = [(row["function"], row["canonical_signature"], row["occurrence"]) for row in alarms]
    if len(identities) != len(set(identities)):
        fail("frozen occurrence identity is not unique")
    function_order = {row["function"]: index for index, row in enumerate(functions)}
    alarm_function_positions = [function_order[row["function"]] for row in alarms]
    if alarm_function_positions != sorted(alarm_function_positions):
        fail("frozen alarm rows do not preserve function-manifest ordering")
    comparison_identities = {
        (row["function"], row["canonical_signature"])
        for row in remaining_comparison
    }
    if any((row["function"], row["canonical_signature"]) not in comparison_identities for row in alarms):
        fail("frozen alarm inventory has no REMAINING comparison counterpart")
    alarm_bearing_functions = len({row["function"] for row in alarms})
    if alarm_bearing_functions != 33:
        fail(f"expected 33 alarm-bearing functions, found {alarm_bearing_functions}")
    return (
        f"remaining=149\ninteger overflow={categories['integer overflow']}\n"
        f"division by zero={categories['division by zero']}\ninvalid shift={categories['invalid shift']}\n"
        f"functions_manifest={len(functions)}\nalarm_bearing_functions={alarm_bearing_functions}\n"
        f"zero_alarm_functions_without_targets={len(functions) - alarm_bearing_functions}\n"
        f"identity_duplicates=0\nfunction_order_monotonic=YES\n"
        f"input_inventory_sha256={sha256(INPUT_ALARMS)}\n"
    )


def validate_log_evidence(alarms: list[dict[str, str]]) -> str:
    by_function: dict[str, list[dict[str, str]]] = defaultdict(list)
    for row in alarms:
        by_function[row["function"]].append(row)
    details: list[str] = []
    total_markers = 0
    for function, rows in by_function.items():
        log_path = ROOT / f"results/high_precision/{function}/{function}_eva.log"
        text = normalize_text(log_path.read_text(encoding="utf-8", errors="replace"))
        marker_count = len(re.findall(r"\[eva:alarm\]", text))
        if marker_count != len(rows):
            fail(f"log/inventory count mismatch for {function}: {marker_count} != {len(rows)}")
        for row in rows:
            message = normalize_text(row["normalized_message"])
            location = f"{row['source_file']}:{row['line']}"
            if location not in text or message not in text:
                fail(f"log evidence not found for {function}: {location}: {message}")
        total_markers += marker_count
        details.append(f"{function}\t{marker_count}\tPASS")
    if total_markers != 149:
        fail(f"expected 149 log markers, found {total_markers}")
    return "function\tmarkers\tstatus\n" + "\n".join(details) + f"\nTOTAL\t{total_markers}\tPASS\n"


def mapping_statistics(rows: list[dict[str, str]]) -> dict[str, Counter[str] | int]:
    return {
        "category": Counter(row["eva_category"] for row in rows),
        "operation_kind": Counter(row["operation_kind"] for row in rows),
        "predicate_class": Counter(row["predicate_normal_form"].split("(", 1)[0] for row in rows),
        "result_width": Counter(row["result_width"] for row in rows),
        "result_signedness": Counter(row["result_signedness"] for row in rows),
        "target_scope": Counter(row["target_scope"] for row in rows),
        "guarded": Counter("WITH_GUARD" if row["control_flow_context_kind"] == "DIRECT_SOURCE_GUARDS" else "NO_DIRECT_GUARD" for row in rows),
        "semantic_sensitivity": Counter(row["semantic_sensitivity"] for row in rows),
        "layout_sensitive": Counter(row["layout_sensitive"] for row in rows),
        "endianness_sensitive": Counter(row["endianness_sensitive"] for row in rows),
        "abi_sensitive": Counter(row["abi_sensitive"] for row in rows),
        "confidence": Counter(row["mapping_confidence"] for row in rows),
        "status": Counter(row["mapping_status"] for row in rows),
    }


def write_statistics(stats: dict[str, Counter[str] | int]) -> None:
    rows: list[dict[str, str]] = []
    for dimension, counter in stats.items():
        if isinstance(counter, Counter):
            for value, count in sorted(counter.items()):
                rows.append({"dimension": dimension, "value": value, "count": str(count)})
    write_tsv(STATS_TSV, ["dimension", "value", "count"], rows)


def markdown_table(headers: Sequence[str], rows: Iterable[Sequence[object]]) -> str:
    output = ["| " + " | ".join(headers) + " |", "|" + "|".join("---" for _ in headers) + "|"]
    for row in rows:
        output.append("| " + " | ".join(str(value).replace("|", "\\|").replace("\n", " ") for value in row) + " |")
    return "\n".join(output)


def stats_section(stats: dict[str, Counter[str] | int], key: str) -> str:
    counter = stats[key]
    assert isinstance(counter, Counter)
    return markdown_table([key, "count"], sorted(counter.items()))


def write_human_inventory(rows: list[dict[str, str]]) -> None:
    sections = [
        "# KLEE Alarm Target Inventory",
        "",
        "This document renders all 149 machine-readable target rows for human audit. `DIRECT REPOSITORY EVIDENCE` fields come from the frozen Eva inventory, logs, source, function metadata, and harness metadata. `DERIVED SEMANTIC MAPPING` fields describe the ppc_32 operation and future safety check. No witness or validity conclusion is present.",
        "",
    ]
    for row in rows:
        sections.extend([
            f"## {row['klee_target_id']} — `{row['eva_function']}`",
            "",
            "### Direct repository evidence",
            "",
            f"- Source: `{row['eva_source_file']}:{row['eva_source_line']}`",
            f"- Category: `{row['eva_category']}`",
            f"- Frozen occurrence: `{row['eva_occurrence_index']}`",
            f"- Eva message: `{row['eva_normalized_message']}`",
            f"- Canonical signature: `{row['eva_canonical_signature']}`",
            f"- Source statement: `{row['source_statement']}`",
            f"- Input parameters: `{row['input_parameters']}`",
            f"- Input domains: `{row['input_domains']}`",
            f"- Eva harness: `{row['harness_path']}`",
            f"- High Precision log: `{row['high_precision_log_path']}`",
            f"- Control-flow context: `{row['control_flow_guards']}`",
            f"- Evidence: `{row['evidence_reference']}`",
            "",
            "### Derived semantic mapping",
            "",
            f"- Containing function/call chain: `{row['containing_function']}` / `{row['call_chain']}`",
            f"- Helper argument mapping: `{row['helper_argument_mapping']}`",
            f"- Source operation: `{row['source_expression']}`",
            f"- Operation kind: `{row['operation_kind']}`",
            f"- Safety predicate: `{row['predicate_text']}`",
            f"- Predicate normal form: `{row['predicate_normal_form']}`",
            f"- Violation condition: `{row['violation_condition']}`",
            f"- Signed-division companion: `{row['companion_signed_division_overflow']}`",
            f"- Operand 1: `{row['operand_1_expression']}`; declared `{row['operand_1_declared_type']}`; effective `{row['operand_1_effective_type']}`",
            f"- Operand 2: `{row['operand_2_expression']}`; declared `{row['operand_2_declared_type']}`; effective `{row['operand_2_effective_type']}`",
            f"- Result: `{row['result_effective_type']}`",
            f"- Semantic sensitivity: `{row['semantic_sensitivity']}`; layout `{row['layout_sensitive']}`; endian `{row['endianness_sensitive']}`; ABI `{row['abi_sensitive']}`",
            f"- Future check position: `{row['recommended_future_check']}`",
            f"- Confidence/status: `{row['mapping_confidence']}` / `{row['mapping_status']}`",
            f"- Notes: {row['notes']}",
            "",
        ])
    HUMAN_INVENTORY.parent.mkdir(parents=True, exist_ok=True)
    HUMAN_INVENTORY.write_text("\n".join(sections).rstrip() + "\n", encoding="utf-8")


def write_source_contexts(rows: list[dict[str, str]]) -> None:
    seen: set[tuple[str, int]] = set()
    chunks: list[str] = []
    for row in rows:
        key = (row["eva_source_file"], int(row["eva_source_line"]))
        if key in seen:
            continue
        seen.add(key)
        path, line = key
        lines = (ROOT / path).read_text(encoding="utf-8", errors="replace").splitlines()
        start, end = max(1, line - 3), min(len(lines), line + 3)
        chunks.append(f"### {path}:{line}")
        for number in range(start, end + 1):
            source_content = lines[number - 1].rstrip()
            chunks.append(f"{number:6d}" + (f"\t{source_content}" if source_content else ""))
        chunks.append("")
    RAW_DIR.mkdir(parents=True, exist_ok=True)
    (RAW_DIR / "source_contexts.txt").write_text("\n".join(chunks), encoding="utf-8")


def write_documents(rows: list[dict[str, str]], stats: dict[str, Counter[str] | int], input_validation: str) -> None:
    PHASE_DIR.mkdir(parents=True, exist_ok=True)
    REPORT_DIR.mkdir(parents=True, exist_ok=True)
    input_hash = sha256(INPUT_ALARMS)
    targets_hash = sha256(TARGETS_TSV)
    identity_hash = sha256(IDENTITY_TSV)
    predicates_hash = sha256(PREDICATES_TSV)
    poc_by_key = {
        (row["eva_function"], row["eva_source_file"], row["eva_source_line"], row["eva_category"]): row
        for row in rows
    }
    overflow_poc = poc_by_key[("s32_mul_s32_s32", "src_analysis/sources/MulHword.c", "47", "integer overflow")]
    division_poc = poc_by_key[("s16_div_s32_s16", "src_analysis/sources/div_Ccode.c", "274", "division by zero")]
    shift_poc = poc_by_key[("root_s32_mul_s32_s16_fac_less1", "src_analysis/sources/mul_Ccode.c", "5089", "invalid shift")]

    docs: dict[str, str] = {}
    docs["00_PHASE_B_SCOPE_AND_RULES.md"] = f"""# KLEE Phase B — Scope and Rules

## Objective

Map the frozen 149 High Precision Eva `REMAINING` alarm occurrences one-to-one to stable target IDs and UB-free safety-predicate specifications. The unit is an occurrence, including caller context for helper alarms.

## Direct repository evidence

- Frozen inventory: `{INPUT_ALARMS.relative_to(ROOT)}`
- Frozen inventory SHA-256: `{input_hash}`
- Rows: 149; integer overflow 100; division by zero 16; invalid shift 33.
- Source, Eva logs, function inventory, and harnesses are read-only evidence.

## Scientific boundary

Phase B performs no KLEE execution, bitcode generation, project harness generation, instrumentation, witness generation, replay, toolchain installation, Eva rerun, or alarm validity classification. Only `analysis/klee_phase_b/` and `reports/klee_phase_b/` are generated.
"""
    docs["01_INPUT_DATASET_VALIDATION.md"] = f"""# Input Dataset Validation

## Direct repository evidence

```text
{input_validation.rstrip()}
```

Every inventory row has `analysis_mode=HIGH_PRECISION` and `comparison_status=REMAINING`. The 149 canonical source/message entries were cross-checked against the corresponding committed High Precision Eva logs. `alarm_comparison.tsv` independently contains 149 `REMAINING` rows.

## Interpretation boundary

The frozen `occurrence` field is preserved exactly. Phase B does not reconstruct or renumber Eva properties from source syntax and does not deduplicate equivalent predicates.
"""
    docs["02_STABLE_ID_POLICY.md"] = f"""# Stable Target-ID Policy

IDs are assigned in exact row order of the frozen High Precision inventory: `KLEE-ALARM-0001` through `KLEE-ALARM-0149`. This choice preserves the already frozen experiment order, which follows the function population and recorded Eva occurrence order. Filesystem traversal order is never used.

The authoritative input is bound to SHA-256 `{input_hash}`. Reproducibility therefore means: verify this hash, read TSV data rows sequentially, preserve `(function, canonical_signature, occurrence)`, and format the one-based row ordinal with four digits. Duplicate-looking source expressions are not merged. A changed or reordered input has a different hash and is a new dataset rather than silently reusing IDs.
"""
    docs["03_PREDICATE_TAXONOMY.md"] = f"""# Predicate Taxonomy

Every `predicate_text` is a safety condition: true means the mapped Eva obligation is satisfied; `violation_condition` is explicitly `NOT(predicate_text)`. Predicates use mathematical/widened notation so their evaluation is not itself undefined.

{stats_section(stats, 'predicate_class')}

Key forms include `DIVISOR_NONZERO`, `SHIFT_COUNT_VALID`, `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE`, bound-specific signed add/subtract/multiply/left-shift forms, `SIGNED_NEG_VALID`, and `SIGNED_DIV_REPRESENTABLE`. Bound-specific lower and upper Eva occurrences remain distinct even when a later implementation could evaluate a shared full-range helper. For every signed division-by-zero row, the distinct `INT32_MIN / -1` representability condition is recorded in `companion_signed_division_overflow`; it is never folded into the divisor predicate.
"""
    docs["04_C_TYPE_AND_PROMOTION_MODEL.md"] = """# C Type and Promotion Model

## Direct repository evidence

The project typedefs are `s8=signed char`, `u8=unsigned char`, `s16=signed short`, `u16=unsigned short`, `s32=signed long`, and `u32=unsigned long`. The frozen Eva machine is ppc_32: 16-bit short, 32-bit int/long/pointer, big-endian, unsigned plain char.

## Derived semantic mapping

Each operand records both the declared source-object type and the effective operation type. Under ppc_32, every `s8/u8/s16/u16` value promotes to signed 32-bit `int`, because signed `int` represents their full ranges. `s32/u32` remain 32-bit signed/unsigned long. Shift result type follows the promoted left operand; the right operand is promoted independently. All 149 mapped operations are effectively 32-bit, but 8/16-bit declared inputs materially affect the promotion evidence.

The future adapter must encode these widths and conversions explicitly; compiling unmodified `signed long` on host LP64 would not preserve this model.

Observed consequences are concrete in the mapping: `u16` half words in `MulHighWord` become signed `int` operands before multiplication; `u8/s8/u16/s16` subtraction and left-shift operands become signed `int`; mixed `s32` and promoted narrow operands operate as 32-bit signed `long` where that type represents the promoted value; the 13 variable-count shift obligations have unsigned `u32` left operands, while the 20 invalid-left-operand obligations concern signed promoted operands. The resulting target signedness is 136 signed operations and 13 unsigned operations.
"""
    docs["05_ALARM_TO_PREDICATE_MAPPING_METHOD.md"] = """# Alarm-to-Predicate Mapping Method

## Direct repository evidence

For every frozen row, the generator retains the Eva function, canonical signature, occurrence index, exact normalized message, source file/line, source statement, caller harness metadata, and log reference. Helper locations retain the outer Eva function as identity.

## Derived semantic mapping

1. Parse the assertion text without changing identity.
2. Locate the exact source statement and containing function.
3. Classify the source operation, including lower/upper occurrences separately.
4. resolve declared object types from signatures/local declarations and apply ppc_32 promotions/conversions;
5. express the safety predicate in UB-free mathematical normal form;
6. record direct source guards separately from conservative input dependency;
7. classify semantic sensitivity and future check placement;
8. assign confidence/status and an explanation for every non-HIGH mapping.

No solver reasoning is performed. `TRANSITIVE_CONSERVATIVE` input dependencies mean the listed entry parameters bound the future experiment; they are not a proof that every parameter influences the target.
"""
    docs["06_MACHINE_SEMANTIC_SENSITIVITY.md"] = f"""# Machine Semantic Sensitivity

{stats_section(stats, 'semantic_sensitivity')}

{stats_section(stats, 'layout_sensitive')}

{stats_section(stats, 'endianness_sensitive')}

{stats_section(stats, 'abi_sensitive')}

All current alarms concern scalar arithmetic/shift semantics. None directly accesses pointers, structs, arrays, object representation, or byte order at the mapped operation. Consequently every row is `SCALAR_WIDTH_SEMANTICS`, while `ppc32_relevant=YES` records that widths, signedness, integer promotions, and `long` data-model semantics remain mandatory. This is an occurrence-level statement, not a claim that the entire containing function is ABI-independent.
"""
    docs["07_MAPPING_VALIDATION.md"] = f"""# Mapping Validation

The committed validator checks frozen counts, unique IDs, exact one-to-one occurrence identity, category preservation, no `REMOVED`/`NEW` rows, required-field completeness, source-line consistency, predicate polarity, three TSV projections, JSON semantic equivalence, hashes, and POC identities.

## Derived statistics

{stats_section(stats, 'category')}

{stats_section(stats, 'operation_kind')}

{stats_section(stats, 'confidence')}

{stats_section(stats, 'status')}

The generated validation evidence must report zero unmapped occurrences, zero multiply mapped occurrences, and zero failures before Phase B is committed.

## Dataset hashes

```text
{targets_hash}  klee_alarm_targets.tsv
{identity_hash}  klee_alarm_identity.tsv
{predicates_hash}  klee_predicate_inventory.tsv
```
"""
    review_rows = [row for row in rows if row["mapping_confidence"] != "HIGH"]
    review_table = markdown_table(
        ["ID", "function", "source", "reason", "status"],
        [(row["klee_target_id"], row["eva_function"], f"{row['eva_source_file']}:{row['eva_source_line']}", row["notes"], row["mapping_status"]) for row in review_rows],
    )
    docs["08_AMBIGUITIES_AND_MANUAL_REVIEW.md"] = f"""# Ambiguities and Manual Review Inventory

No occurrence identity is ambiguous and no row is LOW confidence. The following MEDIUM rows are mapped one-to-one but carry explicit future instrumentation notes:

{review_table}

Shared `MulHighWord` locations require caller-specific target selection. Occurrence-index-2 division rows resolve to the second matching division expression in source order while retaining the frozen index. Neither case changes the frozen identity or prevents Phase C, but generated instrumentation must retain the note.
"""
    docs["09_PHASE_C_INSTRUMENTATION_REQUIREMENTS.md"] = """# Phase-C Instrumentation Requirements

Phase C must consume the hashed Phase-B TSV without re-sorting or reconstructing IDs. It requires: a pinned KLEE 3.2/LLVM 13 environment; explicit-width ppc_32 scalar adapters; full frozen harness domains; one selected target ID per run; predicate templates evaluated before the relevant operation/shift/helper operation; IR inspection at `-O0`; prevention of earlier unrelated UB from obscuring the selected target; KTest decoding tied to the entry signature; and controlled replay.

For helper targets, the entry remains the frozen Eva target function and the check belongs in the helper with caller-context selection. For compound statements, instrumentation must be introduced before the exact suboperation without evaluating the unsafe expression inside the predicate. No code is generated in Phase B.
"""

    for name, content in docs.items():
        (PHASE_DIR / name).write_text(content.strip() + "\n", encoding="utf-8")

    summary = f"""# KLEE Phase B — Executive Summary

## Verdict

```text
SUCCESS — MAPPING COMPLETE WITH REVIEW ITEMS
```

The frozen 149 Eva `REMAINING` occurrences map one-to-one to 149 IDs. Category totals are 100 integer overflow, 16 division by zero, and 33 invalid shift. There are no unmapped, multiply mapped, `REMOVED`, or `NEW` targets.

## Mapping profile

{stats_section(stats, 'operation_kind')}

{stats_section(stats, 'confidence')}

All targets are 32-bit scalar-width properties. Six shared-helper rows and three occurrence-index-2 divisor rows are MEDIUM with semantic notes; all other rows are HIGH. There are no LOW or identity-ambiguous mappings.

## Phase-A POCs

All three Phase-A candidates remain suitable and are retained: `{overflow_poc['klee_target_id']}` (`s32_mul_s32_s32`, `MulHword.c:47`), `{division_poc['klee_target_id']}` (`s16_div_s32_s16`, `div_Ccode.c:274`), and `{shift_poc['klee_target_id']}` (`root_s32_mul_s32_s16_fac_less1`, `mul_Ccode.c:5089`).

No KLEE execution, project bitcode, harness generation, instrumentation, witness generation, replay, toolchain setup, or validity classification occurred.

## Frozen output hashes

```text
{targets_hash}  klee_alarm_targets.tsv
{identity_hash}  klee_alarm_identity.tsv
{predicates_hash}  klee_predicate_inventory.tsv
```
"""
    (REPORT_DIR / "KLEE_PHASE_B_EXECUTIVE_SUMMARY.md").write_text(summary.strip() + "\n", encoding="utf-8")

    technical = f"""# KLEE Phase B — Deterministic Alarm-to-Predicate Mapping Technical Report

## 1. Objective and boundary

Phase B transforms the frozen High Precision Eva occurrence population into deterministic, occurrence-aware target specifications. It does not execute KLEE and does not change the Eva dataset.

## 2. Authoritative inputs

- `{INPUT_ALARMS.relative_to(ROOT)}` ({input_hash})
- `{INPUT_COMPARISON.relative_to(ROOT)}`
- `{INPUT_FUNCTIONS.relative_to(ROOT)}`
- `{INPUT_LOCATIONS.relative_to(ROOT)}`
- committed High Precision Eva logs, source, headers, and harnesses

## 3. Input validation

```text
{input_validation.rstrip()}
```

## 4. Stable identity

The exact frozen TSV row order is retained and mapped to `KLEE-ALARM-0001` through `KLEE-ALARM-0149`. The preserved identity tuple is `(eva_function, eva_canonical_signature, eva_occurrence_index)`. This distinguishes caller contexts, repeated source obligations, and multiplicity without relying on directory traversal.

## 5. Direct evidence versus derived mapping

Direct fields originate in the frozen inventory, Eva log, source line, function inventory, or Eva harness. Derived fields include operation classification, effective C type, normal-form predicate, sensitivity, future check placement, confidence, and status. Derived fields use ppc_32 C semantics and do not claim a witness or runtime classification.

## 6. Category totals

{stats_section(stats, 'category')}

## 7. Operation taxonomy

{stats_section(stats, 'operation_kind')}

## 8. Predicate classes

{stats_section(stats, 'predicate_class')}

## 9. Types and widths

{stats_section(stats, 'result_width')}

{stats_section(stats, 'result_signedness')}

Every effective target operation is 32-bit. Narrow signed and unsigned arguments promote to signed 32-bit `int` where applicable. `s32/u32` map to 32-bit signed/unsigned long only under the frozen ppc_32 model; a host LP64 build is not a substitute.

## 10. Helper and guard profile

{stats_section(stats, 'target_scope')}

{stats_section(stats, 'guarded')}

Helper-source targets remain independent per Eva caller. Guards are recorded as direct source evidence only; no inferred solver path condition is promoted to fact.

## 11. Semantic sensitivity

{stats_section(stats, 'semantic_sensitivity')}

No mapped operation directly depends on byte order, pointer width, object layout, structure layout, or calling convention. Every row nevertheless requires ppc_32 scalar widths/promotions.

## 12. Confidence and review

{stats_section(stats, 'confidence')}

{stats_section(stats, 'status')}

MEDIUM mappings are the six shared-helper occurrences and three frozen occurrence-index-2 divisor properties. Their identity and safety condition are known; the note constrains future instrumentation placement. LOW mappings: zero.

## 13. Predicate construction

Every predicate is a safety condition. Signed arithmetic uses mathematical-result notation and explicit INT32 bounds, so a future check need not evaluate the potentially undefined source operation. Division zero and shift-count predicates precede the operation. Left-shift nonnegative-LHS obligations are distinct from shift-count and representability obligations on the same line.

## 14. Validation and round trip

The validator checks 149 rows/IDs/identities, category totals, exact projection equivalence, JSON equality, source statements, nonempty fields, and reverse mapping. A target resolves to frozen row, log, source, harness, input model, and predicate; each frozen row resolves to one target.

## 15. POC validation

- `{overflow_poc['klee_target_id']}`, `MulHword.c:47` in `s32_mul_s32_s32`: retained; helper context is explicit.
- `{division_poc['klee_target_id']}`, `div_Ccode.c:274` in `s16_div_s32_s16`: retained; compound line has separately identified division/shift/multiplication properties.
- `{shift_poc['klee_target_id']}`, `mul_Ccode.c:5089` in `root_s32_mul_s32_s16_fac_less1`: retained and remains the recommended first end-to-end overshift POC.

## 16. Phase C requirements

Phase C requires the pinned environment and explicit-width adapter identified by Phase A, plus generated predicate templates that consume this dataset without changing IDs. Checks must precede UB, full input domains must match frozen harnesses, IR must be inspected, and replay semantics must be documented.

## 17. Scientific limitation

Mapping a property is not evidence that it is reachable or unreachable. Phase B makes no statement that a program is safe/unsafe, that an alarm is valid/invalid, or that KLEE will/will not produce a witness.

## 18. Dataset hashes

```text
{targets_hash}  klee_alarm_targets.tsv
{identity_hash}  klee_alarm_identity.tsv
{predicates_hash}  klee_predicate_inventory.tsv
```
"""
    (REPORT_DIR / "KLEE_PHASE_B_TECHNICAL_REPORT.md").write_text(technical.strip() + "\n", encoding="utf-8")


def main() -> int:
    alarms = read_tsv(INPUT_ALARMS)
    comparisons = read_tsv(INPUT_COMPARISON)
    functions = read_tsv(INPUT_FUNCTIONS)
    read_tsv(INPUT_LOCATIONS)
    function_rows = {row["function"]: row for row in functions}
    input_validation = validate_inputs(alarms, comparisons, functions)

    PHASE_DIR.mkdir(parents=True, exist_ok=True)
    RAW_DIR.mkdir(parents=True, exist_ok=True)
    VALIDATION_DIR.mkdir(parents=True, exist_ok=True)
    REPORT_DIR.mkdir(parents=True, exist_ok=True)
    (RAW_DIR / "input_dataset_validation.txt").write_text(input_validation, encoding="utf-8")
    (RAW_DIR / "log_occurrence_validation.tsv").write_text(validate_log_evidence(alarms), encoding="utf-8")

    symbols = build_symbol_tables(function_rows)
    mappings = [map_alarm(index, alarm, function_rows[alarm["function"]], symbols) for index, alarm in enumerate(alarms, 1)]
    rows = [mapping.row for mapping in mappings]

    write_tsv(TARGETS_TSV, TARGET_COLUMNS, rows)
    write_tsv(IDENTITY_TSV, IDENTITY_COLUMNS, rows)
    write_tsv(PREDICATES_TSV, PREDICATE_COLUMNS, rows)
    with TARGETS_JSON.open("w", encoding="utf-8") as stream:
        json.dump(rows, stream, ensure_ascii=False, indent=2)
        stream.write("\n")

    stats = mapping_statistics(rows)
    write_statistics(stats)
    poc_keys = [
        ("integer overflow", "s32_mul_s32_s32", "src_analysis/sources/MulHword.c", "47"),
        ("division by zero", "s16_div_s32_s16", "src_analysis/sources/div_Ccode.c", "274"),
        ("invalid shift", "root_s32_mul_s32_s16_fac_less1", "src_analysis/sources/mul_Ccode.c", "5089"),
    ]
    poc_rows = []
    for category, function, source, line in poc_keys:
        matches = [row for row in rows if row["eva_category"] == category and row["eva_function"] == function and row["eva_source_file"] == source and row["eva_source_line"] == line]
        if len(matches) != 1:
            fail(f"POC mapping is not unique: {function}:{line}:{category}")
        row = matches[0]
        poc_rows.append({
            "category": category,
            "klee_target_id": row["klee_target_id"],
            "function": function,
            "source_file": source,
            "source_line": line,
            "decision": "KEEP",
            "predicate_normal_form": row["predicate_normal_form"],
            "mapping_confidence": row["mapping_confidence"],
            "reason": "Unique occurrence mapping retained from the frozen Phase-A recommendation.",
        })
    write_tsv(POC_TSV, ["category", "klee_target_id", "function", "source_file", "source_line", "decision", "predicate_normal_form", "mapping_confidence", "reason"], poc_rows)
    write_human_inventory(rows)
    write_source_contexts(rows)
    write_documents(rows, stats, input_validation)

    hashes = []
    for path in (TARGETS_TSV, IDENTITY_TSV, PREDICATES_TSV):
        hashes.append(f"{sha256(path)}  {path.name}")
    HASHES_FILE.write_text("\n".join(hashes) + "\n", encoding="utf-8")
    print(f"generated {len(rows)} deterministic target rows")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
