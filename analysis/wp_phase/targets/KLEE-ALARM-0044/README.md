# KLEE-ALARM-0044 target-only WP launcher

- KLEE alarm: `KLEE-ALARM-0044`
- KLEE entry function: `s16_fac05_div_s16_s16`
- WP assertion owner function: `s16_fac05_div_s16_s16`
- Repaired source: `src_repaired/sources/div_Ccode.c`
- Original occurrence: `src_analysis/sources/div_Ccode.c:173`
- Current assertion: `src_repaired/sources/div_Ccode.c:175`
- Original Eva alarm: `invalid shift` on `(int)numerator << 16`
- Raw Eva safety property: `(int)numerator >= 0`
- Inserted ACSL property: `(int)numerator >= 0`
- ACSL label: `eva_klee_alarm_0044`
- KLEE counterexample inputs: `numerator=-32768 (0x8000); denominator=0 (0x0000)`
- Repair status: `REPAIRED_SHARED`
- Repair commit: `57864b43199db1c7046c201d40fb52dabafdb3a6`
- Script status: `WP_READY`

This launcher asks WP about only `eva_klee_alarm_0044`. It does not enable RTE generation
or select other assertions. The property text and source placement come unchanged from the repair-phase
manifest.
## Terminal

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0044/run_terminal.sh
```

Each run creates a fresh directory under `analysis/wp_phase/results/KLEE-ALARM-0044/` containing the
exact command, Git/tool metadata, combined output, elapsed time, exit code, and `wp-report.json`.
The persistent proof session is `analysis/wp_phase/sessions/KLEE-ALARM-0044/`.

## GUI

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0044/run_gui.sh
```

The GUI uses the same source inputs, function selection, property label, machine/WP models,
provers, and persistent target session. The current host still needs Node.js 24+ and Yarn for
the installed GUI launcher; the script reports that prerequisite failure without changing it.

A tool exit code of zero is not a proof classification. Inspect the selected target's WP result
in `wp-report.json` or the GUI before updating `WP_RESULTS.tsv`.
