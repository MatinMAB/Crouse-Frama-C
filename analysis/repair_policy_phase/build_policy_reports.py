#!/usr/bin/env python3
"""Build the repair-policy decision records from frozen Eva/KLEE evidence."""

from __future__ import annotations

import csv
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
PHASE = ROOT / "analysis" / "repair_policy_phase"
TARGET_DIR = PHASE / "targets"
REPAIR = ROOT / "analysis" / "repair_phase"

TARGET_IDS = [
    f"KLEE-ALARM-{number}"
    for number in (
        "0002", "0003", "0005", "0006", "0009", "0010", "0012", "0013",
        "0014", "0015", "0019", "0020", "0021", "0061", "0066", "0144",
    )
]

# This map is changed only after the corresponding source repair exists. The
# final traceability commit replaces PENDING_THIS_COMMIT with the real hash.
APPLIED_REPAIRS: dict[str, dict[str, str]] = {}

SHIFT_CALLERS = {
    "KLEE-ALARM-0002": ("s32_mul_s32_s16_fac05", "16", "1..31"),
    "KLEE-ALARM-0003": ("s32_mul_s32_s16_fac05", "16", "1..31"),
    "KLEE-ALARM-0005": ("s32_mul_s32_s8_fac05", "8", "1..31"),
    "KLEE-ALARM-0006": ("s32_mul_s32_s8_fac05", "8", "1..31"),
    "KLEE-ALARM-0009": ("s32_mul_s32_u16_fac05", "17", "1..31"),
    "KLEE-ALARM-0010": ("s32_mul_s32_u16_fac05", "17", "1..31"),
    "KLEE-ALARM-0012": ("s32_mul_s32_u8_fac05", "9", "1..31"),
    "KLEE-ALARM-0013": ("s32_mul_s32_u8_fac05", "9", "1..31"),
    "KLEE-ALARM-0014": ("u32_mul_u32_s16_fac05", "15", "1..31"),
    "KLEE-ALARM-0015": ("u32_mul_u32_s16_fac05", "15", "1..31"),
    "KLEE-ALARM-0019": ("u32_mul_u32_s32_fac05", "32", "32..63"),
    "KLEE-ALARM-0020": ("u32_mul_u32_s8_fac05", "8", "1..31"),
    "KLEE-ALARM-0021": ("u32_mul_u32_s8_fac05", "8", "1..31"),
}

