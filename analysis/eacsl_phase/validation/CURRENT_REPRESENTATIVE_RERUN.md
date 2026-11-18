# Current Representative Reproduction Check

Date: 2026-11-18 (Asia/Tehran task date; execution artifact timestamps are UTC).

This rerun is separate from the frozen 2026-08-21 historical experiment and is not included in historical performance aggregates.

- Environment check: PASS, stock Frama-C/E-ACSL 33.0, GCC 13.3.0.
- FULL generation: PASS, 149 unique generated target-check sites.
- SELECTIVE generation: PASS, 101 unique generated target-check sites.
- FULL performance representative: exit 0, checksum `5272412154435795075`, no violation.
- SELECTIVE performance representative: exit 0, same checksum, no violation.
- `OBS-001` (`KLEE-ALARM-0023`): no violation observed, matching historical classification.
- `OBS-002` (`KLEE-ALARM-0024`): exit 134 and direct `eva_klee_alarm_0024` failure, matching historical violation attribution.

The single-run timing values are reproducibility diagnostics only. They do not replace the historical 10-repeat static or 30-repeat dynamic datasets.
