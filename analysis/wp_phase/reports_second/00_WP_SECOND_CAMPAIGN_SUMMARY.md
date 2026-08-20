# WP Second Campaign Summary

## Methodology and scope

The user executed the dedicated three-target terminal batch after the repair-policy phase. This
analysis reads the existing runs only; it did not execute Frama-C, WP, Eva, KLEE, a target launcher,
the batch script, or the GUI. For each target, the newest complete timestamped run was selected. Each
command uses Frama-C 33.0 (Arsenic), `ppc_32`, `Typed+int`, the exact target function and
`eva_klee_alarm_XXXX` property, and the configured Alt-Ergo/Z3/CVC5 set. No command contains
`-wp-rte`.

## Second-campaign accounting

| Measure | Count |
|---|---:|
| Expected targets | 3 |
| Complete selected runs | 3 |
| VALID_AUTOMATIC | 3 |
| UNKNOWN | 0 |
| TIMEOUT | 0 |
| FAILED | 0 |
| NO_GOAL | 0 |
| NOT_RUN | 0 |

The six execution classifications sum to three. All three targets generated one selected goal and
Qed discharged each goal completely. Alt-Ergo, Z3, and CVC5 were configured but were not invoked.

## Final 48-target accounting

- Confirmed KLEE violations: **48**.
- Repaired and WP-eligible: **35**.
- WP-verified: **35**.
- Semantics-ambiguous and not WP-eligible: **13**.
- Verification rate among repaired targets: **100.00%**.
- Verified coverage among all confirmed KLEE targets: **72.92%**.

## Performance

- Second-campaign total: **1.872999625 seconds**.
- Mean: **0.624333208 seconds**.
- Median: **0.617536856 seconds**.
- Minimum: **0.559338023 seconds** (KLEE-ALARM-0061).
- Maximum: **0.696124746 seconds** (KLEE-ALARM-0144).
- Combined sum of the frozen first-campaign and second-campaign per-target runtimes:
  **168.499282504 seconds**.

## Warnings and limitations

Every run contains `Missing RTE guards`, expected because RTE verification is outside this
target-property-only experiment. Every run also reports a missing `assigns` specification. These
warnings do not negate the selected local proof: each exact target property was generated and proved
1/1. GUI inspection was not performed.

A `VALID_AUTOMATIC` result means WP proved only the selected preserved Eva-derived assertion for the
repaired implementation under the recorded `ppc_32`/`Typed+int` context. It does not verify the whole
function, all runtime errors, or the complete program. The 13 semantic-policy targets remain outside
WP and are not proof failures.
