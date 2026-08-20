# Final Validation Checklist

Overall status: **VALIDATED**.

| Invariant | Result | Observed |
|---|---|---|
| Function list has 46 unique rows | PASS | 46 |
| High-Precision manifest has 46 data rows | PASS | 46 |
| Baseline inventory has 171 alarms | PASS | 171 |
| High-Precision inventory has 149 alarms | PASS | 149 |
| Baseline minus High Precision is 22 | PASS | 22 |
| Removed inventory has 22 alarms | PASS | 22 |
| Semantic comparison partitions 171 rows into 149 remaining and 22 removed | PASS | {'REMAINING': 149, 'REMOVED': 22} |
| All 22 removed alarms reconcile semantically by function/source/line/kind multiplicity with expression/property evidence | PASS | 22 |
| 13 functions have zero High-Precision alarms | PASS | 13 |
| Phase-B target IDs are unique 0001-0149 | PASS | 149 |
| Phase-C preparation manifest IDs are unique 0001-0149 | PASS | 149 |
| Execution summary IDs are unique 0001-0149 | PASS | 149 |
| There are 149 alarm directories | PASS | 149 |
| There are 149 current output directories | PASS | 149 |
| All 149 targets have one primary classification | PASS | 149 |
| All 149 targets built and have execution evidence | PASS | 149 |
| Current and results status files agree | PASS | all matched |
| All confirmed target errors have matching KTests | PASS | 48 |
| All confirmed counterexamples have exact source file and line | PASS | 48 |
| All confirmed counterexamples have decoded concrete inputs | PASS | 48 |
| All confirmed counterexamples retain expression, Eva predicate, and KLEE assertion | PASS | 48 |
| No completed-no-counterexample row is a timeout | PASS | 15 |
| No unresolved structural integrity issue | PASS | 0 |

## Reconciliation block

```text
Functions in scope                = 46

Baseline alarms                  = 171
High-Precision alarms            = 149
Baseline - High Precision        = 22
Removed alarm records            = 22
Eva precision reduction          = 12.87% (22/171)

KLEE target alarms               = 149
Classified KLEE alarms           = 149

Confirmed counterexamples        = 48 (32.21% of 149)
No counterexample completed      = 15 (10.07% of 149)
Timeout                          = 86 (57.72% of 149)
KLEE errors                      = 0
Build errors                     = 0
Unsupported                      = 0
Not run                          = 0
Inconclusive                     = 0
Error/unsupported/not-run total  = 0

Sum of KLEE outcomes             = 149
```

## Integrity observations

- Current status copies match for all 149 alarms.
- Current alarm IDs, target directories, target markers, result rows, and output directories form a complete unique 0001–0149 sequence.
- 26 alarms have archived/validation runs. The current output/status pair matching the final summary is selected; historical evidence remains separate.
- There are 57 current `.err` files: 48 target-specific and 5 experiments with one or more non-target errors.
- 3 alarms (KLEE-ALARM-0097, KLEE-ALARM-0099, KLEE-ALARM-0144) are correctly counterexample-confirmed despite timeout exit 137 because their target `.err` and KTest exist; their `Timeout?` field remains `YES`.
- Tool-emitted trailing whitespace in raw `.err`, KTest logs, and the execution TSV was retained byte-for-byte in the execution-freeze commit.

## Structural issues

None.
