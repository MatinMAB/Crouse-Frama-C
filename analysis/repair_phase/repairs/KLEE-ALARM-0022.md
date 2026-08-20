# KLEE-ALARM-0022 Repair Record

## Scope

- Alarm: `KLEE-ALARM-0022`
- Function: `rotateRight`
- Original occurrence: `src_analysis/sources/rotatefunc.c:119`
- Original expression: `1 << INT_BITS`
- ACSL label: `eva_klee_alarm_0022`

## Frozen safety property and witness

The Eva property is `MATHEMATICAL_LEFT_SHIFT(1,INT_BITS) <= INT32_MAX`,
materialized as `INT_BITS <= 30`. KLEE reaches the target with `num=0` and
`rotation=1`; in the configured 32-bit model `INT_BITS` is 31, so shifting the
signed `int` literal `1` attempts to form an unrepresentable signed value.

## Intended semantics and repair

The function documentation and adjacent code explicitly implement a 32-bit
rotation and use this expression only to clear the most-significant bit. The
original signed expression and ACSL assertion remain in the branch where the
property holds. For the 32-bit case, an explicitly unsigned `u32` one-bit mask
forms the intended most-significant-bit mask without signed overflow. This
does not alter behavior for inputs on which the original operation was
defined.

Repair status: **COMPLETE**.
