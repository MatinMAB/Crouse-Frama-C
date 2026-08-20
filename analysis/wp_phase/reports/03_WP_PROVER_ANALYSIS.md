# WP Prover Analysis

- Qed alone solved: **26 targets**.
- External provers were invoked: **6 targets**.
- Alt-Ergo invoked: 6; Valid: 5; Timeout: 1.
- Z3 invoked: 6; Valid: 6.
- CVC5 invoked: 6; Valid: 6.
- Agreement by at least two external provers: 6 targets.
- Target classifications Unknown/Timeout/Failed: 0/0/0.

`-wp-run-all-provers` caused all three external solvers to run on goals not closed by Qed.
No solver is credited merely for appearing in the command. Cache JSON supplies each actual verdict.
No external solver was uniquely required: Z3 and CVC5 both proved all six external targets.

| Alarm | Qed | Alt-Ergo | Z3 | CVC5 | Target classification |
|---|---|---|---|---|---|
| KLEE-ALARM-0007 | NOT_SUFFICIENT | VALID | VALID | VALID | VALID_AUTOMATIC |
| KLEE-ALARM-0017 | NOT_SUFFICIENT | TIMEOUT | VALID | VALID | VALID_AUTOMATIC |
| KLEE-ALARM-0058 | NOT_SUFFICIENT | VALID | VALID | VALID | VALID_AUTOMATIC |
| KLEE-ALARM-0063 | NOT_SUFFICIENT | VALID | VALID | VALID | VALID_AUTOMATIC |
| KLEE-ALARM-0097 | NOT_SUFFICIENT | VALID | VALID | VALID | VALID_AUTOMATIC |
| KLEE-ALARM-0099 | NOT_SUFFICIENT | VALID | VALID | VALID | VALID_AUTOMATIC |
