# WP Numeric Reconciliation

This file is generated from the retained datasets and is also enforced by `validate_wp_phase.py`.

| Equation | Retained evidence | Result |
| --- | --- | --- |
| KLEE witness IDs = Semantic Decision IDs = WP IDs | 48 = 48 = 48, exact set equality | PASS |
| Code Repair + Specification Completion | 35 + 13 = 48 | PASS |
| Qed-only + External prover | 35 + 13 = 48 | PASS |
| VALID + unresolved | 48 + 0 = 48 | PASS |
| Runtime-monitoring remainder | 149 - 48 = 101 | PASS |
| Category inventory | 29 integer overflow + 19 invalid shift = 48 | PASS |
| Historical runner-wall total | 183.910237408 s | PASS |

No division-by-zero target exists in this 48-witness WP subset. Thirteen retained `Current Assertion Line` values drifted after shared insertions; all 48 ACSL labels remain unique and the normalized dataset records the verified current line.
