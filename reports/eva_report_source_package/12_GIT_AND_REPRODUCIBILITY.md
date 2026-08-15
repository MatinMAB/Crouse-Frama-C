# Git Traceability and Reproducibility

## DIRECT REPOSITORY EVIDENCE

## Branch progression

The local repository records the research progression through these branches:

```text
main
  └─ analysis/eva-high-precision
       └─ analysis/eva-high-precision-comparison
            └─ analysis/eva-precision-study-final
                 └─ docs/eva-report-evidence-package
```

The Baseline artifacts are in the history inherited by the High Precision branch. The High Precision scaffold, runners, and 46 result commits precede the comparison branch. Comparison tooling/results precede the final causal analysis and frozen reports. This package branches from the final freeze commit and adds documentation only.

## Stage anchors

| Stage | Full/short commit | Subject | Role |
| --- | --- | --- | --- |
| High Precision scaffold | `f2901e99a3c6b9fd23615410b3a18cfb7038a52f` (`f2901e9`) | `analysis(eva): add high-precision analysis scaffold` | environment, profile, functions and manifest |
| High Precision runners | `4a2eaa14fdd587863ba33220dfc5f61ad0f4e9e9` (`4a2eaa1`) | `tooling(eva): add high-precision runners for 46 functions` | 46 runners plus sequential orchestrator |
| Comparison tooling | `e7d2fb7b477e8c9f4ba537f7a7c4d1629324a9d0` (`e7d2fb7`) | `tooling(eva): add baseline high-precision comparator` | log-only comparator |
| Comparison results | `ed34fdc8b7f62bd361c545ac7834eb7be1028304` (`ed34fdc`) | `analysis(eva): add baseline high-precision comparison` | TSVs and 46 per-function comparisons |
| Causal analysis | `51bc816496b3a4dbd5b4819ef7deaac0755fc268` (`51bc816`) | `analysis(eva): add final removed-alarm causal analysis` | 22-row causal dataset and ten reduced-function reports |
| Final Eva report | `6b6a565a4fb01eadb593437f1b1617e13b92d486` (`6b6a565`) | `report(eva): add final Eva precision study report` | frozen report, summary, reproducibility guide |

The Baseline stages have 46 tracked harness paths, 46 Baseline runner paths, 46 Baseline result paths, and 46 alarm-detail paths. Each path's most recent introducing commit is recorded in `data/git_traceability.tsv` instead of relying on a manually shortened list.

## Forty-six High Precision result commits

The result commits, in `functions.txt` order, are:

