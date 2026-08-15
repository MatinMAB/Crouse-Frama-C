# Case Studies

## Case Study 1 — `s32_mul_s32_u16`

### Experiment identity

| Field | Value |
| --- | --- |
| Signature | `s32 s32_mul_s32_u16(s32 value, u16 factor)` |
| Declaration | `src_analysis/headers/mul_Ccode.h:149` |
| Definition | `src_analysis/sources/mul_Ccode.c:752` |
| Harness | `harnesses/P1/eva_main_s32_mul_s32_u16.c` |
| Baseline runner | `scripts/run_s32_mul_s32_u16_baseline.sh` |
| High runner | `scripts/high_precision/run_s32_mul_s32_u16_high_precision.sh` |
| Sources | `src_analysis/sources/mul_Ccode.c` |
| Baseline result | 3 alarms |
| High Precision result | 2 alarms |
| Difference | one division-by-zero occurrence removed |
| Final-state status | IDENTICAL |
| Statement coverage | 31/31 in both modes |

### Purpose and complete source body

DIRECT REPOSITORY EVIDENCE: source documentation describes multiplication of an `s32` value by a `u16` factor with limiting behavior. The complete active body is:

```c
752 s32 s32_mul_s32_u16(s32 value, u16 factor)
753 {
754     s32 s32Temp1 = 0, s32Temp2 = -2147483648, s32Factor=0;
755     s32Factor = factor;
756     if(factor != 0)
757     {
758         if(value < 0)
759         {
760             s32Temp1 = s32Temp2 / s32Factor;
761             if(s32Temp1 >= value)
762             {
763                 return 0x80000000;
764             }
765             else
766             {
767                 return (value*factor);
768             }
769         }
770         else
771         {
772             if((0x7FFFFFFFU/factor) <= value)
773             {
774                 return 0x7FFFFFFF;
775             }
776             else
777             {
778                 return (value*factor);
779             }
780         }
781     }
782     else
783     {
784         return 0;
785     }
786 }
```

The function copies the unsigned-short factor into signed-long `s32Factor`, separates the zero case, uses sign-specific division thresholds, returns saturation constants on threshold branches, and otherwise returns a product.

### Harness evidence

```c
s32 value;
u16 factor;
s32 result;

value = Frama_C_long_interval(
    -2147483647L - 1L,
    2147483647L);

factor = Frama_C_unsigned_short_interval(
    0,
    65535);

result = s32_mul_s32_u16(value, factor);
(void) result;
```

Both inputs cover their complete typedef domains. Zero is included for `factor`; no caller assumption is added.

### Baseline and High Precision commands

The parse source, harness, machine model, include path, and entry point are the same. Baseline loads the parse state with:

```text
-eva -eva-slevel 1000 -eva-ilevel 256
```

High Precision replaces that Eva configuration with:

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

### Baseline alarm inventory

1. `mul_Ccode.c:760`, division by zero: `assert s32Factor != 0`.
2. `mul_Ccode.c:767`, integer-overflow lower bound for `value * (s32)factor`.
3. `mul_Ccode.c:778`, integer-overflow upper bound for `value * (s32)factor`.

### High Precision alarm inventory

The two multiplication-bound occurrences at lines 767 and 778 remain. The line-760 divisor occurrence has no canonical counterpart.

### Exact removed condition

DIRECT REPOSITORY EVIDENCE:

```text
Baseline:       [eva:alarm] mul_Ccode.c:760 division by zero; s32Factor != 0
High Precision: no matching canonical source/line/message occurrence
```

The source facts are also direct:

```text
s32Factor = factor
factor != 0 on the active branch
division uses s32Factor
no intervening assignment to s32Factor
```

### Control-flow and type analysis

`factor` is `u16`, range `0..65535`. Assignment to `s32Factor` (`s32`) is value-preserving on `ppc_32`. The division executes only in the `factor != 0` and `value < 0` branch. Proving the divisor predicate requires retaining the relationship between the guarded source variable and the copied target variable.

### Why Baseline contained the condition

DIRECT REPOSITORY EVIDENCE establishes only that Baseline emitted it. TECHNICAL INTERPRETATION: Baseline cvalue/state merging plausibly retained independent ranges but not a sufficiently strong equality tying `s32Factor` to `factor` at line 760. This is an explanation of the information shape, not an internal Eva proof trace.

### Why High Precision differs

TECHNICAL INTERPRETATION: `EQUALITY_RELATION` is the strongest candidate. If `s32Factor == factor` is preserved, `factor != 0` immediately implies `s32Factor != 0`. The equality domain and equality-through-calls are explicitly enabled; higher partition history and octagons may also assist. Confidence is HIGH because the copy/guard/divisor pattern is exact, but option independence cannot be established because the whole profile changed together.

