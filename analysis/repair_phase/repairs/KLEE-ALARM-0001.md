# KLEE-ALARM-0001 Repair Record

## Scope

- Primary alarm: `KLEE-ALARM-0001`
- Additionally affected alarms: `KLEE-ALARM-0004`, `KLEE-ALARM-0008`,
  `KLEE-ALARM-0011`, `KLEE-ALARM-0018`, `KLEE-ALARM-0043`,
  `KLEE-ALARM-0095`, `KLEE-ALARM-0096`, `KLEE-ALARM-0097`,
  `KLEE-ALARM-0099`, `KLEE-ALARM-0104`, `KLEE-ALARM-0105`,
  `KLEE-ALARM-0106`, `KLEE-ALARM-0108`, `KLEE-ALARM-0109`,
  `KLEE-ALARM-0111`, `KLEE-ALARM-0112`, `KLEE-ALARM-0114`,
  `KLEE-ALARM-0115`, `KLEE-ALARM-0116`, `KLEE-ALARM-0119`
- Functions and exact frozen occurrences: recorded per target in
  `48_CONFIRMED_REPAIR_TARGETS.tsv`
- Primary occurrence: `src_analysis/sources/mul_Ccode.c:5071`, expression
  `-value`, label `eva_klee_alarm_0001`

## Frozen safety property and witness

The primary Eva property is `value != INT32_MIN`. KLEE supplies
`value=-2147483648`, `factor=1`, and `count=0`, for which mathematical
negation is `2147483648` and therefore cannot be represented by signed
32-bit C. The additionally affected targets have the same signed-minimum
magnitude defect, expressed either as unary negation or two's-complement
`~x + 1`; their target-specific KTests and `.err` files are listed in the
confirmed-target manifest.

## Intended semantics and repair

These routines immediately store or use the absolute magnitude as an unsigned
32-bit value for multiplication, division, saturation, or sign restoration.
The frozen KLEE preparation notes use `UINT32_C(0) - (uint32_t)value` for the
same intended magnitude conversion. Accordingly, the signed-minimum path now
materializes its exact unsigned magnitude as `0x80000000U`.

For every input satisfying the original Eva property, the original operation
and its ACSL assertion remain together in the guarded branch. The formerly
undefined signed-minimum path receives the same unsigned-magnitude semantics
as the rest of each routine. No assertion is deleted or weakened.

Repair status: **COMPLETE** (shared systematic repair).