| Function | Commit | Subject |
| --- | --- | --- |
| `root_s32_mul_s32_s16_fac_less1` | `531466e` | `analysis(eva): add high-precision results for root_s32_mul_s32_s16_fac_less1` |
| `root_s32_mul_s32_s8_fac_less1` | `6215601` | `analysis(eva): add high-precision results for root_s32_mul_s32_s8_fac_less1` |
| `root_s32_mul_s32_u16_fac_less1` | `a4fd523` | `analysis(eva): add high-precision results for root_s32_mul_s32_u16_fac_less1` |
| `root_s32_mul_s32_u8_fac_less1` | `957300d` | `analysis(eva): add high-precision results for root_s32_mul_s32_u8_fac_less1` |
| `root_u32_mul_u32_s16_fac_less1` | `9914297` | `analysis(eva): add high-precision results for root_u32_mul_u32_s16_fac_less1` |
| `root_u32_mul_u32_s32_fac_less1` | `b4ce31b` | `analysis(eva): add high-precision results for root_u32_mul_u32_s32_fac_less1` |
| `root_u32_mul_u32_s8_fac_less1` | `1f96643` | `analysis(eva): add high-precision results for root_u32_mul_u32_s8_fac_less1` |
| `rotateLeft` | `4a1359a` | `analysis(eva): add high-precision results for rotateLeft` |
| `rotateRight` | `16d797c` | `analysis(eva): add high-precision results for rotateRight` |
| `s16_cos_u32` | `9513870` | `analysis(eva): add high-precision results for s16_cos_u32` |
| `s16_div_s32_s16` | `e1eef17` | `analysis(eva): add high-precision results for s16_div_s32_s16` |
| `s16_div_s32_u32` | `92235e9` | `analysis(eva): add high-precision results for s16_div_s32_u32` |
| `s16_fac05_div_s16_s16` | `50f2754` | `analysis(eva): add high-precision results for s16_fac05_div_s16_s16` |
| `s16_fac05_div_s16_u16` | `3e1598d` | `analysis(eva): add high-precision results for s16_fac05_div_s16_u16` |
| `s16_hip1_s16_s8_s8_u16_fac1` | `1484e01` | `analysis(eva): add high-precision results for s16_hip1_s16_s8_s8_u16_fac1` |
| `s16_hip1_s16_u8_u8_u16_fac1` | `18a2c0b` | `analysis(eva): add high-precision results for s16_hip1_s16_u8_u8_u16_fac1` |
| `s16_mmv_s16_s16_s16_fac1` | `5c7c3cb` | `analysis(eva): add high-precision results for s16_mmv_s16_s16_s16_fac1` |
| `s16_mul_s16_s16_div_s16` | `e758377` | `analysis(eva): add high-precision results for s16_mul_s16_s16_div_s16` |
| `s16_mul_s16_s16_div_u16` | `a0a696c` | `analysis(eva): add high-precision results for s16_mul_s16_s16_div_u16` |
| `s16_mul_s16_u16_div_s16` | `089ebee` | `analysis(eva): add high-precision results for s16_mul_s16_u16_div_s16` |
| `s16_mul_s16_u16_fac025` | `4b71551` | `analysis(eva): add high-precision results for s16_mul_s16_u16_fac025` |
| `s16_mul_u16_s16_div_u16` | `f7948ac` | `analysis(eva): add high-precision results for s16_mul_u16_s16_div_u16` |
| `s16_sin_u32` | `f1f1bb0` | `analysis(eva): add high-precision results for s16_sin_u32` |
| `s16_tan_u32` | `2928b7f` | `analysis(eva): add high-precision results for s16_tan_u32` |
| `s32_div_s32_s32` | `80581f7` | `analysis(eva): add high-precision results for s32_div_s32_s32` |
| `s32_div_s32_u32` | `62f56d0` | `analysis(eva): add high-precision results for s32_div_s32_u32` |
| `s32_div_u32_s32` | `efe8e88` | `analysis(eva): add high-precision results for s32_div_u32_s32` |
| `s32_mul_s32_s16_fac2` | `c2d1fa4` | `analysis(eva): add high-precision results for s32_mul_s32_s16_fac2` |
| `s32_mul_s32_s32` | `99e28f0` | `analysis(eva): add high-precision results for s32_mul_s32_s32` |
| `s32_mul_s32_s32_fac2` | `398b1d9` | `analysis(eva): add high-precision results for s32_mul_s32_s32_fac2` |
| `s32_mul_s32_s32_fac_twopow_u8` | `2714cb3` | `analysis(eva): add high-precision results for s32_mul_s32_s32_fac_twopow_u8` |
| `s32_mul_s32_s8_fac2` | `b4506cf` | `analysis(eva): add high-precision results for s32_mul_s32_s8_fac2` |
| `s32_mul_s32_u16` | `c1bb17e` | `analysis(eva): add high-precision results for s32_mul_s32_u16` |
| `s32_mul_u32_s32` | `e29dc7d` | `analysis(eva): add high-precision results for s32_mul_u32_s32` |
| `u16_cos_u16` | `1dfa80b` | `analysis(eva): add high-precision results for u16_cos_u16` |
| `u16_div_s32_u16` | `7812609` | `analysis(eva): add high-precision results for u16_div_s32_u16` |
| `u16_mmv_u16_u16_s16_fac1` | `2126c85` | `analysis(eva): add high-precision results for u16_mmv_u16_u16_s16_fac1` |
| `u16_mul_s16_u16_div_s16` | `369ad98` | `analysis(eva): add high-precision results for u16_mul_s16_u16_div_s16` |
| `u16_mul_s16_u16_div_u16` | `598a96e` | `analysis(eva): add high-precision results for u16_mul_s16_u16_div_u16` |
| `u16_mul_u16_u8_fac8` | `4a01b59` | `analysis(eva): add high-precision results for u16_mul_u16_u8_fac8` |
| `u16_sin_u16` | `54d2f23` | `analysis(eva): add high-precision results for u16_sin_u16` |
| `u16_tan_u16` | `e8c1bae` | `analysis(eva): add high-precision results for u16_tan_u16` |
| `u32_div_s32_s32` | `d1acd39` | `analysis(eva): add high-precision results for u32_div_s32_s32` |
| `u32_div_s32_u32` | `349caee` | `analysis(eva): add high-precision results for u32_div_s32_u32` |
| `u32_div_u32_s32` | `fd2715f` | `analysis(eva): add high-precision results for u32_div_u32_s32` |
| `u32_mmv_u32_u32_s32_fac1` | `d341a4b` | `analysis(eva): add high-precision results for u32_mmv_u32_u32_s32_fac1` |

