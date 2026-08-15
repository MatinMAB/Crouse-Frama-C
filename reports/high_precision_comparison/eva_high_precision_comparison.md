# Eva Baseline vs High Precision Comparison

## 1. Objective

This study measures how the recorded Eva alarm inventory changes when the same 46 function-level analyses are repeated with the repository's High Precision profile. The comparison is descriptive: it records presence, absence, multiplicity, summary metrics, and final-state text without assessing the underlying program behavior.

## 2. Experimental Control

| Element | Control |
|---|---|
| Source code | Fixed |
| Machine model | Fixed: ppc_32 |
| Preprocessing | Fixed |
| Harness | Fixed and reused |
| Input abstraction | Fixed by the reused harness |
| Entry point | Fixed: eva_main |
| Source/helper list | Fixed per function |
| Parse configuration | Fixed; parse commands verified identical |
| Eva precision configuration | Experimental variable |

For every function, the comparator also verified that the parse-stage command in the Baseline runner is textually identical to the parse-stage command in the corresponding High Precision runner. The 46 pairs of committed parse logs were compared after deterministic path normalization; no diagnostic mismatch was found.

## 3. Baseline Configuration

The Baseline Eva command was extracted from every repository runner. All 46 runners use the same Eva profile:

```bash
frama-c \
-load <PARSE_STATE> \
-eva \
-eva-slevel 1000 \
-eva-ilevel 256 \
-save <OUTPUT_STATE> \
> <OUTPUT_LOG> 2>&1
```

The effective explicit precision controls are `-eva-slevel 1000` and `-eva-ilevel 256`.

## 4. High Precision Configuration

The High Precision command was likewise extracted from all 46 runners:

```bash
frama-c \
-load <PARSE_STATE> \
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
-save <OUTPUT_STATE> \
> <OUTPUT_LOG> 2>&1
```

Every High Precision Eva log explicitly confirms the precision-11 meta-settings: slevel 5000, plevel 2000, partition history 2, automatic loop unroll 1024, minimum loop unroll 4, widening delay 6, and the explicit ilevel 1024 and non-linear subdivision 500 overrides. The relational and auxiliary domains are `cvalue`, `equality`, `symbolic-locations`, `gauges`, `octagon`, and `bitwise`.

## 5. Comparison Methodology

The source of truth is the pair of committed `*_eva.log` files for each function. The parser extracts only source-located `[eva:alarm]` records, joins multiline messages, and cross-checks the resulting count against the official numeric alarm count in `ANALYSIS SUMMARY`. Internal `missing_return` property markers are retained for per-function documentation but excluded from the primary alarm totals because Eva's own numeric summary excludes them.

Analysis-summary metrics, target/helper final-state blocks, and parse diagnostics are extracted independently of the alarm comparison. No analyzer or runner is invoked by this comparator.

## 6. Alarm Matching Algorithm

Each alarm is represented by a canonical signature containing normalized source path, line number, and normalized message. Unicode/ASCII relation variants such as `≢`/`!=`, `≤`/`<=`, and `≥`/`>=` are mapped before whitespace is collapsed. Matching uses a multiset counter rather than a set, so repeated signatures retain their multiplicity. Matched occurrences are `REMAINING`; unmatched Baseline occurrences are `REMOVED`; unmatched High Precision occurrences are `NEW`.

The labels express differences between the two recorded runs only.

## 7. Global Results

| Metric | Value |
|---|---|
| Functions compared | 46 |
| Valid log pairs | 46 |
| Total Baseline alarms | 171 |
| Total High Precision alarms | 149 |
| Net alarm reduction | 22 |
| Reduction percentage | 12.87% |
| REMOVED | 22 |
| REMAINING | 149 |
| NEW | 0 |
| Functions REDUCED | 10 |
| Functions UNCHANGED | 36 |
| Functions INCREASED | 0 |
| Baseline zero-alarm functions | 13 |
| High Precision zero-alarm functions | 13 |
| Comparison invariant failures | 0 |
| Parse diagnostic mismatches | 0 |

## 8. Alarm Category Results

| Alarm Category | Baseline | High Precision | Removed | Remaining | New | Delta |
|---|---|---|---|---|---|---|
| integer overflow | 118 | 100 | 18 | 100 | 0 | -18 |
| division by zero | 20 | 16 | 4 | 16 | 0 | -4 |
| invalid shift | 33 | 33 | 0 | 33 | 0 | 0 |

## 9. Functions with Reduced Alarm Count

| Function | Baseline | High Precision | Delta | Removed | Remaining | New |
|---|---|---|---|---|---|---|
| s16_div_s32_s16 | 25 | 20 | -5 | 5 | 20 | 0 |
| s16_fac05_div_s16_s16 | 11 | 9 | -2 | 2 | 9 | 0 |
| s16_mul_s16_s16_div_s16 | 11 | 8 | -3 | 3 | 8 | 0 |
| s16_mul_s16_s16_div_u16 | 7 | 5 | -2 | 2 | 5 | 0 |
| s16_mul_s16_u16_div_s16 | 11 | 8 | -3 | 3 | 8 | 0 |
| s16_mul_u16_s16_div_u16 | 7 | 6 | -1 | 1 | 6 | 0 |
| s32_mul_s32_u16 | 3 | 2 | -1 | 1 | 2 | 0 |
| u16_div_s32_u16 | 7 | 5 | -2 | 2 | 5 | 0 |
| u16_mul_s16_u16_div_s16 | 11 | 9 | -2 | 2 | 9 | 0 |
| u16_mul_s16_u16_div_u16 | 7 | 6 | -1 | 1 | 6 | 0 |