### Final-state and reachability evidence

The target final-state representation is IDENTICAL, parse logs are identical, and both runs reach 31/31 statements. The disappearance is therefore not associated with a missing code path or a different parsed program. A transient relation can prove an intermediate predicate even when the printed end state is unchanged.

### Scientific significance

This case demonstrates the practical value of relational information in low-level arithmetic code. A safety predicate on a copied temporary may not be discharged by independent bounds even when the source has an explicit guard on the original. It is the package's only HIGH-confidence primary mechanism attribution.

## Case Study 2 — `s16_div_s32_s16`

### Experiment identity

| Field | Value |
| --- | --- |
| Signature | `s16 s16_div_s32_s16(s32 numerator, s16 denominator)` |
| Definition | `src_analysis/sources/div_Ccode.c:255` |
| Harness | `harnesses/P1/eva_main_s16_div_s32_s16.c` |
| Baseline | 25 alarms |
| High Precision | 20 alarms |
| Removed | 5 integer-overflow occurrences |
| Coverage | 51/51 statements in both modes |
| Target final state | IDENTICAL |

This is the largest function-level reduction.

### Harness and types

```c
s32 numerator = Frama_C_long_interval(
    -2147483647L - 1L,
    2147483647L);
s16 denominator = Frama_C_short_interval(-32768, 32767);
s16 result = s16_div_s32_s16(numerator, denominator);
```

The full denominator domain includes zero and `-1`; the numerator includes `INT32_MIN`. These values directly interact with the source's zero-divisor and exceptional signed-division branches.

### Relevant complete control-flow region

```c
255 s16 s16_div_s32_s16(s32 numerator, s16 denominator)
256 {
257     s32 s32Temp1=0,s32Temp2=0;
258     s32Temp1 = numerator;
259     if(denominator == 0)
260     {
261         if (numerator < 0) return -0x8000;
267         else return 0x7FFF;
269     }
270     else
271     {
272         if(numerator != 0x80000000)
273         {
274             s32Temp2 =
                    (s32Temp1 - ((s32Temp1/denominator) * denominator)) << 1;
275             s32Temp1 = s32Temp2/denominator;
276             s32Temp1 = s32Temp1 + numerator/denominator;
277             if(s32Temp1 < 0x7FFF)
279                 if(s32Temp1 > -0x8000) return (s16)s32Temp1;
285                 else return -0x8000;
290             else return 0x7FFF;
292         }
293         else
294         {
295             if(denominator != -1)
296             {
297                 s32Temp2 =
                        (s32Temp1 - ((s32Temp1/denominator) * denominator)) << 1;
298                 s32Temp1 = s32Temp2/denominator;
299                 s32Temp1 = s32Temp1 + numerator/denominator;
300                 if(s32Temp1 < 0x7FFF)
302                     if(s32Temp1 > -0x8000) return (s16)s32Temp1;
308                     else return -0x8000;
313                 else return 0x7FFF;
316             }
317             else return 0x7FFF;
322         }
323     }
325 }
```

### Arithmetic structure

Both core paths compute a remainder-like quantity:

```text
r = x - ((x / y) * y)
scaled_r = r << 1
q = scaled_r / y
result = q + numerator / y
```

Although `x - trunc(x/y)*y` has a mathematical remainder relationship, interval evaluation of division, multiplication, and subtraction can lose operand dependency. The left shift then introduces another signed-bound obligation. The source later saturates the result to the `s16` range.

### Removed occurrence 1 — RA-001

- Location: line 274.
- Predicate: lower signed bound of the remainder subtraction.
- Guard: `denominator != 0` and `numerator != INT32_MIN`.
- DIRECT EVIDENCE: Baseline contains the marker; High Precision does not; coverage is unchanged.
- TECHNICAL INTERPRETATION: nonlinear subdivision and relational reduction plausibly tighten the quotient-product/remainder interval.
- Primary mechanism/confidence: `NONLINEAR_SUBDIVISION`, MEDIUM.

### Removed occurrence 2 — RA-002

- Location: line 274.
- Predicate: upper signed bound of the same subtraction.
- Direct evidence and guard are the same as RA-001.
- Interpretation: the combined nonlinear profile plausibly restores the upper remainder bound.
- Primary mechanism/confidence: `NONLINEAR_SUBDIVISION`, MEDIUM.

### Removed occurrence 3 — RA-003

- Location: line 274.
- Predicate: quotient upper bound for `s32Temp1 / denominator`.
- Guard: numerator is explicitly not `INT32_MIN`; denominator is nonzero.
- DIRECT EVIDENCE: the exceptional numerator is excluded on this branch; Baseline reports the bound and High Precision does not.
- TECHNICAL INTERPRETATION: stronger branch partitioning likely preserves the exclusion needed to rule out the exceptional `INT32_MIN / -1` quotient in this state.
- Primary mechanism/confidence: `BRANCH_PARTITIONING`, MEDIUM.

