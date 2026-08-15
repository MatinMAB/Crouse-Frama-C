# s16_mul_s16_s16_div_u16

## Experiment Summary

Alarm count changes from 7 to 5. Two integer-overflow entries are removed; five remain and none are new. Both runs reach 36/36 statements with identical parse diagnostics and target final-state text.

## Baseline Result

At `div_Ccode.c:1022`, Baseline reports lower and upper signed bounds for `s32Temp1 - ((s32Temp1 / denominator) * denominator)`.

## High Precision Result

Neither canonical marker is present in High Precision.

## Removed Alarm Inventory

### Alarm 1 — RA-011

#### Location / Category / Expression

`div_Ccode.c:1022`; integer-overflow lower bound; signed 32-bit quotient-product remainder with a `u16` denominator converted to signed long.

#### Source Context

The expression follows `s32Temp1 = fak1 * fak2` and is in the `denominator != 0` branch.

#### Baseline Evidence / High Precision Evidence

Baseline marker present; High Precision counterpart absent; coverage remains 36/36.

#### Candidate Precision Mechanism / Confidence

`NONLINEAR_SUBDIVISION`, MEDIUM.

#### Direct Evidence / Technical Inference

The expression, guard, and unchanged coverage are direct. Improved quotient-product dependency tracking is inferred.

### Alarm 2 — RA-012

#### Location and Category

Same line and expression, upper signed bound.

#### Evidence and Attribution

Baseline marker present, High Precision counterpart absent. `NONLINEAR_SUBDIVISION`, MEDIUM.

## Function-level Observation

Both changes concern the two bounds of one remainder-style expression rather than a reachability change.

## Limitations

Relational domains and the larger integer-set threshold may also contribute; the experiment does not separate them.
