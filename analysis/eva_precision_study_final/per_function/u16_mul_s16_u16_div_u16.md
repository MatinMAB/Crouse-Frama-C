# u16_mul_s16_u16_div_u16

## Experiment Summary

Alarm count changes from 7 to 6. One integer-overflow entry is removed, six remain, and none are new. Both analyses reach 32/32 statements, and parse diagnostics and target final-state text are identical.

## Baseline Result

Baseline reports the upper signed bound of the quotient-product remainder at `div_Ccode.c:795`.

## High Precision Result

The canonical marker is absent without a coverage change.

## Removed Alarm Inventory

### Alarm 1 — RA-022

#### Location

`src_analysis/sources/div_Ccode.c:795`

#### Category

Integer overflow.

#### Source Expression

`s32Result - ((s32Result / denominator) * denominator)`, subsequently shifted left.

#### Source Context

`s32Result` is produced from a signed-by-unsigned product. The remainder is evaluated under `denominator != 0`; the `u16` denominator is representable as signed long.

#### Baseline Evidence

The upper-bound marker is present at line 795.

#### High Precision Evidence

No canonical counterpart appears; both analyses reach all 32 statements.

#### Candidate Precision Mechanism

`NONLINEAR_SUBDIVISION`.

#### Confidence

MEDIUM.

#### Direct Evidence

The source expression, nonzero guard, and alarm transition are explicit.

#### Technical Inference

Stronger subdivision and integer-set precision plausibly tighten the dependent remainder range.

## Function-level Observation

The only count change is one upper-bound condition in a nonlinear remainder computation.

## Limitations

The experiment cannot identify an exclusive command-line cause.
