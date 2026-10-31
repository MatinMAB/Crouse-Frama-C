# Target-only Frama-C/WP Verification Methodology

> **Historical preparation snapshot:** the 32/16 eligibility split below describes the state before the final semantic-resolution campaign. The final frozen phase has 48 eligible and VALID targets. See `README.md` and `validation/WP_FINAL_FREEZE_AUDIT.md` for authoritative final counts. The target-only configuration described here remains historically accurate.

## Scientific scope

This experiment asks whether WP can prove only the named ACSL assertion derived from each
confirmed Eva/KLEE alarm. It does not generate or attempt unrelated runtime-error obligations.
Every launcher selects exactly one label with `-wp-prop eva_klee_alarm_XXXX` and restricts the
assertion-owning function with `-wp-fct`.

`-wp-rte` is intentionally **not used**. RTE generation is disabled by omission: the launchers never
pass that option and do not invoke an RTE phase. No new ACSL assertion is generated. The 149 frozen
assertions and their locations are not edited by this preparation phase.

## Models and preprocessing

- Machine model: `-machdep ppc_32`.
- WP model: `-wp-model Typed+int`.
- Include configuration: `-cpp-extra-args=-Isrc_repaired/headers`.
- Macro arguments: none.

`Typed+int` uses WP's typed memory model and machine-integer arithmetic. It retains the relevant
fixed-width integer side conditions under `ppc_32`; neither natural-number arithmetic nor the
potentially unsound weak-integer option is used. This common model is used for all 48 launchers.

The translation-unit inputs reproduce the existing project analysis setup. Multiplication targets
include both `mul_Ccode.c` and `MulHword.c`; other targets use their repaired owning source. For six
helper assertions, the KLEE entry-context function is preserved in metadata while WP selects the
physical owner `MulHighWord`.

## Provers and reproducibility

Qed remains WP's internal simplifier. External goals are submitted to the detected aliases
`alt-ergo,z3,cvc5` with `-wp-run-all-provers`, so one external success does not suppress the other
solver results. Official terminal runs use `-wp-par 1`, a default timeout of 120 seconds,
a default prover memory limit of 2000 MiB, and `-wp-cache rebuild`. Timeout and memory
may be overridden with `WP_TIMEOUT` and `WP_MEMLIMIT` without changing the selected property.

Each alarm has its own persistent session. Each terminal execution creates a new UTC timestamped
evidence directory and archives the exact command, repository/tool state, combined output, elapsed
time, process exit code, prover versions, and WP JSON report. A zero process exit code is not treated
as a Valid proof.

The CLI and GUI launchers use the same repaired inputs, machine/WP models, function, property,
provers, limits, and target session. GUI inspection does not broaden the property selection.

## Eligibility boundary

Scripts exist for all 48 confirmed alarms. The 32 repaired targets are `WP_READY`; the 16 unresolved
targets are `REPAIR_POLICY_REQUIRED` and their launchers refuse execution. The 101 runtime-only Eva
targets are absent from this phase and receive no WP task.
