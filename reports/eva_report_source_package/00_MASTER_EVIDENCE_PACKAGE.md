# Eva Precision Study — Master Evidence Package

This is a writing-source package, not a finished thesis chapter. It assembles repository facts, commands, configurations, tables, source excerpts, log-derived results, provenance, and bounded interpretations so another author can produce a 50–60 page report without reconstructing the experiment from scratch.

## Evidence convention

**DIRECT REPOSITORY EVIDENCE** identifies facts visible in source, harnesses, runners, logs, TSVs, reports, or Git.

**TECHNICAL INTERPRETATION** identifies a reasoned explanation. It is not presented as direct proof of an individual Eva option's contribution.

## 1. Project Context

The repository contains a fixed-width C arithmetic library analyzed with Frama-C Eva. The selected population covers signed and unsigned multiplication, division, combined multiply/divide scaling, rotation, MMV/HIP routines, trigonometric interfaces, high/low-word arithmetic, saturation paths, bit masks, and shifts.

The Eva phase has four completed analytical layers:

```text
Baseline Analysis
  -> High Precision Analysis
  -> Canonical Baseline/High Precision Comparison
  -> Removed-Alarm Source/Causal Analysis
```

The starting point for this package is the frozen branch `analysis/eva-precision-study-final` at `6b6a565`. The documentation branch is `docs/eva-report-evidence-package`.

## 2. Research Goal

The experiment measures the effect of replacing a substantial Baseline Eva configuration with one stronger common profile while holding the analyzed program constant per function. It asks whether richer relational domains, path partitioning, call/return information, larger integer sets, and nonlinear subdivision change the canonical `[eva:alarm]` population.

The package does not determine runtime reachability of individual conditions. That task is reserved for a later, independent witness phase.

## 3. Experimental Questions

1. How many canonical Eva alarm occurrences does each mode produce?
2. Which source/line/message signatures are removed, remain, or are new?
3. Which functions and categories change most?
4. Do alarm changes coincide with parse, coverage, or final-state changes?
5. What source relationships or control-flow patterns are consistent with each removal?
6. What claims remain unsupported without option ablation or concrete witnesses?

## 4. Repository Architecture

| Path | Evidence role |
| --- | --- |
| `src_original/` | preserved source snapshot |
| `src_analysis/` | analyzed source and headers |
| `harnesses/` | abstract `eva_main` entry points |
| `scripts/run_*_baseline.sh` | Baseline parse/Eva commands |
| `scripts/high_precision/` | common-profile High Precision commands |
| `results/baseline/` | 46 × four Baseline artifacts |
| `results/high_precision/` | 46 × four High Precision artifacts |
| `analysis/high_precision/` | function manifest, environment, profile |
| `scripts/comparison/` | reproducible log comparator |
| `analysis/high_precision_comparison/` | multiset comparison results |
| `analysis/eva_precision_study_final/` | 22-row causal dataset and freeze tables |
| `reports/eva_precision_study/` | frozen final Eva reports |
| `reports/eva_report_source_package/` | this evidence package |

No file outside the last path is modified by the package.

## 5. Function Population

DIRECT REPOSITORY EVIDENCE:

- `analysis/high_precision/functions.txt` has 46 lines.
- The manifest has 46 data rows.
- Priority distribution is 21 P0 and 25 P1.
- Every manifest name has one Baseline and one High Precision result directory.
- All 46 definitions and active header declarations have been located in `data/source_locations.tsv`.

The complete signatures, lines, sources, harnesses, runners, result paths, report paths, input expressions, operation profiles, counts, and statuses are in `data/functions.tsv` and `02_FUNCTION_INVENTORY.md`.

## 6. Baseline Analysis Design

The Baseline is function-specific. A runner parses the target source, only required helper source files, and one harness. It selects `eva_main`, saves the parse state/log, loads that state, executes Eva, and saves Eva state/log.

This is not a default-only run. The common Baseline Eva configuration is:

```text
-eva
-eva-slevel 1000
-eva-ilevel 256
```

The exact per-function source/helper lists are preserved in the manifest and runners.

