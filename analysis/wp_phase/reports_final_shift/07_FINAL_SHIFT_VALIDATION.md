# Final Shift WP Validation

| Check | Result |
|---|---|
| Expected target IDs | PASS — 13 exact IDs |
| Final result rows | PASS — 13 |
| Complete selected runs | PASS — 13 |
| Duplicate final IDs | PASS — 0 |
| Full confirmed matrix | PASS — 48 rows / 48 unique IDs |
| Previous/current proof rows | PASS — 35 + 13 = 48 |
| Runtime-only targets in WP matrix | PASS — 0 |
| Commands containing `-wp-rte` | PASS — 0 |
| Command/source/function/property/model consistency | PASS — 13/13 |
| Original Eva target predicates changed | PASS — 0 |
| Source modifications during result analysis | PASS — 0 |
| Frozen historical reports modified | PASS — 0 |
| Classification based on WP goal evidence, not exit code | PASS — all 13 |
| GUI inspected | NO — intentionally outside campaign |

## Run-selection audit

| Alarm | All timestamped runs | Complete | Selected | Reason |
|---|---|---:|---|---|
| KLEE-ALARM-0002 | analysis/wp_phase/results/KLEE-ALARM-0002/20260820-202519Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0002/20260820-202519Z | Only run; complete |
| KLEE-ALARM-0003 | analysis/wp_phase/results/KLEE-ALARM-0003/20260820-202520Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0003/20260820-202520Z | Only run; complete |
| KLEE-ALARM-0005 | analysis/wp_phase/results/KLEE-ALARM-0005/20260820-202522Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0005/20260820-202522Z | Only run; complete |
| KLEE-ALARM-0006 | analysis/wp_phase/results/KLEE-ALARM-0006/20260820-202523Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0006/20260820-202523Z | Only run; complete |
| KLEE-ALARM-0009 | analysis/wp_phase/results/KLEE-ALARM-0009/20260820-202525Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0009/20260820-202525Z | Only run; complete |
| KLEE-ALARM-0010 | analysis/wp_phase/results/KLEE-ALARM-0010/20260820-202526Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0010/20260820-202526Z | Only run; complete |
| KLEE-ALARM-0012 | analysis/wp_phase/results/KLEE-ALARM-0012/20260820-202527Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0012/20260820-202527Z | Only run; complete |
| KLEE-ALARM-0013 | analysis/wp_phase/results/KLEE-ALARM-0013/20260820-202528Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0013/20260820-202528Z | Only run; complete |
| KLEE-ALARM-0014 | analysis/wp_phase/results/KLEE-ALARM-0014/20260820-202530Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0014/20260820-202530Z | Only run; complete |
| KLEE-ALARM-0015 | analysis/wp_phase/results/KLEE-ALARM-0015/20260820-202531Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0015/20260820-202531Z | Only run; complete |
| KLEE-ALARM-0019 | analysis/wp_phase/results/KLEE-ALARM-0019/20260820-202533Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0019/20260820-202533Z | Only run; complete |
| KLEE-ALARM-0020 | analysis/wp_phase/results/KLEE-ALARM-0020/20260820-202534Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0020/20260820-202534Z | Only run; complete |
| KLEE-ALARM-0021 | analysis/wp_phase/results/KLEE-ALARM-0021/20260820-202535Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0021/20260820-202535Z | Only run; complete |

Every target had one complete run. The optional `property-status.csv` artifact was absent; the target-specific JSON report, raw log, command, metadata, versions, exit code, and elapsed time were present.
