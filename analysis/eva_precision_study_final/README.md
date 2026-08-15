# Eva Precision Study Final Dataset

This directory freezes the final analytical layer of the 46-function Eva precision experiment. It joins the already committed Baseline, High Precision, and comparison artifacts with a source-level causal analysis of the 22 comparison entries marked `REMOVED`.

## Inputs

The analysis is read-only with respect to:

- `analysis/high_precision_comparison/alarm_diff.tsv`
- `analysis/high_precision_comparison/function_summary.tsv`
- `analysis/high_precision_comparison/category_summary.tsv`
- Baseline and High Precision Eva and parse logs
- the unchanged C sources, headers, harnesses, and runners

No Eva run was performed for this dataset. No source, harness, runner, option, result, or input domain was modified.

## Selection and context review

Only canonical comparison rows whose status is `REMOVED` were selected. The selection contains 22 rows: 18 integer-overflow entries and four division-by-zero entries across ten functions. Each location was checked against at least the surrounding source block and, where necessary, the complete function body. Operand types, promotions, preceding guards, copied variables, helper boundaries, and dependent expressions were then recorded.

The primary table is `removed_alarm_analysis.tsv`. Its evidence fields deliberately separate:

- **Direct evidence:** text or structure present in committed logs and source, such as a Baseline marker, absence of its canonical counterpart in High Precision, an assignment, a guard, unchanged parse diagnostics, or unchanged coverage.
- **Technical inference:** a cautious explanation of which part of the combined profile most plausibly supplied the missing abstract information.

## Mechanism attribution

Each removed entry receives exactly one primary mechanism from the project taxonomy so aggregate counts do not double-count alarms. Secondary contributors may be discussed in prose. Confidence means:

- `HIGH`: source structure and observed change provide a particularly direct explanation.
- `MEDIUM`: the explanation is technically strong, but multiple simultaneously enabled features could contribute.
- `LOW`: the exact mechanism cannot be separated beyond the observed disappearance.

The experiment is not an ablation study. Precision level, domains, partitioning, call-boundary propagation, nonlinear subdivision, integer-set precision, and return splitting changed together. Consequently, a primary mechanism is a best-supported attribution, not proof that one command-line option alone caused the change.

## Files

- `removed_alarm_analysis.tsv`: 22 source-level alarm analyses.
- `removed_alarm_feature_summary.tsv`: primary mechanism and confidence totals.
- `reduced_function_summary.tsv`: the ten functions with reduced counts.
- `final_function_summary.tsv`: frozen 46-function comparison table.
- `final_category_summary.tsv`: frozen category totals.
- `methodology.md`: experimental design and measurements.
- `limitations.md`: interpretation boundaries.
- `per_function/`: detailed reports for the ten reduced functions.

## Scope boundary

This dataset explains the precision transition only. It does not determine runtime reachability of the reported conditions and does not contain witness generation. That independent task is reserved for the subsequent KLEE phase.