### Functions sorted by alarm reduction

| Function | Removed − New | Baseline | High Precision | Removed | Remaining | New |
|---|---|---|---|---|---|---|
| s16_div_s32_s16 | 5 | 25 | 20 | 5 | 20 | 0 |
| s16_mul_s16_s16_div_s16 | 3 | 11 | 8 | 3 | 8 | 0 |
| s16_mul_s16_u16_div_s16 | 3 | 11 | 8 | 3 | 8 | 0 |
| s16_fac05_div_s16_s16 | 2 | 11 | 9 | 2 | 9 | 0 |
| s16_mul_s16_s16_div_u16 | 2 | 7 | 5 | 2 | 5 | 0 |
| u16_div_s32_u16 | 2 | 7 | 5 | 2 | 5 | 0 |
| u16_mul_s16_u16_div_s16 | 2 | 11 | 9 | 2 | 9 | 0 |
| s16_mul_u16_s16_div_u16 | 1 | 7 | 6 | 1 | 6 | 0 |
| s32_mul_s32_u16 | 1 | 3 | 2 | 1 | 2 | 0 |
| u16_mul_s16_u16_div_u16 | 1 | 7 | 6 | 1 | 6 | 0 |
| root_s32_mul_s32_s16_fac_less1 | 0 | 3 | 3 | 0 | 3 | 0 |
| root_s32_mul_s32_s8_fac_less1 | 0 | 3 | 3 | 0 | 3 | 0 |
| root_s32_mul_s32_u16_fac_less1 | 0 | 4 | 4 | 0 | 4 | 0 |
| root_s32_mul_s32_u8_fac_less1 | 0 | 3 | 3 | 0 | 3 | 0 |
| root_u32_mul_u32_s16_fac_less1 | 0 | 2 | 2 | 0 | 2 | 0 |
| root_u32_mul_u32_s32_fac_less1 | 0 | 4 | 4 | 0 | 4 | 0 |
| root_u32_mul_u32_s8_fac_less1 | 0 | 2 | 2 | 0 | 2 | 0 |
| rotateLeft | 0 | 0 | 0 | 0 | 0 | 0 |
| rotateRight | 0 | 1 | 1 | 0 | 1 | 0 |
| s16_cos_u32 | 0 | 0 | 0 | 0 | 0 | 0 |
| s16_div_s32_u32 | 0 | 1 | 1 | 0 | 1 | 0 |
| s16_fac05_div_s16_u16 | 0 | 5 | 5 | 0 | 5 | 0 |
| s16_hip1_s16_s8_s8_u16_fac1 | 0 | 5 | 5 | 0 | 5 | 0 |
| s16_hip1_s16_u8_u8_u16_fac1 | 0 | 5 | 5 | 0 | 5 | 0 |
| s16_mmv_s16_s16_s16_fac1 | 0 | 0 | 0 | 0 | 0 | 0 |
| s16_mul_s16_u16_fac025 | 0 | 0 | 0 | 0 | 0 | 0 |
| s16_sin_u32 | 0 | 0 | 0 | 0 | 0 | 0 |
| s16_tan_u32 | 0 | 0 | 0 | 0 | 0 | 0 |
| s32_div_s32_s32 | 0 | 9 | 9 | 0 | 9 | 0 |
| s32_div_s32_u32 | 0 | 1 | 1 | 0 | 1 | 0 |
| s32_div_u32_s32 | 0 | 1 | 1 | 0 | 1 | 0 |
| s32_mul_s32_s16_fac2 | 0 | 1 | 1 | 0 | 1 | 0 |
| s32_mul_s32_s32 | 0 | 3 | 3 | 0 | 3 | 0 |
| s32_mul_s32_s32_fac2 | 0 | 3 | 3 | 0 | 3 | 0 |
| s32_mul_s32_s32_fac_twopow_u8 | 0 | 3 | 3 | 0 | 3 | 0 |
| s32_mul_s32_s8_fac2 | 0 | 1 | 1 | 0 | 1 | 0 |
| s32_mul_u32_s32 | 0 | 1 | 1 | 0 | 1 | 0 |
| u16_cos_u16 | 0 | 0 | 0 | 0 | 0 | 0 |
| u16_mmv_u16_u16_s16_fac1 | 0 | 1 | 1 | 0 | 1 | 0 |
| u16_mul_u16_u8_fac8 | 0 | 0 | 0 | 0 | 0 | 0 |
| u16_sin_u16 | 0 | 0 | 0 | 0 | 0 | 0 |
| u16_tan_u16 | 0 | 0 | 0 | 0 | 0 | 0 |
| u32_div_s32_s32 | 0 | 9 | 9 | 0 | 9 | 0 |
| u32_div_s32_u32 | 0 | 0 | 0 | 0 | 0 | 0 |
| u32_div_u32_s32 | 0 | 0 | 0 | 0 | 0 | 0 |
| u32_mmv_u32_u32_s32_fac1 | 0 | 0 | 0 | 0 | 0 | 0 |

## 10. Functions with Unchanged Alarm Count

