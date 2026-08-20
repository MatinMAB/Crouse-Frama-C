# Per-Function Eva/KLEE Comparison

All 46 frozen in-scope functions are included, including the 13 functions with zero High-Precision alarms.

| Function | Baseline EVA | High-Precision EVA | Removed | KLEE Targets | Counterexamples | No Counterexample | Timeout | Build/KLEE Error | Unsupported/Not Run | Inconclusive | CE Rate | No-CE Rate | Timeout Rate | Final Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| root_s32_mul_s32_s16_fac_less1 | 3 | 3 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| root_s32_mul_s32_s8_fac_less1 | 3 | 3 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| root_s32_mul_s32_u16_fac_less1 | 4 | 4 | 0 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| root_s32_mul_s32_u8_fac_less1 | 3 | 3 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| root_u32_mul_u32_s16_fac_less1 | 2 | 2 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| root_u32_mul_u32_s32_fac_less1 | 4 | 4 | 0 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| root_u32_mul_u32_s8_fac_less1 | 2 | 2 | 0 | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| rotateLeft | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| rotateRight | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| s16_cos_u32 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| s16_div_s32_s16 | 25 | 20 | 5 | 20 | 0 | 1 | 19 | 0 | 0 | 0 | 0.00% | 5.00% | 95.00% | All targets accounted for. |
| s16_div_s32_u32 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| s16_fac05_div_s16_s16 | 11 | 9 | 2 | 9 | 1 | 1 | 7 | 0 | 0 | 0 | 11.11% | 11.11% | 77.78% | All targets accounted for. |
| s16_fac05_div_s16_u16 | 5 | 5 | 0 | 5 | 1 | 1 | 3 | 0 | 0 | 0 | 20.00% | 20.00% | 60.00% | All targets accounted for. |
| s16_hip1_s16_s8_s8_u16_fac1 | 5 | 5 | 0 | 5 | 2 | 3 | 0 | 0 | 0 | 0 | 40.00% | 60.00% | 0.00% | All targets accounted for. |
| s16_hip1_s16_u8_u8_u16_fac1 | 5 | 5 | 0 | 5 | 2 | 3 | 0 | 0 | 0 | 0 | 40.00% | 60.00% | 0.00% | All targets accounted for. |
| s16_mmv_s16_s16_s16_fac1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| s16_mul_s16_s16_div_s16 | 11 | 8 | 3 | 8 | 0 | 1 | 7 | 0 | 0 | 0 | 0.00% | 12.50% | 87.50% | All targets accounted for. |
| s16_mul_s16_s16_div_u16 | 7 | 5 | 2 | 5 | 0 | 0 | 5 | 0 | 0 | 0 | 0.00% | 0.00% | 100.00% | All targets accounted for. |
| s16_mul_s16_u16_div_s16 | 11 | 8 | 3 | 8 | 0 | 1 | 7 | 0 | 0 | 0 | 0.00% | 12.50% | 87.50% | All targets accounted for. |
| s16_mul_s16_u16_fac025 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| s16_mul_u16_s16_div_u16 | 7 | 6 | 1 | 6 | 0 | 0 | 6 | 0 | 0 | 0 | 0.00% | 0.00% | 100.00% | All targets accounted for. |
| s16_sin_u32 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| s16_tan_u32 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| s32_div_s32_s32 | 9 | 9 | 0 | 9 | 4 | 0 | 5 | 0 | 0 | 0 | 44.44% | 0.00% | 55.56% | All targets accounted for. |
| s32_div_s32_u32 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| s32_div_u32_s32 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| s32_mul_s32_s16_fac2 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| s32_mul_s32_s32 | 3 | 3 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| s32_mul_s32_s32_fac2 | 3 | 3 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| s32_mul_s32_s32_fac_twopow_u8 | 3 | 3 | 0 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| s32_mul_s32_s8_fac2 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| s32_mul_s32_u16 | 3 | 2 | 1 | 2 | 0 | 2 | 0 | 0 | 0 | 0 | 0.00% | 100.00% | 0.00% | All targets accounted for. |
| s32_mul_u32_s32 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 100.00% | 0.00% | 0.00% | All targets accounted for. |
| u16_cos_u16 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| u16_div_s32_u16 | 7 | 5 | 2 | 5 | 0 | 0 | 5 | 0 | 0 | 0 | 0.00% | 0.00% | 100.00% | All targets accounted for. |
| u16_mmv_u16_u16_s16_fac1 | 1 | 1 | 0 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0.00% | 100.00% | 0.00% | All targets accounted for. |
| u16_mul_s16_u16_div_s16 | 11 | 9 | 2 | 9 | 0 | 1 | 8 | 0 | 0 | 0 | 0.00% | 11.11% | 88.89% | All targets accounted for. |
| u16_mul_s16_u16_div_u16 | 7 | 6 | 1 | 6 | 0 | 0 | 6 | 0 | 0 | 0 | 0.00% | 0.00% | 100.00% | All targets accounted for. |
| u16_mul_u16_u8_fac8 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| u16_sin_u16 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| u16_tan_u16 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| u32_div_s32_s32 | 9 | 9 | 0 | 9 | 1 | 0 | 8 | 0 | 0 | 0 | 11.11% | 0.00% | 88.89% | All targets accounted for. |
| u32_div_s32_u32 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| u32_div_u32_s32 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| u32_mmv_u32_u32_s32_fac1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | N/A | N/A | N/A | No High-Precision alarms; no KLEE target. |
| TOTAL | 171 | 149 | 22 | 149 | 48 | 15 | 86 | 0 | 0 | 0 | 32.21% | 10.07% | 57.72% | Reconciled |

## Reconciliation

- Baseline Eva: 171
- High-Precision Eva / KLEE targets: 149
- Removed by precision: 22
- KLEE outcomes: 149

Rates in function rows use that function's High-Precision target count as denominator. Zero-target functions report `N/A` rates.
