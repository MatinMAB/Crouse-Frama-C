# s16_mul_s16_u16_div_s16

## Experiment Summary

Alarm count changes from 11 to 8. Two integer-overflow entries and one division-by-zero entry are removed. Both analyses reach 33/33 statements and preserve identical target final-state text and parse diagnostics.

## Baseline Result

The markers appear at `div_Ccode.c:628` and `:630` after `s32Result = factor1 * factor2`, within the `denominator != 0` branch.

## High Precision Result

The three canonical markers are absent; eight alarms remain.

## Removed Alarm Inventory

### Alarm 1 — RA-013

#### Location and Category

`div_Ccode.c:628`, integer-overflow lower bound of `s32Result - ((s32Result / denominator) * denominator)`.

#### Source Context and Evidence

The remainder depends on a promoted s16-by-u16 product and a signed denominator. Baseline reports the marker; High Precision does not; coverage is unchanged.

#### Candidate Precision Mechanism / Confidence

`NONLINEAR_SUBDIVISION`, MEDIUM.

#### Direct Evidence / Technical Inference

The source dependency is direct. Tighter handling of nonlinear quotient/product relations is inferred.

### Alarm 2 — RA-014

#### Location and Category

`div_Ccode.c:628`, integer-overflow upper bound of the same remainder.

#### Evidence and Attribution

Baseline marker present; High Precision counterpart absent. `NONLINEAR_SUBDIVISION`, MEDIUM.

### Alarm 3 — RA-015

#### Location and Category

`div_Ccode.c:630`, division by zero for the divisions by `denominator`.

#### Source Context

The source's zero-denominator branch returns before line 630. The divisions occur in the alternative branch after remainder and shift operations.

#### Baseline Evidence / High Precision Evidence

Baseline emits the nonzero assertion; High Precision does not.

#### Candidate Precision Mechanism / Confidence

`BRANCH_PARTITIONING`, MEDIUM.

## Function-level Observation

The mixed result is consistent with two effects: nonlinear refinement for the remainder and stronger preservation of the divisor guard.

## Limitations

The combined profile prevents option-level attribution.
