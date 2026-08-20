# WP Second Campaign Prover Analysis

| Prover | Invoked targets | Valid contributions | Other results |
|---|---:|---:|---|
| Qed | 3 | 3 | None |
| Alt-Ergo 2.6.2 | 0 | 0 | NOT_NEEDED / NOT_INVOKED for all 3 |
| Z3 4.8.12 | 0 | 0 | NOT_NEEDED / NOT_INVOKED for all 3 |
| CVC5 1.1.2 | 0 | 0 | NOT_NEEDED / NOT_INVOKED for all 3 |

All three JSON reports identify Qed as the sole proving engine. Listing an external prover in
`-wp-prover` is not counted as invocation or contribution when Qed has already closed the goal.

There were no Unknown, Timeout, Failed, No-goal, or Not-run second-campaign targets.
