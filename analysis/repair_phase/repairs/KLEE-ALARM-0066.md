# KLEE-ALARM-0066 Repair Record

## Frozen occurrence and property

- Function: `s16_hip1_s16_u8_u8_u16_fac1`
- Original occurrence: `src_analysis/sources/hip_Ccode.c:53` (occurrence 1)
- Original statement: `s32Temp2 = s32Temp2 << 1;`
- Original expression: `s32Temp2 << 1`
- Eva safety property: `s32Temp2 >= 0`
- Inserted ACSL property: `s32Temp2 >= 0`
- ACSL label: `eva_klee_alarm_0066`
- Current assertion: `src_repaired/sources/hip_Ccode.c:69`

## Concrete KLEE witness

- Decoded inputs: `yold=-137 (0xFF77); u=0 (0x00); uold=0 (0x00); m=32768 (0x8000)`
- Target assertion: `KLEE-ALARM-0066: invalid LHS operand for left shift. assert 0 <= s32Temp2;`
- KTest: `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066/build/klee-out-alarm-0066/test000002.ktest`
- Target `.err`: `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066/build/klee-out-alarm-0066/test000002.klee-alarm-0066.err`
- Timeout after witness: `NO`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Policy decision required

The same shift statement carries runtime-only alarm KLEE-ALARM-0067; changing the operation would modify a runtime-only target occurrence, so a phase-separation policy is required.

- Status: `REPAIR_POLICY_REQUIRED`
- Repair commit: `NOT_APPLICABLE`
- Additionally affected alarms: `KLEE-ALARM-0067`