## 7. Harness Strategy

Every harness uses project typedefs and `__fc_builtin.h`. Each target parameter receives one full-domain abstract interval; the target C symbol is called exactly once; its result is stored in the exact return type and referenced with `(void) result`.

Representative example:

```c
s32 value = Frama_C_long_interval(
    -2147483647L - 1L, 2147483647L);
u16 factor = Frama_C_unsigned_short_interval(0, 65535);
s32 result = s32_mul_s32_u16(value, factor);
(void) result;
```

The harnesses do not encode undocumented caller ranges, add assumptions, or substitute helper/assembly symbols.

## 8. Input Modeling Strategy

| Project type | Builtin | Full `ppc_32` domain |
| --- | --- | --- |
| `s8` | `(s8) Frama_C_int_interval` | `-128..127` |
| `u8` | `Frama_C_unsigned_char_interval` | `0..255` |
| `s16` | `Frama_C_short_interval` | `-32768..32767` |
| `u16` | `Frama_C_unsigned_short_interval` | `0..65535` |
| `s32` | `Frama_C_long_interval` | `-2147483648..2147483647` |
| `u32` | `Frama_C_unsigned_long_interval` | `0..4294967295` |

DIRECT REPOSITORY EVIDENCE: all selected harness assignment expressions are recorded verbatim-normalized in `data/functions.tsv`.

TECHNICAL INTERPRETATION: an abstract interval summarizes all concrete values in the range in one analysis. It is not an exhaustive loop over all tuples. Joins and non-relational operations may lose correlations, which is one motivation for the stronger profile.

## 9. Baseline Commands

Canonical parse structure verified from actual runners:

```bash
frama-c \
  -machdep ppc_32 \
  -cpp-extra-args="-Isrc_analysis/headers" \
  <exact target/helper sources> \
  <exact target harness> \
  -main eva_main \
  -save "$DIR/${FUNC}_parse.sav" \
  > "$DIR/${FUNC}_parse.log" 2>&1
```

Canonical Baseline Eva structure:

```bash
frama-c \
  -load "$DIR/${FUNC}_parse.sav" \
  -eva \
  -eva-slevel 1000 \
  -eva-ilevel 256 \
  -save "$DIR/${FUNC}_eva.sav" \
  > "$DIR/${FUNC}_eva.log" 2>&1
```

## 10. Baseline Eva Configuration

- `ppc_32` fixes 32-bit target semantics.
- `slevel=1000` provides semantic/path state budget.
- `ilevel=256` preserves finite integer sets to the configured threshold.
- No result-reducing assumption is added.
- Complete stdout/stderr is stored in logs.

The Baseline is the reference condition for all canonical multiset comparisons.

## 11. Baseline Artifacts

Each function has:

```text
<FUNCTION>_parse.log
<FUNCTION>_parse.sav
<FUNCTION>_eva.log
<FUNCTION>_eva.sav
```

Filesystem audit verifies 184 files and exactly four in every selected Baseline directory. The 46 alarm-detail reports summarize Baseline evidence; 46 ignored work notes provide local detail but are not the source of numerical totals.

## 12. Baseline Results

DIRECT REPOSITORY EVIDENCE:

| Category | Count |
| --- | ---: |
| integer overflow | 118 |
| division by zero | 20 |
| invalid shift | 33 |
| **Total** | **171** |

Thirteen functions have zero canonical Baseline alarms. Exact per-occurrence rows are in `data/baseline_alarm_inventory.tsv`.

## 13. High Precision Motivation

The source population contains patterns that challenge coarse independent intervals:

- copies guarded through an original variable;
- quotient/product/remainder dependencies;
- nonlinear multiplication;
- nested sign, zero, minimum-value, and saturation branches;
- helper-call boundaries;
- masks and bitwise combinations;
- variable shift counts;
- loops and table accesses.

TECHNICAL INTERPRETATION: relational domains, larger finite sets, partition history, deeper slevel, nonlinear subdivision, and call/return splitting can preserve information that a Baseline state may merge or approximate.

## 14. High Precision Branch and Architecture

Key commits:

