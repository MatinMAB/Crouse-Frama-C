# WP Warning Analysis

Warnings are interpreted relative to the selected-property-only experiment; they are not automatically proof failures.

| Category | Target frequency | Occurrences | Interpretation |
|---|---:|---:|---|
| Missing RTE guards | 32 | 32 | Expected experiment-design warning because RTE generation is excluded. |
| Missing assigns specification | 32 | 46 | Contract precision warning; each selected local target goal was still generated and proved. |
| Parser/fall-through warning | 20 | 20 | Pre-existing unrelated warning in `mul_Ccode.c`; not the selected target property. |
| Other warnings | 0 | 0 | None observed. |

There were no preprocessing-failure, missing-function, missing-property, invalid-command, or internal-tool warnings.

## Per-target categories

| Alarm | Warnings |
|---|---|
| KLEE-ALARM-0001 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0004 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0007 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1; Parser/fall-through warning: 1 |
| KLEE-ALARM-0008 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0011 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0016 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1; Parser/fall-through warning: 1 |
| KLEE-ALARM-0017 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1; Parser/fall-through warning: 1 |
| KLEE-ALARM-0018 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0022 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2 |
| KLEE-ALARM-0043 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 |
| KLEE-ALARM-0044 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 |
| KLEE-ALARM-0053 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 |
| KLEE-ALARM-0058 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 |
| KLEE-ALARM-0063 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 |
| KLEE-ALARM-0095 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 |
| KLEE-ALARM-0096 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 |
| KLEE-ALARM-0097 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 |
| KLEE-ALARM-0099 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 |
| KLEE-ALARM-0104 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 |
| KLEE-ALARM-0105 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1 |
| KLEE-ALARM-0106 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0107 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1; Parser/fall-through warning: 1 |
| KLEE-ALARM-0108 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0109 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0110 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1; Parser/fall-through warning: 1 |
| KLEE-ALARM-0111 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0112 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0113 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1; Parser/fall-through warning: 1 |
| KLEE-ALARM-0114 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0115 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0116 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 2; Parser/fall-through warning: 1 |
| KLEE-ALARM-0119 | Missing RTE guards: 1 (expected experimental scope); Missing assigns specification: 1; Parser/fall-through warning: 1 |
