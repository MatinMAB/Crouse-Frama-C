# KLEE-ALARM-0004 target-only WP launcher

- KLEE alarm: `KLEE-ALARM-0004`
- KLEE entry function: `root_s32_mul_s32_s8_fac_less1`
- WP assertion owner function: `root_s32_mul_s32_s8_fac_less1`
- Repaired source: `src_repaired/sources/mul_Ccode.c`
- Original occurrence: `src_analysis/sources/mul_Ccode.c:5223`
- Current assertion: `src_repaired/sources/mul_Ccode.c:5357`
- Original Eva alarm: `integer overflow` on `-value`
- Raw Eva safety property: `value != INT32_MIN`
- Inserted ACSL property: `value != (-2147483647 - 1)`
- ACSL label: `eva_klee_alarm_0004`
- KLEE counterexample inputs: `value=-2147483648 (0x80000000); factor=0 (0x00); count=0 (0x00000000)`
- Repair status: `REPAIRED_SHARED`
- Repair commit: `7aa2299eac6e789a51e1288ecc4959f558bd728b`
- Script status: `WP_READY`

This launcher asks WP about only `eva_klee_alarm_0004`. It does not enable RTE generation
or select other assertions. The property text and source placement come unchanged from the repair-phase
manifest.
## Terminal

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0004/run_terminal.sh
```

Each run creates a fresh directory under `analysis/wp_phase/results/KLEE-ALARM-0004/` containing the
exact command, Git/tool metadata, combined output, elapsed time, exit code, and `wp-report.json`.
The persistent proof session is `analysis/wp_phase/sessions/KLEE-ALARM-0004/`.

## GUI

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0004/run_gui.sh
```

The GUI uses the same source inputs, function selection, property label, machine/WP models,
provers, and persistent target session. The current host still needs Node.js 24+ and Yarn for
the installed GUI launcher; the script reports that prerequisite failure without changing it.

A tool exit code of zero is not a proof classification. Inspect the selected target's WP result
in `wp-report.json` or the GUI before updating `WP_RESULTS.tsv`.