```text
f2901e9 analysis(eva): add high-precision analysis scaffold
4a2eaa1 tooling(eva): add high-precision runners for 46 functions
```

The architecture mirrors Baseline under `scripts/high_precision/` and `results/high_precision/`. It reuses the Baseline harness and exact source list. A sequential orchestrator exists, but each target also retains an independent runner as the primary execution unit.

## 15. High Precision Configuration

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

All 46 logs record:

```text
slevel=5000
plevel=2000
partition-history=2
auto-loop-unroll=1024
min-loop-unroll=4
widening-delay=6
```

## 16. Detailed Explanation of Each Eva Option

| Option/domain | Evidence-based role | Expected benefit | Expected cost |
| --- | --- | --- | --- |
| `cvalue` | central scalar/memory value abstraction | baseline numeric/value information | standard Eva state cost |
| `equality` | expression/value equalities | preserves copy/temporary relationships | relational state/reductions |
| `symbolic-locations` | symbolic memory locations | stronger address relationships | symbolic memory processing |
| `gauges` | induction-like numeric relationships | loop/evolution precision | relational transfer |
| `octagon` | pairwise sum/difference constraints | preserves two-variable numeric relations | relational matrices/reduction |
| `bitwise` | bit-pattern abstraction | masks and bit operations | bit-level state |
| equality/octagon through calls | interprocedural relation retention | helper-boundary precision | larger call states |
| interprocedural splits/history | call-sensitive path history | retains branch provenance | state multiplication |
| split return full | separates return states | preserves path-specific return information | more caller states |
| nonlinear subdivision 500 | splits nonlinear evaluation | tighter products/remainders | repeated evaluation |
| ilevel 1024 | larger finite sets | retains discrete values longer | set memory/operations |
| precision 11 | coordinated meta-profile | higher path/loop/propagation settings | broad CPU/RAM increase |

No individual feature was ablated; this is a combined-profile table.

## 17. High Precision Execution

The 46 runners were executed sequentially. Every successful result was validated for four non-empty artifacts, absence of fatal parse failures, presence of `ANALYSIS SUMMARY`, narrow Git scope, and an independent function-result commit. The history contains exactly 46 matching result subjects after `4a2eaa1`.

Timing was observed during execution but was not persisted as a complete tracked dataset, therefore no complete quantitative performance comparison is claimed.

## 18. High Precision Artifacts

High Precision also has 184 artifacts: four per selected function. Every result directory is tracked. The full function-to-result-commit mapping appears in `data/git_traceability.tsv` and `12_GIT_AND_REPRODUCIBILITY.md`.

## 19. High Precision Results

| Category | Count |
| --- | ---: |
| integer overflow | 100 |
| division by zero | 16 |
| invalid shift | 33 |
| **Total** | **149** |

Thirteen functions have zero canonical alarms. Exact rows are in `data/high_precision_alarm_inventory.tsv`.

## 20. Baseline vs High Precision Comparison Method

The committed comparator reads only Eva logs and the ordered 46-function file. It extracts actual `[eva:alarm]` records, joins wrapped messages, assigns categories, normalizes signatures, and compares counters. Kernel warnings are not merged into the primary alarm population.

Comparison commits:

```text
e7d2fb7 tooling(eva): add baseline high-precision comparator
ed34fdc analysis(eva): add baseline high-precision comparison
```

## 21. Alarm Canonicalization

A canonical signature includes:

```text
normalized source path | line | normalized message
```

Whitespace and Unicode/ASCII operator variants such as `≢`/`!=` and `≤`/`<=` are normalized. This prevents display encoding alone from creating a new/removed pair.

## 22. Alarm Matching Algorithm

Matching is multiset-based. Multiplicity is retained. If Baseline contains two identical signatures and High Precision contains one, the result is one remaining and one removed occurrence.

For every function:

```text
baseline = removed + remaining
high = remaining + new
delta = high - baseline = new - removed
```

All 46 invariants pass.

## 23. Global Comparison Results

### Expected/verified audit