| Function | Baseline | High Precision | Removed | Remaining | New |
|---|---|---|---|---|---|
| root_s32_mul_s32_s16_fac_less1 | 3 | 3 | 0 | 3 | 0 |
| root_s32_mul_s32_s8_fac_less1 | 3 | 3 | 0 | 3 | 0 |
| root_s32_mul_s32_u16_fac_less1 | 4 | 4 | 0 | 4 | 0 |
| root_s32_mul_s32_u8_fac_less1 | 3 | 3 | 0 | 3 | 0 |
| root_u32_mul_u32_s16_fac_less1 | 2 | 2 | 0 | 2 | 0 |
| root_u32_mul_u32_s32_fac_less1 | 4 | 4 | 0 | 4 | 0 |
| root_u32_mul_u32_s8_fac_less1 | 2 | 2 | 0 | 2 | 0 |
| rotateLeft | 0 | 0 | 0 | 0 | 0 |
| rotateRight | 1 | 1 | 0 | 1 | 0 |
| s16_cos_u32 | 0 | 0 | 0 | 0 | 0 |
| s16_div_s32_u32 | 1 | 1 | 0 | 1 | 0 |
| s16_fac05_div_s16_u16 | 5 | 5 | 0 | 5 | 0 |
| s16_hip1_s16_s8_s8_u16_fac1 | 5 | 5 | 0 | 5 | 0 |
| s16_hip1_s16_u8_u8_u16_fac1 | 5 | 5 | 0 | 5 | 0 |
| s16_mmv_s16_s16_s16_fac1 | 0 | 0 | 0 | 0 | 0 |
| s16_mul_s16_u16_fac025 | 0 | 0 | 0 | 0 | 0 |
| s16_sin_u32 | 0 | 0 | 0 | 0 | 0 |
| s16_tan_u32 | 0 | 0 | 0 | 0 | 0 |
| s32_div_s32_s32 | 9 | 9 | 0 | 9 | 0 |
| s32_div_s32_u32 | 1 | 1 | 0 | 1 | 0 |
| s32_div_u32_s32 | 1 | 1 | 0 | 1 | 0 |
| s32_mul_s32_s16_fac2 | 1 | 1 | 0 | 1 | 0 |
| s32_mul_s32_s32 | 3 | 3 | 0 | 3 | 0 |
| s32_mul_s32_s32_fac2 | 3 | 3 | 0 | 3 | 0 |
| s32_mul_s32_s32_fac_twopow_u8 | 3 | 3 | 0 | 3 | 0 |
| s32_mul_s32_s8_fac2 | 1 | 1 | 0 | 1 | 0 |
| s32_mul_u32_s32 | 1 | 1 | 0 | 1 | 0 |
| u16_cos_u16 | 0 | 0 | 0 | 0 | 0 |
| u16_mmv_u16_u16_s16_fac1 | 1 | 1 | 0 | 1 | 0 |
| u16_mul_u16_u8_fac8 | 0 | 0 | 0 | 0 | 0 |
| u16_sin_u16 | 0 | 0 | 0 | 0 | 0 |
| u16_tan_u16 | 0 | 0 | 0 | 0 | 0 |
| u32_div_s32_s32 | 9 | 9 | 0 | 9 | 0 |
| u32_div_s32_u32 | 0 | 0 | 0 | 0 | 0 |
| u32_div_u32_s32 | 0 | 0 | 0 | 0 | 0 |
| u32_mmv_u32_u32_s32_fac1 | 0 | 0 | 0 | 0 | 0 |

## 11. Functions with Increased Alarm Count

None.

## 12. Zero-alarm Functions

### Baseline > 0 → High Precision = 0

None.

### Baseline = 0 → High Precision = 0

- `rotateLeft`
- `s16_cos_u32`
- `s16_mmv_s16_s16_s16_fac1`
- `s16_mul_s16_u16_fac025`
- `s16_sin_u32`
- `s16_tan_u32`
- `u16_cos_u16`
- `u16_mul_u16_u8_fac8`
- `u16_sin_u16`
- `u16_tan_u16`
- `u32_div_s32_u32`
- `u32_div_u32_s32`
- `u32_mmv_u32_u32_s32_fac1`

### Baseline = 0 → High Precision > 0

None.

## 13. Removed Alarm Inventory

