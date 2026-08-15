# Mapping Validation

The committed validator checks frozen counts, unique IDs, exact one-to-one occurrence identity, category preservation, no `REMOVED`/`NEW` rows, required-field completeness, source-line consistency, predicate polarity, three TSV projections, JSON semantic equivalence, hashes, and POC identities.

## Derived statistics

| category | count |
|---|---|
| division by zero | 16 |
| integer overflow | 100 |
| invalid shift | 33 |

| operation_kind | count |
|---|---|
| LEFT_SHIFT | 26 |
| RIGHT_SHIFT | 7 |
| SIGNED_ADD | 21 |
| SIGNED_DIV | 18 |
| SIGNED_LEFT_SHIFT | 17 |
| SIGNED_MUL | 31 |
| SIGNED_NEG | 22 |
| SIGNED_SUB | 7 |

| confidence | count |
|---|---|
| HIGH | 140 |
| MEDIUM | 9 |

| status | count |
|---|---|
| MAPPED | 140 |
| MAPPED_WITH_SEMANTIC_NOTE | 9 |

The generated validation evidence must report zero unmapped occurrences, zero multiply mapped occurrences, and zero failures before Phase B is committed.

## Dataset hashes

```text
43bbc34ce52a30fca42956e38a1e35c8e2efde74bd88a59b56588a0fd9111212  klee_alarm_targets.tsv
1c6b5726a3b828615aa6eaec0fcee5d40149e416661671ec41679db3bed2f120  klee_alarm_identity.tsv
e69f05b9ea40c31aa604877f3e5d5da88b6179322d12b53226aa0fa0b11a2821  klee_predicate_inventory.tsv
```
