# KLEE-ALARM-0007 Repair Record

## Scope

- Primary alarm: `KLEE-ALARM-0007`
- Additionally affected alarms: `KLEE-ALARM-0016`, `KLEE-ALARM-0017`,
  `KLEE-ALARM-0107`, `KLEE-ALARM-0110`, `KLEE-ALARM-0113`
- Function: `MulHighWord`
- Original occurrences: `src_analysis/sources/MulHword.c:47` and `:49`
- Original statements: `MulTemp1 = arg1_LW * arg2_LW;` and
  `MulTemp3 = arg1_HW * arg2_LW;`
- ACSL labels: `eva_klee_alarm_0007`, `eva_klee_alarm_0016`,
  `eva_klee_alarm_0017`, `eva_klee_alarm_0107`, `eva_klee_alarm_0110`,
  `eva_klee_alarm_0113`

## Frozen safety property and witnesses

The Eva properties require each selected 16-bit limb product, after C integer
promotion, not to exceed `INT32_MAX`. The frozen witnesses include limb values
whose mathematical product is greater than `2147483647`; for example alarm
0007 uses `value=-2147474737`, `factor=60816`, and alarm 0017 uses
`value=4294443008`, `factor=53761`. The target `.err` and KTests listed in
`48_CONFIRMED_REPAIR_TARGETS.tsv` show that KLEE reaches the violating helper
operation.

## Intended semantics and repair

The helper documentation states that it decomposes unsigned 32-bit operands
into 16-bit limbs to emulate an unsigned 64-bit product. Assignment is to
`u32`, so the intended limb product is unsigned; signed promotion is accidental.

For operands satisfying the original Eva predicate, the original expression is
retained behind an unsigned, overflow-free guard and all original ACSL labels
remain immediately before it. For the violating path, explicit `u32` operands
compute the same mathematical 16-by-16-bit product without signed overflow.
This preserves all previously defined behavior and supplies the documented
unsigned result for the formerly undefined path.

Repair status: **COMPLETE** (shared implementation repair).