| Function | Source | Line | Category | Message |
|---|---|---|---|---|
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 274 | integer overflow | signed overflow. assert -2147483648 ≤ s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator); |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 274 | integer overflow | signed overflow. assert s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator) ≤ 2147483647; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 274 | integer overflow | signed overflow. assert s32Temp1 / (s32)denominator ≤ 2147483647; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 297 | integer overflow | signed overflow. assert -2147483648 ≤ s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator); |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 297 | integer overflow | signed overflow. assert s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator) ≤ 2147483647; |
| s16_fac05_div_s16_s16 | src_analysis/sources/div_Ccode.c | 190 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(s32Temp1 / (s32)denominator) * (s32)denominator; |
| s16_fac05_div_s16_s16 | src_analysis/sources/div_Ccode.c | 190 | integer overflow | signed overflow. assert s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator) ≤ 2147483647; |
| s16_mul_s16_s16_div_s16 | src_analysis/sources/div_Ccode.c | 964 | integer overflow | signed overflow. assert -2147483648 ≤ s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div); |
| s16_mul_s16_s16_div_s16 | src_analysis/sources/div_Ccode.c | 964 | integer overflow | signed overflow. assert s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div) ≤ 2147483647; |
| s16_mul_s16_s16_div_s16 | src_analysis/sources/div_Ccode.c | 965 | division by zero | division by zero. assert (s32)div ≢ 0; |
| s16_mul_s16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 1022 | integer overflow | signed overflow. assert -2147483648 ≤ s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator); |
| s16_mul_s16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 1022 | integer overflow | signed overflow. assert s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator) ≤ 2147483647; |
| s16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 628 | integer overflow | signed overflow. assert -2147483648 ≤ s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator); |
| s16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 628 | integer overflow | signed overflow. assert s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator) ≤ 2147483647; |
| s16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 630 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| s16_mul_u16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 684 | integer overflow | signed overflow. assert s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator) ≤ 2147483647; |
| s32_mul_s32_u16 | src_analysis/sources/mul_Ccode.c | 760 | division by zero | division by zero. assert s32Factor ≢ 0; |
| u16_div_s32_u16 | src_analysis/sources/div_Ccode.c | 495 | integer overflow | signed overflow. assert -2147483648 ≤ x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value); |
| u16_div_s32_u16 | src_analysis/sources/div_Ccode.c | 495 | integer overflow | signed overflow. assert x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value) ≤ 2147483647; |
| u16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 740 | integer overflow | signed overflow. assert s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator) ≤ 2147483647; |
| u16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 741 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| u16_mul_s16_u16_div_u16 | src_analysis/sources/div_Ccode.c | 795 | integer overflow | signed overflow. assert s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator) ≤ 2147483647; |

## 14. Remaining Alarm Inventory

