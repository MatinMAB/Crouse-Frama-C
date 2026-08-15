# Eva Precision Study — Final Technical Report

## 1. Executive Summary

This report freezes the first research phase: a controlled Frama-C Eva precision study over 46 independently harnessed C functions. The same source, machine model, preprocessing, harness, abstract inputs, entry point, and per-function source/helper lists were analyzed twice. Only the Eva precision configuration changed.

The Baseline produced 171 canonical Eva alarms. The High Precision profile produced 149. Multiset matching identifies 22 `REMOVED`, 149 `REMAINING`, and zero `NEW` entries, a net reduction of 22 or 12.87%. Ten functions have lower counts, 36 have equal counts, and none have higher counts. Thirteen functions have zero alarms in each mode.

Category-level change is concentrated in integer arithmetic: integer overflow changes from 118 to 100, division by zero from 20 to 16, and invalid shift remains 33 in both modes. Source-level review attributes the 22 removed entries, cautiously, to one primary equality-relation case, six branch-partitioning cases, and 15 nonlinear-subdivision cases. Confidence is HIGH for the copied-divisor equality case and MEDIUM for the remaining 21 because multiple High Precision features were enabled together.

These transitions describe analysis output. They are not runtime-validity decisions. The 149 remaining alarms form the input population for a later, independent witness-analysis phase.

## 2. Research Objective

The objective is to quantify and explain how a materially stronger, supported Eva configuration changes results for the existing 46-function benchmark without changing the analyzed programs. The experiment asks whether richer relational domains, deeper path sensitivity, larger finite integer sets, nonlinear subdivision, and stronger call/return information allow Eva to discharge conditions that the Baseline leaves reported.

The study also establishes a reproducible Git-traced dataset suitable for later work. It deliberately separates three questions:

1. What did Baseline report?
2. What changes under one common High Precision profile?
3. What source structure most plausibly explains each removed entry?

Concrete reachability of remaining conditions is outside this phase.

## 3. Experimental Questions

The study addresses:

- How many canonical Eva alarms are reported in each mode?
- Which alarm signatures are removed, remain, or are new when multiplicity is preserved?
- Which functions and categories benefit most?
- Are changes accompanied by parse or statement-coverage changes?
- Which source-level relations, guards, or nonlinear expressions are consistent with the observed removals?
- What cannot be concluded without option ablation or concrete witnesses?

## 4. Repository and Analysis Architecture

The repository separates immutable analysis inputs from generated artifacts:

```text
src_original/                         preserved original source
src_analysis/                         analyzed source and headers
harnesses/                            function-specific Eva entry points
scripts/run_*_baseline.sh             Baseline runners
scripts/high_precision/               High Precision runners
results/baseline/<FUNCTION>/          Baseline log/save artifacts
results/high_precision/<FUNCTION>/    High Precision log/save artifacts
analysis/high_precision/              profile manifest and environment
analysis/high_precision_comparison/   reproducible comparison tables
analysis/eva_precision_study_final/   frozen causal-analysis dataset
reports/eva_precision_study/          final research reports
```

Each function is an independent experiment. This reduces cross-function state explosion and makes the source list, harness, result directory, and Git history traceable.

## 5. Function Set

The ordered source of truth is `analysis/high_precision/functions.txt`, validated at 46 lines. The set includes root/fixed-factor multiply helpers, rotations, trigonometric interfaces, division families, multiplication/division composites, HIP and MMV functions, and signed/unsigned variants. It is not inferred from filenames.

The complete list and source mapping are frozen in `analysis/high_precision/manifest.tsv`; the complete count table is in `analysis/eva_precision_study_final/final_function_summary.tsv` and `EVA_RESULTS_SUMMARY.md`.

## 6. Harness Design

Every target has a function-specific harness that:

- includes Frama-C builtins and the project header;
- declares inputs with the target's exact typedefs;
- constructs abstract values over the intended complete type domains;
- calls the target symbol once through its public declaration;
- stores the return in the exact return type;
- uses `eva_main` as the entry point.

High Precision reuses these harnesses byte-for-byte. It does not add assumptions, masks, casts, normalization, contracts, concrete-call enumeration, helper substitutions, or assembly variants.

## 7. Input Modeling

Inputs are modeled with type-appropriate Frama-C interval builtins under `ppc_32`. The design preserves type minima and maxima, zero, signed extrema, and internal thresholds already covered by the full interval. Caller usage does not narrow a harness unless an explicit project contract requires it.

