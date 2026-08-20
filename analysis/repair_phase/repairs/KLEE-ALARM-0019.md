# KLEE-ALARM-0019 Repair Record

## Frozen occurrence and property

- Function: `root_u32_mul_u32_s32_fac_less1`
- Original occurrence: `src_analysis/sources/mul_Ccode.c:5372` (occurrence 1)
- Original statement: `u32Temp2 = u32Temp2 >> (count-32);`
- Original expression: `u32Temp2 >> (count-32)`
- Eva safety property: `0 <= (u32)(count - 32) && (u32)(count - 32) < 32`
- Inserted ACSL property: `0 <= (u32)(count - 32) && (u32)(count - 32) < 32`
- ACSL label: `eva_klee_alarm_0019`
- Current assertion: `src_repaired/sources/mul_Ccode.c:5532`

## Concrete KLEE witness

- Decoded inputs: `value=65528 (0x0000FFF8); factor=53761 (0x0000D201); count=0 (0x00000000)`
- Target assertion: `KLEE-ALARM-0019: invalid RHS operand for shift. assert 0 <= (u32)(count - 32) < 32;`
- KTest: `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019/build/klee-out-alarm-0019/test000002.ktest`
- Target `.err`: `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019/build/klee-out-alarm-0019/test000002.klee-alarm-0019.err`
- Timeout after witness: `NO`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Policy decision required

The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented.

- Status: `REPAIR_POLICY_REQUIRED`
- Repair commit: `NOT_APPLICABLE`
- Additionally affected alarms: `NONE_IDENTIFIED`
