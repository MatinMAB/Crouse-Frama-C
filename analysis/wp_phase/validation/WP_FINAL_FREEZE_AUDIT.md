# WP Final Freeze Audit

```text
WP phase status: FROZEN / PASS

Base branch: analysis/eva-klee-final-shift-resolution
Base commit: 9307d7b68ea4c9b1496cfd0160e337f739827edd
Base relation: analysis/eva-klee-final-shift-resolution~1
WP branch: analysis/wp-verification
WP HEAD audited before this freeze-only commit: 371c10384ebc5e6042a2e7afcca56d09d85df154

KLEE witness set: 48 unique IDs
Semantic-decision set: 48 unique IDs
WP target set: 48 unique IDs
Set equality: PASS (exact ID equality, not count-only)

Code Repair: 35
Specification Completion: 13
  repository-inferred: 5
  thesis-policy-selected: 8

VALID: 48
Qed-only: 35
External prover: 13
  Alt-Ergo: 12
  Z3: 1
  CVC5 successful: 0

Machine model: ppc_32
WP model: Typed+int
-wp-rte: NOT USED

Historical total wall time: 183.910237408 s
Timing interpretation: runner/Frama-C-WP invocation wall-clock time; not solver time

Property identity validation: PASS (48/48)
JSON result validation: PASS (48/48 selected goals passed)
SHA256 validation: PASS
```

## Primary evidence and audit method

The audit used `analysis/klee_phase_c/results/summary.tsv`, `analysis/repair_phase/48_CONFIRMED_REPAIR_TARGETS.tsv`, `WP_TARGET_INPUTS.tsv`, all 48 selected `wp-report.json` files, their `command.txt`, `elapsed_time.txt`, logs and version records, plus the normalized datasets. The exact KLEE-witness, semantic-decision and WP-target ID sets are equal.

All 48 retained commands contain target-specific `-wp-fct` and `-wp-prop`, use `-machdep ppc_32`, `-wp-model Typed+int`, `-wp-timeout 120`, `-wp-memlimit 2000`, `-wp-par 1`, and omit `-wp-rte`. Every retained environment record reports Frama-C 33.0 (Arsenic), Why3 1.8.2, Alt-Ergo 2.6.2, Z3 4.8.12 and CVC5 1.1.2.

Qed is WP's internal simplifier, not an external SMT prover. The authoritative successful-prover attribution comes from each selected `wp-report.json`: 35 Qed-only goals, 12 Alt-Ergo goals and one Z3 goal. No selected JSON records CVC5 as a successful prover.

## Timing interpretation

`elapsed_time.txt` measures from immediately before launching the Frama-C command until that process/pipeline completes. It includes Frama-C startup, WP processing, any recorded external-prover execution and output piping through `tee`. Its 48-value sum is 183.910237408 seconds. It is not pure solver time. Individual Qed/external attempt times are retained separately when present in `wp-report.json`.

The current two-target reproducibility rerun is separate: `KLEE-ALARM-0001` remained VALID/Qed in 0.888381851 s and `KLEE-ALARM-0003` remained VALID/Alt-Ergo in 1.568453587 s, totaling 2.456835438 s.

## Source-line reconciliation

Thirteen manifest line numbers drifted after shared source insertions. For each, the `KLEE-ALARM`/ACSL label remains unique and stable, and `verified_assertion_line` equals the actual current repaired-source location. Historical line numbers remain provenance only and must not be cited as current locations.

## Known evidence limitations

- The 48-target subset contains 29 integer-overflow and 19 invalid-shift targets; it contains no division-by-zero target. No division-by-zero WP case study is supported.
- For `KLEE-ALARM-0017`, the legacy aggregate matrix records Alt-Ergo=`TIMEOUT`, Z3=`VALID`, and CVC5=`VALID`, while the retained selected JSON/log records only Qed unsuccessful and Z3 successful. The selected JSON/log is authoritative for successful-prover attribution; therefore this audit counts Z3 once and CVC5 zero times. The extra legacy attempt statuses are not independently recoverable from the retained run.
- Historical preparation and intermediate-campaign documents preserve earlier 32/16 and 35/48 states. They are explicitly marked or catalogued as historical in `README.md` and are not final aggregate sources.
- No standalone proof certificate independent of the recorded Frama-C/Why3/prover toolchain is retained.
- Eight specification completions are thesis-policy-selected. Their proofs establish validity under that explicit policy, not developer confirmation or unspecified legacy intent.

## Final claim boundary

The frozen result establishes that WP proved the same 48 selected Eva/KLEE-derived ACSL properties for the recorded repaired implementation or documented specification context, source revision, `ppc_32` machine model, `Typed+int` WP model and assumptions. It does **not** prove whole-function correctness, whole-program correctness, absence of all runtime errors, behavior outside the stated contracts, or correctness for another machine/WP model.