| Metric | Expected value | Verified value | Source file |
| --- | ---: | ---: | --- |
| Functions | 46 | 46 | `function_summary.tsv` |
| Baseline alarms | 171 | 171 | Eva logs / Baseline inventory |
| High Precision alarms | 149 | 149 | Eva logs / High inventory |
| Removed | 22 | 22 | `alarm_diff.tsv` |
| Remaining | 149 | 149 | `alarm_diff.tsv` |
| New | 0 | 0 | `alarm_diff.tsv` |
| Reduction | 22 | 22 | recomputed totals |
| Percentage reduction | 12.87% | 12.87% | `22/171*100` |
| Reduced functions | 10 | 10 | `function_summary.tsv` |
| Unchanged functions | 36 | 36 | `function_summary.tsv` |
| Increased functions | 0 | 0 | `function_summary.tsv` |
| Baseline zero | 13 | 13 | `function_summary.tsv` |
| High Precision zero | 13 | 13 | `function_summary.tsv` |

## 24. Per-Category Results

| Category | Baseline | High | Removed | Remaining | New | Delta | Reduction |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| integer overflow | 118 | 100 | 18 | 100 | 0 | -18 | 15.25% |
| division by zero | 20 | 16 | 4 | 16 | 0 | -4 | 20.00% |
| invalid shift | 33 | 33 | 0 | 33 | 0 | 0 | 0.00% |

DIRECT EVIDENCE: the shift population is unchanged under this profile. TECHNICAL INTERPRETATION: stronger relational precision does not necessarily constrain a full-domain shift parameter when the active source does not establish an in-range count.

## 25. Per-Function Results

| Function | Baseline | High | Delta | Removed | Remaining | New | Status |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| `root_s32_mul_s32_s16_fac_less1` | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| `root_s32_mul_s32_s8_fac_less1` | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| `root_s32_mul_s32_u16_fac_less1` | 4 | 4 | 0 | 0 | 4 | 0 | UNCHANGED |
| `root_s32_mul_s32_u8_fac_less1` | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| `root_u32_mul_u32_s16_fac_less1` | 2 | 2 | 0 | 0 | 2 | 0 | UNCHANGED |
| `root_u32_mul_u32_s32_fac_less1` | 4 | 4 | 0 | 0 | 4 | 0 | UNCHANGED |
| `root_u32_mul_u32_s8_fac_less1` | 2 | 2 | 0 | 0 | 2 | 0 | UNCHANGED |
| `rotateLeft` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `rotateRight` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `s16_cos_u32` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `s16_div_s32_s16` | 25 | 20 | -5 | 5 | 20 | 0 | REDUCED |
| `s16_div_s32_u32` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `s16_fac05_div_s16_s16` | 11 | 9 | -2 | 2 | 9 | 0 | REDUCED |
| `s16_fac05_div_s16_u16` | 5 | 5 | 0 | 0 | 5 | 0 | UNCHANGED |
| `s16_hip1_s16_s8_s8_u16_fac1` | 5 | 5 | 0 | 0 | 5 | 0 | UNCHANGED |
| `s16_hip1_s16_u8_u8_u16_fac1` | 5 | 5 | 0 | 0 | 5 | 0 | UNCHANGED |
| `s16_mmv_s16_s16_s16_fac1` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `s16_mul_s16_s16_div_s16` | 11 | 8 | -3 | 3 | 8 | 0 | REDUCED |
| `s16_mul_s16_s16_div_u16` | 7 | 5 | -2 | 2 | 5 | 0 | REDUCED |
| `s16_mul_s16_u16_div_s16` | 11 | 8 | -3 | 3 | 8 | 0 | REDUCED |
| `s16_mul_s16_u16_fac025` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `s16_mul_u16_s16_div_u16` | 7 | 6 | -1 | 1 | 6 | 0 | REDUCED |
| `s16_sin_u32` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `s16_tan_u32` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `s32_div_s32_s32` | 9 | 9 | 0 | 0 | 9 | 0 | UNCHANGED |
| `s32_div_s32_u32` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `s32_div_u32_s32` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `s32_mul_s32_s16_fac2` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `s32_mul_s32_s32` | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| `s32_mul_s32_s32_fac2` | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| `s32_mul_s32_s32_fac_twopow_u8` | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| `s32_mul_s32_s8_fac2` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `s32_mul_s32_u16` | 3 | 2 | -1 | 1 | 2 | 0 | REDUCED |
| `s32_mul_u32_s32` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `u16_cos_u16` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `u16_div_s32_u16` | 7 | 5 | -2 | 2 | 5 | 0 | REDUCED |
| `u16_mmv_u16_u16_s16_fac1` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `u16_mul_s16_u16_div_s16` | 11 | 9 | -2 | 2 | 9 | 0 | REDUCED |
| `u16_mul_s16_u16_div_u16` | 7 | 6 | -1 | 1 | 6 | 0 | REDUCED |
| `u16_mul_u16_u8_fac8` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `u16_sin_u16` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `u16_tan_u16` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `u32_div_s32_s32` | 9 | 9 | 0 | 0 | 9 | 0 | UNCHANGED |
| `u32_div_s32_u32` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `u32_div_u32_s32` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `u32_mmv_u32_u32_s32_fac1` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |

