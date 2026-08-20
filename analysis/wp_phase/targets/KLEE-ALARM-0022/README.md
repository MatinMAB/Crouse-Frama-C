# KLEE-ALARM-0022 target-only WP launcher

- KLEE alarm: `KLEE-ALARM-0022`
- KLEE entry function: `rotateRight`
- WP assertion owner function: `rotateRight`
- Repaired source: `src_repaired/sources/rotatefunc.c`
- Original occurrence: `src_analysis/sources/rotatefunc.c:119`
- Current assertion: `src_repaired/sources/rotatefunc.c:121`
- Original Eva alarm: `integer overflow` on `1 << INT_BITS`
- Raw Eva safety property: `MATHEMATICAL_LEFT_SHIFT(1,INT_BITS) <= INT32_MAX`
- Inserted ACSL property: `INT_BITS <= 30`
- ACSL label: `eva_klee_alarm_0022`
- KLEE counterexample inputs: `num=0 (0x00000000); rotation=1 (0x00000001)`
- Repair status: `REPAIRED`
- Repair commit: `61a2ce39e49409f7139327fe5f10450eb4ccd88d`
- Script status: `WP_READY`

This launcher asks WP about only `eva_klee_alarm_0022`. It does not enable RTE generation
or select other assertions. The property text and source placement come unchanged from the repair-phase
manifest.
## Terminal

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0022/run_terminal.sh
```

Each run creates a fresh directory under `analysis/wp_phase/results/KLEE-ALARM-0022/` containing the
exact command, Git/tool metadata, combined output, elapsed time, exit code, and `wp-report.json`.
The persistent proof session is `analysis/wp_phase/sessions/KLEE-ALARM-0022/`.

## GUI

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0022/run_gui.sh
```

The GUI uses the same source inputs, function selection, property label, machine/WP models,
provers, and persistent target session. The current host still needs Node.js 24+ and Yarn for
the installed GUI launcher; the script reports that prerequisite failure without changing it.

A tool exit code of zero is not a proof classification. Inspect the selected target's WP result
in `wp-report.json` or the GUI before updating `WP_RESULTS.tsv`.