## Artifact model and counts

The selected function population has:

```text
46 Baseline result directories × 4 files = 184 artifacts
46 High Precision result directories × 4 files = 184 artifacts
```

Filesystem audit confirms both totals and reports no selected directory with a count other than four. A function's result commit stages only its directory, preserving one-function-to-one-commit traceability.

## Alarm detail and work notes

There are 46 `reports/alarm_details/*.md` files for the selected names, and all are tracked. There are also 46 matching `reports/work_notes/*_work_report.md` files on disk. `reports/work_notes/` is ignored by `.gitignore`; consequently Git reports zero tracked work-note files. Work notes provide local detailed context but do not serve as immutable numeric sources. The Eva logs and comparison TSVs remain authoritative for counts.

## Reproducibility commands

The commands below document the existing pipeline. They were not executed while creating this package.

Run one Baseline analysis in a separate reproducibility checkout:

```bash
./scripts/run_s32_mul_s32_u16_baseline.sh
```

Run its High Precision counterpart:

```bash
./scripts/high_precision/run_s32_mul_s32_u16_high_precision.sh
```

Inspect canonical alarm headers:

```bash
grep -n '\[eva:alarm\]' results/baseline/<FUNCTION>/<FUNCTION>_eva.log
grep -n '\[eva:alarm\]' results/high_precision/<FUNCTION>/<FUNCTION>_eva.log
```

Inspect summaries and final states:

```bash
grep -A140 'ANALYSIS SUMMARY' results/baseline/<FUNCTION>/<FUNCTION>_eva.log
grep -A140 'ANALYSIS SUMMARY' results/high_precision/<FUNCTION>/<FUNCTION>_eva.log
grep -A40 'Values at end of function <FUNCTION>:' results/*/<FUNCTION>/<FUNCTION>_eva.log
```

Compare parse logs:

```bash
cmp results/baseline/<FUNCTION>/<FUNCTION>_parse.log \
    results/high_precision/<FUNCTION>/<FUNCTION>_parse.log
```

Count selected artifacts:

```bash
find results/baseline -mindepth 2 -maxdepth 2 -type f | wc -l
find results/high_precision -mindepth 2 -maxdepth 2 -type f | wc -l
```

Rebuild comparison outputs in a separate checkout:

```bash
python3 scripts/comparison/compare_baseline_high_precision.py
```

Audit Git state:

```bash
git status
git diff --check
git log --oneline --decorate --graph
```

## Git commands in experiment context

- `git status` guarded every mutation and ensured only the intended function result or documentation package was present.
- `git diff` and `git diff --check` detected scope drift, whitespace errors, and changes to immutable inputs.
- `git add <exact path>` staged one harness, runner, result directory, report, or package scope rather than broad unrelated changes.
- `git commit` created auditable stage boundaries. One function result per commit allows later provenance lookup by result path.
- `git log -- <path>` links an artifact to the commit that introduced it.
- `git branch --show-current` and `git switch -c` anchor each experimental phase without rewriting earlier branches.
- No push is part of this package operation; commits remain local.

## Reproduction invariants

```text
functions = 46
baseline artifacts = 184
high precision artifacts = 184
baseline alarms = 171
high precision alarms = 149
removed + remaining = 22 + 149 = 171
remaining + new = 149 + 0 = 149
parse-log pair mismatches = 0
comparison invariant failures = 0
```

## TECHNICAL INTERPRETATION

The Git layout functions as an experimental ledger. It does not by itself establish semantic conclusions, but it makes each claim traceable to source, configuration, logs, tables, and introduction commits. Independent result commits are especially valuable when one function must later be reproduced or audited without conflating unrelated outputs.