## 26. Removed Alarm Analysis

The 22 occurrences span ten functions and three source lines families: guarded division/remainder code in `div_Ccode.c` and one copied-divisor case in `mul_Ccode.c`. Operation classification from the final causal table is:

- 16 remainder-style subtraction bounds;
- one quotient-product bound;
- one signed quotient exceptional bound;
- four divisor nonzero bounds.

No removed occurrence is an invalid shift. Every row has exact source, line, message, expression, operand types, control guard, variables, direct evidence, interpretation, mechanism, and confidence in `data/removed_alarm_inventory.tsv`.

## 27. Causal Mechanism Attribution

| Primary mechanism | Count | HIGH | MEDIUM | LOW |
| --- | ---: | ---: | ---: | ---: |
| EQUALITY_RELATION | 1 | 1 | 0 | 0 |
| BRANCH_PARTITIONING | 6 | 0 | 6 | 0 |
| NONLINEAR_SUBDIVISION | 15 | 0 | 15 | 0 |

These are primary candidate labels. They avoid double counting but do not exclude secondary effects from other domains/settings.

## 28. Case Study 1

`s32_mul_s32_u16` changes from three to two occurrences. Source assigns `s32Factor = factor`, guards `factor != 0`, and later divides by `s32Factor` at line 760. Baseline reports a divisor condition there; High Precision does not. Both modes reach 31/31 statements and print identical target final states.

DIRECT EVIDENCE establishes the assignment, guard, divisor, and log transition. TECHNICAL INTERPRETATION assigns `EQUALITY_RELATION` with HIGH confidence because retaining `s32Factor == factor` transfers the nonzero branch fact to the copy. The combined profile prevents exclusive attribution to one option.

## 29. Case Study 2

`s16_div_s32_s16` changes from 25 to 20, the largest reduction. Three removed occurrences are at line 274 in the `denominator != 0` and `numerator != INT32_MIN` path; two are at line 297 in the `numerator == INT32_MIN`, `denominator != -1` path. Two line-274 remainder bounds are assigned nonlinear subdivision; the quotient exceptional bound and two nested-branch remainder bounds are assigned branch partitioning. Both runs reach 51/51 statements and have identical parse/final-state evidence.

## 30. Other Representative Functions

- `root_u32_mul_u32_s16_fac_less1`: two invalid-shift occurrences remain at lines 5309–5310 with a full-domain `u32 count`.
- `u16_sin_u16`: zero alarms in both modes, but High Precision prints a tighter/different target final state.
- `s32_mul_s32_s32`: three integer-overflow occurrences remain, including helper multiplication and full-domain unary negations.

These cases show that alarm count, final-state precision, and category response are distinct observations.

## 31. Git Traceability

The study uses one-function result commits. High Precision has 46 independent result commits after `4a2eaa1`. File-level traceability for harness, Baseline runner/result, alarm detail, High runner/result, and ignored work note is in `data/git_traceability.tsv` (328 data rows). Stage-level full hashes are in `12_GIT_AND_REPRODUCIBILITY.md`.