Because the harnesses are shared, differences cannot be attributed to changed input populations. Both modes analyze the same abstract call at the same entry point.

## 8. Baseline Eva Configuration

The committed Baseline runners load their function-specific parse state and invoke:

```text
-eva
-eva-slevel 1000
-eva-ilevel 256
```

`-eva` activates value analysis. `-eva-slevel 1000` allocates semantic-unrolling/state-splitting capacity, reducing premature merges within the selected budget. `-eva-ilevel 256` retains finite integer sets up to the configured threshold before joining to coarser interval representations.

The Baseline is already a deliberate analysis configuration; it is not a minimal default. The High Precision stage therefore measures an incremental strengthening over a meaningful reference.

## 9. High Precision Eva Configuration

All 46 High Precision runners use the common profile:

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

Every High Precision Eva log records the meta-option values:

```text
slevel = 5000
plevel = 2000
partition-history = 2
auto-loop-unroll = 1024
min-loop-unroll = 4
widening-delay = 6
```

These values were verified from committed runners and logs, not reconstructed from version-independent assumptions.

## 10. Rationale for High Precision Options

| Option | Mode | Purpose | Expected precision effect | Potential cost |
| --- | --- | --- | --- | --- |
| `-eva` | Both | activates Eva | computes abstract states and safety checks | base analysis cost |
| `-eva-slevel 1000` | Baseline | semantic-unrolling budget | delays merges relative to defaults | more states |
| `-eva-ilevel 256` | Baseline | finite integer-set threshold | preserves moderate discrete sets | memory and set operations |
| `-eva-precision 11` | High | supported meta-profile | raises multiple precision controls consistently | higher CPU/RAM use |
| `-eva-domains cvalue,equality,symbolic-locations,gauges,octagon,bitwise` | High | product of complementary domains | preserves scalar values, equalities, symbolic addresses, induction relations, pairwise numeric constraints, and bit patterns | cross-domain reductions and memory |
| `-eva-equality-through-calls all` | High | propagates equality information through calls | retains copy/parameter relations at call boundaries | larger relational states |
| `-eva-octagon-through-calls` | High | carries octagonal relations across calls | preserves constraints such as `x-y<=c` | relational transfer cost |
| `-eva-interprocedural-splits` | High | carries split structure interprocedurally | avoids early merge across calls | state multiplication |
| `-eva-interprocedural-history` | High | retains partition history across calls | keeps branch provenance longer | additional metadata/state separation |
| `-eva-split-return full` | High | separates return states | avoids merging distinct return conditions too early | more caller states |
| `-eva-subdivide-non-linear 500` | High | subdivides nonlinear evaluations | tightens multiplication and dependent nonlinear ranges | potentially substantial reevaluation cost |
| `-eva-ilevel 1024` | High | larger explicit integer sets | delays conversion of discrete sets to intervals | more memory and set operations |
| precision-11 `slevel=5000` | High | larger semantic budget | keeps more paths/states separate | time and memory |
| precision-11 `plevel=2000` | High | higher propagation precision level | improves propagation through supported constructs | analysis work |
| `partition-history=2` | High | remembers two branch decisions | reduces immediate reconvergence | partition growth |
| loop-unroll/widening settings | High | delay loss around loops | improves loop-state precision | more iterations |

The chosen profile is uniform across all 46 functions to preserve scientific comparability. A function was not given a lower precision merely because its cost or alarm population differed.

## 11. Experimental Controls

The controlled variables are source code, header declarations, machine model, preprocessing flags, harness, input abstraction, entry point, source order, helper list, and parse procedure. Only the Eva command following `-load <parse.sav>` changes meaningfully.

All 46 Baseline/High Precision parse logs are byte-identical. For the ten reduced functions, analyzed-function counts, reached-statement counts, and target final-state text are also identical. Thus none of the 22 removals is explained by dropping a statement or parsing a different program.

## 12. Baseline Execution Method

A Baseline runner changes to the repository root, creates its result directory, parses the exact source list and harness under `ppc_32`, saves a parse state and complete parse log, then loads that state for Eva and saves the Eva state and log. Each run produces exactly four artifacts.

Representative parse command structure:

```bash
frama-c \
  -machdep ppc_32 \
  -cpp-extra-args="-Isrc_analysis/headers" \
  <exact source/helper list> \
  <exact harness> \
  -main eva_main \
  -save <FUNCTION>_parse.sav
```

