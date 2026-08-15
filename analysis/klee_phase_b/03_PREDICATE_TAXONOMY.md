# Predicate Taxonomy

Every `predicate_text` is a safety condition: true means the mapped Eva obligation is satisfied; `violation_condition` is explicitly `NOT(predicate_text)`. Predicates use mathematical/widened notation so their evaluation is not itself undefined.

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

Key forms include `DIVISOR_NONZERO`, `SHIFT_COUNT_VALID`, `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE`, bound-specific signed add/subtract/multiply/left-shift forms, `SIGNED_NEG_VALID`, and `SIGNED_DIV_REPRESENTABLE`. Bound-specific lower and upper Eva occurrences remain distinct even when a later implementation could evaluate a shared full-range helper. For every signed division-by-zero row, the distinct `INT32_MIN / -1` representability condition is recorded in `companion_signed_division_overflow`; it is never folded into the divisor predicate.
