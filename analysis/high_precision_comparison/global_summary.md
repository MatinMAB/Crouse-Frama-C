# Baseline vs High Precision: Global Summary

## Scope and validation

- Functions compared: **46**
- Valid Eva-log pairs: **46**
- Comparison invariant failures: **0**
- Parse diagnostic mismatches: **0**
- Primary alarm unit: numeric Eva alarms represented by `[eva:alarm]` and included in the official `ANALYSIS SUMMARY` count.
- Internal `missing_return` property markers are documented separately and excluded from primary alarm totals.

## Global alarm totals

| Metric | Value |
|---|---|
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

## Alarm categories

| Category | Baseline | High Precision | Removed | Remaining | New | Delta |
|---|---|---|---|---|---|---|
| integer overflow | 118 | 100 | 18 | 100 | 0 | -18 |
| division by zero | 20 | 16 | 4 | 16 | 0 | -4 |
| invalid shift | 33 | 33 | 0 | 33 | 0 | 0 |

## Final-state status

| Status | Functions |
|---|---|
| CHANGED | 3 |
| IDENTICAL | 43 |

## Zero-alarm transitions

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
