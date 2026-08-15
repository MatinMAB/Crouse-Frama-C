# s16_mul_s16_s16_div_s16

## Experiment Summary

Alarm count changes from 11 to 8. Two integer-overflow entries and one division-by-zero entry are removed. Both runs reach all 33 statements and have identical parse diagnostics and target final-state text.

## Baseline Result

The markers occur in the nonzero-`div` branch at `div_Ccode.c:964-965`, after `s32Temp1 = fak1 * fak2`.

## High Precision Result

All three canonical counterparts are absent; eight other alarms remain.

## Removed Alarm Inventory

### Alarm 1 — RA-008

#### Location and Category

`div_Ccode.c:964`, integer-overflow lower bound of `s32Temp1 - ((s32Temp1 / div) * div)`.

#### Source Context

The signed 32-bit quotient-product remainder is evaluated under `div != 0` and depends on the preceding signed-input product.

#### Baseline Evidence / High Precision Evidence

Baseline emits the marker; High Precision does not; reachability stays 33/33.

#### Candidate Precision Mechanism / Confidence

`NONLINEAR_SUBDIVISION`, MEDIUM.

#### Direct Evidence / Technical Inference

The dependent expression and guard are direct; a tighter nonlinear remainder abstraction is the most plausible inference.

### Alarm 2 — RA-009

#### Location and Category

`div_Ccode.c:964`, integer-overflow upper bound of the same expression.

#### Evidence and Attribution

The canonical Baseline marker has no High Precision counterpart. Primary mechanism: `NONLINEAR_SUBDIVISION`; confidence MEDIUM.

### Alarm 3 — RA-010

#### Location and Category

`div_Ccode.c:965`, division by zero for the divisions by `div`.

#### Source Context

The source tests `div == 0` and returns from that branch. Line 965 is in the alternative branch, after the remainder assignment.

#### Baseline Evidence / High Precision Evidence

Baseline emits `(s32)div != 0`; High Precision does not, with unchanged coverage.

#### Candidate Precision Mechanism / Confidence

`BRANCH_PARTITIONING`, MEDIUM. Retaining the direct guard across the preceding computation is the most plausible explanation.

## Function-level Observation

The function combines two likely precision effects: nonlinear handling of the remainder and longer-lived branch information for the divisor.

## Limitations

The experiment cannot attribute the transition to a single command-line feature.
