# WP Run Selection and Command Consistency Audit

All discovered runs are retained in place and listed in `WP_RUN_INVENTORY.tsv`. The authoritative
selection rule is the most recent complete run; every target currently has exactly one complete run.

| Alarm | Runs found | Selected run | Complete | Command consistent | Optional missing artifacts | Selection reason |
|---|---:|---|---|---|---|---|
| KLEE-ALARM-0001 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0001/20260820-185801Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0004 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0004/20260820-185802Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0007 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0007/20260820-185803Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0008 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0008/20260820-185813Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0011 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0011/20260820-185814Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0016 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0016/20260820-185815Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0017 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0017/20260820-185816Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0018 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0018/20260820-190028Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0022 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0022/20260820-190029Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0043 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0043/20260820-190029Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0044 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0044/20260820-190030Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0053 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0053/20260820-190031Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0058 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0058/20260820-190032Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0063 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0063/20260820-190034Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0095 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0095/20260820-190035Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0096 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0096/20260820-190036Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0097 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0097/20260820-190037Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0099 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0099/20260820-190038Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0104 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0104/20260820-190040Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0105 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0105/20260820-190041Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0106 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0106/20260820-190042Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0107 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0107/20260820-190043Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0108 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0108/20260820-190044Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0109 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0109/20260820-190045Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0110 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0110/20260820-190046Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0111 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0111/20260820-190047Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0112 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0112/20260820-190048Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0113 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0113/20260820-190049Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0114 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0114/20260820-190050Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0115 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0115/20260820-190051Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0116 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0116/20260820-190052Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |
| KLEE-ALARM-0119 | 1 | `analysis/wp_phase/results/KLEE-ALARM-0119/20260820-190052Z` | COMPLETE | YES | property-status.csv (optional; WP JSON present) | Only run; complete |

Every selected command uses `-machdep ppc_32`, `-wp`, the expected assertion-owner function,
the target's own `eva_klee_alarm_XXXX`, `-wp-model Typed+int`, and the configured
`alt-ergo,z3,cvc5` set. No selected command contains `-wp-rte`.

All selected runs recorded Git revision `ab1faecb082c1248f76492937603dce6bcf249a5` and
Frama-C `33.0 (Arsenic)`. `property-status.csv` is absent for all runs but was optional;
the configured `wp-report.json` exists and is the primary machine-readable target evidence.
