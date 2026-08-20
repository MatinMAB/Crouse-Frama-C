# WP Result Classification

The primary classification concerns only the selected `eva_klee_alarm_XXXX` assertion.

- `VALID_AUTOMATIC`: the selected target property is Valid using Qed and/or an automatic external prover.
- `VALID_INTERACTIVE`: the selected property is Valid only after an auditable interactive proof.
- `UNKNOWN`: WP generated the selected goal, but no configured prover established validity or failure.
- `TIMEOUT`: the selected goal exhausted its configured prover time allowance.
- `FAILED`: the selected property was not proved because of a proof/tool failure that is not a timeout.
- `REPAIR_POLICY_REQUIRED`: implementation policy is unresolved; WP execution is intentionally blocked.
- `NOT_RUN`: no WP execution has been performed for this target.

Frama-C process exit status records tool execution only. It must never be converted directly into
`VALID_AUTOMATIC` or any other proof classification. RTE is outside this experiment and therefore
has no result category.
