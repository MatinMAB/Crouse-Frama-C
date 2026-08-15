# Representative Phase-C POC Candidate Recommendations

## Selection method

Candidates were selected read-only from the 149-row High Precision alarm
inventory and cross-checked against source, function inventory, and existing Eva
harnesses. They are recommendations only: no KLEE project harness or
instrumentation was created.

## Candidate 1 — signed integer overflow

| Field | Value |
|---|---|
| Function | `s32_mul_s32_s32` |
| Source | `src_analysis/sources/MulHword.c:47` |
| Eva category | integer overflow |
| Normalized predicate | `(int)arg1_LW * (int)arg2_LW <= 2147483647` |
| Function signature | `s32 s32_mul_s32_s32(s32 val1, s32 val2)` |
| Eva input domain | both `val1` and `val2`: `-2147483648..2147483647` |
| Existing sources | `mul_Ccode.c`, `MulHword.c` |
| Helper | `MulHighWord` |

Relevant expression:

```c
MulTemp1 = arg1_LW * arg2_LW;
```

`arg1_LW` and `arg2_LW` are `u16`; integer promotions make the multiplication a
signed 32-bit `int` operation under `ppc_32`. The source line is compact, the
operation family is directly represented by the synthetic signed-overflow
characterization, and the existing analysis has exactly three remaining alarms.

**Why it is a good POC:** it tests helper inclusion, 16-to-32 integer
promotions, a multiplication overflow predicate, full-domain signed inputs, and
occurrence traceability without arrays or pointers.

**Potential KLEE difficulty:** host LP64 changes the outer `s32` parameters;
therefore an explicit-width adapter is mandatory. Natural multiplication with
`nsw` is not a reliable KLEE error oracle in this installation; use an UB-free
widened predicate, with UBSan as an optional cross-check.

## Candidate 2 — division by zero

| Field | Value |
|---|---|
| Function | `s16_div_s32_s16` |
| Source | `src_analysis/sources/div_Ccode.c:274` |
| Eva category | division by zero |
| Normalized predicate | `(s32)denominator != 0` |
| Function signature | `s16 s16_div_s32_s16(s32 numerator, s16 denominator)` |
| Eva numerator domain | `-2147483648..2147483647` |
| Eva denominator domain | `-32768..32767` |
| Existing source | `div_Ccode.c` |

Relevant source control flow:

```c
if (denominator == 0) {
    /* saturating returns */
} else {
    if (numerator != 0x80000000) {
        s32Temp2 =
            (s32Temp1 - ((s32Temp1 / denominator) * denominator)) << 1;
```

**Why it is a good POC:** it tests whether occurrence-specific instrumentation
and KLEE path constraints agree with an explicit source guard. It also exercises
the distinction between an Eva remaining alarm and a runtime witness search
without presupposing the result. The same line has overflow and invalid-shift
alarms, so Phase-B identity design is exercised.

**Potential KLEE difficulty:** multiple divisions and multiple alarm categories
occur in one compound expression; the target must be identified before the exact
division occurrence, without executing another UB first. The `s32` numerator
requires explicit 32-bit modeling.

## Candidate 3 — invalid shift

| Field | Value |
|---|---|
| Function | `root_s32_mul_s32_s16_fac_less1` |
| Source | `src_analysis/sources/mul_Ccode.c:5089` |
| Eva category | invalid shift |
| Normalized predicate | `0 <= count && count < 32` (with `count` unsigned, effectively `count < 32`) |
| Function signature | `s32 root_s32_mul_s32_s16_fac_less1(s32 value, s16 factor, u32 count)` |
| Eva `value` domain | `-2147483648..2147483647` |
| Eva `factor` domain | `-32768..32767` |
| Eva `count` domain | `0..4294967295` |
| Existing sources | `mul_Ccode.c`, `MulHword.c` |

Relevant expression:

```c
u32Temp3 = u32Temp3 >> count;
```

**Why it is a good POC:** the full-domain unsigned count directly includes
values at and above the 32-bit operand width. The Phase-A overshift microtest
demonstrated built-in KLEE testcase generation for this pattern. The next line
also has a distinct shift target, testing occurrence separation.

**Potential KLEE difficulty:** the function contains an earlier unary-negation
overflow target and helper arithmetic. A shift-target POC must prevent an earlier
UB from terminating or contaminating paths while preserving original guards and
inputs. Host LP64 again requires explicit-width `u32/s32` modeling.

## Recommendation order

1. Start with the invalid-shift candidate to validate end-to-end target ID,
   full-domain input generation, built-in overshift corroboration, KTest decode,
   and replay.
2. Run the multiplication-overflow candidate to validate explicit overflow
   predicates and helper integration.
3. Run the guarded division candidate to validate compound-expression
   occurrence mapping and outcome taxonomy.

No result is predicted for any candidate. Failure to obtain a testcase remains
`NO_WITNESS_WITHIN_BUDGET`, `UNSUPPORTED`, or another precisely evidenced state,
not a safety conclusion.
