# Commands and Options Reference

This reference describes commands in the context of the committed experiment. It does not invoke any runner during package generation.

## Canonical Baseline commands

DIRECT REPOSITORY EVIDENCE from `scripts/run_s32_mul_s32_u16_baseline.sh`:

```bash
frama-c \
  -machdep ppc_32 \
  -cpp-extra-args="-Isrc_analysis/headers" \
  src_analysis/sources/mul_Ccode.c \
  harnesses/P1/eva_main_s32_mul_s32_u16.c \
  -main eva_main \
  -save "$DIR/${FUNC}_parse.sav" \
  > "$DIR/${FUNC}_parse.log" 2>&1

frama-c \
  -load "$DIR/${FUNC}_parse.sav" \
  -eva \
  -eva-slevel 1000 \
  -eva-ilevel 256 \
  -save "$DIR/${FUNC}_eva.sav" \
  > "$DIR/${FUNC}_eva.log" 2>&1
```

## Canonical High Precision command

DIRECT REPOSITORY EVIDENCE from `scripts/high_precision/run_s32_mul_s32_u16_high_precision.sh`:

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

## `frama-c`

- **Purpose:** invokes the installed Frama-C platform.
- **Usage:** both parse and Eva stages.
- **Exact environment:** Frama-C 33.0, codename Arsenic, as recorded in `analysis/high_precision/eva_environment.txt`.
- **Why used:** it supplies parsing, normalization, the Eva abstract interpreter, logs, and saved states.
- **Precision impact:** the executable selects the implementation/version in which all options and domains operate.
- **Potential cost:** depends on plugins and profile; the executable itself is not a precision parameter.
- **Evidence source:** environment file, runners, parse and Eva logs.

## `-machdep ppc_32`

- **Purpose:** selects the 32-bit PowerPC C machine model.
- **Usage/value:** both modes, `ppc_32`.
- **Why used:** matches project assumptions for typedef widths and signed/unsigned long behavior.
- **Precision impact:** fixes exact integer widths, promotions, representable ranges, shift widths, pointer model, and literal interpretation.
- **Potential cost:** negligible relative to Eva; it changes semantics rather than an analysis budget.
- **Evidence source:** every parse runner.

## `-cpp-extra-args="-Isrc_analysis/headers"`

- **Purpose:** passes the project header search path to preprocessing.
- **Usage/value:** identical in both modes.
- **Why used:** resolves project declarations and typedefs without listing headers as translation units.
- **Precision impact:** indirect but essential; consistent declarations and typedefs define the analyzed semantics.
- **Potential cost:** ordinary preprocessing.
- **Evidence source:** every parse runner.

## Source and helper arguments

- **Purpose:** identify the exact translation units parsed for one target.
- **Usage:** copied from the Baseline runner into the corresponding High Precision runner.
- **Why used:** includes a helper source only when the target requires it; e.g., `MulHword.c` accompanies selected multiplication targets.
- **Precision impact:** controls the call graph and availability of helper definitions.
- **Potential cost:** additional source increases parse and analysis work.
- **Evidence source:** `analysis/high_precision/manifest.tsv` and runners.

## `-main eva_main`

- **Purpose:** selects the harness entry point.
- **Usage/value:** both modes, `eva_main`.
- **Why used:** provides one controlled abstract target call independent of application callers.
- **Precision impact:** bounds the reachable call graph and makes harness input abstractions authoritative.
- **Potential cost:** generally reduces scope relative to whole-library entry.
- **Evidence source:** every parse runner and harness.

## `-save`

- **Purpose:** serializes Frama-C state.
- **Usage:** parse stage writes `*_parse.sav`; Eva stage writes `*_eva.sav` in both modes.
- **Why used:** preserves normalized and analyzed states for audit/reuse.
- **Precision impact:** none on transfer semantics; it preserves evidence.
- **Potential cost:** disk space and serialization time.
- **Evidence source:** runners and 368 committed `.sav`/log artifacts across both modes.

## `-load`

- **Purpose:** loads the saved parse state into the Eva invocation.
- **Usage:** both modes.
- **Why used:** guarantees the analysis phase consumes the previously captured normalized program.
- **Precision impact:** no direct refinement; it supports parse-stage control.
- **Potential cost:** deserialization.
- **Evidence source:** every Eva command.

## `-eva`

- **Purpose:** activates Eva abstract interpretation.
- **Usage:** both modes.
- **Exact value:** flag, no numeric argument.
- **Why used:** produces abstract states and the canonical safety markers being compared.
- **Precision impact:** establishes the analysis; other options configure it.
- **Potential cost:** principal CPU/memory cost.
- **Evidence source:** all runners and Eva logs.

## `-eva-slevel`

- **Purpose:** controls semantic unrolling/state separation budget.
- **Baseline:** explicit `1000`.
- **High Precision:** precision-11 logs record `5000`.
- **Why used:** delays merges and preserves path-specific information for small arithmetic functions.
- **Precision impact:** can retain guard facts and separate states through more statements.
- **Potential cost:** state count, CPU, and memory can grow substantially.
- **Evidence source:** Baseline runners; High Precision logs and profile documentation.

## `-eva-ilevel`

