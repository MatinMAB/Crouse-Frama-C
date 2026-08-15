# Stable Target-ID Policy

IDs are assigned in exact row order of the frozen High Precision inventory: `KLEE-ALARM-0001` through `KLEE-ALARM-0149`. This choice preserves the already frozen experiment order, which follows the function population and recorded Eva occurrence order. Filesystem traversal order is never used.

The authoritative input is bound to SHA-256 `493effbda44b6668a0dbb64cf875b9ecc18c87231ac40673fd662b7148b36d51`. Reproducibility therefore means: verify this hash, read TSV data rows sequentially, preserve `(function, canonical_signature, occurrence)`, and format the one-based row ordinal with four digits. Duplicate-looking source expressions are not merged. A changed or reordered input has a different hash and is a new dataset rather than silently reusing IDs.
