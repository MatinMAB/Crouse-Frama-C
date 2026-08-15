# High Precision Methodology

## DIRECT REPOSITORY EVIDENCE

## Motivation and control principle

The High Precision stage re-analyzes the exact 46-function population using the Baseline harnesses and parse inputs. It does not modify source, headers, helper closure, entry point, or input abstraction. The experimental variable is the Eva configuration after loading the saved parse state.

The profile was derived against Frama-C 33.0 (Arsenic). Environment, available-option, available-domain, and rationale records are committed in:

```text
analysis/high_precision/eva_environment.txt
analysis/high_precision/eva_options_available.txt
analysis/high_precision/eva_domains_available.txt
analysis/high_precision/precision_profile.md
```

## Architecture and naming

The stage adds:

```text
analysis/high_precision/
scripts/high_precision/run_<FUNCTION>_high_precision.sh
results/high_precision/<FUNCTION>/
```

`analysis/high_precision/functions.txt` contains exactly 46 names. `manifest.tsv` maps each name to the Baseline runner, High Precision runner, harness, sources, priorities, result directories, alarm detail, and work note.

Every result was executed sequentially and committed independently. The frozen tree contains 46 directories and 184 artifacts, exactly four per function.

## Parse equivalence

The High Precision parse command is semantically the Baseline parse command with only the output directory changed from `results/baseline` to `results/high_precision`. For each function it retains:

- `-machdep ppc_32`;
- the same `-cpp-extra-args`;
- the same target and helper source files;
- the same harness path;
- `-main eva_main`;
- a saved parse state and complete log.

All 46 corresponding parse logs are byte-identical. Comparison tooling records zero parse diagnostic mismatches.

## Exact High Precision Eva command

Representative runner: `scripts/high_precision/run_s32_mul_s32_u16_high_precision.sh`.

```bash
frama-c \
  -load "$DIR/${FUNC}_parse.sav" \
  -eva \
  -eva-precision 11 \
  -eva-domains cvalue,equality,symbolic-locations,gauges,octagon,bitwise \
  -eva-equality-through-calls all \
  -eva-octagon-through-calls \
  -eva-interprocedural-splits \
  -eva-interprocedural-history \
  -eva-split-return full \
  -eva-subdivide-non-linear 500 \
  -eva-ilevel 1024 \
  -save "$DIR/${FUNC}_eva.sav" \
  > "$DIR/${FUNC}_eva.log" 2>&1
```

Every one of the 46 runner files contains this common Eva profile. Function differences are limited to `FUNC`, harness, exact source/helper list, and result path inherited from the corresponding Baseline experiment.

## Meta-option evidence

All 46 High Precision Eva logs report the `precision 11` settings:

```text
slevel = 5000
plevel = 2000
partition-history = 2
auto-loop-unroll = 1024
min-loop-unroll = 4
widening-delay = 6
```

The explicit `-eva-ilevel 1024` follows the meta-option and intentionally overrides the finite integer-set threshold where applicable. Option ordering is therefore part of the recorded configuration.

## Scientific rationale by code pattern

### Integer and fixed-point arithmetic

Fixed-width code frequently combines promoted `s16`/`u16` operands with `s32` temporaries, thresholds, casts, and saturation branches. A simple interval can preserve independent bounds but not relations such as `temp == input`, `x-y <= c`, or a branch-specific correlation. Equality and octagon domains are therefore plausible aids, while cvalue remains the central scalar/memory abstraction.

### Division and remainder-style expressions

Several functions implement a rounded quotient through expressions equivalent to:

```c
remainder = x - ((x / y) * y);
result = x / y + remainder / y;
```

The mathematical dependency among the quotient, product, and original dividend is strong, but separate interval evaluation can produce a broad product and subtraction. `-eva-subdivide-non-linear 500`, larger integer sets, path partitions, and relational reduction can produce tighter enclosures.

### Multiplication

Products of independent abstract ranges are intrinsically nonlinear. Subdivision can split operand regions and evaluate products more tightly. It does not guarantee discharge: if the complete input domain contains combinations that remain represented by the predicate, a stronger profile may still report it.

### Branch guards

Zero checks, minimum-value exceptions, sign branches, and saturation thresholds constrain later arithmetic. `partition-history=2`, higher slevel, interprocedural history, and relational domains are intended to retain those facts longer before state joins.

### Temporary-variable relationships

The pattern:

```c
copy = original;
if (original != 0) {
    q = x / copy;
}
```

requires a relation between `copy` and `original`. The `equality` domain and equality propagation are directly relevant to this information shape. `s32_mul_s32_u16` contains exactly this source pattern.

### Helper calls

Some multiplication functions include `MulHword.c` and call `MulHighWord`. Equality/octagon propagation through calls, interprocedural splits/history, and full return-state splitting aim to avoid losing useful caller/callee correlations. The profile uses those mechanisms uniformly even for functions without helpers so the comparison remains standardized.

### Bit operations and shifts

The bitwise domain can retain mask and bit-pattern information unavailable to a pure interval. Symbolic locations support address relationships, and gauges can support induction-like evolution. However, a shift-count domain that includes values outside the word width is not automatically narrowed merely by adding relational domains. The observed invalid-shift population remains 33 in both modes.

## Execution and validation protocol

The 46 runners were executed sequentially. Each successful run was validated for:

- exactly four files;
- non-empty artifacts;
- no fatal parse failure marker;
- an `ANALYSIS SUMMARY` in the Eva log;
- no unrelated changed file;
- exact four-file staging;
- one independent result commit.

No group result commit was used. The ordered 46 commit inventory is in `data/git_traceability.tsv` and `12_GIT_AND_REPRODUCIBILITY.md`.

## Results directly associated with the profile

The High Precision run produces 149 canonical Eva alarms versus 171 in Baseline. Canonical multiset comparison gives 22 removed, 149 remaining, and zero new occurrences. Reached-statement counts and target final states were checked independently; all ten reduced functions retain identical target final-state text and identical statement coverage between modes.

## Performance evidence boundary

Timing was observed during execution but was not persisted as a complete tracked dataset, therefore no complete quantitative performance comparison is claimed. The profile's larger state budgets, domain product, nonlinear subdivision, and interprocedural partitioning imply additional expected computational work, but a repository-wide time or memory ratio is `NOT AVAILABLE IN TRACKED ARTIFACTS`.

## TECHNICAL INTERPRETATION

The profile was designed for maximum useful precision on small, independent integer functions, not for minimal runtime. Its uniform application strengthens comparability: a reduced count cannot be explained by choosing a custom profile after viewing one function's output. At the same time, all features changed together, so the experiment estimates their combined effect. It is not an option-by-option ablation study, and the exact contribution of one domain or flag cannot generally be isolated.
