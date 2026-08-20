# KLEE-ALARM-0066 target-only WP launcher

- KLEE alarm: `KLEE-ALARM-0066`
- KLEE entry function: `s16_hip1_s16_u8_u8_u16_fac1`
- WP assertion owner function: `s16_hip1_s16_u8_u8_u16_fac1`
- Repaired source: `src_repaired/sources/hip_Ccode.c`
- Original occurrence: `src_analysis/sources/hip_Ccode.c:53`
- Current assertion: `src_repaired/sources/hip_Ccode.c:69`
- Original Eva alarm: `invalid shift` on `s32Temp2 << 1`
- Raw Eva safety property: `s32Temp2 >= 0`
- Inserted ACSL property: `s32Temp2 >= 0`
- ACSL label: `eva_klee_alarm_0066`
- KLEE counterexample inputs: `yold=-137 (0xFF77); u=0 (0x00); uold=0 (0x00); m=32768 (0x8000)`
- Repair status: `REPAIR_POLICY_REQUIRED`
- Repair commit: `NOT_APPLICABLE`
- Script status: `REPAIR_POLICY_REQUIRED`

This launcher asks WP about only `eva_klee_alarm_0066`. It does not enable RTE generation
or select other assertions. The property text and source placement come unchanged from the repair-phase
manifest.
## Repair-policy gate

**REPAIR_POLICY_REQUIRED.** The current implementation has not received the final thesis repair for this target. Both launchers intentionally refuse to execute. No WP conclusion should be drawn until repair policy is resolved and this metadata is regenerated.

## Terminal

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0066/run_terminal.sh
```

Each run creates a fresh directory under `analysis/wp_phase/results/KLEE-ALARM-0066/` containing the
exact command, Git/tool metadata, combined output, elapsed time, exit code, and `wp-report.json`.
The persistent proof session is `analysis/wp_phase/sessions/KLEE-ALARM-0066/`.

## GUI

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0066/run_gui.sh
```

The GUI uses the same source inputs, function selection, property label, machine/WP models,
provers, and persistent target session. The current host still needs Node.js 24+ and Yarn for
the installed GUI launcher; the script reports that prerequisite failure without changing it.

A tool exit code of zero is not a proof classification. Inspect the selected target's WP result
in `wp-report.json` or the GUI before updating `WP_RESULTS.tsv`.
