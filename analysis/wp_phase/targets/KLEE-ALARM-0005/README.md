# KLEE-ALARM-0005 target-only WP launcher

- KLEE alarm: `KLEE-ALARM-0005`
- KLEE entry function: `root_s32_mul_s32_s8_fac_less1`
- WP assertion owner function: `root_s32_mul_s32_s8_fac_less1`
- Repaired source: `src_repaired/sources/mul_Ccode.c`
- Original occurrence: `src_analysis/sources/mul_Ccode.c:5241`
- Current assertion: `src_repaired/sources/mul_Ccode.c:5388`
- Original Eva alarm: `invalid shift` on `u32Temp3 >> count`
- Raw Eva safety property: `0 <= count && count < 32`
- Inserted ACSL property: `0 <= count && count < 32`
- ACSL label: `eva_klee_alarm_0005`
- KLEE counterexample inputs: `value=-2130706432 (0x81000000); factor=1 (0x01); count=4294967295 (0xFFFFFFFF)`
- Repair status: `SPEC_RESOLVED`
- Repair commit: `830f84d2f53e7c49f66359a75abd9a7f30a0d188`
- Script status: `WP_READY`

This launcher asks WP about only `eva_klee_alarm_0005`. It does not enable RTE generation
or select other assertions. The original Eva predicate and label remain unchanged; the current
placement is occurrence-aware after the final helper contract.

## Final shift-campaign eligibility

**WP_READY.** The semantic policy and helper contract are frozen. This launcher belongs only to
the final 13-target shift campaign; it has not been executed in this preparation phase.

## Terminal

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0005/run_terminal.sh
```

Each run creates a fresh directory under `analysis/wp_phase/results/KLEE-ALARM-0005/` containing the
exact command, Git/tool metadata, combined output, elapsed time, exit code, and `wp-report.json`.
The persistent proof session is `analysis/wp_phase/sessions/KLEE-ALARM-0005/`.

## GUI

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0005/run_gui.sh
```

The GUI uses the same source inputs, function selection, property label, machine/WP models,
provers, and persistent target session. The current host still needs Node.js 24+ and Yarn for
the installed GUI launcher; the script reports that prerequisite failure without changing it.

A tool exit code of zero is not a proof classification. Inspect the selected target's WP result
in `wp-report.json` or the GUI before updating `WP_RESULTS.tsv`.
