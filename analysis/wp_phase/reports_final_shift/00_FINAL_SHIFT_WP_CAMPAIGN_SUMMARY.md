# Final Shift WP Campaign Summary

## Methodology and scope

This analysis selected the newest complete existing terminal run for each of the 13 final shift
targets. It did not execute WP, Eva, KLEE, a campaign launcher, or the GUI. Every selected command
uses Frama-C 33.0 (Arsenic), `-machdep ppc_32`, `-wp-model Typed+int`, the exact expected function,
and only its `eva_klee_alarm_XXXX` property. None uses `-wp-rte` or broad `@all` selection.

## Final-campaign accounting

| Classification | Count |
|---|---:|
| Expected / complete runs | 13 / 13 |
| VALID_AUTOMATIC | 13 |
| UNKNOWN | 0 |
| TIMEOUT | 0 |
| FAILED | 0 |
| NO_GOAL | 0 |
| NOT_RUN | 0 |

The six classifications reconcile to 13. All 13 selected target properties were generated as one
goal each and proved 1/1.

## Policy-origin boundary

- Repository-inferred contracts: **5**, valid **5**, proof rate **100.00%**.
- Thesis-policy-selected interface/domain semantics: **8**, valid **8**, proof rate **100.00%**.

The latter result proves the preserved Eva-derived properties under the thesis-selected policy; it
does not retroactively establish that policy as the unspecified legacy intent.

## Provers and performance

- Qed alone: **6** targets.
- Alt-Ergo: invoked and valid for **7** targets.
- Z3 and CVC5: not invoked for these 13 because Qed or Alt-Ergo closed every goal first.
- Wall-clock total: **15.410954904 seconds**; mean **1.185458070**; median **1.485058726**.
- Fastest: **KLEE-ALARM-0014**, 0.785077060 seconds.
- Slowest: **KLEE-ALARM-0003**, 1.532028366 seconds.

## Final 48-target result

All **48/48** selected Eva-derived properties are `VALID_AUTOMATIC` under their documented
implementation-repair or specification contexts. The summed recorded wall-clock runtime is
**183.910237408 seconds**. This is selected-property verification, not whole-function,
whole-program, unrestricted-input, or general RTE verification.