## 13. High Precision Execution Method

High Precision uses the same parse command and then loads the resulting state with the profile in Section 9. The 46 runners were executed sequentially, validated for four non-empty artifacts and an `ANALYSIS SUMMARY`, and committed one function per result commit. This supports independent provenance and avoids resource contention from parallel Eva runs.

## 14. Artifact Structure

Each mode stores:

```text
<FUNCTION>_parse.log
<FUNCTION>_parse.sav
<FUNCTION>_eva.log
<FUNCTION>_eva.sav
```

The logs are the textual source of truth for alarm comparison. Save files preserve Frama-C states for reproducibility and later inspection without modifying the original run artifacts.

## 15. Git Traceability

The High Precision scaffold and runners are anchored by:

```text
f2901e9 analysis(eva): add high-precision analysis scaffold
4a2eaa1 tooling(eva): add high-precision runners for 46 functions
```

Each of 46 High Precision function results has its own commit. The comparison implementation and data are anchored by:

```text
e7d2fb7 tooling(eva): add baseline high-precision comparator
ed34fdc analysis(eva): add baseline high-precision comparison
```

For each function, repository history contains a harness, runner, parse log/save, Eva log/save, alarm detail, and associated commits. Work notes are present where created during the earlier phase but are not used as numerical sources for this comparison.

## 16. Alarm Extraction Method

The primary unit is an actual `[eva:alarm]` record in the Eva log. The parser extracts function, analysis mode, source path, line, message, and category. Wrapped message lines are joined before normalization. Kernel warnings and unrelated diagnostics remain separate and do not inflate the Eva count.

Counts are recomputed from the committed logs. Earlier narrative reports are cross-checks only.

## 17. Alarm Canonicalization and Matching

Canonical signatures contain normalized source path, line number, and normalized message. Unicode/ASCII variants of comparison operators and irregular whitespace are normalized so presentation differences do not create artificial changes.

Matching uses counters, not sets. If a signature appears twice in Baseline and once in High Precision, one occurrence is `REMAINING` and one is `REMOVED`. For every function:

```text
baseline = removed + remaining
high precision = remaining + new
delta = new - removed
```

All 46 function invariants and global category/table cross-checks pass.

## 18. Baseline Global Results

Baseline reports 171 canonical Eva alarms across the 46 functions:

- 118 integer overflow;
- 20 division by zero;
- 33 invalid shift.

Thirteen functions have zero Baseline alarms. The remaining distribution is concentrated in arithmetic division/multiplication composites, with `s16_div_s32_s16` highest at 25.

## 19. High Precision Global Results

High Precision reports 149 canonical Eva alarms:

- 100 integer overflow;
- 16 division by zero;
- 33 invalid shift.

Thirteen functions have zero High Precision alarms. No function has a higher count than its Baseline counterpart.

## 20. Global Comparison

| Metric | Count |
| --- | ---: |
| Baseline | 171 |
| High Precision | 149 |
| Removed | 22 |
| Remaining | 149 |
| New | 0 |
| Net reduction | 22 |
| Percentage reduction | 12.87% |
| Reduced functions | 10 |
| Unchanged functions | 36 |
| Increased functions | 0 |

The reduction percentage is `22 / 171 * 100`, rounded to two decimals. The count transition is internally consistent: `171 = 22 + 149` and `149 = 149 + 0`.

## 21. Alarm Category Comparison

| Category | Baseline | High Precision | Removed | Remaining | New | Delta |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| integer overflow | 118 | 100 | 18 | 100 | 0 | -18 |
| division by zero | 20 | 16 | 4 | 16 | 0 | -4 |
| invalid shift | 33 | 33 | 0 | 33 | 0 | 0 |

Eighteen of 22 removals are arithmetic bound checks; four are divisor nonzero checks. There is no shift-category count change.

## 22. Functions with Reduced Alarm Count

