# KLEE-ALARM-0002 Repair Record

## Frozen occurrence and property

- Function: `root_s32_mul_s32_s16_fac_less1`
- Original occurrence: `src_analysis/sources/mul_Ccode.c:5089` (occurrence 1)
- Original statement: `u32Temp3 = u32Temp3 >> count;`
- Original expression: `u32Temp3 >> count`
- Eva safety property: `0 <= count && count < 32`
- Inserted ACSL property: `0 <= count && count < 32`
- ACSL label: `eva_klee_alarm_0002`
- Current assertion: `src_repaired/sources/mul_Ccode.c:5195`

## Concrete KLEE witness

- Decoded inputs: `value=-2130706432 (0x81000000); factor=1 (0x0001); count=4294967295 (0xFFFFFFFF)`
- Target assertion: `KLEE-ALARM-0002: invalid RHS operand for shift. assert 0 <= count < 32;`
- KTest: `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0002/build/klee-out-alarm-0002/test000003.ktest`
- Target `.err`: `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0002/build/klee-out-alarm-0002/test000003.klee-alarm-0002.err`
- Timeout after witness: `NO`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Policy decision required

The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented.

- Status: `REPAIR_POLICY_REQUIRED`
- Repair commit: `NOT_APPLICABLE`
- Additionally affected alarms: `NONE_IDENTIFIED`
