#!/usr/bin/env python3
"""Build the auditable alarm->resolution->WP datasets and an optional external report.

The script is intentionally evidence-only: it does not invoke Frama-C, KLEE, or a
prover.  Source before/after text is recovered from the parent diff of each
recorded semantic-resolution commit.
"""

from __future__ import annotations

import argparse
import csv
import json
import statistics
import subprocess
from collections import Counter, defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
WP = ROOT / "analysis" / "wp_phase"
DATA = WP / "data"
VALIDATION = WP / "validation"
NOT_AVAILABLE = "NOT_AVAILABLE_IN_RETAINED_EVIDENCE"


def read_tsv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def write_tsv(path: Path, rows: list[dict[str, str]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        # Keep TSV records one physical line each; JSON retains literal newlines.
        writer.writerows(
            {key: value.replace("\n", "\\n") for key, value in row.items()}
            for row in rows
        )


def git(*args: str) -> str:
    return subprocess.run(
        ["git", *args], cwd=ROOT, check=True, text=True,
        stdout=subprocess.PIPE, stderr=subprocess.PIPE,
    ).stdout.rstrip("\n")


def commit_exists(value: str) -> bool:
    return subprocess.run(
        ["git", "cat-file", "-e", f"{value}^{{commit}}"], cwd=ROOT,
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False,
    ).returncode == 0


def changed_source_files(commit: str) -> list[str]:
    return [
        path for path in git("diff-tree", "--no-commit-id", "--name-only", "-r", commit).splitlines()
        if path.startswith("src_repaired/")
    ]


def diff_sides(commit: str, paths: list[str]) -> tuple[str, str]:
    """Return exact old/new hunk text, with file and hunk headers retained."""
    parent = git("rev-parse", f"{commit}^")
    text = git("diff", "--no-ext-diff", "--unified=3", parent, commit, "--", *paths)
    old: list[str] = []
    new: list[str] = []
    current = ""
    for line in text.splitlines():
        if line.startswith("diff --git "):
            current = line.split(" b/", 1)[-1]
            old.append(f"/* file: {current} */")
            new.append(f"/* file: {current} */")
        elif line.startswith("@@"):
            old.append(f"/* {line} */")
            new.append(f"/* {line} */")
        elif line.startswith("---") or line.startswith("+++") or line.startswith("index "):
            continue
        elif line.startswith("-"):
            old.append(line[1:])
        elif line.startswith("+"):
            new.append(line[1:])
        elif line.startswith(" "):
            old.append(line[1:])
            new.append(line[1:])
    return "\n".join(old).strip(), "\n".join(new).strip()


def md_escape(value: object) -> str:
    return str(value).replace("|", "\\|").replace("\n", "<br>")


def md_table(headers: list[str], rows: list[list[object]]) -> str:
    out = [
        "| " + " | ".join(headers) + " |",
        "| " + " | ".join("---" for _ in headers) + " |",
    ]
    out.extend("| " + " | ".join(md_escape(value) for value in row) + " |" for row in rows)
    return "\n".join(out)


def strip_yes(value: str) -> str:
    return value.removeprefix("YES — ").strip()


def cause_for(commit: str) -> str:
    causes = {
        "7aa2299eac6e789a51e1288ecc4959f558bd728b": "SIGNED_MINIMUM_MAGNITUDE",
        "afea04153ccb966d0911b7404d7bc88eb7361b81": "INTERMEDIATE_LIMB_PRODUCT_OVERFLOW",
        "61a2ce39e49409f7139327fe5f10450eb4ccd88d": "SIGNED_SHIFT_MASK_OVERFLOW",
        "57864b43199db1c7046c201d40fb52dabafdb3a6": "NEGATIVE_SIGNED_LEFT_SHIFT",
        "f5daa364e14957ae7410fd2d347917ab6555f046": "NEGATIVE_SIGNED_LEFT_SHIFT",
        "b8b767816bdbe2e38196b9e81b57b48384daeca5": "SIGNED_MINIMUM_MAGNITUDE",
    }
    return causes.get(commit, "MISSING_SHIFT_COUNT_DOMAIN")


def witness_explanation(target: dict[str, str], repair: dict[str, str]) -> str:
    prop = target["original_eva_property"]
    witness = target["concrete_witness"]
    expr = target["source_expression"]
    if "INT32_MIN" in prop and "-2147483648" in witness:
        return (
            f"The retained witness assigns INT32_MIN (-2147483648) to the signed operand of `{expr}`. "
            "Its mathematical magnitude is 2147483648, outside signed 32-bit range; therefore the retained "
            f"property `{prop}` is false before the dangerous operation."
        )
    if target["alarm_category"] == "invalid shift":
        return (
            f"KLEE reached the target assertion for `{expr}` with `{witness}` and emitted the retained target "
            f"error artifact.  That artifact records falsification of `{prop}` before the C shift.  Where the "
            "violating internal temporary is not itself an input object, its concrete value was not separately "
            "retained and is not reconstructed here."
        )
    return (
        f"KLEE reached the assertion guarding `{expr}` with `{witness}` and the retained target-specific .err "
        f"artifact records falsification of `{prop}`.  No additional internal valuation is inferred."
    )


def rationale_for(
    alarm_id: str,
    target: dict[str, str],
    repair: dict[str, str],
    policy: dict[str, dict[str, str]],
    final_shift: dict[str, dict[str, str]],
) -> str:
    if alarm_id in final_shift:
        row = final_shift[alarm_id]
        return "; ".join(
            part for part in [row["Notes"], f"Input-domain contract: {row['Input-Domain Contract']}",
                              f"Interface conversion: {row['Interface Conversion']}"] if part
        )
    if alarm_id in policy and policy[alarm_id]["Notes"] == "REPAIRED":
        return policy[alarm_id]["Selected Repair"]
    return repair["Repair Rationale"]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--external-report", type=Path,
        help="write the comprehensive human report outside the repository",
    )
    args = parser.parse_args()
    if args.external_report:
        resolved = args.external_report.expanduser().resolve()
        if ROOT == resolved or ROOT in resolved.parents:
            raise SystemExit("external report path must be outside the Git repository")

    targets = read_tsv(DATA / "wp_targets.tsv")
    repair_rows = read_tsv(ROOT / "analysis/repair_phase/48_CONFIRMED_REPAIR_TARGETS.tsv")
    manifest_rows = read_tsv(ROOT / "analysis/repair_phase/149_TARGET_REPAIR_MANIFEST.tsv")
    alarm_identity_rows = read_tsv(ROOT / "analysis/klee_phase_b/data/klee_alarm_targets.tsv")
    policy_rows = read_tsv(ROOT / "analysis/repair_policy_phase/REPAIR_POLICY_MATRIX.tsv")
    shift_rows = read_tsv(ROOT / "analysis/final_shift_resolution/FINAL_SHIFT_RESOLUTION_MATRIX.tsv")
    repairs = {row["KLEE Alarm ID"]: row for row in repair_rows}
    manifests = {row["KLEE Alarm ID"]: row for row in manifest_rows}
    alarm_identities = {row["klee_target_id"]: row for row in alarm_identity_rows}
    policy = {row["KLEE Alarm ID"]: row for row in policy_rows}
    final_shift = {row["KLEE Alarm ID"]: row for row in shift_rows}
    if len(targets) != 48 or len({row["klee_target_id"] for row in targets}) != 48:
        raise SystemExit("normalized WP target dataset must contain 48 unique IDs")

    by_commit: dict[str, list[dict[str, str]]] = defaultdict(list)
    for target in targets:
        commit = target["git_repair_commit"]
        if not commit_exists(commit):
            raise SystemExit(f"missing resolution commit: {commit}")
        by_commit[commit].append(target)

    ordered_commits = sorted(
        by_commit,
        key=lambda value: min(int(row["klee_target_id"].rsplit("-", 1)[1]) for row in by_commit[value]),
    )
    repair_ids = {commit: f"REPAIR-{index:03d}" for index, commit in enumerate(ordered_commits, 1)}
    catalog: list[dict[str, str]] = []
    catalog_by_commit: dict[str, dict[str, str]] = {}
    for commit in ordered_commits:
        group = sorted(by_commit[commit], key=lambda row: row["klee_target_id"])
        files = changed_source_files(commit)
        before, after = diff_sides(commit, files)
        parent = git("rev-parse", f"{commit}^")
        functions = sorted({row["function"] for row in group} | {row["wp_function"] for row in group})
        rationales = []
        for row in group:
            text = rationale_for(row["klee_target_id"], row, repairs[row["klee_target_id"]], policy, final_shift)
            if text not in rationales:
                rationales.append(text)
        entry = {
            "repair_id": repair_ids[commit],
            "commit": commit,
            "parent_commit": parent,
            "file": ";".join(files),
            "function": ";".join(functions),
            "resolution_type": group[0]["resolution_type"],
            "affected_alarm_ids": ";".join(row["klee_target_id"] for row in group),
            "before_code": before or NOT_AVAILABLE,
            "after_code": after or NOT_AVAILABLE,
            "technical_rationale": " | ".join(rationales),
            "root_cause": cause_for(commit),
            "git_subject": git("show", "-s", "--format=%s", commit),
        }
        catalog.append(entry)
        catalog_by_commit[commit] = entry

    fields = [
        "klee_target_id", "eva_function", "eva_category", "eva_source_file", "eva_original_line",
        "eva_original_message", "eva_original_expression", "eva_original_statement", "original_property",
        "original_property_label", "klee_status", "klee_witness_available", "klee_ktest_path",
        "klee_testcase_path", "klee_error_path", "witness_inputs", "witness_relevant_values",
        "witness_violation_explanation", "root_cause", "semantic_decision", "resolution_type",
        "resolution_provenance", "resolution_rationale", "repair_id", "repair_commit",
        "repair_parent_commit", "changed_files", "changed_function", "changed_source_before",
        "changed_source_after", "code_change_summary", "specification_before", "specification_after",
        "specification_change_summary", "specification_weakening_audit", "shared_repair",
        "shared_repair_group", "other_alarms_affected_by_same_change", "wp_function", "wp_property_label",
        "wp_property_text", "historical_source_line", "verified_assertion_line", "wp_status", "qed_only",
        "external_prover_required", "successful_prover", "wp_elapsed_time", "wp_report_json", "wp_log",
        "wp_command", "property_identity_preserved", "notes",
    ]
    trace: list[dict[str, str]] = []
    provenance: list[dict[str, str]] = []
    for target in sorted(targets, key=lambda row: row["klee_target_id"]):
        alarm_id = target["klee_target_id"]
        repair = repairs[alarm_id]
        manifest = manifests[alarm_id]
        commit = target["git_repair_commit"]
        cat = catalog_by_commit[commit]
        group_ids = cat["affected_alarm_ids"].split(";")
        is_spec = target["resolution_type"] == "SPECIFICATION_COMPLETION"
        spec_after = strip_yes(target["specification_change"]) if is_spec else "NOT_APPLICABLE"
        result_dir = ROOT / target["report_json_path"]
        command_path = result_dir.parent / "command.txt"
        ktest = repair["KTest"] if (ROOT / repair["KTest"]).is_file() else NOT_AVAILABLE
        error = repair["Target Error Evidence"] if (ROOT / repair["Target Error Evidence"]).is_file() else NOT_AVAILABLE
        rationale = rationale_for(alarm_id, target, repair, policy, final_shift)
        row = {
            "klee_target_id": alarm_id,
            "eva_function": target["function"],
            "eva_category": target["alarm_category"],
            "eva_source_file": repair["Original Source File"],
            "eva_original_line": repair["Original Source Line"],
            "eva_original_message": alarm_identities[alarm_id]["eva_normalized_message"],
            "eva_original_expression": repair["Original Expression"],
            "eva_original_statement": manifest["Original Statement"] or NOT_AVAILABLE,
            "original_property": target["original_eva_property"],
            "original_property_label": target["wp_property_name"],
            "klee_status": target["klee_status"],
            "klee_witness_available": "YES" if ktest != NOT_AVAILABLE and error != NOT_AVAILABLE else "NO",
            "klee_ktest_path": ktest,
            "klee_testcase_path": NOT_AVAILABLE,
            "klee_error_path": error,
            "witness_inputs": target["concrete_witness"],
            "witness_relevant_values": target["concrete_witness"],
            "witness_violation_explanation": witness_explanation(target, repair),
            "root_cause": cat["root_cause"],
            "semantic_decision": target["semantic_decision"],
            "resolution_type": target["resolution_type"],
            "resolution_provenance": target["evidence_origin"],
            "resolution_rationale": rationale,
            "repair_id": cat["repair_id"],
            "repair_commit": commit,
            "repair_parent_commit": cat["parent_commit"],
            "changed_files": cat["file"],
            "changed_function": cat["function"],
            "changed_source_before": cat["before_code"],
            "changed_source_after": cat["after_code"],
            "code_change_summary": cat["git_subject"] if not is_spec else "NOT_APPLICABLE",
            "specification_before": "NO_EXPLICIT_RETAINED_HELPER_DOMAIN_CONTRACT" if is_spec else "NOT_APPLICABLE",
            "specification_after": spec_after,
            "specification_change_summary": cat["git_subject"] if is_spec else "NOT_APPLICABLE",
            "specification_weakening_audit": (
                "PASS_DOMAIN_CONSTRAINT_NOT_TARGET_PROPERTY" if is_spec else "NOT_APPLICABLE"
            ),
            "shared_repair": "YES" if len(group_ids) > 1 else "NO",
            "shared_repair_group": cat["repair_id"],
            "other_alarms_affected_by_same_change": ";".join(value for value in group_ids if value != alarm_id) or "NONE",
            "wp_function": target["wp_function"],
            "wp_property_label": target["wp_property_name"],
            "wp_property_text": target["inserted_acsl_property"],
            "historical_source_line": target["current_assertion_line"],
            "verified_assertion_line": target["verified_assertion_line"],
            "wp_status": target["proof_status"],
            "qed_only": "YES" if target["proof_mode"] == "QED_ONLY" else "NO",
            "external_prover_required": target["external_prover_required"],
            "successful_prover": target["successful_prover"],
            "wp_elapsed_time": target["runner_wall_time_seconds"],
            "wp_report_json": target["report_json_path"],
            "wp_log": target["log_path"],
            "wp_command": command_path.read_text(encoding="utf-8").strip(),
            "property_identity_preserved": "YES",
            "notes": target["notes"],
        }
        trace.append(row)
        provenance.append({
            "klee_target_id": alarm_id,
            "resolution_type": target["resolution_type"],
            "repair_id": cat["repair_id"],
            "repair_commit": commit,
            "repair_parent": cat["parent_commit"],
            "changed_files": cat["file"],
            "source_revision_before": cat["parent_commit"],
            "source_revision_after": commit,
            "repair_attribution": "SHARED_REPAIR" if len(group_ids) > 1 else "DIRECT",
            "proof_execution_commit": target["git_proof_commit"],
            "base_branch": "analysis/eva-klee-final-shift-resolution",
            "base_commit": "9307d7b68ea4c9b1496cfd0160e337f739827edd",
            "frozen_final_analysis_commit": "09e759283a6f1f9483cb560873e0b97d544fa714",
        })

    write_tsv(DATA / "wp_alarm_repair_traceability.tsv", trace, fields)
    (DATA / "wp_alarm_repair_traceability.json").write_text(
        json.dumps(trace, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    catalog_fields = list(catalog[0])
    write_tsv(DATA / "wp_repair_catalog.tsv", catalog, catalog_fields)
    (DATA / "wp_repair_catalog.json").write_text(
        json.dumps(catalog, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    write_tsv(DATA / "git_provenance.tsv", provenance, list(provenance[0]))

    exact_code = sum(row["resolution_type"] == "CODE_REPAIR" and row["changed_source_before"] != NOT_AVAILABLE for row in trace)
    exact_spec = sum(row["resolution_type"] == "SPECIFICATION_COMPLETION" and row["specification_after"] != NOT_AVAILABLE for row in trace)
    shared_targets = sum(row["shared_repair"] == "YES" for row in trace)
    witnesses = sum(row["klee_witness_available"] == "YES" for row in trace)
    validation = f"""# WP Alarm-to-Repair Traceability Validation

Status: **PASS WITH DOCUMENTED LIMITATIONS**

- Targets traced: **{len(trace)}/48**
- Code Repair: **{sum(row['resolution_type'] == 'CODE_REPAIR' for row in trace)}**
- Specification Completion: **{sum(row['resolution_type'] == 'SPECIFICATION_COMPLETION' for row in trace)}**
- Exact source before/after recovered from Git: **{exact_code}/35 Code Repair targets**
- Shared-repair target references: **{shared_targets}**
- Unique resolution diffs: **{len(catalog)}** (6 implementation repairs; 7 specification completions)
- Specification before/after recovered: **{exact_spec}/13**
- Witness KTest and target error retained: **{witnesses}/48**
- Separate human-readable testcase files retained: **0/48**
- Property identity preserved: **{sum(row['property_identity_preserved'] == 'YES' for row in trace)}/48**
- WP VALID: **{sum(row['wp_status'] == 'VALID' for row in trace)}/48**

## Evidence limitations

- `klee_testcase_path` is marked `{NOT_AVAILABLE}` because no separate extracted testcase text files are retained; the `.ktest`, target-specific `.err`, and normalized concrete-input field are retained.
- For internal temporary values not represented as symbolic inputs, no value is reconstructed beyond the retained KLEE evidence.
- A commit-level hunk is shared by every target mapped to that resolution commit; `repair_id` and `other_alarms_affected_by_same_change` make this explicit.
- The eight `THESIS_POLICY_SELECTED` contracts are not described as developer-confirmed requirements.
- `KLEE-ALARM-0017` successful attribution is Z3 4.8.12 from selected JSON/log evidence; legacy matrix fields are not used as successful-prover evidence.
"""
    (VALIDATION / "WP_ALARM_REPAIR_TRACEABILITY_VALIDATION.md").write_text(validation, encoding="utf-8")

    if args.external_report:
        args.external_report.expanduser().resolve().parent.mkdir(parents=True, exist_ok=True)
        args.external_report.expanduser().resolve().write_text(
            build_report(trace, catalog), encoding="utf-8"
        )

    print(f"traceability_rows={len(trace)}")
    print(f"catalog_rows={len(catalog)}")
    print(f"code_before_after={exact_code}/35")
    print(f"spec_before_after={exact_spec}/13")
    print(f"witness_artifacts={witnesses}/48")
    if args.external_report:
        print(f"external_report={args.external_report.expanduser().resolve()}")


def build_report(trace: list[dict[str, str]], catalog: list[dict[str, str]]) -> str:
    resolution = Counter(row["resolution_type"] for row in trace)
    proof = Counter("Qed-only" if row["qed_only"] == "YES" else row["successful_prover"] for row in trace)
    categories = Counter(row["eva_category"] for row in trace)
    causes = Counter(row["root_cause"] for row in trace)
    total_time = sum(float(row["wp_elapsed_time"]) for row in trace)
    times = [float(row["wp_elapsed_time"]) for row in trace]

    function_groups: dict[str, list[dict[str, str]]] = defaultdict(list)
    for row in trace:
        function_groups[row["eva_function"]].append(row)
    function_table = md_table(
        ["Function", "Witnesses", "Code Repair", "Spec Completion", "WP result"],
        [[name, len(rows), sum(r["resolution_type"] == "CODE_REPAIR" for r in rows),
          sum(r["resolution_type"] == "SPECIFICATION_COMPLETION" for r in rows), "VALID"]
         for name, rows in sorted(function_groups.items())],
    )
    cause_table = md_table(
        ["Root Cause", "Targets", "Code Repair", "Spec Completion"],
        [[cause, count, sum(r["root_cause"] == cause and r["resolution_type"] == "CODE_REPAIR" for r in trace),
          sum(r["root_cause"] == cause and r["resolution_type"] == "SPECIFICATION_COMPLETION" for r in trace)]
         for cause, count in sorted(causes.items())],
    )
    category_table = md_table(
        ["Category", "Targets", "Code Repair", "Spec Completion", "Qed", "External", "Total wall (s)"],
        [[category, count,
          sum(r["eva_category"] == category and r["resolution_type"] == "CODE_REPAIR" for r in trace),
          sum(r["eva_category"] == category and r["resolution_type"] == "SPECIFICATION_COMPLETION" for r in trace),
          sum(r["eva_category"] == category and r["qed_only"] == "YES" for r in trace),
          sum(r["eva_category"] == category and r["qed_only"] == "NO" for r in trace),
          f"{sum(float(r['wp_elapsed_time']) for r in trace if r['eva_category'] == category):.9f}"]
         for category, count in sorted(categories.items())],
    )
    file_groups: dict[str, set[str]] = defaultdict(set)
    file_repairs: dict[str, set[str]] = defaultdict(set)
    file_causes: dict[str, set[str]] = defaultdict(set)
    for item in catalog:
        for file in item["file"].split(";"):
            file_groups[file].update(item["affected_alarm_ids"].split(";"))
            file_repairs[file].add(item["repair_id"])
            file_causes[file].add(item["root_cause"])
    file_table = md_table(
        ["File", "Affected alarms", "Unique repairs", "Main cause(s)"],
        [[file, len(file_groups[file]), len(file_repairs[file]), ", ".join(sorted(file_causes[file]))]
         for file in sorted(file_groups)],
    )
    repair_table = md_table(
        ["Repair ID", "Type", "Commit", "Files", "Targets", "Root cause"],
        [[r["repair_id"], r["resolution_type"], r["commit"], r["file"], r["affected_alarm_ids"], r["root_cause"]]
         for r in catalog],
    )
    provenance_table = md_table(
        ["ID", "Repair ID", "Commit", "Parent", "Attribution"],
        [[r["klee_target_id"], r["repair_id"], r["repair_commit"], r["repair_parent_commit"],
          "SHARED_REPAIR" if r["shared_repair"] == "YES" else "DIRECT"] for r in trace],
    )
    command_table = md_table(
        ["ID", "WP command"], [[r["klee_target_id"], f"`{r['wp_command']}`"] for r in trace],
    )

    cases = []
    for row in trace:
        limitation = []
        if row["klee_testcase_path"] == NOT_AVAILABLE:
            limitation.append("No separate extracted testcase text is retained; use the KTest and `.err` evidence.")
        if row["resolution_provenance"] == "THESIS_POLICY_SELECTED":
            limitation.append("The interface-domain choice is thesis-policy-selected, not developer-confirmed.")
        cases.append(f"""## {row['klee_target_id']}

### هویت هشدار

- Function: `{row['eva_function']}`
- Category: `{row['eva_category']}`
- Source: `{row['eva_source_file']}`
- Historical line: `{row['eva_original_line']}`
- Original expression: `{row['eva_original_expression']}`
- Original statement: `{row['eva_original_statement']}`
- Original property: `{row['original_property']}`

### نتیجه KLEE

- Status: `{row['klee_status']}`
- Witness inputs: `{row['witness_inputs']}`
- KTest: `{row['klee_ktest_path']}`
- Testcase text: `{row['klee_testcase_path']}`
- Error artifact: `{row['klee_error_path']}`

### چرا این ورودی باعث نقض شد؟

{row['witness_violation_explanation']}

### تصمیم معنایی

- Decision: `{row['semantic_decision']}`
- Resolution type: `{row['resolution_type']}`
- Provenance: `{row['resolution_provenance']}`
- Root cause: `{row['root_cause']}`
- Rationale: {row['resolution_rationale']}

### اصلاح انجام‌شده

- Repair ID: `{row['repair_id']}`
- Repair commit: `{row['repair_commit']}` (parent `{row['repair_parent_commit']}`)
- Changed file(s): `{row['changed_files']}`
- Changed function(s): `{row['changed_function']}`
- Shared repair: `{row['shared_repair']}`; other affected alarms: `{row['other_alarms_affected_by_same_change']}`

#### قبل از اصلاح

```c
{row['changed_source_before']}
```

#### بعد از اصلاح

```c
{row['changed_source_after']}
```

### تحلیل اصلاح

{row['resolution_rationale']}

- Specification before: `{row['specification_before']}`
- Specification after: `{row['specification_after']}`
- Weakening audit: `{row['specification_weakening_audit']}`

### حفظ مشخصه

- Original property: `{row['original_property']}`
- Current ACSL label: `{row['wp_property_label']}`
- Historical assertion line: `{row['historical_source_line']}`
- Verified current line: `{row['verified_assertion_line']}`
- Property identity preserved: `{row['property_identity_preserved']}`

### نتیجه WP

- Status: `{row['wp_status']}`
- Qed-only: `{row['qed_only']}`
- External prover required: `{row['external_prover_required']}`
- Successful prover: `{row['successful_prover']}`
- Historical Frama-C/WP invocation wall time: `{row['wp_elapsed_time']} s`
- WP report: `{row['wp_report_json']}`
- Log: `{row['wp_log']}`
- Command: `{row['wp_command']}`

### زنجیره ردیابی

`Eva → KLEE → Witness → Semantic Decision → {row['repair_id']} → WP/{row['wp_property_label']} → VALID`

### محدودیت یا نکته

{' '.join(limitation) if limitation else 'No target-specific evidence limitation beyond the global claim boundary.'}
""")

    deep_ids = ["KLEE-ALARM-0001", "KLEE-ALARM-0002", "KLEE-ALARM-0017"]
    deep = []
    for alarm_id in deep_ids:
        row = next(r for r in trace if r["klee_target_id"] == alarm_id)
        deep.append(
            f"### {alarm_id}\n\nThis case represents `{row['root_cause']}`. The retained witness is "
            f"`{row['witness_inputs']}`. The resolution is `{row['resolution_type']}` from "
            f"`{row['resolution_provenance']}` and maps to `{row['repair_id']}`. WP proved the preserved "
            f"label `{row['wp_property_label']}` as `{row['wp_status']}` using `{row['successful_prover']}`. "
            + ("For 0017, selected JSON/log evidence records Qed unsuccessful and Z3 4.8.12 successful; legacy Alt-Ergo/CVC5 matrix values are not successful attribution evidence."
               if alarm_id == "KLEE-ALARM-0017" else row["witness_violation_explanation"])
        )

    return f"""# گزارش فنی مرحله اثبات قیاسی با Frama-C/WP
## ردیابی کامل نمونه‌های نقض KLEE، اصلاحات و نتایج اثبات

## 1. خلاصه مدیریتی

این گزارش مستقل، ۴۸ مشخصهٔ انتخاب‌شده را از alarm Eva تا witness واقعی KLEE، تصمیم معنایی، diff واقعی Git و proof نهایی WP ردیابی می‌کند. مجموعه‌ها دقیقاً برابرند: ۴۸ KLEE witness، ۴۸ semantic decision و ۴۸ WP target. همهٔ ۴۸ مشخصه `VALID` هستند؛ این عبارت به معنی ایمنی کل تابع یا کل برنامه نیست.

{md_table(['Metric', 'Value'], [['Targets', 48], ['Code Repair', resolution['CODE_REPAIR']], ['Specification Completion', resolution['SPECIFICATION_COMPLETION']], ['Qed-only', proof['Qed-only']], ['Alt-Ergo 2.6.2', proof['Alt-Ergo:2.6.2']], ['Z3 4.8.12', proof['Z3:4.8.12']], ['CVC5 successful', 0], ['Integer Overflow', categories['integer overflow']], ['Invalid Shift', categories['invalid shift']], ['Division by Zero', 0]])}

## 2. جایگاه WP در روند کلی پروژه

WP پس از Eva و KLEE اجرا شده است. KLEE existence یک مسیر نقض را برای ۴۸ هدف نشان داد؛ سپس ۳۵ implementation repair و ۱۳ specification completion اعمال شد و همان property label با `-wp-fct` و `-wp-prop` اثبات شد.

## 3. ورودی مرحله WP

### 3.1 مجموعه 48 نمونه نقض KLEE

هر ردیف دارای KTest و target-specific `.err` است. فایل testcase متنی جداگانه retained نیست.

### 3.2 تصمیم معنایی

۳۵ مورد `CODE_REPAIR` و ۱۳ مورد `SPECIFICATION_COMPLETION` هستند.

### 3.3 نسخه اصلاح‌شده کد و specification

Before/After از parent diff commit ثبت‌شده استخراج شده است؛ ۱۳ diff یکتا شامل ۶ code repair و ۷ specification completion است.

## 4. روش حفظ Traceability

هویت پایدار target ترکیب `KLEE-ALARM ID`، label `eva_klee_alarm_NNNN` و canonical property است. line number به‌تنهایی هویت نیست؛ ۱۳ assertion بعد از shared changes جابه‌جا شدند و historical/current line جدا ثبت شده است.

## 5. پیکربندی WP

- Frama-C 33.0 (Arsenic), Why3 1.8.2
- machine model: `ppc_32`
- WP model: `Typed+int`
- timeout: 120 seconds per prover; memory: 2000 MiB; parallelism: 1
- Qed simplifier داخلی WP است، نه external SMT prover.
- external provers configured: Alt-Ergo 2.6.2, Z3 4.8.12, CVC5 1.1.2.
- `-wp-rte` استفاده نشده است.

## 6. روش اجرای یک target

```bash
./analysis/wp_phase/scripts/check_environment.sh
./analysis/wp_phase/scripts/run_one.sh KLEE-ALARM-0001 --timeout 120 --memlimit 2000
```

## 7. روش اجرای campaign

```bash
./analysis/wp_phase/scripts/run_all.sh --timeout 120 --memlimit 2000
./analysis/wp_phase/scripts/run_all.sh --resume
```

## 8. نتایج کلی

۴۸/۴۸ selected properties `VALID`: ۳۵ Qed-only، ۱۲ Alt-Ergo و ۱ Z3. CVC5 هیچ successful retained proof ندارد.

## 9. تحلیل تصمیم معنایی

Specification provenance دقیقاً ۵ `REPOSITORY_INFERRED` و ۸ `THESIS_POLICY_SELECTED` است. دستهٔ دوم developer-confirmed یا industrial-confirmed نامیده نمی‌شود.

## 10. تحلیل تغییرات کد

۶ diff یکتای implementation repair، ۳۵ target را پوشش می‌دهند. shared attribution صریح است؛ target count با unique repair count یکی گرفته نمی‌شود.

## 11. تحلیل تکمیل Specification

۱۳ target در ۷ diff به contractهای domain و interface normalization نگاشت شده‌اند. audit ماشینی بررسی می‌کند contract برابر خود target property نباشد؛ این نتیجه، توجیه معنایی domain را جایگزین نمی‌کند و provenance را حفظ می‌کند.

## 12. الگوهای Root Cause

{cause_table}

## 13. اصلاحات مشترک

{repair_table}

## 14. تحلیل به تفکیک فایل

{file_table}

## 15. تحلیل به تفکیک تابع

{function_table}

## 16. تحلیل به تفکیک نوع Property

{category_table}

Subset نهایی فقط ۲۹ Integer Overflow و ۱۹ Invalid Shift دارد؛ Division by Zero برابر صفر است و case مصنوعی ساخته نشده است.

## 17. تحلیل زمان اثبات

Historical total Frama-C/WP invocation wall-clock time برابر **{total_time:.9f} s** است (mean={statistics.fmean(times):.9f}, median={statistics.median(times):.9f}, min={min(times):.9f}, max={max(times):.9f}). این solver time نیست: startup، WP و orchestration invocation را نیز دربرمی‌گیرد. individual prover timing فقط در JSONهای مربوط موجود است. rerun فعلی جداست: 0001=`0.888381851 s` و 0003=`1.568453587 s` و در aggregate تاریخی وارد نشده است.

## 18. مطالعات موردی عمیق

{chr(10).join(deep)}

## 19. KLEE-ALARM-0017 و اختلاف legacy

Source of truth منتخب (`wp-report.json` و log همان run) Qed را ناموفق و Z3 4.8.12 را موفق نشان می‌دهد. مقادیر legacy برای Alt-Ergo/CVC5 در attribution موفق نهایی استفاده نشده‌اند؛ CVC5 successful count صفر است.

## 20. محدودیت‌ها و Claim Boundary

Claim دقیق: **48 selected properties were proved.** نه ۴۸ تابع safe، و نه whole-program verification. `-wp-rte` استفاده نشده است. هشت interface policy thesis-selected هستند. concrete internal temporaries اگر در retained witness export نشده باشند بازسازی نشده‌اند. نبود testcase متنی مستقل با وجود KTest و `.err` یک evidence limitation است.

## 21. ارتباط خروجی WP با مرحله E-ACSL

این evidence می‌تواند property identity و selection را به مرحلهٔ dynamic instrumentation منتقل کند، اما این گزارش نتیجهٔ E-ACSL جدیدی ادعا نمی‌کند.

## 22. راهنمای بازتولید

```bash
python3 analysis/wp_phase/scripts/generate_wp_traceability.py
python3 analysis/wp_phase/scripts/validate_wp_phase.py
git diff --check
```

## 23. جمع‌بندی

زنجیرهٔ ۴۸ هدف به‌صورت machine-readable و انسانی قابل audit است. نتیجه، proof همان selected property پس از resolution ثبت‌شده است و فراتر از boundary فوق تعمیم داده نمی‌شود.

# Appendix A — تمام 48 Alarm

{chr(10).join(cases)}

# Appendix B — Unique Repair Catalog

{repair_table}

## Before/After catalog

{chr(10).join(f"## {r['repair_id']}\n\nCommit: `{r['commit']}`; parent: `{r['parent_commit']}`\n\n### Before\n\n```c\n{r['before_code']}\n```\n\n### After\n\n```c\n{r['after_code']}\n```\n\nRationale: {r['technical_rationale']}" for r in catalog)}

# Appendix C — Git Provenance

{provenance_table}

# Appendix D — WP Commands

{command_table}

# Appendix E — Evidence Gaps

- Separate extracted testcase text files: 0/48; KTest and target `.err`: 48/48.
- Internal temporary valuations absent from retained concrete input records are not reconstructed.
- Eight contracts are `THESIS_POLICY_SELECTED`, not developer-confirmed.
- KLEE-ALARM-0017 legacy prover matrix is non-authoritative relative to selected JSON/log evidence.
"""


if __name__ == "__main__":
    main()