## 32. Reproducibility

Key checks:

```bash
wc -l analysis/high_precision/functions.txt
find results/baseline -mindepth 2 -maxdepth 2 -type f | wc -l
find results/high_precision -mindepth 2 -maxdepth 2 -type f | wc -l
cmp results/baseline/<F>/<F>_parse.log results/high_precision/<F>/<F>_parse.log
grep -n '\[eva:alarm\]' results/*/<F>/<F>_eva.log
python3 scripts/comparison/compare_baseline_high_precision.py
git status
git diff --check
```

Re-execution should occur in a separate checkout so frozen artifacts are not overwritten.

## 33. Experimental Controls

Held constant per function:

```text
source code
machine model
preprocessor include path
harness
entry point
input abstraction
source/helper list
parse stage
```

Independent variable: Eva precision profile. All 46 parse-log pairs are byte-identical, and there are zero semantic parse-diagnostic mismatches.

## 34. Threats to Validity

- no per-option ablation;
- combined feature interactions;
- abstract interpretation rather than concrete execution;
- full-domain harness may exceed deployed caller constraints;
- isolated-function context may omit application relations;
- `ppc_32` dependence;
- textual signature and final-state representation limits;
- incomplete tracked performance data;
- tool-version dependence;
- separation of kernel diagnostics from canonical Eva alarms.

## 35. Limitations

A remaining occurrence is not a concrete witness. A removed occurrence is not assigned a runtime class. A changed printed final state does not reveal every internal relation, and an identical final state does not prove identical intermediate abstract states. Timing/memory aggregates are `NOT AVAILABLE IN TRACKED ARTIFACTS`.

## 36. Final Eva Dataset

The frozen dataset comprises:

```text
46 Baseline runs / 184 artifacts
46 High Precision runs / 184 artifacts
171-row Baseline inventory
149-row High Precision inventory
171-row canonical comparison
22-row removed causal inventory
46-row function comparison
3-row category comparison
46 source-location rows
Git traceability
```

The validation equations are:

```text
171 = 22 + 149
149 = 149 + 0
22 = 18 integer overflow + 4 division by zero + 0 invalid shift
46 = 10 reduced + 36 unchanged + 0 increased
```

## 37. Transition to KLEE Phase

The remaining 149 occurrences are the candidate population for a separate witness-generation study:

```text
remaining Eva occurrence
  -> targeted safety predicate
  -> symbolic harness
  -> KLEE exploration
  -> candidate testcase
  -> native replay
  -> confirmed witness, if replay succeeds
```

No KLEE installation, analysis, instrumentation, bitcode, or harness construction is performed here. Failure to find a KLEE testcase does not prove safety.

## PACKAGE HANDOFF INSTRUCTIONS

For a 50–60 page report, give the writer the entire `reports/eva_report_source_package/` directory. Recommended reading order:

1. `00_MASTER_EVIDENCE_PACKAGE.md` — complete experimental narrative and central numbers.
2. `10_PER_FUNCTION_TECHNICAL_INVENTORY.md` — uniform 46-function technical records.
3. `11_CASE_STUDIES.md` — detailed source/log reasoning and representative patterns.
4. `05_COMMANDS_AND_OPTIONS_REFERENCE.md` — exact commands and option rationale.
5. `08_COMPARISON_RESULTS.md` — full count/category/function changes.
6. `09_REMOVED_ALARM_CAUSAL_ANALYSIS.md` — all 22 removals with source context.
7. `12_GIT_AND_REPRODUCIBILITY.md` — experimental ledger and repeatability.
8. `13_LIMITATIONS_AND_THREATS_TO_VALIDITY.md` — boundaries for defensible claims.
9. `14_THESIS_READY_FACTS.md` — directly citable statements.
10. `data/*.tsv` — machine-readable evidence and cross-check source.

The writer should preserve the DIRECT REPOSITORY EVIDENCE / TECHNICAL INTERPRETATION distinction, cite path/line/commit evidence, avoid inventing untracked requirements or performance figures, and keep the later witness phase separate from the frozen Eva dataset.
