# KLEE-ALARM-0097 Repair Record

## Frozen occurrence and property

- Function: `s32_div_s32_s32`
- Original occurrence: `src_analysis/sources/div_Ccode.c:1410` (occurrence 1)
- Original statement: `u32numerator = ~numerator+1;`
- Original expression: `(s32)(~numerator) + 1`
- Eva safety property: `MATHEMATICAL((s32)(~numerator)) + MATHEMATICAL(1) <= INT32_MAX`
- Inserted ACSL property: `((s32)(~numerator)) + (1) <= 2147483647`
- ACSL label: `eva_klee_alarm_0097`
- Current assertion: `src_repaired/sources/div_Ccode.c:1740`

## Concrete KLEE witness

- Decoded inputs: `numerator=-2147483648 (0x80000000); denominator=2147483647 (0x7FFFFFFF)`
- Target assertion: `KLEE-ALARM-0097: signed overflow. assert (s32)(~numerator) + 1 <= 2147483647;`
- KTest: `analysis/klee_phase_c/s32_div_s32_s32/alarm_0097/build/klee-out-alarm-0097/test000002.ktest`
- Target `.err`: `analysis/klee_phase_c/s32_div_s32_s32/alarm_0097/build/klee-out-alarm-0097/test000002.klee-alarm-0097.err`
- Timeout after witness: `YES`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Implemented repair

Use exact unsigned 0x80000000 magnitude for INT32_MIN; retain each original signed operation and ACSL assertion on the predicate-satisfying branch.

- Status: `REPAIRED_SHARED`
- Repair commit: `7aa2299eac6e789a51e1288ecc4959f558bd728b`
- Additionally affected alarms: `KLEE-ALARM-0001,0004,0008,0011,0018,0043,0095,0096,0097,0099,0104,0105,0106,0108,0109,0111,0112,0114,0115,0116,0119`
