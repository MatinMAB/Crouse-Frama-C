# s16_fac05_div_s16_s16

## Experiment Summary

Alarm count changes from 11 to 9. Two integer-overflow entries are removed, nine remain, and none are new. Both analyses reach 28 of 49 statements and report identical target final-state text and parse diagnostics.

## Baseline Result

Both selected markers occur at `div_Ccode.c:190` in a remainder-style computation after `s32Temp1 = numerator << 16`, a zero-denominator branch, and a guard excluding `s32Temp1 == INT32_MIN`.

## High Precision Result

The two canonical markers are absent without a coverage change.

## Removed Alarm Inventory

### Alarm 1 — RA-006

#### Location

`src_analysis/sources/div_Ccode.c:190`

#### Category and Source Expression

Integer overflow on the lower bound of `(s32Temp1 / denominator) * denominator`.

#### Source Context

The quotient and product are signed 32-bit. `denominator != 0` and `s32Temp1 != INT32_MIN` hold in this branch.

#### Baseline Evidence

Baseline reports the product-bound marker.

#### High Precision Evidence

High Precision does not report its canonical counterpart; statement reachability is still 28/49.

#### Candidate Precision Mechanism

`NONLINEAR_SUBDIVISION`.

#### Confidence

MEDIUM.

#### Direct Evidence

The product, guards, and log transition are explicit.

#### Technical Inference

The 500-way nonlinear subdivision most plausibly refines the quotient-product, with relational domains as possible contributors.

### Alarm 2 — RA-007

#### Location and Category

`div_Ccode.c:190`, integer-overflow upper bound of `s32Temp1 - ((s32Temp1 / denominator) * denominator)`.

#### Baseline and High Precision Evidence

The Baseline marker is present and the High Precision counterpart absent; parse, coverage, and final-state text are unchanged.

#### Candidate Precision Mechanism and Confidence

`NONLINEAR_SUBDIVISION`, MEDIUM. A tighter quotient-product enclosure plausibly restores the remainder bound.

## Function-level Observation

Both removals arise from a single dependent nonlinear expression, so nonlinear subdivision is the common primary attribution.

## Limitations

The profile is combined, and the exact shares of nonlinear subdivision, integer-set precision, and relational reduction are not separable.
