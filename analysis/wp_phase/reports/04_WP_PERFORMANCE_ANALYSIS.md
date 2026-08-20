# WP Performance Analysis

Only wall-clock time captured by the terminal launcher is analyzed; no CPU or memory metric is invented.

- Total: **166.626282879 seconds**
- Mean: **5.207071340 seconds**
- Median: **0.781153923 seconds**
- Minimum: **0.597309440 seconds** (KLEE-ALARM-0105)
- Maximum: **131.908813542 seconds** (KLEE-ALARM-0017)

## Grouped by prover usage

| Group | Targets | Total (s) | Mean (s) | Median (s) | Min (s) | Max (s) |
|---|---:|---:|---:|---:|---:|---:|
| Qed alone | 26 | 19.313198047 | 0.742815309 | 0.768646149 | 0.597309440 | 0.944173325 |
| External provers | 6 | 147.313084832 | 24.552180805 | 1.555960209 | 1.338741983 | 131.908813542 |

All targets are VALID_AUTOMATIC, so classification grouping is identical to the full campaign.

## Runtime per target

| Alarm | Runtime (s) | Prover usage |
|---|---:|---|
| KLEE-ALARM-0105 | 0.597309440 | Qed alone |
| KLEE-ALARM-0044 | 0.600762044 | Qed alone |
| KLEE-ALARM-0104 | 0.601476787 | Qed alone |
| KLEE-ALARM-0095 | 0.624012836 | Qed alone |
| KLEE-ALARM-0096 | 0.629553114 | Qed alone |
| KLEE-ALARM-0043 | 0.634042626 | Qed alone |
| KLEE-ALARM-0053 | 0.634189306 | Qed alone |
| KLEE-ALARM-0022 | 0.643334027 | Qed alone |
| KLEE-ALARM-0110 | 0.759012244 | Qed alone |
| KLEE-ALARM-0112 | 0.761582419 | Qed alone |
| KLEE-ALARM-0018 | 0.762367123 | Qed alone |
| KLEE-ALARM-0004 | 0.764614327 | Qed alone |
| KLEE-ALARM-0113 | 0.767082242 | Qed alone |
| KLEE-ALARM-0108 | 0.770210056 | Qed alone |
| KLEE-ALARM-0114 | 0.774175472 | Qed alone |
| KLEE-ALARM-0116 | 0.779620137 | Qed alone |
| KLEE-ALARM-0111 | 0.782687709 | Qed alone |
| KLEE-ALARM-0107 | 0.788547305 | Qed alone |
| KLEE-ALARM-0016 | 0.794820741 | Qed alone |
| KLEE-ALARM-0115 | 0.799058416 | Qed alone |
| KLEE-ALARM-0109 | 0.801101872 | Qed alone |
| KLEE-ALARM-0011 | 0.807499025 | Qed alone |
| KLEE-ALARM-0106 | 0.808987944 | Qed alone |
| KLEE-ALARM-0119 | 0.823305181 | Qed alone |
| KLEE-ALARM-0008 | 0.859672329 | Qed alone |
| KLEE-ALARM-0001 | 0.944173325 | Qed alone |
| KLEE-ALARM-0063 | 1.338741983 | External provers |
| KLEE-ALARM-0058 | 1.349394188 | External provers |
| KLEE-ALARM-0099 | 1.515477946 | External provers |
| KLEE-ALARM-0097 | 1.596442472 | External provers |
| KLEE-ALARM-0007 | 9.604214701 | External provers |
| KLEE-ALARM-0017 | 131.908813542 | External provers |