| Function | Baseline | High | Removed | Primary function-level mechanism | Confidence |
| --- | ---: | ---: | ---: | --- | --- |
| `s16_div_s32_s16` | 25 | 20 | 5 | COMBINED_PRECISION_EFFECT | MEDIUM |
| `s16_fac05_div_s16_s16` | 11 | 9 | 2 | NONLINEAR_SUBDIVISION | MEDIUM |
| `s16_mul_s16_s16_div_s16` | 11 | 8 | 3 | COMBINED_PRECISION_EFFECT | MEDIUM |
| `s16_mul_s16_s16_div_u16` | 7 | 5 | 2 | NONLINEAR_SUBDIVISION | MEDIUM |
| `s16_mul_s16_u16_div_s16` | 11 | 8 | 3 | COMBINED_PRECISION_EFFECT | MEDIUM |
| `s16_mul_u16_s16_div_u16` | 7 | 6 | 1 | NONLINEAR_SUBDIVISION | MEDIUM |
| `s32_mul_s32_u16` | 3 | 2 | 1 | EQUALITY_RELATION | HIGH |
| `u16_div_s32_u16` | 7 | 5 | 2 | NONLINEAR_SUBDIVISION | MEDIUM |
| `u16_mul_s16_u16_div_s16` | 11 | 9 | 2 | COMBINED_PRECISION_EFFECT | MEDIUM |
| `u16_mul_s16_u16_div_u16` | 7 | 6 | 1 | NONLINEAR_SUBDIVISION | MEDIUM |

## 23. Functions with Unchanged Alarm Count

Thirty-six functions retain equal counts. This includes 13 zero-alarm functions and 23 functions with one or more remaining alarms. Equal count does not imply identical internal abstract states, although canonical alarm multisets are unchanged for this group. Three functions—`s16_hip1_s16_s8_s8_u16_fac1`, `s16_hip1_s16_u8_u8_u16_fac1`, and `u16_sin_u16`—have changed textual target final-state blocks despite unchanged alarm counts.

## 24. New Alarm Analysis

No `NEW` canonical alarm occurs. Therefore the stronger profile did not add a source-line/message occurrence absent from Baseline in this dataset. This is an experimental observation, not a general property of increasing abstract precision: a different program or profile can expose paths or split states differently.

## 25. Zero-Alarm Functions

The same 13 functions have zero canonical alarms in both modes:

```text
rotateLeft
s16_cos_u32
s16_mmv_s16_s16_s16_fac1
s16_mul_s16_u16_fac025
s16_sin_u32
s16_tan_u32
u16_cos_u16
u16_mul_u16_u8_fac8
u16_sin_u16
u16_tan_u16
u32_div_s32_u32
u32_div_u32_s32
u32_mmv_u32_u32_s32_fac1
```

Separate kernel properties, such as behavior of empty non-void bodies where present, are not merged into this zero count.

## 26. Removed Alarm Causal Analysis Methodology

The causal layer starts with the 22 `REMOVED` rows in the committed comparison table. For each occurrence it inspects at least 15 surrounding lines and, when required, the complete function. It records the expression, operand types under `ppc_32`, guards, temporary-variable relations, and helper context. It then checks both logs for the exact transition and compares parse diagnostics, coverage, and final-state text.

Direct evidence is kept separate from technical inference. One primary mechanism is assigned to avoid double counting. Because all High Precision options changed together, the mechanism is phrased as the most plausible explanation and given HIGH, MEDIUM, or LOW confidence.

## 27. Removed Integer Overflow Analysis

The 18 removed integer-overflow entries break down by source operation:

- 16 bounds on remainder-style subtraction `x - ((x / y) * y)`;
- one bound on the intermediate quotient-product;
- one exceptional signed-division quotient bound.

Fifteen receive `NONLINEAR_SUBDIVISION` as the primary mechanism. Their expressions combine division, multiplication, and subtraction with shared operands; non-relational interval evaluation commonly loses the dependency that mathematically constrains a remainder. The High Precision configuration adds 500-way nonlinear subdivision, larger finite integer sets, and relational reductions, all of which are consistent with tighter results.

Three overflow entries in `s16_div_s32_s16` receive `BRANCH_PARTITIONING`: one occurs where `numerator != INT32_MIN`, and two occur in the complementary `numerator == INT32_MIN` path after explicit exclusion of `denominator == -1`. These guards target the exceptional signed-division case and must remain associated with the correct state.

## 28. Removed Division-by-Zero Analysis

Four divisor checks are removed:

| Function | Line | Divisor | Preceding relation/guard | Primary mechanism |
| --- | ---: | --- | --- | --- |
| `s16_mul_s16_s16_div_s16` | 965 | `div` | direct `div != 0` alternative branch | BRANCH_PARTITIONING |
| `s16_mul_s16_u16_div_s16` | 630 | `denominator` | direct `denominator != 0` branch | BRANCH_PARTITIONING |
| `s32_mul_s32_u16` | 760 | `s32Factor` | `s32Factor = factor`, then `factor != 0` | EQUALITY_RELATION |
| `u16_mul_s16_u16_div_s16` | 741 | `denominator` | direct `denominator != 0` branch | BRANCH_PARTITIONING |

