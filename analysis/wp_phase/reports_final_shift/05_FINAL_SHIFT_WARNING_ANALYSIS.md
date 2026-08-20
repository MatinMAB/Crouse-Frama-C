# Final Shift Warning Analysis

| Warning category | Targets | Total occurrences | Interpretation |
|---|---:|---:|---|
| Missing RTE guards | 13 | 13 | Expected experiment-scope warning because `-wp-rte` is intentionally absent. |
| Missing assigns specification | 13 | 26 | Pedantic frame-specification warning; selected local goals were nevertheless generated and proved. |
| Parser/fall-through | 13 | 13 | Pre-existing unrelated fall-through warning in `s16_mul_s16_u16_fac025`. |
| Prover/preprocessing/internal failure | 0 | 0 | None observed. |

Raw warnings remain preserved in each selected `stdout_stderr.log`. Warning presence was not used as
a substitute for target-property proof status.
