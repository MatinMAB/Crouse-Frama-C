# Phase-C Instrumentation Requirements

Phase C must consume the hashed Phase-B TSV without re-sorting or reconstructing IDs. It requires: a pinned KLEE 3.2/LLVM 13 environment; explicit-width ppc_32 scalar adapters; full frozen harness domains; one selected target ID per run; predicate templates evaluated before the relevant operation/shift/helper operation; IR inspection at `-O0`; prevention of earlier unrelated UB from obscuring the selected target; KTest decoding tied to the entry signature; and controlled replay.

For helper targets, the entry remains the frozen Eva target function and the check belongs in the helper with caller-context selection. For compound statements, instrumentation must be introduced before the exact suboperation without evaluating the unsafe expression inside the predicate. No code is generated in Phase B.