| Function | Source | Line | Category | Message |
|---|---|---|---|---|
| root_s32_mul_s32_s16_fac_less1 | src_analysis/sources/mul_Ccode.c | 5071 | integer overflow | signed overflow. assert -value ≤ 2147483647; |
| root_s32_mul_s32_s16_fac_less1 | src_analysis/sources/mul_Ccode.c | 5089 | invalid shift | invalid RHS operand for shift. assert 0 ≤ count < 32; |
| root_s32_mul_s32_s16_fac_less1 | src_analysis/sources/mul_Ccode.c | 5090 | invalid shift | invalid RHS operand for shift. assert 0 ≤ (u32)(32 - count) < 32; |
| root_s32_mul_s32_s8_fac_less1 | src_analysis/sources/mul_Ccode.c | 5223 | integer overflow | signed overflow. assert -value ≤ 2147483647; |
| root_s32_mul_s32_s8_fac_less1 | src_analysis/sources/mul_Ccode.c | 5241 | invalid shift | invalid RHS operand for shift. assert 0 ≤ count < 32; |
| root_s32_mul_s32_s8_fac_less1 | src_analysis/sources/mul_Ccode.c | 5242 | invalid shift | invalid RHS operand for shift. assert 0 ≤ (u32)(32 - count) < 32; |
| root_s32_mul_s32_u16_fac_less1 | src_analysis/sources/MulHword.c | 47 | integer overflow | signed overflow. assert (int)arg1_LW * (int)arg2_LW ≤ 2147483647; |
| root_s32_mul_s32_u16_fac_less1 | src_analysis/sources/mul_Ccode.c | 5147 | integer overflow | signed overflow. assert -value ≤ 2147483647; |
| root_s32_mul_s32_u16_fac_less1 | src_analysis/sources/mul_Ccode.c | 5165 | invalid shift | invalid RHS operand for shift. assert 0 ≤ count < 32; |
| root_s32_mul_s32_u16_fac_less1 | src_analysis/sources/mul_Ccode.c | 5166 | invalid shift | invalid RHS operand for shift. assert 0 ≤ (u32)(32 - count) < 32; |
| root_s32_mul_s32_u8_fac_less1 | src_analysis/sources/mul_Ccode.c | 5534 | integer overflow | signed overflow. assert -value ≤ 2147483647; |
| root_s32_mul_s32_u8_fac_less1 | src_analysis/sources/mul_Ccode.c | 5544 | invalid shift | invalid RHS operand for shift. assert 0 ≤ count < 32; |
| root_s32_mul_s32_u8_fac_less1 | src_analysis/sources/mul_Ccode.c | 5545 | invalid shift | invalid RHS operand for shift. assert 0 ≤ (u32)(32 - count) < 32; |
| root_u32_mul_u32_s16_fac_less1 | src_analysis/sources/mul_Ccode.c | 5309 | invalid shift | invalid RHS operand for shift. assert 0 ≤ count < 32; |
| root_u32_mul_u32_s16_fac_less1 | src_analysis/sources/mul_Ccode.c | 5310 | invalid shift | invalid RHS operand for shift. assert 0 ≤ (u32)(32 - count) < 32; |
| root_u32_mul_u32_s32_fac_less1 | src_analysis/sources/MulHword.c | 47 | integer overflow | signed overflow. assert (int)arg1_LW * (int)arg2_LW ≤ 2147483647; |
| root_u32_mul_u32_s32_fac_less1 | src_analysis/sources/MulHword.c | 49 | integer overflow | signed overflow. assert (int)arg1_HW * (int)arg2_LW ≤ 2147483647; |
| root_u32_mul_u32_s32_fac_less1 | src_analysis/sources/mul_Ccode.c | 5364 | integer overflow | signed overflow. assert -factor ≤ 2147483647; |
| root_u32_mul_u32_s32_fac_less1 | src_analysis/sources/mul_Ccode.c | 5372 | invalid shift | invalid RHS operand for shift. assert 0 ≤ (u32)(count - 32) < 32; |
| root_u32_mul_u32_s8_fac_less1 | src_analysis/sources/mul_Ccode.c | 5451 | invalid shift | invalid RHS operand for shift. assert 0 ≤ count < 32; |
| root_u32_mul_u32_s8_fac_less1 | src_analysis/sources/mul_Ccode.c | 5452 | invalid shift | invalid RHS operand for shift. assert 0 ≤ (u32)(32 - count) < 32; |
| rotateRight | src_analysis/sources/rotatefunc.c | 119 | integer overflow | signed overflow. assert 1 << INT_BITS ≤ 2147483647; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 274 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 274 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)); |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 274 | integer overflow | signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 274 | integer overflow | signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator ≤ 2147483647; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 274 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(s32Temp1 / (s32)denominator) * (s32)denominator; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 275 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 276 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 276 | integer overflow | signed overflow. assert -2147483648 ≤ s32Temp1 + (s32)(numerator / (s32)denominator); |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 276 | integer overflow | signed overflow. assert s32Temp1 + (s32)(numerator / (s32)denominator) ≤ 2147483647; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 297 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 297 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)); |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 297 | integer overflow | signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 297 | integer overflow | signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator ≤ 2147483647; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 297 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(s32Temp1 / (s32)denominator) * (s32)denominator; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 297 | integer overflow | signed overflow. assert s32Temp1 / (s32)denominator ≤ 2147483647; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 298 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 299 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 299 | integer overflow | signed overflow. assert -2147483648 ≤ s32Temp1 + (s32)(numerator / (s32)denominator); |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 299 | integer overflow | signed overflow. assert numerator / (s32)denominator ≤ 2147483647; |
| s16_div_s32_s16 | src_analysis/sources/div_Ccode.c | 299 | integer overflow | signed overflow. assert s32Temp1 + (s32)(numerator / (s32)denominator) ≤ 2147483647; |
| s16_div_s32_u32 | src_analysis/sources/div_Ccode.c | 1477 | integer overflow | signed overflow. assert -numerator ≤ 2147483647; |
| s16_fac05_div_s16_s16 | src_analysis/sources/div_Ccode.c | 173 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (int)numerator; |
| s16_fac05_div_s16_s16 | src_analysis/sources/div_Ccode.c | 190 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| s16_fac05_div_s16_s16 | src_analysis/sources/div_Ccode.c | 190 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)); |
| s16_fac05_div_s16_s16 | src_analysis/sources/div_Ccode.c | 190 | integer overflow | signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647; |
| s16_fac05_div_s16_s16 | src_analysis/sources/div_Ccode.c | 190 | integer overflow | signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator ≤ 2147483647; |
| s16_fac05_div_s16_s16 | src_analysis/sources/div_Ccode.c | 191 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| s16_fac05_div_s16_s16 | src_analysis/sources/div_Ccode.c | 192 | division by zero | division by zero. assert (int)denominator ≢ 0; |
| s16_fac05_div_s16_s16 | src_analysis/sources/div_Ccode.c | 192 | integer overflow | signed overflow. assert -2147483648 ≤ s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator)); |
| s16_fac05_div_s16_s16 | src_analysis/sources/div_Ccode.c | 192 | integer overflow | signed overflow. assert s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator)) ≤ 2147483647; |
| s16_fac05_div_s16_u16 | src_analysis/sources/div_Ccode.c | 348 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (int)numerator; |
| s16_fac05_div_s16_u16 | src_analysis/sources/div_Ccode.c | 362 | integer overflow | signed overflow. assert (int)((int)((int)numerator << 16) / (int)u16Temp1) * (int)u16Temp1 ≤ 2147483647; |
| s16_fac05_div_s16_u16 | src_analysis/sources/div_Ccode.c | 363 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ s32Temp1; |
| s16_fac05_div_s16_u16 | src_analysis/sources/div_Ccode.c | 363 | integer overflow | signed overflow. assert s32Temp1 << 1 ≤ 2147483647; |
| s16_fac05_div_s16_u16 | src_analysis/sources/div_Ccode.c | 365 | integer overflow | signed overflow. assert (s32)((int)((int)((int)numerator << 16) / (int)u16Temp1)) + s32Temp1 ≤ 2147483647; |
| s16_hip1_s16_s8_s8_u16_fac1 | src_analysis/sources/hip_Ccode.c | 163 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (int)((int)u - (int)uold); |
| s16_hip1_s16_s8_s8_u16_fac1 | src_analysis/sources/hip_Ccode.c | 166 | integer overflow | signed overflow. assert -2147483648 ≤ s32Temp1 - s32Temp2; |
| s16_hip1_s16_s8_s8_u16_fac1 | src_analysis/sources/hip_Ccode.c | 166 | integer overflow | signed overflow. assert s32Temp1 - s32Temp2 ≤ 2147483647; |
| s16_hip1_s16_s8_s8_u16_fac1 | src_analysis/sources/hip_Ccode.c | 167 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ s32Temp2; |
| s16_hip1_s16_s8_s8_u16_fac1 | src_analysis/sources/hip_Ccode.c | 167 | integer overflow | signed overflow. assert s32Temp2 << 1 ≤ 2147483647; |
| s16_hip1_s16_u8_u8_u16_fac1 | src_analysis/sources/hip_Ccode.c | 49 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (int)((int)u - (int)uold); |
| s16_hip1_s16_u8_u8_u16_fac1 | src_analysis/sources/hip_Ccode.c | 52 | integer overflow | signed overflow. assert -2147483648 ≤ s32Temp1 - s32Temp2; |
| s16_hip1_s16_u8_u8_u16_fac1 | src_analysis/sources/hip_Ccode.c | 52 | integer overflow | signed overflow. assert s32Temp1 - s32Temp2 ≤ 2147483647; |
| s16_hip1_s16_u8_u8_u16_fac1 | src_analysis/sources/hip_Ccode.c | 53 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ s32Temp2; |
| s16_hip1_s16_u8_u8_u16_fac1 | src_analysis/sources/hip_Ccode.c | 53 | integer overflow | signed overflow. assert s32Temp2 << 1 ≤ 2147483647; |
| s16_mul_s16_s16_div_s16 | src_analysis/sources/div_Ccode.c | 964 | division by zero | division by zero. assert (s32)div ≢ 0; |
| s16_mul_s16_s16_div_s16 | src_analysis/sources/div_Ccode.c | 964 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)); |
| s16_mul_s16_s16_div_s16 | src_analysis/sources/div_Ccode.c | 964 | integer overflow | signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)) << 1 ≤ 2147483647; |
| s16_mul_s16_s16_div_s16 | src_analysis/sources/div_Ccode.c | 964 | integer overflow | signed overflow. assert (s32)(s32Temp1 / (s32)div) * (s32)div ≤ 2147483647; |
| s16_mul_s16_s16_div_s16 | src_analysis/sources/div_Ccode.c | 964 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(s32Temp1 / (s32)div) * (s32)div; |
| s16_mul_s16_s16_div_s16 | src_analysis/sources/div_Ccode.c | 965 | division by zero | division by zero. assert (s32)div ≢ 0; |
| s16_mul_s16_s16_div_s16 | src_analysis/sources/div_Ccode.c | 965 | integer overflow | signed overflow. assert (s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div) ≤ 2147483647; |
| s16_mul_s16_s16_div_s16 | src_analysis/sources/div_Ccode.c | 965 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div); |
| s16_mul_s16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 1022 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)); |
| s16_mul_s16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 1022 | integer overflow | signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647; |
| s16_mul_s16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 1022 | integer overflow | signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator ≤ 2147483647; |
| s16_mul_s16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 1022 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(s32Result / (s32)denominator) * (s32)denominator; |
| s16_mul_s16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 1023 | integer overflow | signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) ≤ 2147483647; |
| s16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 628 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| s16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 628 | integer overflow | signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator ≤ 2147483647; |
| s16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 628 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(s32Result / (s32)denominator) * (s32)denominator; |
| s16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 629 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ s32Temp1; |
| s16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 629 | integer overflow | signed overflow. assert s32Temp1 << 1 ≤ 2147483647; |
| s16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 630 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| s16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 630 | integer overflow | signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) ≤ 2147483647; |
| s16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 630 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator); |
| s16_mul_u16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 684 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)); |
| s16_mul_u16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 684 | integer overflow | signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647; |
| s16_mul_u16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 684 | integer overflow | signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator ≤ 2147483647; |
| s16_mul_u16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 684 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(s32Result / (s32)denominator) * (s32)denominator; |
| s16_mul_u16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 684 | integer overflow | signed overflow. assert -2147483648 ≤ s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator); |
| s16_mul_u16_s16_div_u16 | src_analysis/sources/div_Ccode.c | 685 | integer overflow | signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) ≤ 2147483647; |
| s32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1394 | integer overflow | signed overflow. assert -numerator ≤ 2147483647; |
| s32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1395 | integer overflow | signed overflow. assert -denominator ≤ 2147483647; |
| s32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1410 | integer overflow | signed overflow. assert (s32)(~numerator) + 1 ≤ 2147483647; |
| s32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1413 | integer overflow | signed overflow. assert (s32)(~s32Temp2) + 1 ≤ 2147483647; |
| s32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1426 | integer overflow | signed overflow. assert (s32)(~denominator) + 1 ≤ 2147483647; |
| s32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1429 | integer overflow | signed overflow. assert (s32)(~s32Temp2) + 1 ≤ 2147483647; |
| s32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1434 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)); |
| s32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1434 | integer overflow | signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 ≤ 2147483647; |
| s32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1434 | integer overflow | signed overflow. assert (s32)(numerator / denominator) * denominator ≤ 2147483647; |
| s32_div_s32_u32 | src_analysis/sources/div_Ccode.c | 1330 | integer overflow | signed overflow. assert -numerator ≤ 2147483647; |
| s32_div_u32_s32 | src_analysis/sources/div_Ccode.c | 1267 | integer overflow | signed overflow. assert -denominator ≤ 2147483647; |
| s32_mul_s32_s16_fac2 | src_analysis/sources/mul_Ccode.c | 1993 | integer overflow | signed overflow. assert -val1 ≤ 2147483647; |
| s32_mul_s32_s32 | src_analysis/sources/MulHword.c | 47 | integer overflow | signed overflow. assert (int)arg1_LW * (int)arg2_LW ≤ 2147483647; |
| s32_mul_s32_s32 | src_analysis/sources/mul_Ccode.c | 2672 | integer overflow | signed overflow. assert -val1 ≤ 2147483647; |
| s32_mul_s32_s32 | src_analysis/sources/mul_Ccode.c | 2681 | integer overflow | signed overflow. assert -val2 ≤ 2147483647; |
| s32_mul_s32_s32_fac2 | src_analysis/sources/MulHword.c | 47 | integer overflow | signed overflow. assert (int)arg1_LW * (int)arg2_LW ≤ 2147483647; |
| s32_mul_s32_s32_fac2 | src_analysis/sources/mul_Ccode.c | 2223 | integer overflow | signed overflow. assert -value ≤ 2147483647; |
| s32_mul_s32_s32_fac2 | src_analysis/sources/mul_Ccode.c | 2232 | integer overflow | signed overflow. assert -factor ≤ 2147483647; |
| s32_mul_s32_s32_fac_twopow_u8 | src_analysis/sources/MulHword.c | 47 | integer overflow | signed overflow. assert (int)arg1_LW * (int)arg2_LW ≤ 2147483647; |
| s32_mul_s32_s32_fac_twopow_u8 | src_analysis/sources/mul_Ccode.c | 2454 | integer overflow | signed overflow. assert -value ≤ 2147483647; |
| s32_mul_s32_s32_fac_twopow_u8 | src_analysis/sources/mul_Ccode.c | 2463 | integer overflow | signed overflow. assert -factor ≤ 2147483647; |
| s32_mul_s32_s8_fac2 | src_analysis/sources/mul_Ccode.c | 2600 | integer overflow | signed overflow. assert -value ≤ 2147483647; |
| s32_mul_s32_u16 | src_analysis/sources/mul_Ccode.c | 767 | integer overflow | signed overflow. assert -2147483648 ≤ value * (s32)factor; |
| s32_mul_s32_u16 | src_analysis/sources/mul_Ccode.c | 778 | integer overflow | signed overflow. assert value * (s32)factor ≤ 2147483647; |
| s32_mul_u32_s32 | src_analysis/sources/mul_Ccode.c | 1762 | integer overflow | signed overflow. assert -val2 ≤ 2147483647; |
| u16_div_s32_u16 | src_analysis/sources/div_Ccode.c | 495 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)); |
| u16_div_s32_u16 | src_analysis/sources/div_Ccode.c | 495 | integer overflow | signed overflow. assert (s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)) << 1 ≤ 2147483647; |
| u16_div_s32_u16 | src_analysis/sources/div_Ccode.c | 495 | integer overflow | signed overflow. assert (s32)(x_value / (s32)y_value) * (s32)y_value ≤ 2147483647; |
| u16_div_s32_u16 | src_analysis/sources/div_Ccode.c | 495 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(x_value / (s32)y_value) * (s32)y_value; |
| u16_div_s32_u16 | src_analysis/sources/div_Ccode.c | 496 | integer overflow | signed overflow. assert (s32)(s32Temp1 / (s32)y_value) + (s32)(x_value / (s32)y_value) ≤ 2147483647; |
| u16_mmv_u16_u16_s16_fac1 | src_analysis/sources/avrg_Ccode.c | 249 | integer overflow | signed overflow. assert -s32mmv ≤ 2147483647; |
| u16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 740 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| u16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 740 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)); |
| u16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 740 | integer overflow | signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647; |
| u16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 740 | integer overflow | signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator ≤ 2147483647; |
| u16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 740 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(s32Result / (s32)denominator) * (s32)denominator; |
| u16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 740 | integer overflow | signed overflow. assert -2147483648 ≤ s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator); |
| u16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 741 | division by zero | division by zero. assert (s32)denominator ≢ 0; |
| u16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 741 | integer overflow | signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) ≤ 2147483647; |
| u16_mul_s16_u16_div_s16 | src_analysis/sources/div_Ccode.c | 741 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator); |
| u16_mul_s16_u16_div_u16 | src_analysis/sources/div_Ccode.c | 795 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)); |
| u16_mul_s16_u16_div_u16 | src_analysis/sources/div_Ccode.c | 795 | integer overflow | signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647; |
| u16_mul_s16_u16_div_u16 | src_analysis/sources/div_Ccode.c | 795 | integer overflow | signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator ≤ 2147483647; |
| u16_mul_s16_u16_div_u16 | src_analysis/sources/div_Ccode.c | 795 | integer overflow | signed overflow. assert -2147483648 ≤ (s32)(s32Result / (s32)denominator) * (s32)denominator; |
| u16_mul_s16_u16_div_u16 | src_analysis/sources/div_Ccode.c | 795 | integer overflow | signed overflow. assert -2147483648 ≤ s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator); |
| u16_mul_s16_u16_div_u16 | src_analysis/sources/div_Ccode.c | 796 | integer overflow | signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) ≤ 2147483647; |
| u32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1168 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)); |
| u32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1168 | integer overflow | signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 ≤ 2147483647; |
| u32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1168 | integer overflow | signed overflow. assert (s32)(numerator / denominator) * denominator ≤ 2147483647; |
| u32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1182 | integer overflow | signed overflow. assert -numerator ≤ 2147483647; |
| u32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1183 | integer overflow | signed overflow. assert -denominator ≤ 2147483647; |
| u32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1184 | division by zero | division by zero. assert denominator ≢ 0; |
| u32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1184 | invalid shift | invalid LHS operand for left shift. assert 0 ≤ (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)); |
| u32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1184 | integer overflow | signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 ≤ 2147483647; |
| u32_div_s32_s32 | src_analysis/sources/div_Ccode.c | 1184 | integer overflow | signed overflow. assert (s32)(numerator / denominator) * denominator ≤ 2147483647; |

