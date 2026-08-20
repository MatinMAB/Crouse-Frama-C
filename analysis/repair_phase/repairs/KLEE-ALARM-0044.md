# KLEE-ALARM-0044 Repair Record

## Scope

- Primary alarm: `KLEE-ALARM-0044`
- Additionally affected alarms: `KLEE-ALARM-0053`, `KLEE-ALARM-0058`,
  `KLEE-ALARM-0063`
- Primary occurrence: `src_analysis/sources/div_Ccode.c:173`, expression
  `(int)numerator << 16`, label `eva_klee_alarm_0044`
- Other exact occurrences and labels: recorded in
  `48_CONFIRMED_REPAIR_TARGETS.tsv`

## Frozen safety property and witness

The primary property is `(int)numerator >= 0`. KLEE supplies
`numerator=-32768`, so the fixed-point left shift has a negative left operand
and violates C's shift precondition. The other three repaired witnesses
likewise reach negative operands in fixed-point scaling by 65536 or 128.

## Intended semantics and repair

The affected routines document fixed-point scaling, and the shifted values
have bounded ranges in which multiplication by the same power of two is
representable. The repair retains each original shift and ACSL assertion in a
nonnegative guarded branch. A negative operand uses multiplication by the same
scale factor, which is defined C arithmetic and preserves the documented
fixed-point value.

Repair status: **COMPLETE** (shared systematic repair).