The copied-divisor case has the strongest source-to-mechanism correspondence. The other three require a direct branch fact to survive one or more intermediate statements before a later division.

## 29. Invalid Shift Observation

Invalid-shift count is exactly 33 in both modes: all 33 remain, none are removed, and none are new. This is direct result data.

A cautious interpretation is that relational precision cannot, by itself, remove a shift condition when the harness deliberately supplies a complete shift-count type domain and source guards do not exclude out-of-width values. That inference does not determine the runtime status of any individual shift entry.

## 30. Detailed Case Study — s32_mul_s32_u16

The function changes from three alarms to two. The removed entry is division by zero at `src_analysis/sources/mul_Ccode.c:760`:

```c
s32Factor = factor;

if (factor != 0)
{
    /* intervening arithmetic */
    s32Temp1 = s32Temp2 / s32Factor;
}
```

Direct evidence establishes four facts: `s32Factor` is assigned from `factor`; the branch tests `factor`; the division uses `s32Factor`; and the Baseline marker has no High Precision counterpart. Parse logs, 31/31 statement reachability, and final-state text are unchanged.

The most plausible inference is equality retention. If the abstract state preserves `s32Factor == factor`, the branch fact `factor != 0` transfers immediately to the copied divisor. The explicit equality domain and equality-through-calls configuration are designed to retain such relations. Confidence is HIGH because the guard/copy/divisor structure is direct, while the report still avoids claiming that one option alone produced the result.

## 31. Detailed Case Study — s16_div_s32_s16

This function has the largest reduction, 25 to 20. Five integer-overflow markers disappear at two source lines.

At line 274, the function is in `denominator != 0` and `numerator != INT32_MIN`. Two markers bound the remainder-style subtraction, and one bounds the quotient. Excluding `INT32_MIN` is directly relevant to the exceptional signed division `INT32_MIN / -1`. The quotient removal is therefore most consistent with stronger branch-state preservation. The two remainder bounds are more consistent with nonlinear subdivision and relational reduction across `x / y`, multiplication by `y`, and subtraction from `x`.

At line 297, control is in the complementary `numerator == INT32_MIN` path. An inner guard excludes `denominator == -1` before evaluating the same remainder expression. The two removed subtraction bounds are most consistent with preserving the nested conjunction of branch facts. Both analyses reach all 51 statements, so the absence is not caused by skipping this branch.

This function illustrates why one label cannot describe an entire reduced function. Its five entries receive two primary mechanism families, and the function-level summary uses `COMBINED_PRECISION_EFFECT`.

## 32. Precision Mechanism Attribution

| Primary mechanism | Alarm count | HIGH | MEDIUM | LOW |
| --- | ---: | ---: | ---: | ---: |
| EQUALITY_RELATION | 1 | 1 | 0 | 0 |
| BRANCH_PARTITIONING | 6 | 0 | 6 | 0 |
| NONLINEAR_SUBDIVISION | 15 | 0 | 15 | 0 |
| **Total** | **22** | **1** | **21** | **0** |

Other configured mechanisms—octagons, integer-set precision, higher slevel, interprocedural information, and return splitting—may contribute as reducers or enablers even where not selected as primary. Primary labels exist for aggregation, not exclusion of secondary effects.

## 33. Confidence Assessment

HIGH is reserved for the copied-divisor relation in `s32_mul_s32_u16`, where the source equality and guarded original precisely match the missing predicate on the copy. MEDIUM covers 21 entries: their explanations are strongly consistent with source structure, but branch history, nonlinear subdivision, equality, octagons, cvalue reductions, and larger integer sets changed simultaneously. No entry is assigned LOW because each removed marker has a specific guard or dependent arithmetic pattern, although option-level isolation remains unavailable.

## 34. Final-State Comparison

Target final-state text is IDENTICAL for 43 functions and CHANGED for three. The changed functions are:

- `s16_hip1_s16_s8_s8_u16_fac1`;
- `s16_hip1_s16_u8_u8_u16_fac1`;
- `u16_sin_u16`.

All ten reduced functions have IDENTICAL target final-state text. This does not conflict with improved proofs at intermediate statements: textual end states do not expose every relational fact held temporarily by Eva. No validity conclusion is drawn from final-state text alone.

