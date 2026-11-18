# E-ACSL Numeric Reconciliation

- High-Precision IDs: **149**
- WP-proved IDs: **48**
- E-ACSL selected IDs: **101**
- Exact relation: `149 - 48 = 101`
- KLEE completed/no-witness: **15**
- KLEE timeout/inconclusive: **86**
- Exact relation: `15 + 86 = 101`
- `WP ∩ EACSL = ∅`: **PASS**
- `WP ∪ EACSL = High Precision`: **PASS**
- Runtime executions (property-observation cases): **101**
- Unique violated targets/events: **7/7**
- No violation observed: **48**
- Not reached because another check aborted first: **42**
- Ambiguous output: **4**

Thus 94 targets had no direct target-matched violation, but only 48 were `NO_VIOLATION_OBSERVED`; 42 were `NOT_REACHED` and 4 were `AMBIGUOUS_OUTPUT`.

`NO_VIOLATION_OBSERVED` is not a proof of safety.
