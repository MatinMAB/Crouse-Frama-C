# KLEE-ALARM-0053 Repair Record

## Frozen occurrence and property

- Function: `s16_fac05_div_s16_u16`
- Original occurrence: `src_analysis/sources/div_Ccode.c:348` (occurrence 1)
- Original statement: `s32Temp1 = numerator<<16;`
- Original expression: `(int)numerator << 16`
- Eva safety property: `(int)numerator >= 0`
- Inserted ACSL property: `(int)numerator >= 0`
- ACSL label: `eva_klee_alarm_0053`
- Current assertion: `src_repaired/sources/div_Ccode.c:444`

## Concrete KLEE witness

- Decoded inputs: `numerator=-32768 (0x8000); denominator=0 (0x0000)`
- Target assertion: `KLEE-ALARM-0053: invalid LHS operand for left shift. assert 0 <= (int)numerator;`
- KTest: `analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053/build/klee-out-alarm-0053/test000001.ktest`
- Target `.err`: `analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053/build/klee-out-alarm-0053/test000001.klee-alarm-0053.err`
- Timeout after witness: `NO`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Implemented repair

Retain the original shift and assertion for nonnegative operands; use equivalent, range-safe multiplication by the documented fixed-point scale for negative operands.

- Status: `REPAIRED_SHARED`
- Repair commit: `57864b43199db1c7046c201d40fb52dabafdb3a6`
- Additionally affected alarms: `KLEE-ALARM-0044,0053,0058,0061,0063,0066`
