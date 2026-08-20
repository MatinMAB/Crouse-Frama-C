# WP Terminal Campaign Summary

## Methodology and environment

The user executed the prepared terminal-only campaign for the 32 repaired, WP-eligible targets.
Each run selected one named `eva_klee_alarm_XXXX` assertion using `-wp-prop`, restricted its
assertion-owning function with `-wp-fct`, and used Frama-C 33.0 (Arsenic), `ppc_32`, `Typed+int`,
Qed, Alt-Ergo 2.6.2, Z3 4.8.12, and CVC5 1.1.2. RTE generation was intentionally excluded;
none of the selected commands contains `-wp-rte`.

## Accounting

| Measure | Count |
|---|---:|
| Confirmed KLEE violations | 48 |
| WP-ready/repaired | 32 |
| Repair-policy-required | 16 |
| Expected terminal targets | 32 |
| Complete selected runs | 32 |
| VALID_AUTOMATIC | 32 |
| UNKNOWN | 0 |
| TIMEOUT | 0 |
| FAILED | 0 |
| NO_GOAL | 0 |
| NOT_RUN | 0 |

The six WP campaign classifications sum to 32, and 32 eligible plus 16 policy-required targets
sum to all 48 confirmed KLEE alarms.

## Proof rates

- Automatic WP verification rate among eligible repairs: **32/32 = 100.00%**.
- Resolved rate among eligible repairs: **32/32 = 100.00%**.
- Unresolved rate among eligible repairs: **0/32 = 0.00%**.
- Verified coverage among all confirmed KLEE alarms: **32/48 = 66.67%**.

## Prover contribution

- Qed alone discharged 26 targets.
- External provers were actually invoked for 6 targets.
- Alt-Ergo was Valid for 5 and timed out for 1.
- Z3 was Valid for 6.
- CVC5 was Valid for 6.
- 6 targets had agreement from at least two external provers.

## Performance

- Sum of per-target wall-clock runtimes: **166.626282879 seconds**.
- Mean: **5.207071340 seconds**.
- Median: **0.781153923 seconds**.
- Minimum: **0.597309440 seconds** (KLEE-ALARM-0105).
- Maximum: **131.908813542 seconds** (KLEE-ALARM-0017).

## Warnings

All 32 logs contain `Missing RTE guards`, which is expected because RTE generation was deliberately
outside the experiment. Missing-assigns diagnostics occurred for all 32 selected runs, and the
pre-existing fall-through parser warning occurred in 20 multiplication-source runs. Every selected
target property was nevertheless generated and proved 1/1; warnings are documented, not converted
into proof failure.

## Unresolved targets and limitations

No eligible terminal target remained Unknown, timed out as a target, failed, produced no goal, or
was not run. Alt-Ergo timed out on alarm 0017, but Z3 and CVC5 independently proved that same target,
so its final target classification is VALID_AUTOMATIC. The 16 policy-required alarms are listed
separately and are not WP failures. GUI inspection was deferred because offline GUI dependencies
were unavailable.

A VALID_AUTOMATIC result means WP proved only the explicitly selected Eva-derived assertion for the
repaired implementation under the recorded `ppc_32`/`Typed+int` proof context. It does not establish
that the entire function or program is bug-free, does not verify other ACSL properties, and does not
prove absence of runtime errors.

## Next step

Freeze this terminal analysis, then begin a separate repair-policy phase for the 16 ineligible
confirmed alarms. Any secondary WP work with longer timeouts, alternate strategies, or interactive
proof must be a separately configured experiment; no reruns belong to this campaign.
