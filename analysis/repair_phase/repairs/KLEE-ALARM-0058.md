# KLEE-ALARM-0058 Repair Record

## Frozen occurrence and property

- Function: `s16_hip1_s16_s8_s8_u16_fac1`
- Original occurrence: `src_analysis/sources/hip_Ccode.c:163` (occurrence 1)
- Original statement: `s16uold = (u - uold) << 7;`
- Original expression: `(int)((int)u - (int)uold) << 7`
- Eva safety property: `(int)((int)u - (int)uold) >= 0`
- Inserted ACSL property: `(int)((int)u - (int)uold) >= 0`
- ACSL label: `eva_klee_alarm_0058`
- Current assertion: `src_repaired/sources/hip_Ccode.c:194`

## Concrete KLEE witness

- Decoded inputs: `yold=0 (0x0000); u=-128 (0x80); uold=0 (0x00); m=0 (0x0000)`
- Target assertion: `KLEE-ALARM-0058: invalid LHS operand for left shift. assert 0 <= (int)((int)u - (int)uold);`
- KTest: `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058/build/klee-out-alarm-0058/test000001.ktest`
- Target `.err`: `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058/build/klee-out-alarm-0058/test000001.klee-alarm-0058.err`
- Timeout after witness: `NO`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Implemented repair

Retain the original shift and assertion for nonnegative operands; use equivalent, range-safe multiplication by the documented fixed-point scale for negative operands.

- Status: `REPAIRED_SHARED`
- Repair commit: `57864b43199db1c7046c201d40fb52dabafdb3a6`
- Additionally affected alarms: `KLEE-ALARM-0044,0053,0058,0061,0063,0066`
