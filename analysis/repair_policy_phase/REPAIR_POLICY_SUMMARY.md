# Repair-Policy Resolution Summary

## Methodology

This phase starts from `thesis/wp-terminal-campaign-analyzed` and uses only frozen Eva, KLEE,
repair, source, and Git-history evidence. No Eva, KLEE, WP, GUI, or target launcher was run. Each
decision is occurrence-aware and preserves the original ACSL label and predicate meaning.

## Accounting

- Confirmed KLEE targets: 48
- Previously repaired and WP-verified: 32
- Initial policy-required targets: 16
- Newly repaired in this phase: 3
- Semantics ambiguous: 13
- Repairable decisions awaiting application: 0
- Total repaired: 35/48
- Total WP-ready: 35/48

## Semantic decisions and groups

- Thirteen root shift-count targets remain ambiguous. Known callers supply fixed valid counts, but
  no repository evidence defines direct-call behavior outside those domains.
- `KLEE-ALARM-0061` and `KLEE-ALARM-0066` share a formula-preserving signed-remainder doubling repair.
- `KLEE-ALARM-0144` uses an unsigned-magnitude exceptional path consistent with the division formula
  and sibling implementation.

## Applied repair commits

- `KLEE-ALARM-0061`, `KLEE-ALARM-0066` ->
  `f5daa364e14957ae7410fd2d347917ab6555f046` (one shared physical/semantic repair).
- `KLEE-ALARM-0144` -> `b8b767816bdbe2e38196b9e81b57b48384daeca5`.

The high-pass repair retains the original shift on the nonnegative path and uses range-safe signed
multiplication by two for the negative remainder, preserving the documented filter equation. The
division repair represents `INT32_MIN` as unsigned magnitude `0x80000000U` and retains the existing
quotient-plus-doubled-remainder rule. Arbitrary return values, clamping, saturation, masking, modulo,
and new assumptions/preconditions were rejected. Detailed evidence and alternatives are recorded in
the corresponding `targets/KLEE-ALARM-XXXX.md` files.

## Runtime-only interactions

- `0061`/`0066` share physical operations with runtime-only `0062`/`0067`; their assertions remain
  unchanged on the retained shift paths and are not reclassified.
- `0144` bypasses runtime-only `0145` through `0149` only for the signed-minimum numerator path;
  their ordinary path and classification remain unchanged.

## ACSL and validation

All original predicates remain unchanged. Parser/syntax results and repair commit hashes are recorded
in `REPAIR_POLICY_MATRIX.tsv`. `WP_SECOND_CAMPAIGN_MANIFEST.tsv` contains only applied repairs and every
row remains `NOT_RUN`.

The non-proof sanity commands were:

- `gcc -std=c11 -fsyntax-only -Isrc_repaired/headers src_repaired/sources/hip_Ccode.c`
- `gcc -std=c11 -fsyntax-only -Isrc_repaired/headers src_repaired/sources/div_Ccode.c`
- `bash -n analysis/wp_phase/run_second_campaign.sh`

All passed. No Eva, KLEE, WP, GUI, or target execution was performed.

## Limitations

Ambiguous target IDs: KLEE-ALARM-0002, KLEE-ALARM-0003, KLEE-ALARM-0005, KLEE-ALARM-0006, KLEE-ALARM-0009, KLEE-ALARM-0010, KLEE-ALARM-0012, KLEE-ALARM-0013, KLEE-ALARM-0014, KLEE-ALARM-0015, KLEE-ALARM-0019, KLEE-ALARM-0020, KLEE-ALARM-0021.
Repairable but not yet applied: NONE.
No proof conclusion is made for the second campaign in this phase.