## 15. New Alarm Inventory

None.

## 16. Final-State Differences

Target-function final-state text changed for 3 functions and was unavailable on one or both sides for 0 functions. A normalized block-level diff is included in each per-function report.

Changed target final states:

- `s16_hip1_s16_s8_s8_u16_fac1`
- `s16_hip1_s16_u8_u8_u16_fac1`
- `u16_sin_u16`

Not-available target final states:

None.

## 17. Detailed Function Table

| Function | Baseline | High Precision | Delta | Removed | Remaining | New | Status |
|---|---|---|---|---|---|---|---|
| root_s32_mul_s32_s16_fac_less1 | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| root_s32_mul_s32_s8_fac_less1 | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| root_s32_mul_s32_u16_fac_less1 | 4 | 4 | 0 | 0 | 4 | 0 | UNCHANGED |
| root_s32_mul_s32_u8_fac_less1 | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| root_u32_mul_u32_s16_fac_less1 | 2 | 2 | 0 | 0 | 2 | 0 | UNCHANGED |
| root_u32_mul_u32_s32_fac_less1 | 4 | 4 | 0 | 0 | 4 | 0 | UNCHANGED |
| root_u32_mul_u32_s8_fac_less1 | 2 | 2 | 0 | 0 | 2 | 0 | UNCHANGED |
| rotateLeft | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| rotateRight | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| s16_cos_u32 | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| s16_div_s32_s16 | 25 | 20 | -5 | 5 | 20 | 0 | REDUCED |
| s16_div_s32_u32 | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| s16_fac05_div_s16_s16 | 11 | 9 | -2 | 2 | 9 | 0 | REDUCED |
| s16_fac05_div_s16_u16 | 5 | 5 | 0 | 0 | 5 | 0 | UNCHANGED |
| s16_hip1_s16_s8_s8_u16_fac1 | 5 | 5 | 0 | 0 | 5 | 0 | UNCHANGED |
| s16_hip1_s16_u8_u8_u16_fac1 | 5 | 5 | 0 | 0 | 5 | 0 | UNCHANGED |
| s16_mmv_s16_s16_s16_fac1 | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| s16_mul_s16_s16_div_s16 | 11 | 8 | -3 | 3 | 8 | 0 | REDUCED |
| s16_mul_s16_s16_div_u16 | 7 | 5 | -2 | 2 | 5 | 0 | REDUCED |
| s16_mul_s16_u16_div_s16 | 11 | 8 | -3 | 3 | 8 | 0 | REDUCED |
| s16_mul_s16_u16_fac025 | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| s16_mul_u16_s16_div_u16 | 7 | 6 | -1 | 1 | 6 | 0 | REDUCED |
| s16_sin_u32 | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| s16_tan_u32 | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| s32_div_s32_s32 | 9 | 9 | 0 | 0 | 9 | 0 | UNCHANGED |
| s32_div_s32_u32 | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| s32_div_u32_s32 | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| s32_mul_s32_s16_fac2 | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| s32_mul_s32_s32 | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| s32_mul_s32_s32_fac2 | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| s32_mul_s32_s32_fac_twopow_u8 | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| s32_mul_s32_s8_fac2 | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| s32_mul_s32_u16 | 3 | 2 | -1 | 1 | 2 | 0 | REDUCED |
| s32_mul_u32_s32 | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| u16_cos_u16 | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| u16_div_s32_u16 | 7 | 5 | -2 | 2 | 5 | 0 | REDUCED |
| u16_mmv_u16_u16_s16_fac1 | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| u16_mul_s16_u16_div_s16 | 11 | 9 | -2 | 2 | 9 | 0 | REDUCED |
| u16_mul_s16_u16_div_u16 | 7 | 6 | -1 | 1 | 6 | 0 | REDUCED |
| u16_mul_u16_u8_fac8 | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| u16_sin_u16 | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| u16_tan_u16 | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| u32_div_s32_s32 | 9 | 9 | 0 | 0 | 9 | 0 | UNCHANGED |
| u32_div_s32_u32 | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| u32_div_u32_s32 | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| u32_mmv_u32_u32_s32_fac1 | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |

## 18. Reproducibility

From the repository root, regenerate every comparison artifact with:

```bash
python3 scripts/comparison/compare_baseline_high_precision.py
```

The tool reads `analysis/high_precision/functions.txt`, the committed Baseline/High Precision logs, parse logs, and the corresponding runner scripts. It writes only under `analysis/high_precision_comparison/` and `reports/high_precision_comparison/`. A nonzero exit indicates missing inputs, count inconsistencies, runner-control drift, failed sanity checks, or broken multiset/global invariants.

## 19. Limitations

Canonical matching intentionally depends on source path, line, and normalized message. Semantically related alarms at different lines or with materially different predicates are therefore not merged. Final states are compared textually after whitespace normalization; the report does not attempt semantic equivalence checking between abstract states. Summary percentages inherit Frama-C's integer formatting.

## 20. Conclusion

All 46 function pairs passed structural, summary-count, multiset, category-total, runner-control, and sanity-check validation. The tables above quantify only the observed differences between the two committed Eva configurations. Further interpretation is outside the scope of this comparison stage.
