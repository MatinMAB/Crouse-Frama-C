# s16_mul_u16_s16_div_u16

## Experiment Summary

Alarm count changes from 7 to 6. One integer-overflow entry is removed, six remain, and none are new. Both analyses reach 32/32 statements with identical parse diagnostics and target final-state text.

## Baseline Result

Baseline reports the upper signed bound of the remainder subtraction at `div_Ccode.c:684`.

## High Precision Result

The canonical counterpart is absent without any reachability change.

## Removed Alarm Inventory

### Alarm 1 — RA-016

#### Location

`src_analysis/sources/div_Ccode.c:684`

#### Category

Integer overflow.

#### Source Expression

`s32Result - ((s32Result / denominator) * denominator)`, subsequently shifted left.

#### Source Context

`s32Result` comes from a u16-by-s16 product. The expression executes under `denominator != 0` with the `u16` denominator converted to signed long.

#### Baseline Evidence

The upper-bound marker is present.

#### High Precision Evidence

It has no canonical High Precision counterpart; coverage remains 32/32.

#### Candidate Precision Mechanism

`NONLINEAR_SUBDIVISION`.

#### Confidence

MEDIUM.

#### Direct Evidence

The dependent quotient-product expression, guard, and marker transition are directly observed.

#### Technical Inference

The stronger nonlinear and integer-set profile plausibly tightens the remainder upper bound.

## Function-level Observation

The change concerns one bound of a nonlinear remainder expression, not a change in analyzed paths.

## Limitations

No individual profile option was varied independently.
