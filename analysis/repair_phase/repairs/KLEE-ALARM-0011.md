# KLEE-ALARM-0011 Repair Record

## Frozen occurrence and property

- Function: `root_s32_mul_s32_u8_fac_less1`
- Original occurrence: `src_analysis/sources/mul_Ccode.c:5534` (occurrence 1)
- Original statement: `u32Temp1 = -value;`
- Original expression: `-value`
- Eva safety property: `value != INT32_MIN`
- Inserted ACSL property: `value != (-2147483647 - 1)`
- ACSL label: `eva_klee_alarm_0011`
- Current assertion: `src_repaired/sources/mul_Ccode.c:5709`

## Concrete KLEE witness

- Decoded inputs: `value=-2147483648 (0x80000000); factor=0 (0x00); count=0 (0x00000000)`
- Target assertion: `KLEE-ALARM-0011: signed overflow. assert -value <= 2147483647;`
- KTest: `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0011/build/klee-out-alarm-0011/test000001.ktest`
- Target `.err`: `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0011/build/klee-out-alarm-0011/test000001.klee-alarm-0011.err`
- Timeout after witness: `NO`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Implemented repair

Use exact unsigned 0x80000000 magnitude for INT32_MIN; retain each original signed operation and ACSL assertion on the predicate-satisfying branch.

- Status: `REPAIRED_SHARED`
- Repair commit: `7aa2299eac6e789a51e1288ecc4959f558bd728b`
- Additionally affected alarms: `KLEE-ALARM-0001,0004,0008,0011,0018,0043,0095,0096,0097,0099,0104,0105,0106,0108,0109,0111,0112,0114,0115,0116,0119`
