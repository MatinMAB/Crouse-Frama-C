# KLEE-ALARM-0144 Repair Record

## Frozen occurrence and property

- Function: `u32_div_s32_s32`
- Original occurrence: `src_analysis/sources/div_Ccode.c:1182` (occurrence 1)
- Original statement: `numerator = -numerator;`
- Original expression: `-numerator`
- Eva safety property: `numerator != INT32_MIN`
- Inserted ACSL property: `numerator != (-2147483647 - 1)`
- ACSL label: `eva_klee_alarm_0144`
- Current assertion: `src_repaired/sources/div_Ccode.c:1448`

## Concrete KLEE witness

- Decoded inputs: `numerator=-2147483648 (0x80000000); denominator=-2147483648 (0x80000000)`
- Target assertion: `KLEE-ALARM-0144: signed overflow. assert -numerator <= 2147483647;`
- KTest: `analysis/klee_phase_c/u32_div_s32_s32/alarm_0144/build/klee-out-alarm-0144/test000004.ktest`
- Target `.err`: `analysis/klee_phase_c/u32_div_s32_s32/alarm_0144/build/klee-out-alarm-0144/test000004.klee-alarm-0144.err`
- Timeout after witness: `YES`

The frozen target-specific error proves that these concrete inputs reach the selected operation and falsify its Eva-derived safety predicate under the configured KLEE model.

## Policy decision required

The witness also violates runtime-only denominator and downstream properties in the same path; defining an unsigned-magnitude quotient path would change implementation behavior associated with those inconclusive targets, so a phase-separation and quotient-policy decision is required.

- Status: `REPAIR_POLICY_REQUIRED`
- Repair commit: `NOT_APPLICABLE`
- Additionally affected alarms: `KLEE-ALARM-0145,0146,0147,0148,0149`
