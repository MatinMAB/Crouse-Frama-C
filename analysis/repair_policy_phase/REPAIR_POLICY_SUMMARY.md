# Repair-Policy Resolution Summary

## Methodology

This phase starts from `thesis/wp-terminal-campaign-analyzed` and uses only frozen Eva, KLEE,
repair, source, and Git-history evidence. No Eva, KLEE, WP, GUI, or target launcher was run. Each
decision is occurrence-aware and preserves the original ACSL label and predicate meaning.

## Accounting

- Confirmed KLEE targets: 48
- Previously repaired and WP-verified: 32
- Initial policy-required targets: 16
- Newly repaired in this phase: 0
- Semantics ambiguous: 13
- Repairable decisions awaiting application: 3
- Total repaired: 32/48
- Total WP-ready: 32/48

## Semantic decisions and groups

- Thirteen root shift-count targets remain ambiguous. Known callers supply fixed valid counts, but
  no repository evidence defines direct-call behavior outside those domains.
- `KLEE-ALARM-0061` and `KLEE-ALARM-0066` share a formula-preserving signed-remainder doubling repair.
- `KLEE-ALARM-0144` uses an unsigned-magnitude exceptional path consistent with the division formula
  and sibling implementation.

## Runtime-only interactions

- `0061`/`0066` share physical operations with runtime-only `0062`/`0067`; their assertions remain
  unchanged on the retained shift paths and are not reclassified.
- `0144` bypasses runtime-only `0145` through `0149` only for the signed-minimum numerator path;
  their ordinary path and classification remain unchanged.

## ACSL and validation

All original predicates remain unchanged. Parser/syntax results and repair commit hashes are recorded
in `REPAIR_POLICY_MATRIX.tsv`. `WP_SECOND_CAMPAIGN_MANIFEST.tsv` contains only applied repairs and every
row remains `NOT_RUN`.

## Limitations

Ambiguous target IDs: KLEE-ALARM-0002, KLEE-ALARM-0003, KLEE-ALARM-0005, KLEE-ALARM-0006, KLEE-ALARM-0009, KLEE-ALARM-0010, KLEE-ALARM-0012, KLEE-ALARM-0013, KLEE-ALARM-0014, KLEE-ALARM-0015, KLEE-ALARM-0019, KLEE-ALARM-0020, KLEE-ALARM-0021.
Repairable but not yet applied: KLEE-ALARM-0061, KLEE-ALARM-0066, KLEE-ALARM-0144.
No proof conclusion is made for the second campaign in this phase.
