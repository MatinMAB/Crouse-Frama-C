# KLEE-ALARM-0096 Repair Record

## Frozen occurrence and property

- Function: `s32_div_s32_s32`
- Original occurrence: `src_analysis/sources/div_Ccode.c:1395` (occurrence 1)
- Original statement: `u32denominator = -denominator;`
- Original expression: `-denominator`
- Eva safety property: `denominator != INT32_MIN`
- Inserted ACSL property: `denominator != (-2147483647 - 1)`
- ACSL label: `eva_klee_alarm_0096`
- Current assertion: `src_repaired/sources/div_Ccode.c:1715`

## Concrete KLEE witness

- Decoded inputs: `numerator=-2130706432 (0x81000000); denominator=-2147483648 (0x80000000)`
- Target assertion: `KLEE-ALARM-0096: signed overflow. assert -denominator <= 2147483647;`
- KTest: `analysis/klee_phase_c/s32_div_s32_s32/alarm_0096/build/klee-out-alarm-0096/test000004.ktest`
- Target `.err`: `analysis/klee_phase_c/s32_div_s32_s32/alarm_0096/build/klee-out-alarm-0096/test000004.klee-alarm-0096.err`
- Timeout after witness: `NO`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Implemented repair

Use exact unsigned 0x80000000 magnitude for INT32_MIN; retain each original signed operation and ACSL assertion on the predicate-satisfying branch.

- Status: `REPAIRED_SHARED`
- Repair commit: `7aa2299eac6e789a51e1288ecc4959f558bd728b`
- Additionally affected alarms: `KLEE-ALARM-0001,0004,0008,0011,0018,0043,0095,0096,0097,0099,0104,0105,0106,0108,0109,0111,0112,0114,0115,0116,0119`
