# Methodology

## Independent Variable

The independent variable is the Eva precision configuration. The Baseline and High Precision executions operate on the same saved parse model for each function-specific experiment but use different Eva settings.

## Controlled Variables

The following were held constant per function:

- source code and helper-source list;
- `ppc_32` machine model;
- preprocessing include configuration;
- harness implementation;
- `eva_main` entry point;
- abstract input domain;
- source ordering and parse stage;
- target function and result assignment.

Byte comparison of all 46 Baseline/High Precision parse-log pairs found no differences. This supports the intended control: the meaningful experimental change is Eva precision, not parsing or program construction.

## Baseline

The committed function-specific Baseline runners use:

```text
-eva
-eva-slevel 1000
-eva-ilevel 256
```

Their parse stage supplies the target's exact source and helper list, its existing harness, `-machdep ppc_32`, project include path, `-main eva_main`, and a saved parse state.

## High Precision

The committed High Precision runners use the same parse inputs and add the common profile:

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

Every one of the 46 High Precision logs records the precision-11 meta-settings `slevel=5000`, `plevel=2000`, `partition-history=2`, `auto-loop-unroll=1024`, `min-loop-unroll=4`, and `widening-delay=6`.

## Outcome Metrics

The comparison measures:

- canonical Eva alarm count;
- `REMOVED`, `REMAINING`, and `NEW` multiset matches;
- alarm category;
- function-level count status;
- final-state textual status;
- parse-diagnostic agreement;
- analyzed-function and reached-statement summaries.

Kernel diagnostics and internal `missing_return` properties are not included in the primary Eva alarm count unless represented as the canonical comparison unit defined by the committed comparator.

## Causal-analysis procedure

For each of the 22 `REMOVED` entries, the study:

1. verified the exact Baseline marker and canonical absence in High Precision;
2. inspected the source expression and at least 15 surrounding lines;
3. resolved typedefs and C integer conversions under `ppc_32`;
4. identified guards, branches, copies, dependent temporaries, and helper calls;
5. checked parse-diagnostic, coverage, and final-state comparison evidence;
6. selected one primary mechanism and a confidence grade;
7. separated directly observed facts from interpretation.

## Mathematical validation

The frozen data satisfies:

```text
171 = 22 + 149
149 = 149 + 0
delta = new - removed = -22
```

Category totals are 118/100 for integer overflow, 20/16 for division by zero, and 33/33 for invalid shift. The 22 removals comprise 18 integer-overflow and four division-by-zero entries. Ten functions are reduced, 36 unchanged, and none increased.
