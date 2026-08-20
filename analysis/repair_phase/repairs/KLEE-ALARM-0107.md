# KLEE-ALARM-0107 Repair Record

## Frozen occurrence and property

- Function: `s32_mul_s32_s32`
- Original occurrence: `src_analysis/sources/MulHword.c:47` (occurrence 1)
- Original statement: `MulTemp1 = arg1_LW * arg2_LW;`
- Original expression: `(int)arg1_LW * (int)arg2_LW`
- Eva safety property: `MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX`
- Inserted ACSL property: `((int)arg1_LW) * ((int)arg2_LW) <= 2147483647`
- ACSL label: `eva_klee_alarm_0107`
- Current assertion: `src_repaired/sources/MulHword.c:55`

## Concrete KLEE witness

- Decoded inputs: `val1=-2146301931 (0x80120815); val2=34301 (0x000085FD)`
- Target assertion: `KLEE-ALARM-0107: signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;`
- KTest: `analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107/build/klee-out-alarm-0107/test000005.ktest`
- Target `.err`: `analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107/build/klee-out-alarm-0107/test000005.klee-alarm-0107.err`
- Timeout after witness: `NO`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Implemented repair

Compute 16-bit limb products as unsigned on the violating path; retain original promoted multiplication and ACSL assertions behind an overflow-free unsigned guard.

- Status: `REPAIRED_SHARED`
- Repair commit: `afea04153ccb966d0911b7404d7bc88eb7361b81`
- Additionally affected alarms: `KLEE-ALARM-0007,0016,0017,0107,0110,0113`
