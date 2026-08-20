# KLEE-ALARM-0020 Repair Record

## Frozen occurrence and property

- Function: `root_u32_mul_u32_s8_fac_less1`
- Original occurrence: `src_analysis/sources/mul_Ccode.c:5451` (occurrence 1)
- Original statement: `u32Temp2 = u32Temp2 >> count;`
- Original expression: `u32Temp2 >> count`
- Eva safety property: `0 <= count && count < 32`
- Inserted ACSL property: `0 <= count && count < 32`
- ACSL label: `eva_klee_alarm_0020`
- Current assertion: `src_repaired/sources/mul_Ccode.c:5614`

## Concrete KLEE witness

- Decoded inputs: `value=0 (0x00000000); factor=0 (0x00); count=4294967295 (0xFFFFFFFF)`
- Target assertion: `KLEE-ALARM-0020: invalid RHS operand for shift. assert 0 <= count < 32;`
- KTest: `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0020/build/klee-out-alarm-0020/test000001.ktest`
- Target `.err`: `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0020/build/klee-out-alarm-0020/test000001.klee-alarm-0020.err`
- Timeout after witness: `NO`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Policy decision required

The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented.

- Status: `REPAIR_POLICY_REQUIRED`
- Repair commit: `NOT_APPLICABLE`
- Additionally affected alarms: `NONE_IDENTIFIED`