## 35. Precision vs Computational Cost

The profile is deliberately expensive: it increases semantic state budgets, partition history, loop handling, finite sets, nonlinear subdivision, and relational-domain products. Each can increase CPU time and memory, sometimes multiplicatively.

Timing information was collected during execution but was not persisted as a tracked experimental artifact for every function; therefore it is not used as a complete quantitative dataset in the final comparison. The study can state qualitatively that the configuration has higher expected cost, but it does not fabricate an aggregate speed or memory ratio.

## 36. Scientific Interpretation

Under controlled program inputs, the stronger profile reduces the canonical alarm population by 12.87% and introduces no new entries. The improvement is selective rather than uniform: 22 entries disappear in ten arithmetic functions, while 149 remain and 36 functions show equal counts.

The pattern is technically coherent. Most removals involve dependent quotient/product/remainder expressions, and several involve guards whose facts must survive to a later division. The shift population is unaffected. These observations support the proposition that relational and path-sensitive precision is useful for this fixed-point/integer codebase, while also showing that precision alone does not discharge most reported conditions.

## 37. Threats to Validity

- The profile is bundled, so exact option contributions cannot be identified.
- The 46-function set reflects this repository and may not generalize to other programs.
- Canonical textual matching can only compare what Eva logs; it does not compare internal proof objects.
- Save-state and log generation share one Frama-C build, improving internal comparability but limiting cross-version claims.
- Complete type-domain harnesses may be broader than undocumented operational usage; they are intentionally retained to avoid unsupported restrictions.
- Function-specific analysis controls call graphs but may differ from a whole-application context.

## 38. Limitations

This phase performs static-result comparison, not runtime witness assessment. A remaining entry is not established as a concrete violation by persistence alone. A removed entry is not assigned a runtime class. Final-state textual equality is a partial observation, and timing data is incomplete as a tracked quantitative series.

Most importantly, the study is not an ablation experiment. Statements such as “most plausible mechanism” and “consistent with” are intentional: equality, octagon, bitwise, gauges, partitioning, subdivision, slevel, ilevel, and return/call settings may interact.

## 39. Reproducibility

Reproduction is supported by the ordered manifest, committed environment records, function-specific runners, four artifacts per run, independent result commits, deterministic comparison script, TSV outputs, and explicit invariants. The companion `EVA_EXPERIMENT_REPRODUCIBILITY.md` specifies paths, commands, configuration, matching rules, and audit equations.

Reproduction should occur in a separate checkout so the frozen result trees are not overwritten. The comparator can then be re-run against the newly reproduced logs and checked against the committed 46-row and category summaries.

## 40. Transition to KLEE Witness Analysis

The next phase receives 149 remaining Eva alarm occurrences. Its conceptual pipeline is:

```text
Remaining Eva Alarm
        ↓
Targeted Safety Predicate
        ↓
KLEE Symbolic Harness
        ↓
Symbolic Execution
        ↓
Concrete Test Case
        ↓
Native Replay
        ↓
Confirmed Violation Witness
```

This report provides only the interface boundary. It does not install or execute KLEE, build LLVM bitcode, create symbolic harnesses, or classify the 149 occurrences. Failure to find a testcase with KLEE will not, by itself, prove that a condition is unreachable.

### Eva Study Freeze

After the two final-study commits, the following become the fixed Eva-phase dataset:

- Baseline results;
- High Precision results;
- Baseline-versus-High Precision comparison results;
- removed-alarm causal analysis;
- final reproducibility and results reports.

No KLEE artifact belongs in this dataset. Later work must reference it without rewriting it.

## 41. Conclusion

The controlled 46-function experiment demonstrates a measurable effect from stronger Eva precision: alarms decrease from 171 to 149, with 22 removals, 149 remaining entries, and no new entries. Ten functions improve; 36 retain equal counts. Integer-overflow entries account for 18 removals and division-by-zero entries for four, while all 33 invalid-shift entries remain.

Source-level analysis connects the changes to recognizable precision challenges: equality between copied variables, preservation of nonzero and exceptional-value guards, and dependent nonlinear quotient/product/remainder expressions. The conclusions remain appropriately bounded because the profile was changed as a unit. With artifacts, comparison tables, causal records, and Git provenance frozen, the Eva Precision Study is complete and ready to hand off to the independent witness-analysis phase.
