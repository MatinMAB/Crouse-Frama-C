# KLEE-ALARM-0016 Repair Record

## Frozen occurrence and property

- Function: `root_u32_mul_u32_s32_fac_less1`
- Original occurrence: `src_analysis/sources/MulHword.c:47` (occurrence 1)
- Original statement: `MulTemp1 = arg1_LW * arg2_LW;`
- Original expression: `(int)arg1_LW * (int)arg2_LW`
- Eva safety property: `MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX`
- Inserted ACSL property: `((int)arg1_LW) * ((int)arg2_LW) <= 2147483647`
- ACSL label: `eva_klee_alarm_0016`
- Current assertion: `src_repaired/sources/MulHword.c:52`

## Concrete KLEE witness

- Decoded inputs: `value=65528 (0x0000FFF8); factor=53761 (0x0000D201); count=0 (0x00000000)`
- Target assertion: `KLEE-ALARM-0016: signed product must not exceed INT32_MAX`
- KTest: `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0016/build/klee-out-alarm-0016/test000001.ktest`
- Target `.err`: `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0016/build/klee-out-alarm-0016/test000001.klee-alarm-0016.err`
- Timeout after witness: `NO`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Implemented repair

Compute 16-bit limb products as unsigned on the violating path; retain original promoted multiplication and ACSL assertions behind an overflow-free unsigned guard.

- Status: `REPAIRED_SHARED`
- Repair commit: `afea04153ccb966d0911b7404d7bc88eb7361b81`
- Additionally affected alarms: `KLEE-ALARM-0007,0016,0017,0107,0110,0113`
