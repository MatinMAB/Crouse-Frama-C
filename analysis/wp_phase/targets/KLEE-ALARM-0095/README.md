# KLEE-ALARM-0095 target-only WP launcher

- KLEE alarm: `KLEE-ALARM-0095`
- KLEE entry function: `s32_div_s32_s32`
- WP assertion owner function: `s32_div_s32_s32`
- Repaired source: `src_repaired/sources/div_Ccode.c`
- Original occurrence: `src_analysis/sources/div_Ccode.c:1394`
- Current assertion: `src_repaired/sources/div_Ccode.c:1704`
- Original Eva alarm: `integer overflow` on `-numerator`
- Raw Eva safety property: `numerator != INT32_MIN`
- Inserted ACSL property: `numerator != (-2147483647 - 1)`
- ACSL label: `eva_klee_alarm_0095`
- KLEE counterexample inputs: `numerator=-2147483648 (0x80000000); denominator=-2147483648 (0x80000000)`
- Repair status: `REPAIRED_SHARED`
- Repair commit: `7aa2299eac6e789a51e1288ecc4959f558bd728b`
- Script status: `WP_READY`

This launcher asks WP about only `eva_klee_alarm_0095`. It does not enable RTE generation
or select other assertions. The property text and source placement come unchanged from the repair-phase
manifest.
## Terminal

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0095/run_terminal.sh
```

Each run creates a fresh directory under `analysis/wp_phase/results/KLEE-ALARM-0095/` containing the
exact command, Git/tool metadata, combined output, elapsed time, exit code, and `wp-report.json`.
The persistent proof session is `analysis/wp_phase/sessions/KLEE-ALARM-0095/`.

## GUI

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0095/run_gui.sh
```

The GUI uses the same source inputs, function selection, property label, machine/WP models,
provers, and persistent target session. The current host still needs Node.js 24+ and Yarn for
the installed GUI launcher; the script reports that prerequisite failure without changing it.

A tool exit code of zero is not a proof classification. Inspect the selected target's WP result
in `wp-report.json` or the GUI before updating `WP_RESULTS.tsv`.
