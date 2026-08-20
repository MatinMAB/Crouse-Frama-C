# KLEE-ALARM-0003 Repair Record

## Frozen occurrence and property

- Function: `root_s32_mul_s32_s16_fac_less1`
- Original occurrence: `src_analysis/sources/mul_Ccode.c:5090` (occurrence 1)
- Original statement: `u32Temp3 |= u32Temp4 << (32-count);`
- Original expression: `u32Temp4 << (32-count)`
- Eva safety property: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32`
- Inserted ACSL property: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32`
- ACSL label: `eva_klee_alarm_0003`
- Current assertion: `src_repaired/sources/mul_Ccode.c:5199`

## Concrete KLEE witness

- Decoded inputs: `value=0 (0x00000000); factor=-32768 (0x8000); count=0 (0x00000000)`
- Target assertion: `KLEE-ALARM-0003: invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- KTest: `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0003/build/klee-out-alarm-0003/test000007.ktest`
- Target `.err`: `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0003/build/klee-out-alarm-0003/test000007.klee-alarm-0003.err`
- Timeout after witness: `NO`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Policy decision required

The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented.

- Status: `REPAIR_POLICY_REQUIRED`
- Repair commit: `NOT_APPLICABLE`
- Additionally affected alarms: `NONE_IDENTIFIED`
