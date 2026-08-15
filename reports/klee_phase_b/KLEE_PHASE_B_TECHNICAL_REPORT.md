# KLEE Phase B — Deterministic Alarm-to-Predicate Mapping Technical Report

## 1. Objective and boundary

Phase B transforms the frozen High Precision Eva occurrence population into deterministic, occurrence-aware target specifications. It does not execute KLEE and does not change the Eva dataset.

## 2. Authoritative inputs

- `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv` (493effbda44b6668a0dbb64cf875b9ecc18c87231ac40673fd662b7148b36d51)
- `reports/eva_report_source_package/data/alarm_comparison.tsv`
- `reports/eva_report_source_package/data/functions.tsv`
- `reports/eva_report_source_package/data/source_locations.tsv`
- committed High Precision Eva logs, source, headers, and harnesses

## 3. Input validation

```text
remaining=149
integer overflow=100
division by zero=16
invalid shift=33
functions_manifest=46
alarm_bearing_functions=33
zero_alarm_functions_without_targets=13
identity_duplicates=0
function_order_monotonic=YES
input_inventory_sha256=493effbda44b6668a0dbb64cf875b9ecc18c87231ac40673fd662b7148b36d51
```

## 4. Stable identity

The exact frozen TSV row order is retained and mapped to `KLEE-ALARM-0001` through `KLEE-ALARM-0149`. The preserved identity tuple is `(eva_function, eva_canonical_signature, eva_occurrence_index)`. This distinguishes caller contexts, repeated source obligations, and multiplicity without relying on directory traversal.

## 5. Direct evidence versus derived mapping

Direct fields originate in the frozen inventory, Eva log, source line, function inventory, or Eva harness. Derived fields include operation classification, effective C type, normal-form predicate, sensitivity, future check placement, confidence, and status. Derived fields use ppc_32 C semantics and do not claim a witness or runtime classification.

## 6. Category totals

| category | count |
|---|---|
| division by zero | 16 |
| integer overflow | 100 |
| invalid shift | 33 |

## 7. Operation taxonomy

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

## 8. Predicate classes

| predicate_class | count |
|---|---|
| DIVISOR_NONZERO | 16 |
| SHIFT_COUNT_VALID | 13 |
| SIGNED_ADD_LOWER_BOUND | 6 |
| SIGNED_ADD_UPPER_BOUND | 15 |
| SIGNED_DIV_REPRESENTABLE | 2 |
| SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE | 20 |
| SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND | 17 |
| SIGNED_MUL_LOWER_BOUND | 10 |
| SIGNED_MUL_UPPER_BOUND | 21 |
| SIGNED_NEG_VALID | 22 |
| SIGNED_SUB_LOWER_BOUND | 5 |
| SIGNED_SUB_UPPER_BOUND | 2 |

## 9. Types and widths

| result_width | count |
|---|---|
| 32 | 149 |

| result_signedness | count |
|---|---|
| SIGNED | 136 |
| UNSIGNED | 13 |

Every effective target operation is 32-bit. Narrow signed and unsigned arguments promote to signed 32-bit `int` where applicable. `s32/u32` map to 32-bit signed/unsigned long only under the frozen ppc_32 model; a host LP64 build is not a substitute.

## 10. Helper and guard profile

| target_scope | count |
|---|---|
| HELPER_FUNCTION | 6 |
| TARGET_FUNCTION | 143 |

| guarded | count |
|---|---|
| NO_DIRECT_GUARD | 31 |
| WITH_GUARD | 118 |

Helper-source targets remain independent per Eva caller. Guards are recorded as direct source evidence only; no inferred solver path condition is promoted to fact.

## 11. Semantic sensitivity

| semantic_sensitivity | count |
|---|---|
| SCALAR_WIDTH_SEMANTICS | 149 |

No mapped operation directly depends on byte order, pointer width, object layout, structure layout, or calling convention. Every row nevertheless requires ppc_32 scalar widths/promotions.

## 12. Confidence and review

| confidence | count |
|---|---|
| HIGH | 140 |
| MEDIUM | 9 |

| status | count |
|---|---|
| MAPPED | 140 |
| MAPPED_WITH_SEMANTIC_NOTE | 9 |

MEDIUM mappings are the six shared-helper occurrences and three frozen occurrence-index-2 divisor properties. Their identity and safety condition are known; the note constrains future instrumentation placement. LOW mappings: zero.

## 13. Predicate construction

Every predicate is a safety condition. Signed arithmetic uses mathematical-result notation and explicit INT32 bounds, so a future check need not evaluate the potentially undefined source operation. Division zero and shift-count predicates precede the operation. Left-shift nonnegative-LHS obligations are distinct from shift-count and representability obligations on the same line.

## 14. Validation and round trip

The validator checks 149 rows/IDs/identities, category totals, exact projection equivalence, JSON equality, source statements, nonempty fields, and reverse mapping. A target resolves to frozen row, log, source, harness, input model, and predicate; each frozen row resolves to one target.

## 15. POC validation

- `KLEE-ALARM-0107`, `MulHword.c:47` in `s32_mul_s32_s32`: retained; helper context is explicit.
- `KLEE-ALARM-0023`, `div_Ccode.c:274` in `s16_div_s32_s16`: retained; compound line has separately identified division/shift/multiplication properties.
- `KLEE-ALARM-0002`, `mul_Ccode.c:5089` in `root_s32_mul_s32_s16_fac_less1`: retained and remains the recommended first end-to-end overshift POC.

## 16. Phase C requirements

Phase C requires the pinned environment and explicit-width adapter identified by Phase A, plus generated predicate templates that consume this dataset without changing IDs. Checks must precede UB, full input domains must match frozen harnesses, IR must be inspected, and replay semantics must be documented.

## 17. Scientific limitation

Mapping a property is not evidence that it is reachable or unreachable. Phase B makes no statement that a program is safe/unsafe, that an alarm is valid/invalid, or that KLEE will/will not produce a witness.

## 18. Dataset hashes

```text
43bbc34ce52a30fca42956e38a1e35c8e2efde74bd88a59b56588a0fd9111212  klee_alarm_targets.tsv
1c6b5726a3b828615aa6eaec0fcee5d40149e416661671ec41679db3bed2f120  klee_alarm_identity.tsv
e69f05b9ea40c31aa604877f3e5d5da88b6179322d12b53226aa0fa0b11a2821  klee_predicate_inventory.tsv
```
