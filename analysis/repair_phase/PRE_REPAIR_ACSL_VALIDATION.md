# Pre-Repair ACSL Baseline Validation

This state is derived from validated analysis commit
`8974a9ff49ce774be3c02fcc3b3ab3a160e37ad2`. The byte-for-byte
`src_analysis` copy was frozen as `src_repaired` in baseline commit
`6a762e3` before any specification was inserted.

## Materialization accounting

- High-Precision targets: 149
- Unique ACSL labels: 149
- Inserted ACSL assertions: 149
- Missing labels: 0
- Duplicate labels: 0
- Confirmed-counterexample/WP-future targets: 48
- Runtime-only targets: 101
  - completed search without target counterexample: 15
  - timeout/inconclusive: 86

Every assertion is inserted immediately before the exact source statement
recorded by the occurrence-aware Phase-B target mapping. Multiple target IDs at
one statement retain separate unique labels.

## Property preservation

`149_TARGET_REPAIR_MANIFEST.tsv` preserves both the frozen raw Eva predicate
and the inserted ACSL predicate. Conversion is limited to:

- replacing `INT32_MIN`/`INT32_MAX` names with their exact 32-bit mathematical
  bounds;
- interpreting the frozen `MATHEMATICAL(x)` notation as ACSL mathematical
  integer arithmetic;
- expressing `MATHEMATICAL_LEFT_SHIFT(x,1)` as mathematical `2*x`;
- expressing the special unsigned `1 << INT_BITS` bound as `INT_BITS <= 30`.

No property was strengthened or weakened. The conversion for every row is
recorded in `ACSL Conversion Note`.

## Implementation-equivalence check

Programmatically removing only the 149 generated ACSL blocks from
`src_repaired` produces byte-for-byte text equal to `src_analysis` for all 27
source/header files. Therefore this pre-repair state contains specifications
only and no implementation repair.

## ACSL parser check

Frama-C 33.0 parsed all six affected files under `-machdep ppc_32` and the
`src_repaired/headers` include path. No Eva or WP plugin was invoked. The parser
accepted all 149 assertions. It emitted only pre-existing C diagnostics about
an unrelated bitwise relation and two fall-through functions.

Overall pre-repair materialization status: **VALIDATED**.
