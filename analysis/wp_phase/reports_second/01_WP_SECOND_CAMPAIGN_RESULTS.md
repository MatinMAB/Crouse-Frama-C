# WP Second Campaign Results

| Alarm | Function | Property | Goals | Qed | Alt-Ergo | Z3 | CVC5 | Runtime | Warnings | Classification | Evidence |
|---|---|---|---:|---|---|---|---|---:|---|---|---|
| KLEE-ALARM-0061 | s16_hip1_s16_s8_s8_u16_fac1 | s32Temp2 >= 0 | 1/1 | VALID | NOT_NEEDED / NOT_INVOKED | NOT_NEEDED / NOT_INVOKED | NOT_NEEDED / NOT_INVOKED | 0.559338023 seconds | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 | VALID_AUTOMATIC | `analysis/wp_phase/results/KLEE-ALARM-0061/20260820-194527Z/wp-report.json`; `analysis/wp_phase/results/KLEE-ALARM-0061/20260820-194527Z/stdout_stderr.log` |
| KLEE-ALARM-0066 | s16_hip1_s16_u8_u8_u16_fac1 | s32Temp2 >= 0 | 1/1 | VALID | NOT_NEEDED / NOT_INVOKED | NOT_NEEDED / NOT_INVOKED | NOT_NEEDED / NOT_INVOKED | 0.617536856 seconds | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 | VALID_AUTOMATIC | `analysis/wp_phase/results/KLEE-ALARM-0066/20260820-194527Z/wp-report.json`; `analysis/wp_phase/results/KLEE-ALARM-0066/20260820-194527Z/stdout_stderr.log` |
| KLEE-ALARM-0144 | u32_div_s32_s32 | numerator != INT32_MIN | 1/1 | VALID | NOT_NEEDED / NOT_INVOKED | NOT_NEEDED / NOT_INVOKED | NOT_NEEDED / NOT_INVOKED | 0.696124746 seconds | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 | VALID_AUTOMATIC | `analysis/wp_phase/results/KLEE-ALARM-0144/20260820-194528Z/wp-report.json`; `analysis/wp_phase/results/KLEE-ALARM-0144/20260820-194528Z/stdout_stderr.log` |

Exit codes are retained as execution metadata and were not used to infer proof status.
