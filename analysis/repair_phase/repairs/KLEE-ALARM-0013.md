# KLEE-ALARM-0013 Repair Record

## Frozen occurrence and property

- Function: `root_s32_mul_s32_u8_fac_less1`
- Original occurrence: `src_analysis/sources/mul_Ccode.c:5545` (occurrence 1)
- Original statement: `u32Temp2 |= u32Temp3 << (32-count);`
- Original expression: `u32Temp3 << (32-count)`
- Eva safety property: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32`
- Inserted ACSL property: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32`
- ACSL label: `eva_klee_alarm_0013`
- Current assertion: `src_repaired/sources/mul_Ccode.c:5727`

## Concrete KLEE witness

- Decoded inputs: `value=0 (0x00000000); factor=0 (0x00); count=0 (0x00000000)`
- Target assertion: `KLEE-ALARM-0013: invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- KTest: `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0013/build/klee-out-alarm-0013/test000006.ktest`
- Target `.err`: `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0013/build/klee-out-alarm-0013/test000006.klee-alarm-0013.err`
- Timeout after witness: `NO`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Policy decision required

The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented.

- Status: `REPAIR_POLICY_REQUIRED`
- Repair commit: `NOT_APPLICABLE`
- Additionally affected alarms: `NONE_IDENTIFIED`
