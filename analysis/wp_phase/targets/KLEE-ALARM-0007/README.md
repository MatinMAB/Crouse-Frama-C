# KLEE-ALARM-0007 target-only WP launcher

- KLEE alarm: `KLEE-ALARM-0007`
- KLEE entry function: `root_s32_mul_s32_u16_fac_less1`
- WP assertion owner function: `MulHighWord`
- Repaired source: `src_repaired/sources/MulHword.c`
- Original occurrence: `src_analysis/sources/MulHword.c:47`
- Current assertion: `src_repaired/sources/MulHword.c:49`
- Original Eva alarm: `integer overflow` on `(int)arg1_LW * (int)arg2_LW`
- Raw Eva safety property: `MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX`
- Inserted ACSL property: `((int)arg1_LW) * ((int)arg2_LW) <= 2147483647`
- ACSL label: `eva_klee_alarm_0007`
- KLEE counterexample inputs: `value=-2147474737 (0x800022CF); factor=60816 (0xED90); count=0 (0x00000000)`
- Repair status: `REPAIRED_SHARED`
- Repair commit: `afea04153ccb966d0911b7404d7bc88eb7361b81`
- Script status: `WP_READY`

This launcher asks WP about only `eva_klee_alarm_0007`. It does not enable RTE generation
or select other assertions. The property text and source placement come unchanged from the repair-phase
manifest.
The KLEE entry context is `root_s32_mul_s32_u16_fac_less1`, while the assertion is physically inside helper `MulHighWord`. WP therefore selects `MulHighWord` with `-wp-fct` and includes both the caller translation unit and `MulHword.c`.

## Terminal

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0007/run_terminal.sh
```

Each run creates a fresh directory under `analysis/wp_phase/results/KLEE-ALARM-0007/` containing the
exact command, Git/tool metadata, combined output, elapsed time, exit code, and `wp-report.json`.
The persistent proof session is `analysis/wp_phase/sessions/KLEE-ALARM-0007/`.

## GUI

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0007/run_gui.sh
```

The GUI uses the same source inputs, function selection, property label, machine/WP models,
provers, and persistent target session. The current host still needs Node.js 24+ and Yarn for
the installed GUI launcher; the script reports that prerequisite failure without changing it.

A tool exit code of zero is not a proof classification. Inspect the selected target's WP result
in `wp-report.json` or the GUI before updating `WP_RESULTS.tsv`.
