# Eva High-Precision Study

## Purpose

This directory defines the reproducible high-precision phase for the 46 functions already analyzed during the Baseline phase. The scientific comparison is:

```text
Baseline Eva configuration
vs.
High-Precision Eva configuration
```

The benchmark inputs and program model are intentionally unchanged. Each high-precision runner reuses the exact Baseline harness, full abstract input domains, source and helper list, `ppc_32` machine model, include path, `eva_main` entry point, and parse/save procedure. Only the Eva-stage precision configuration and the result root differ.

The following paths are immutable for this phase:

```text
src_original/
src_analysis/
harnesses/
results/baseline/
reports/alarm_details/
```

No source patch, ACSL assumption, harness restriction, alarm suppression, or function exclusion is part of this study.

## Inventory

- `functions.txt` contains the 46 function names, one per line.
- `manifest.tsv` maps every function to its Baseline runner, high-precision runner, harness, exact source list, result directories, priority, alarm detail, and work note.
- The priority is derived from the existing `harnesses/P0` or `harnesses/P1` path.
- All 46 Baseline runner, harness, result-directory, and alarm-detail name sets were checked for exact equality before this scaffold was created.
- Every Baseline result directory was checked to contain exactly its parse log/save and Eva log/save artifacts.

## Environment

The installed tool is Frama-C `33.0 (Arsenic)`. Captured local outputs are recorded below; trailing whitespace is normalized so Git whitespace validation remains clean:

- `eva_environment.txt`: `frama-c -version`
- `eva_options_available.txt`: `frama-c -eva-help`
- `eva_domains_available.txt`: `frama-c -eva-domains help`

Only options accepted by this installation are used. The complete final profile is justified in `precision_profile.md`.

## High-precision Eva profile

Every individual runner uses the same Eva command profile:

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

The `-eva-precision 11` meta-option provides the common high-precision base. In Arsenic it configures, among other settings, `slevel=5000`, `plevel=2000`, `partition-history=2`, automatic loop unrolling up to 1024, minimum loop unrolling of 4, widening delay 6, integer-set level 256, non-linear subdivision 220, the `cvalue`, `symbolic-locations`, `equality`, `gauges`, and `octagon` domains, automatic return splitting, formal-argument equalities through calls, and octagons through calls.

Explicit options follow the meta-option to make intentional changes readable:

- `bitwise` is added because the study contains shifts, masks, rotations, and fixed-point integer code.
- Equality propagation is raised from `formals` to `all` to retain relations between arguments, temporaries, guards, and later arithmetic across helper calls.
- Octagon propagation is explicitly retained across calls for integer relations around helpers such as `MulHighWord`.
- Split and branch history are retained through function returns.
- Return states are kept in full instead of the precision-11 `auto` strategy; the functions are analyzed individually and are small enough to justify this more expensive choice.
- Non-linear subdivision is raised from 220 to 500 for multiplication-heavy code.
- Integer-set precision is raised from 256 to 1024 to delay conversion of finite integer sets into interval/congruence abstractions.

The meta-option's `slevel=5000`, `plevel=2000`, and `partition-history=2` are retained without redundant explicit overrides. Function-specific precision overrides are intentionally not used: a uniform profile is required for the 46-way comparison.

## Domain strategy

The main profile uses only supported, non-experimental domains that are relevant to this codebase:

- `cvalue`: mandatory base value and memory domain.
- `equality`: equalities between syntactic expressions and temporary variables.
- `symbolic-locations`: values behind imprecise lvalues.
- `gauges`: loop-counter-related linear inequalities.
- `octagon`: relations of the form `b < +/-X +/-Y < e`.
- `bitwise`: bit-level information for shifts, masks, rotations, and fixed-point operations.

The installed build does not list APRON domains. Experimental domains (`multidim`, `taint`, `numerors`, and `traces`) are excluded from the common benchmark. They may be evaluated later in separate experiments, but not mixed into this profile.

## Runner behavior

Individual runners live at:

```text
scripts/high_precision/run_<FUNCTION>_high_precision.sh
```

From the repository root, run one function with:

```bash
./scripts/high_precision/run_<FUNCTION>_high_precision.sh
```

The optional sequential orchestrator is:

```bash
./scripts/high_precision/run_all_high_precision.sh
```

It deliberately does not run analyses in parallel because this profile can consume substantial CPU and memory.

Each individual runner creates exactly four files when it is actually executed:

```text
results/high_precision/<FUNCTION>/<FUNCTION>_parse.log
results/high_precision/<FUNCTION>/<FUNCTION>_parse.sav
results/high_precision/<FUNCTION>/<FUNCTION>_eva.log
results/high_precision/<FUNCTION>/<FUNCTION>_eva.sav
```

No high-precision runner was executed while creating this scaffold. The result tree therefore contains no analysis artifact.

## Comparison workflow

For a function `<FUNCTION>`:

1. Run its individual high-precision runner.
2. Compare the Baseline and high-precision parse logs to confirm equivalent parsing inputs and diagnostics.
3. Compare Eva logs for alarm counts and statuses, reachability, final states, inferred intervals, and precision messages.
4. Use the saved projects for deeper inspection if required.
5. Keep runtime and memory cost separate from semantic precision when evaluating the profile.

The primary pairs are:

```text
results/baseline/<FUNCTION>/
results/high_precision/<FUNCTION>/
```

Reports produced from later comparisons belong under `reports/high_precision/`; no comparison report is generated by the runners themselves.