### Removed occurrence 4 — RA-004

- Location: line 297.
- Predicate: lower signed bound of the remainder subtraction.
- Guard: this is the `numerator == INT32_MIN` path, and `denominator != -1` is checked immediately before the expression; zero was excluded outside.
- DIRECT EVIDENCE: Baseline marker present, High counterpart absent, same reached statements.
- TECHNICAL INTERPRETATION: retention of the nested branch conjunction is the most plausible primary aid.
- Primary mechanism/confidence: `BRANCH_PARTITIONING`, MEDIUM.

### Removed occurrence 5 — RA-005

- Location: line 297.
- Predicate: upper bound of the same subtraction.
- Guard and direct evidence match RA-004.
- Primary mechanism/confidence: `BRANCH_PARTITIONING`, MEDIUM.

### Why five entries can have two mechanism families

The quotient predicate depends directly on excluding the exceptional signed pair, while the remainder predicates combine nonlinear dependency and branch constraints. A function-level label would hide this distinction. The final dataset therefore assigns one primary mechanism per occurrence and `COMBINED_PRECISION_EFFECT` at function level.

### Scientific significance

The function shows that precision improvement is not just a count phenomenon. Source guards correspond to exact C arithmetic exceptional cases, and dependent quotient/product/remainder computations challenge non-relational bounds. Yet all profile features changed together, so branch and nonlinear labels remain evidence-based candidates rather than isolated causal measurements.

## Short Case Study 3 — Invalid shifts in `root_u32_mul_u32_s16_fac_less1`

DIRECT REPOSITORY EVIDENCE:

- Signature: `u32 root_u32_mul_u32_s16_fac_less1(u32 value, s16 factor, u32 count)`.
- Harness gives `count` the full `u32` range `0..0xFFFFFFFF`.
- Source lines 5309–5310 use `u32Temp2 >> count` and `u32Temp3 << (32-count)`.
- Baseline and High Precision each report two invalid-shift occurrences at these lines.
- Both occurrences are `REMAINING`; final state is IDENTICAL.

TECHNICAL INTERPRETATION: the common profile did not establish a narrower in-range shift count for this source/harness combination. Conceptually, this can reflect either insufficient precision or a modeled domain that includes counts outside the word width. This phase does not decide between those possibilities for individual concrete executions.

## Short Case Study 4 — Zero alarm with changed final state: `u16_sin_u16`

DIRECT REPOSITORY EVIDENCE:

- Both modes report zero canonical Eva alarms.
- The target final-state text is CHANGED.
- Baseline prints `Phi` as `{0; 1; 3; 5; 10; 20; 41}` and coarse/absent ranges for several temporaries.
- High Precision prints `Phi` as `{0; 1}`, numeric ranges for `u32R30` and `u32R31`, `s32Tabmem` as `{-2; -1; 0; 1}`, and a range for `Phi1`.
- Source uses a mask, a 16-iteration loop, table accesses, shifts, additions/subtractions, and a final shift/mask return.

TECHNICAL INTERPRETATION: richer domains and loop/path settings change the precision of the printed abstract state even though the alarm count is already zero. This demonstrates why alarm count alone is not a complete description of abstract-state quality.

## Short Case Study 5 — Remaining integer overflows in `s32_mul_s32_s32`

DIRECT REPOSITORY EVIDENCE:

- Baseline and High Precision each report three integer-overflow occurrences.
- Locations are `MulHword.c:47`, `mul_Ccode.c:2672`, and `mul_Ccode.c:2681`.
- The latter two concern unary negation of full-domain signed inputs; the helper occurrence concerns a low-word product.
- The function includes `MulHword.c`, sign branches, magnitude conversion, low/high-word multiplication, and saturation paths.
- Alarm multiset and target final state are IDENTICAL.

TECHNICAL INTERPRETATION: the stronger profile does not remove conditions whose source/harness state still contains the relevant extreme operands or whose nonlinear/helper predicate remains unresolved. Persistence does not itself establish a concrete runtime occurrence.

## Cross-case synthesis

The five cases expose distinct outcomes under one profile:

1. a relation-sensitive divisor condition disappears;
2. five guarded/nonlinear division conditions disappear;
3. shift-count conditions remain;
4. a zero-alarm function gains a more precise printed final state;
5. three multiplication/negation conditions remain unchanged.

This variation supports a nuanced interpretation: High Precision improves selected information patterns, but it neither uniformly changes every abstract state nor removes every reported condition.
