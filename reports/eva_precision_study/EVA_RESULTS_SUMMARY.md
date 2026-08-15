# Eva Precision Study — Results Summary

## Headline results

| Metric | Value |
| --- | ---: |
| Functions analyzed | 46 |
| Baseline alarms | 171 |
| High Precision alarms | 149 |
| Removed | 22 |
| Remaining | 149 |
| New | 0 |
| Net reduction | 22 (12.87%) |
| Functions reduced | 10 |
| Functions unchanged | 36 |
| Functions increased | 0 |
| Baseline zero-alarm functions | 13 |
| High Precision zero-alarm functions | 13 |

The counts refer only to canonical `[eva:alarm]` entries matched as a multiset. Kernel diagnostics and separate internal properties are not merged into these totals. Status describes the difference between the two analyses and does not assign runtime validity.

## Alarm categories

| Category | Baseline | High Precision | Removed | Remaining | New | Delta |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| integer overflow | 118 | 100 | 18 | 100 | 0 | -18 |
| division by zero | 20 | 16 | 4 | 16 | 0 | -4 |
| invalid shift | 33 | 33 | 0 | 33 | 0 | 0 |
| **Total** | **171** | **149** | **22** | **149** | **0** | **-22** |

## Complete function table

| Function | Baseline | High Precision | Delta | Removed | Remaining | New | Status |
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

## Reduced functions

| Function | Baseline | High Precision | Removed | Primary function-level explanation |
| --- | ---: | ---: | ---: | --- |
| `s16_div_s32_s16` | 25 | 20 | 5 | combined branch and nonlinear precision |
| `s16_mul_s16_s16_div_s16` | 11 | 8 | 3 | combined branch and nonlinear precision |
| `s16_mul_s16_u16_div_s16` | 11 | 8 | 3 | combined branch and nonlinear precision |
| `s16_fac05_div_s16_s16` | 11 | 9 | 2 | nonlinear subdivision |
| `s16_mul_s16_s16_div_u16` | 7 | 5 | 2 | nonlinear subdivision |
| `u16_div_s32_u16` | 7 | 5 | 2 | nonlinear and bitwise-aware precision |
| `u16_mul_s16_u16_div_s16` | 11 | 9 | 2 | combined branch and nonlinear precision |
| `s16_mul_u16_s16_div_u16` | 7 | 6 | 1 | nonlinear subdivision |
| `s32_mul_s32_u16` | 3 | 2 | 1 | equality relation across a copied divisor |
| `u16_mul_s16_u16_div_u16` | 7 | 6 | 1 | nonlinear subdivision |

## Integrity checks

```text
171 = 22 removed + 149 remaining
149 = 149 remaining + 0 new
22 = 18 integer overflow + 4 division by zero + 0 invalid shift
46 = 10 reduced + 36 unchanged + 0 increased
```

All comparison invariants pass. All 46 Baseline/High Precision parse-log pairs are byte-identical.