GROUPS = {
    "KLEE-ALARM-0002": "SHIFT_ROOT_S32_S16_0002_0003",
    "KLEE-ALARM-0003": "SHIFT_ROOT_S32_S16_0002_0003",
    "KLEE-ALARM-0005": "SHIFT_ROOT_S32_S8_0005_0006",
    "KLEE-ALARM-0006": "SHIFT_ROOT_S32_S8_0005_0006",
    "KLEE-ALARM-0009": "SHIFT_ROOT_S32_U16_0009_0010",
    "KLEE-ALARM-0010": "SHIFT_ROOT_S32_U16_0009_0010",
    "KLEE-ALARM-0012": "SHIFT_ROOT_S32_U8_0012_0013",
    "KLEE-ALARM-0013": "SHIFT_ROOT_S32_U8_0012_0013",
    "KLEE-ALARM-0014": "SHIFT_ROOT_U32_S16_0014_0015",
    "KLEE-ALARM-0015": "SHIFT_ROOT_U32_S16_0014_0015",
    "KLEE-ALARM-0019": "SHIFT_ROOT_U32_S32_0019",
    "KLEE-ALARM-0020": "SHIFT_ROOT_U32_S8_0020_0021",
    "KLEE-ALARM-0021": "SHIFT_ROOT_U32_S8_0020_0021",
    "KLEE-ALARM-0061": "HIP_SIGNED_REMAINDER_DOUBLE_0061_0066",
    "KLEE-ALARM-0066": "HIP_SIGNED_REMAINDER_DOUBLE_0061_0066",
    "KLEE-ALARM-0144": "U32_SIGNED_DIVISION_MINIMUM_0144",
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


def source_location(source: str, label: str) -> tuple[int, str]:
    lines = (ROOT / source).read_text(encoding="utf-8").splitlines()
    label_index = next(i for i, line in enumerate(lines) if label in line)
    close_index = next(i for i in range(label_index, len(lines)) if "*/" in lines[i])
    statement = ""
    index = close_index + 1
    while index < len(lines):
        candidate = lines[index].strip()
        if candidate.startswith("/*"):
            index = next(i for i in range(index, len(lines)) if "*/" in lines[i]) + 1
            continue
        if candidate and not candidate.startswith("*"):
            statement = candidate
            break
        index += 1
    return label_index + 1, statement


def shift_analysis(alarm_id: str, row: dict[str, str]) -> dict[str, str]:
    caller, fixed_count, valid_domain = SHIFT_CALLERS[alarm_id]
    expression = row["Original Expression"]
    direction = "left" if "<<" in expression else "right"
    violating_count = row["Concrete Inputs"].split("count=", 1)[1].split(";", 1)[0]
    evidence = (
        f"The operation is a {direction} shift of a 32-bit `u32` product word by a `u32` "
        f"count. Repository caller `{caller}` supplies the fixed bit count {fixed_count}, which is "
        f"inside the operation's {valid_domain} decomposition domain. The surrounding code combines "
        "`MulHighWord` with the low product word to implement the documented fixed-point product "
        "shift. All source-tree callers use their documented fixed counts; no test, comment, contract, "
        "caller, sibling, or historical implementation defines behavior for a direct root call outside "
        f"that domain. The KLEE witness instead supplies count {violating_count}."
    )
    rejected = (
        "Masking/modulo would impose target-instruction semantics absent from the C API; clamping would "
        "change the scale; returning zero or saturation would invent an exceptional-value policy; adding "
        "an ACSL precondition would evade rather than repair the selected assertion; and a generalized "
        "64-bit shift would still invent the result/limitation policy outside the documented caller domain."
    )
    return {
        "decision": "SEMANTICS_AMBIGUOUS",
        "confidence": "Repository evidence insufficient",
        "selected": "NONE — no implementation change",
        "evidence": evidence,
        "candidates": (
            "Reject invalid direct calls; extend the full-width mathematical shift; clamp; mask/modulo; "
            "or return a limited value. Each produces observably different behavior outside known callers."
        ),
        "rejected": rejected,
        "why": (
            "The fixed-count callers establish the intended normal domain but do not establish exceptional "
            "behavior. Preserving the implementation is scientifically preferable to choosing among "
            "unsupported policies."
        ),
        "callers": f"{caller} (fixed count {fixed_count}); direct root API/harness calls",
        "related": f"Shared repair group {GROUPS[alarm_id]}; no runtime-only alarm shares this exact statement",
        "runtime": "NONE_IDENTIFIED",
        "primary": alarm_id,
    }


def hip_analysis(alarm_id: str) -> dict[str, str]:
    runtime_id = "KLEE-ALARM-0062" if alarm_id.endswith("0061") else "KLEE-ALARM-0067"
    function = (
        "s16_hip1_s16_s8_s8_u16_fac1"
        if alarm_id.endswith("0061")
        else "s16_hip1_s16_u8_u8_u16_fac1"
    )
    evidence = (
        "The function comment gives `result = yold - (m*yold/65536) + (u-uold)*128`. The selected "
        "statement doubles the signed remainder left after removing the truncated 65536 multiple. For "
        "the witness, `yold*m = -4489216`, truncating division gives `-68`, and the remainder is "
        "`-32768`; left-shifting it is undefined, while multiplication by 2 gives the intended "
        "`-65536` exactly and remains within `s32`. The signed and unsigned-input sibling functions use "
        "the identical algorithm. Commit 57864b4 previously implemented this exact branch; 76fb867 "
        "reverted it solely to preserve the prior runtime-only phase boundary, not because the numerical "
        "semantics were disputed."
    )
    return {
        "decision": "SEMANTICS_CONFIRMED_REPAIRABLE",
        "confidence": "Confirmed by formula, range, sibling, and Git history",
        "selected": (
            "If the remainder is nonnegative, retain the original ACSL assertions and `<< 1`; if it is "
            "negative, compute the same documented doubling with range-safe `* 2`."
        ),
        "evidence": evidence,
        "candidates": "Guarded equivalent multiplication; unconditional multiplication; clamp/saturate; or skip the update.",
        "rejected": (
            "Unconditional multiplication needlessly removes the original verified operation; clamp, "
            "saturation, skipping, or an early return changes the filter equation. The guarded equivalent "
            "preserves every already-defined value and defines only the formerly undefined negative shift."
        ),
        "why": (
            "Both branches compute mathematical doubling. The negative remainder magnitude is below 65536, "
            "so doubling is representable. The original assertion remains unchanged immediately before the "
            "original shift on the path where it is true."
        ),
        "callers": f"{function}; no distinct repository caller changes the local formula",
        "related": f"The same physical shift also carries runtime-only {runtime_id}",
        "runtime": (
            f"{runtime_id}: move its unchanged upper-bound assertion into the nonnegative shift branch. "
            "The negative branch no longer executes a shift; the runtime-only alarm is not reclassified or added to WP."
        ),
        "primary": "KLEE-ALARM-0061",
    }


def division_analysis() -> dict[str, str]:
    return {
        "decision": "SEMANTICS_INFERRED_HIGH_CONFIDENCE",
        "confidence": "High confidence from independent formula and sibling implementation evidence",
        "selected": (
            "For `numerator == INT32_MIN` on the negative/negative path, use exact unsigned magnitude "
            "`0x80000000U`, derive the negative denominator magnitude without signed-minimum negation, and "
            "apply the existing quotient-plus-doubled-remainder rounding formula. Keep the original "
            "assertion and signed negation unchanged on the non-minimum path."
        ),
        "evidence": (
            "The API comment states `u32 = s32 / s32`; the existing negative/negative branch converts both "
            "operands to magnitudes and returns the positive quotient with doubled-remainder rounding. The "
            "sibling `s32_div_s32_s32` already represents signed minima as unsigned `0x80000000U` and performs "
            "the same magnitude formula. Earlier repair 7aa2299 established that exact unsigned-magnitude "
            "policy throughout the division family. For the witness, both magnitudes are 2147483648, the "
            "remainder is zero, and the documented result is exactly 1."
        ),
        "candidates": (
            "Unsigned-magnitude exceptional path; return 1 only for the observed witness; saturate; widen signed "
            "arithmetic; or reject signed minima."
        ),
        "rejected": (
            "Witness-only return is incomplete; saturation/rejection contradict quotient semantics; signed "
            "widening changes the implementation model and is unnecessary. The sibling's unsigned-magnitude "
            "algorithm handles the complete numerator-minimum subdomain."
        ),
        "why": (
            "The repair reproduces the existing magnitude quotient and rounding for every negative denominator, "
            "preserves ordinary-path behavior, and avoids only the undefined signed negation."
        ),
        "callers": "Public `u32_div_s32_s32` interface; no in-repository C caller narrows its operand range",
        "related": "Runtime-only KLEE-ALARM-0145 through KLEE-ALARM-0149 occupy the ordinary negative/negative path",
        "runtime": (
            "KLEE-ALARM-0145..0149 are bypassed only when numerator is INT32_MIN because the new unsigned "
            "magnitude path replaces the shared undefined computation. Their assertions remain unchanged on "
            "the ordinary path; none is reclassified or included in the second WP campaign."
        ),
        "primary": "KLEE-ALARM-0144",
    }


PHASE.mkdir(parents=True, exist_ok=True)
TARGET_DIR.mkdir(exist_ok=True)
confirmed_headers, confirmed_rows = read_tsv(REPAIR / "48_CONFIRMED_REPAIR_TARGETS.tsv")
_, property_rows = read_tsv(REPAIR / "149_ACSL_PROPERTY_MAP.tsv")
confirmed = {row["KLEE Alarm ID"]: row for row in confirmed_rows}
properties = {row["KLEE Alarm ID"]: row for row in property_rows}

if len(confirmed_rows) != 48 or len(set(TARGET_IDS)) != 16:
    raise SystemExit("frozen confirmed/repair-policy target cardinality mismatch")
if not set(TARGET_IDS) <= confirmed.keys():
    raise SystemExit("repair-policy target missing from frozen confirmed manifest")

matrix_rows: list[dict[str, str]] = []
second_rows: list[dict[str, str]] = []

for alarm_id in TARGET_IDS:
    row = confirmed[alarm_id]
    prop = properties[alarm_id]
    if not (ROOT / row["KTest"]).is_file() or not (ROOT / row["Target Error Evidence"]).is_file():
        raise SystemExit(f"missing frozen KLEE witness evidence for {alarm_id}")
    if alarm_id in SHIFT_CALLERS:
        analysis = shift_analysis(alarm_id, row)
    elif alarm_id in {"KLEE-ALARM-0061", "KLEE-ALARM-0066"}:
        analysis = hip_analysis(alarm_id)
    else:
        analysis = division_analysis()

    source = prop["Repaired Source File"]
    current_line, current_statement = source_location(source, row["ACSL Label"])
    applied = APPLIED_REPAIRS.get(alarm_id)
    repair_commit = applied["commit"] if applied else "NOT_APPLICABLE"
    parser_check = applied["parser"] if applied else "NOT_RUN"
    wp_ready = "YES" if applied else "NO"
    status = "REPAIRED" if applied else (
        "DECISION_READY" if analysis["decision"] != "SEMANTICS_AMBIGUOUS" else "SEMANTICS_AMBIGUOUS"
    )

    matrix_rows.append(
        {
            "KLEE Alarm ID": alarm_id,
            "Function": row["Function"],
            "Source Occurrence": (
                f"{row['Original Source File']}:{row['Original Source Line']} occurrence {row['Occurrence']}; "
                f"{source}:{current_line}"
            ),
            "Alarm Kind": row["Alarm Kind"],
            "Eva Property": row["Raw Eva Property"],
            "Concrete Counterexample": row["Concrete Inputs"],
            "Semantic Decision": analysis["decision"],
            "Decision Confidence": analysis["confidence"],
            "Selected Repair": analysis["selected"],
            "Primary Repair Alarm": analysis["primary"],
            "Shared Repair Group": GROUPS[alarm_id],
            "Repair Commit": repair_commit,
            "Runtime-only Cross-effects": analysis["runtime"],
            "ACSL Preserved?": "YES" if applied else "UNCHANGED / NOT APPLIED",
            "Parser Check": parser_check,
            "WP Ready?": wp_ready,
            "Notes": status,
        }
    )

    if applied:
        second_rows.append(
            {
                "KLEE Alarm ID": alarm_id,
                "Function": row["Function"],
                "ACSL Label": row["ACSL Label"],
                "Eva Property": row["Raw Eva Property"],
                "Repair Commit": repair_commit,
                "Source File": source,
                "Current Assertion Location": f"{source}:{current_line}",
                "WP Status": "NOT_RUN",
            }
        )

    direction_detail = ""
    if alarm_id in SHIFT_CALLERS:
        direction = "left" if "<<" in row["Original Expression"] else "right"
        direction_detail = (
            f"- Shift direction: `{direction}`\n"
            "- Operand: unsigned 32-bit product word (`u32`)\n"
            "- Shift-count type: `u32`\n"
            f"- Known caller/domain: `{analysis['callers']}`\n"
        )

    document = f"""# Target

- KLEE Alarm ID: `{alarm_id}`
- Function / physical function: `{row['Function']}`
- Original occurrence: `{row['Original Source File']}:{row['Original Source Line']}` occurrence `{row['Occurrence']}`
- Current repaired-tree assertion: `{source}:{current_line}`
- Exact current statement after the assertion: `{current_statement}`
- Affected callers: {analysis['callers']}
{direction_detail}
# Eva Alarm

- Kind: `{row['Alarm Kind']}`
- Original expression: `{row['Original Expression']}`
- Raw predicate: `{row['Raw Eva Property']}`

# KLEE Counterexample

- Concrete values: `{row['Concrete Inputs']}`
- Target assertion: `{row['KLEE Target Assertion']}`
- KTest: `{row['KTest']}`
- Target error: `{row['Target Error Evidence']}`
- Timeout after witness: `{row['Timeout After Witness?']}`

The witness reaches this occurrence and falsifies the selected Eva safety predicate under the frozen KLEE model.

# Existing Code

`{row['Original Expression']}` occurs in `{row['Function']}`. The current executable statement is
`{current_statement}`. `src_original` and `src_analysis` retain the frozen pre-repair operation.

# Safety Property

- ACSL label: `{row['ACSL Label']}`
- Inserted property: `{row['Inserted ACSL Property']}`
- Preservation rule: the label and predicate meaning must remain unchanged.

# Semantic Evidence

{analysis['evidence']}

# Candidate Repairs

{analysis['candidates']}

# Rejected Repair Alternatives

{analysis['rejected']}

# Selected Repair

{analysis['selected']}

# Why Selected Repair Preserves Intended Semantics

{analysis['why']}

# Shared-Occurrence Effects

{analysis['related']}

# Runtime-Only Cross-Effects

{analysis['runtime']}

# Final Decision Confidence

- Classification: `{analysis['decision']}`
- Confidence: {analysis['confidence']}
- Application status: `{status}`
- Repair commit: `{repair_commit}`
- Parser check: `{parser_check}`
- Future WP status: `{'NOT_RUN' if applied else 'NOT_ELIGIBLE'}`
"""
    (TARGET_DIR / f"{alarm_id}.md").write_text(document, encoding="utf-8")

matrix_headers = [
    "KLEE Alarm ID", "Function", "Source Occurrence", "Alarm Kind", "Eva Property",
    "Concrete Counterexample", "Semantic Decision", "Decision Confidence", "Selected Repair",
    "Primary Repair Alarm", "Shared Repair Group", "Repair Commit", "Runtime-only Cross-effects",
    "ACSL Preserved?", "Parser Check", "WP Ready?", "Notes",
]
write_tsv(PHASE / "REPAIR_POLICY_MATRIX.tsv", matrix_headers, matrix_rows)

second_headers = [
    "KLEE Alarm ID", "Function", "ACSL Label", "Eva Property", "Repair Commit", "Source File",
    "Current Assertion Location", "WP Status",
]
write_tsv(PHASE / "WP_SECOND_CAMPAIGN_MANIFEST.tsv", second_headers, second_rows)

current_headers = confirmed_headers + [
    "Historical Repair Status", "Historical Repair Commit", "Policy Phase Decision",
    "Latest Repair Status", "Latest Repair Commit", "Policy Phase Record",
]
current_rows: list[dict[str, str]] = []
matrix_by_id = {row["KLEE Alarm ID"]: row for row in matrix_rows}
for row in confirmed_rows:
    item = dict(row)
    item["Historical Repair Status"] = row["Repair Status"]
    item["Historical Repair Commit"] = row["Repair Commit"]
    if row["KLEE Alarm ID"] in matrix_by_id:
        policy = matrix_by_id[row["KLEE Alarm ID"]]
        item["Policy Phase Decision"] = policy["Semantic Decision"]
        item["Latest Repair Status"] = "REPAIRED" if policy["WP Ready?"] == "YES" else "REPAIR_POLICY_REQUIRED"
        item["Latest Repair Commit"] = policy["Repair Commit"]
        item["Policy Phase Record"] = f"analysis/repair_policy_phase/targets/{row['KLEE Alarm ID']}.md"
    else:
        item["Policy Phase Decision"] = "NOT_IN_POLICY_PHASE"
        item["Latest Repair Status"] = row["Repair Status"]
        item["Latest Repair Commit"] = row["Repair Commit"]
        item["Policy Phase Record"] = "NOT_APPLICABLE"
    current_rows.append(item)
write_tsv(PHASE / "CURRENT_48_CONFIRMED_REPAIR_STATUS.tsv", current_headers, current_rows)

new_count = len(second_rows)
ambiguous = [row["KLEE Alarm ID"] for row in matrix_rows if row["Semantic Decision"] == "SEMANTICS_AMBIGUOUS"]
decided_not_applied = [
    row["KLEE Alarm ID"] for row in matrix_rows
    if row["Semantic Decision"] != "SEMANTICS_AMBIGUOUS" and row["WP Ready?"] == "NO"
]
summary = f"""# Repair-Policy Resolution Summary

## Methodology

This phase starts from `thesis/wp-terminal-campaign-analyzed` and uses only frozen Eva, KLEE,
repair, source, and Git-history evidence. No Eva, KLEE, WP, GUI, or target launcher was run. Each
decision is occurrence-aware and preserves the original ACSL label and predicate meaning.

## Accounting

- Confirmed KLEE targets: 48
- Previously repaired and WP-verified: 32
- Initial policy-required targets: 16
- Newly repaired in this phase: {new_count}
- Semantics ambiguous: {len(ambiguous)}
- Repairable decisions awaiting application: {len(decided_not_applied)}
- Total repaired: {32 + new_count}/48
- Total WP-ready: {32 + new_count}/48

## Semantic decisions and groups

- Thirteen root shift-count targets remain ambiguous. Known callers supply fixed valid counts, but
  no repository evidence defines direct-call behavior outside those domains.
- `KLEE-ALARM-0061` and `KLEE-ALARM-0066` share a formula-preserving signed-remainder doubling repair.
- `KLEE-ALARM-0144` uses an unsigned-magnitude exceptional path consistent with the division formula
  and sibling implementation.

## Runtime-only interactions

- `0061`/`0066` share physical operations with runtime-only `0062`/`0067`; their assertions remain
  unchanged on the retained shift paths and are not reclassified.
- `0144` bypasses runtime-only `0145` through `0149` only for the signed-minimum numerator path;
  their ordinary path and classification remain unchanged.

## ACSL and validation

All original predicates remain unchanged. Parser/syntax results and repair commit hashes are recorded
in `REPAIR_POLICY_MATRIX.tsv`. `WP_SECOND_CAMPAIGN_MANIFEST.tsv` contains only applied repairs and every
row remains `NOT_RUN`.

## Limitations

Ambiguous target IDs: {', '.join(ambiguous) if ambiguous else 'NONE'}.
Repairable but not yet applied: {', '.join(decided_not_applied) if decided_not_applied else 'NONE'}.
No proof conclusion is made for the second campaign in this phase.
"""
(PHASE / "REPAIR_POLICY_SUMMARY.md").write_text(summary, encoding="utf-8")

print(f"policy targets={len(matrix_rows)}")
print(f"new repairs={new_count}")
print(f"ambiguous={len(ambiguous)}")
print(f"decision-ready={len(decided_not_applied)}")
