# Final Thesis Verification Summary

## Eva and KLEE accounting

| Stage | Outcome | Count |
|---|---|---:|
| Baseline Eva | alarms | 171 |
| High-Precision Eva | alarms | 149 |
| Higher precision | removed alarms | 22 |
| KLEE | targets | 149 |
| KLEE | confirmed counterexamples | 48 |
| KLEE | completed without target counterexample | 15 |
| KLEE | timeout/inconclusive | 86 |

The 149 KLEE targets reconcile as 48 + 15 + 86. The 101 non-counterexample targets retain their
existing classifications and are not part of the WP campaign.

## Resolution and WP outcome for the 48 confirmed targets

- Repository-justified implementation repairs: **35**.
- Repository-derived specification resolutions: **5**.
- Thesis-policy-selected specification/interface resolutions: **8**.
- Selected properties proved `VALID_AUTOMATIC`: **48/48 (100.00%)**.

The 8 thesis-policy-selected targets are valid only under the explicitly adopted interface/domain
policy. They are not evidence that the legacy repository originally specified that policy.

## Proof claim

Frama-C/WP proved all 48 explicitly selected, preserved Eva-derived ACSL target properties under
their documented implementation-repair or input-domain/interface contexts, the `ppc_32` machine
model, and the `Typed+int` WP model. No `-wp-rte` goals were generated. This result is not a proof of
whole-function correctness, whole-program correctness, general RTE freedom, behavior outside the
stated contracts, or equivalence between thesis-selected policy and unspecified legacy intent.

The summed recorded wall-clock runtime for the 48 target runs is **183.910237408 seconds**.
