# Eva Precision Study — Reproducibility Guide

## Frozen repository state

The experiment is organized through Git and should be reproduced from the committed Eva-study history on branch `analysis/eva-precision-study-final`. Key provenance points are:

```text
f2901e9 analysis(eva): add high-precision analysis scaffold
4a2eaa1 tooling(eva): add high-precision runners for 46 functions
e7d2fb7 tooling(eva): add baseline high-precision comparator
ed34fdc analysis(eva): add baseline high-precision comparison
51bc816 analysis(eva): add final removed-alarm causal analysis
```

The 46 High Precision executions each have an independent result commit after `4a2eaa1`. Baseline history likewise retains function-specific harnesses, runners, results, and alarm-detail reports.

## Required environment

- Frama-C 33.0 (Arsenic)
- Eva plugin supplied with that installation
- a shell capable of executing the committed Bash runners
- a repository checkout containing the committed `.log` and `.sav` artifacts

The recorded environment and option inventories are under `analysis/high_precision/`.

## Function set

`analysis/high_precision/functions.txt` is the sole ordered function manifest and contains 46 lines. `analysis/high_precision/manifest.tsv` maps each function to its Baseline runner, High Precision runner, harness, exact sources, and result directories.

Do not reconstruct the function set by scanning names or by memory. Validate it with:

```bash
wc -l analysis/high_precision/functions.txt
```

## Controlled program inputs

Every High Precision runner reuses the Baseline harness unchanged. Thus the abstract input construction, complete typedef domain, landmark inclusion, result type, target call, and `eva_main` entry point are identical. No comparison-time precondition or assumption is introduced.

The parse command preserves:

```text
-machdep ppc_32
-cpp-extra-args="-Isrc_analysis/headers"
the exact per-function source/helper list
the exact harness
-main eva_main
-save <parse-state>
```

## Runner naming and artifacts

Baseline runner:

```text
scripts/run_<FUNCTION>_baseline.sh
```

High Precision runner:

```text
scripts/high_precision/run_<FUNCTION>_high_precision.sh
```

Each successful mode produces exactly four artifacts:

```text
<FUNCTION>_parse.log
<FUNCTION>_parse.sav
<FUNCTION>_eva.log
<FUNCTION>_eva.sav
```

They are stored under `results/baseline/<FUNCTION>/` or `results/high_precision/<FUNCTION>/`. There are 46 High Precision directories and 184 committed High Precision artifacts.

## Analysis configurations

Baseline uses Eva with `-eva-slevel 1000` and `-eva-ilevel 256`.

High Precision uses:

```text
-eva
-eva-precision 11
-eva-domains cvalue,equality,symbolic-locations,gauges,octagon,bitwise
-eva-equality-through-calls all
-eva-octagon-through-calls
-eva-interprocedural-splits
-eva-interprocedural-history
-eva-split-return full
-eva-subdivide-non-linear 500
-eva-ilevel 1024
```

The logs record the precision-11 settings `slevel=5000`, `plevel=2000`, `partition-history=2`, `auto-loop-unroll=1024`, `min-loop-unroll=4`, and `widening-delay=6`.

## Re-running one analysis

For a clean reproduction checkout, execute runners sequentially. A single High Precision run is:

```bash
./scripts/high_precision/run_<FUNCTION>_high_precision.sh
```

Re-running is not part of the freeze operation and should be performed only in a separate reproducibility workspace, never by overwriting the frozen dataset.

## Reproducing the comparison

The comparator is:

```text
scripts/comparison/compare_baseline_high_precision.sh
```

Its committed invocation is documented in `analysis/high_precision_comparison/README.md`. It reads only the two result trees and creates canonical alarm multisets. A signature includes normalized source path, line, and normalized message; Unicode/ASCII operator variants and whitespace are normalized. Multiplicity is preserved.

The three match states are `REMOVED`, `REMAINING`, and `NEW`. Kernel warnings are kept separate from the primary `[eva:alarm]` population.

## Required invariants

For each function:

```text
baseline = removed + remaining
high_precision = remaining + new
delta = high_precision - baseline
delta = new - removed
```

Globally:

```text
baseline = 171
high_precision = 149
removed = 22
remaining = 149
new = 0
```

The function, category, and alarm-diff tables must reconcile to these totals. All 46 parse-log pairs must also retain equivalent diagnostics; the frozen dataset has zero parse mismatches.

## Causal-analysis reproduction

Select the 22 `REMOVED` rows from `analysis/high_precision_comparison/alarm_diff.tsv`. For each row, inspect the complete containing function and at least 15 lines around the source location, then cross-check both Eva logs, coverage, and final-state status. Record direct observations separately from mechanism inference. The resulting frozen table is `analysis/eva_precision_study_final/removed_alarm_analysis.tsv`.

## Scope boundary

This guide reproduces the Eva precision experiment and its comparison. It does not include symbolic witness construction or runtime classification. Those activities belong to a separate phase and must not alter the frozen Eva artifacts.