- **Purpose:** controls when finite integer sets are approximated more coarsely.
- **Baseline:** `256`.
- **High Precision:** explicit `1024` after the meta-option.
- **Why used:** preserve larger discrete sets for masks, branches, shifts, and small-type arithmetic.
- **Precision impact:** delays loss of exact enumerated integer values.
- **Potential cost:** larger sets and more expensive joins/transfers.
- **Evidence source:** all runners.

## `-eva-precision 11`

- **Purpose:** supported Eva meta-option that raises a coordinated group of precision settings.
- **Usage:** High Precision only.
- **Exact value:** `11`.
- **Why used:** establishes a strong, standardized profile rather than manually changing only one budget.
- **Precision impact:** logs record `slevel=5000`, `plevel=2000`, `partition-history=2`, `auto-loop-unroll=1024`, `min-loop-unroll=4`, and `widening-delay=6`.
- **Potential cost:** more states, propagation, loop work, and delayed approximation.
- **Evidence source:** all High Precision runners and logs.

## `-eva-domains cvalue,equality,symbolic-locations,gauges,octagon,bitwise`

- **Purpose:** enables a product/reduction of available abstract domains.
- **Usage:** High Precision only, exact comma-separated list shown above.
- **Why used:** the project combines scalar ranges, copied temporaries, arithmetic relations, bit manipulation, loops, and helper calls.
- **Precision impact:** `cvalue` supplies central value/memory abstraction; `equality` tracks equal expressions; `symbolic-locations` retains symbolic address relations; `gauges` capture induction-like relations; `octagon` tracks pairwise difference/sum constraints; `bitwise` retains bit-level patterns.
- **Potential cost:** domain state, reductions, and transfer operations increase memory and CPU use.
- **Evidence source:** all High Precision runners; available-domain record.

## `-eva-equality-through-calls all`

- **Purpose:** preserves equality information at call boundaries according to the selected scope.
- **Usage/value:** High Precision, `all`.
- **Why used:** targets may call helpers, and parameter/local-copy relations can be important.
- **Precision impact:** can prevent relational information from being forgotten at calls.
- **Potential cost:** larger relational states and call transfer.
- **Evidence source:** all High Precision runners.

## `-eva-octagon-through-calls`

- **Purpose:** retains octagonal relations across function calls.
- **Usage:** High Precision only.
- **Why used:** helpers such as `MulHighWord` can participate in arithmetic relations used later by the caller.
- **Precision impact:** preserves supported pairwise constraints across call boundaries.
- **Potential cost:** interprocedural relational transfer and reduction.
- **Evidence source:** all High Precision runners.

## `-eva-interprocedural-splits`

- **Purpose:** carries partition/split information through calls.
- **Usage:** High Precision only.
- **Why used:** avoids immediately joining caller states whose guarded distinctions may matter after a helper.
- **Precision impact:** stronger call-sensitive path separation.
- **Potential cost:** increased number of callee/caller states.
- **Evidence source:** all High Precision runners.

## `-eva-interprocedural-history`

- **Purpose:** retains partition history interprocedurally.
- **Usage:** High Precision only.
- **Why used:** makes branch origin available beyond a call boundary.
- **Precision impact:** can preserve correlations conditioned on earlier decisions.
- **Potential cost:** state metadata and reduced merging.
- **Evidence source:** all High Precision runners.

## `-eva-split-return full`

- **Purpose:** keeps distinct return states separated according to full splitting.
- **Usage/value:** High Precision only, `full`.
- **Why used:** saturation, zero handling, and sign branches often return different constrained states.
- **Precision impact:** avoids immediate merge of path-distinct return values.
- **Potential cost:** caller-state multiplication.
- **Evidence source:** all High Precision runners.

## `-eva-subdivide-non-linear 500`

- **Purpose:** subdivides nonlinear evaluations to obtain tighter ranges.
- **Usage/value:** High Precision only, `500`.
- **Why used:** many targets contain multiplication and dependent quotient/product/remainder expressions.
- **Precision impact:** can reduce range blow-up caused by evaluating nonlinear operands too coarsely.
- **Potential cost:** repeated evaluation of subdomains; potentially one of the most expensive explicit settings.
- **Evidence source:** all High Precision runners and precision-profile rationale.

## Precision-11 derived settings

| Setting | Verified value | Intended effect | Potential cost |
| --- | ---: | --- | --- |
| `slevel` | 5000 | retain more path/state distinctions | more states |
| `plevel` | 2000 | stronger propagation effort | more transfer work |
| `partition-history` | 2 | retain recent branch provenance | partition growth |
| `auto-loop-unroll` | 1024 | increase automatic loop unrolling allowance | more iterations/states |
| `min-loop-unroll` | 4 | ensure initial loop iterations stay distinct | additional loop states |
| `widening-delay` | 6 | postpone widening | slower convergence, tighter early states |

## TECHNICAL INTERPRETATION

The profile is coherent for integer/fixed-point code: it strengthens scalar, relational, bitwise, path, call, return, set, and nonlinear reasoning simultaneously. The observed 22-entry reduction is the combined-profile outcome. Without rerunning controlled ablations, no individual option can be credited exclusively.
