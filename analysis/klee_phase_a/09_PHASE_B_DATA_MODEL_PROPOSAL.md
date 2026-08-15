# Phase-B Alarm-to-Predicate Data Model Proposal

## Boundary

This document proposes the model; it does not create the 149-row mapping. The
source of truth remains:

```text
reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv
```

It contains exactly 149 `REMAINING` alarm occurrences.

## Stable target identity

Phase B should sort deterministically by the existing function order, source
path, numeric line, canonical signature, and occurrence, then assign IDs:

```text
KLEE-ALARM-0001
...
KLEE-ALARM-0149
```

The durable identity key should be:

```text
function + canonical_signature + occurrence
```

The sequential ID is a presentation handle; the composite key detects source
drift and preserves multiplicity where identical signatures occur more than
once.

## Proposed required fields

```text
target_id
function
priority
source_file
source_line
category
normalized_message
canonical_signature
occurrence
definition_file
definition_line
function_signature
harness_path
source_files
input_model
source_expression
source_context_hash
operand_types_ppc32
integer_promotions
operation_type
destination_type
control_guard
path_constraints
helper_context
safety_predicate_c
safety_predicate_math
predicate_evaluation_width
instrumentation_site
instrumentation_strategy
target_semantic_sensitivity
recommended_replay_target
mapping_status
review_notes
```

## Category-specific predicate rules

### Integer overflow

Record whether the operation is addition, subtraction, multiplication,
negation, left shift, or conversion. The predicate must evaluate the
mathematical result without repeating the source UB. Examples include:

- widened `int64_t` for a 32-bit add/multiply when mathematically sufficient;
- boundary division tests before multiplication if even the widened type could
  overflow;
- explicit `value != INT32_MIN` before unary negation;
- Clang checked-overflow intrinsics as a secondary implementation.

The mapped predicate must match the specific Eva assertion (upper bound, lower
bound, or both), rather than collapse multiple alarm rows into one line-level
event.

### Division by zero

Capture the divisor after the exact source conversions. The primary predicate
is `converted_divisor != 0`. For signed division, separately record whether
`MIN / -1` is possible, because that is a different undefined condition.

### Invalid shift

Record:

- promoted LHS width;
- signedness and source range of RHS;
- `0 <= rhs < width` for signed RHS;
- `rhs < width` for unsigned RHS;
- left-shift LHS non-negativity and representability checks where applicable.

Eva's `invalid LHS operand for left shift` and `invalid RHS operand for shift`
must remain distinct targets.

## Input model

Phase B should parse the existing Eva harness but translate its full-domain
intent into KLEE symbolic objects without reusing Frama-C builtins. It must
preserve:

- parameter order and source typedef;
- signed/unsigned width under `ppc_32`;
- full minimum/maximum domain;
- no caller-derived narrowing unless an existing formal contract explicitly
  supplied it in the frozen experiment.

## Source and helper control

The baseline/high-precision runner manifests already identify the exact source
and helper lists. Phase B must reuse those lists and record every KLEE-specific
adapter or instrumentation file separately. No helper may be added merely for
convenience if it changes the call graph.

## Semantic sensitivity flag

Suggested values:

```text
SCALAR_WIDTH_ONLY
IMPLEMENTATION_DEFINED_SIGNED_SHIFT
PLAIN_CHAR_SIGNEDNESS
ENDIANNESS_SENSITIVE
LAYOUT_SENSITIVE
POINTER_WIDTH_SENSITIVE
REQUIRES_REVIEW
```

Multiple flags may apply. The inspected population strongly suggests many
alarms will be `SCALAR_WIDTH_ONLY`, but Phase B must establish that occurrence
by occurrence.

## Invariants and validation

Phase B should fail closed unless:

- exactly 149 rows exist;
- every frozen `(function, canonical_signature, occurrence)` maps once;
- no new alarm is invented;
- every target has a source expression and context hash;
- every operand has a resolved `ppc_32` type;
- every predicate can be evaluated without invoking its target UB;
- every function references its existing full-domain input model;
- target IDs are stable under repeated generation;
- generated mapping does not modify the frozen Eva trees.

## Later outcome taxonomy

Phase B should reserve, but not assign, result states such as:

```text
WITNESS_CONFIRMED
KLEE_WITNESS_ONLY
NO_WITNESS_WITHIN_BUDGET
UNSUPPORTED
KLEE_ERROR
```

`NO_WITNESS_WITHIN_BUDGET` must never be rendered as `SAFE`.
