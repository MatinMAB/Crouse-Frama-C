# KLEE Phase B — Executive Summary

## Verdict

```text
SUCCESS — MAPPING COMPLETE WITH REVIEW ITEMS
```

The frozen 149 Eva `REMAINING` occurrences map one-to-one to 149 IDs. Category totals are 100 integer overflow, 16 division by zero, and 33 invalid shift. There are no unmapped, multiply mapped, `REMOVED`, or `NEW` targets.

## Mapping profile

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

All targets are 32-bit scalar-width properties. Six shared-helper rows and three occurrence-index-2 divisor rows are MEDIUM with semantic notes; all other rows are HIGH. There are no LOW or identity-ambiguous mappings.

## Phase-A POCs

All three Phase-A candidates remain suitable and are retained: `KLEE-ALARM-0107` (`s32_mul_s32_s32`, `MulHword.c:47`), `KLEE-ALARM-0023` (`s16_div_s32_s16`, `div_Ccode.c:274`), and `KLEE-ALARM-0002` (`root_s32_mul_s32_s16_fac_less1`, `mul_Ccode.c:5089`).

No KLEE execution, project bitcode, harness generation, instrumentation, witness generation, replay, toolchain setup, or validity classification occurred.

## Frozen output hashes

```text
43bbc34ce52a30fca42956e38a1e35c8e2efde74bd88a59b56588a0fd9111212  klee_alarm_targets.tsv
1c6b5726a3b828615aa6eaec0fcee5d40149e416661671ec41679db3bed2f120  klee_alarm_identity.tsv
e69f05b9ea40c31aa604877f3e5d5da88b6179322d12b53226aa0fa0b11a2821  klee_predicate_inventory.tsv
```
