# KLEE-ALARM-0061 target-only WP launcher

- KLEE alarm: `KLEE-ALARM-0061`
- KLEE entry function: `s16_hip1_s16_s8_s8_u16_fac1`
- WP assertion owner function: `s16_hip1_s16_s8_s8_u16_fac1`
- Repaired source: `src_repaired/sources/hip_Ccode.c`
- Original occurrence: `src_analysis/sources/hip_Ccode.c:167`
- Current assertion: `src_repaired/sources/hip_Ccode.c:214`
- Original Eva alarm: `invalid shift` on `s32Temp2 << 1`
- Raw Eva safety property: `s32Temp2 >= 0`
- Inserted ACSL property: `s32Temp2 >= 0`
- ACSL label: `eva_klee_alarm_0061`
- KLEE counterexample inputs: `yold=-137 (0xFF77); u=0 (0x00); uold=0 (0x00); m=32768 (0x8000)`
- Repair status: `REPAIRED_SHARED`
- Repair commit: `f5daa364e14957ae7410fd2d347917ab6555f046`
- Script status: `WP_READY`

This launcher asks WP about only `eva_klee_alarm_0061`. It does not enable RTE generation
or select other assertions. The property text and label remain unchanged; the current placement is
recorded occurrence-aware after repair. This target is eligible only for the
separate second WP campaign; no WP result exists yet.

## Terminal

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0061/run_terminal.sh
```

Each run creates a fresh directory under `analysis/wp_phase/results/KLEE-ALARM-0061/` containing the
exact command, Git/tool metadata, combined output, elapsed time, exit code, and `wp-report.json`.
The persistent proof session is `analysis/wp_phase/sessions/KLEE-ALARM-0061/`.

## GUI

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0061/run_gui.sh
```

The GUI uses the same source inputs, function selection, property label, machine/WP models,
provers, and persistent target session. The current host still needs Node.js 24+ and Yarn for
the installed GUI launcher; the script reports that prerequisite failure without changing it.

A tool exit code of zero is not a proof classification. Inspect the selected target's WP result
in `wp-report.json` or the GUI before updating `WP_RESULTS.tsv`.
