# KLEE Phase B — Scope and Rules

## Objective

Map the frozen 149 High Precision Eva `REMAINING` alarm occurrences one-to-one to stable target IDs and UB-free safety-predicate specifications. The unit is an occurrence, including caller context for helper alarms.

## Direct repository evidence

- Frozen inventory: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv`
- Frozen inventory SHA-256: `493effbda44b6668a0dbb64cf875b9ecc18c87231ac40673fd662b7148b36d51`
- Rows: 149; integer overflow 100; division by zero 16; invalid shift 33.
- Source, Eva logs, function inventory, and harnesses are read-only evidence.

## Scientific boundary

Phase B performs no KLEE execution, bitcode generation, project harness generation, instrumentation, witness generation, replay, toolchain installation, Eva rerun, or alarm validity classification. Only `analysis/klee_phase_b/` and `reports/klee_phase_b/` are generated.
