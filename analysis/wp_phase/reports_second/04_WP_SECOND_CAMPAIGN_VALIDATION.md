# WP Second Campaign Validation

| Check | Result |
|---|---|
| Expected targets | PASS — exactly 0061, 0066, 0144 |
| Selected rows | PASS — 3 |
| Complete selected runs | PASS — 3 |
| Duplicate alarm IDs | PASS — 0 |
| Runtime-only targets | PASS — 0 |
| Correct repaired source/function/property | PASS — all 3 |
| `ppc_32` and `Typed+int` | PASS — all 3 |
| Selected commands containing `-wp-rte` | PASS — 0 |
| Proof classification derived from WP evidence | PASS — all 3 |
| Source changes during result analysis | PASS — 0 |
| Frozen first-campaign tables/reports modified | PASS — 0 |
| Previous target result evidence modified | PASS — 0 |
| GUI inspected | NO — intentionally outside campaign |

## Run selection

| Alarm | All runs | Complete | Selected | Reason |
|---|---|---:|---|---|
| KLEE-ALARM-0061 | analysis/wp_phase/results/KLEE-ALARM-0061/20260820-194527Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0061/20260820-194527Z | Only run; complete |
| KLEE-ALARM-0066 | analysis/wp_phase/results/KLEE-ALARM-0066/20260820-194527Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0066/20260820-194527Z | Only run; complete |
| KLEE-ALARM-0144 | analysis/wp_phase/results/KLEE-ALARM-0144/20260820-194528Z | 1 | analysis/wp_phase/results/KLEE-ALARM-0144/20260820-194528Z | Only run; complete |

Each target had one complete run, so no historical run was superseded. Optional `property-status.csv` files were absent, but the target-specific WP JSON and raw logs were present.
