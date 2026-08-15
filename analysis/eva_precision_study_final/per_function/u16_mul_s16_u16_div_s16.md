# u16_mul_s16_u16_div_s16

## Experiment Summary

Alarm count changes from 11 to 9. One integer-overflow and one division-by-zero entry are removed. Both analyses reach 34/34 statements with identical parse diagnostics and target final-state text.

## Baseline Result

The selected markers occur at `div_Ccode.c:740-741` in the `denominator != 0` branch.

## High Precision Result

Both canonical counterparts are absent; nine alarms remain.

## Removed Alarm Inventory

### Alarm 1 — RA-020

#### Location and Category

`div_Ccode.c:740`, integer-overflow upper bound of `s32Result - ((s32Result / denominator) * denominator)`.

#### Source Context and Evidence

The remainder depends on a signed-by-unsigned product and executes under a nonzero signed denominator. Baseline emits the marker; High Precision does not; coverage remains 34/34.

#### Candidate Precision Mechanism / Confidence

`NONLINEAR_SUBDIVISION`, MEDIUM.

#### Direct Evidence / Technical Inference

The expression dependency is direct. Improved nonlinear remainder enclosure is inferred.

### Alarm 2 — RA-021

#### Location and Category

`div_Ccode.c:741`, division by zero for divisions by `denominator`.

#### Source Context

The zero-denominator branch returns. Line 741 follows the remainder assignment in the alternative branch.

#### Baseline Evidence / High Precision Evidence

Baseline emits the nonzero assertion; High Precision does not.

#### Candidate Precision Mechanism / Confidence

`BRANCH_PARTITIONING`, MEDIUM.

## Function-level Observation

The function exhibits both nonlinear-expression and guard-retention effects under the combined profile.

## Limitations

Option-level causality cannot be isolated.
