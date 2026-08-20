# KLEE-ALARM-0020 target-only WP launcher

- KLEE alarm: `KLEE-ALARM-0020`
- KLEE entry function: `root_u32_mul_u32_s8_fac_less1`
- WP assertion owner function: `root_u32_mul_u32_s8_fac_less1`
- Repaired source: `src_repaired/sources/mul_Ccode.c`
- Original occurrence: `src_analysis/sources/mul_Ccode.c:5451`
- Current assertion: `src_repaired/sources/mul_Ccode.c:5614`
- Original Eva alarm: `invalid shift` on `u32Temp2 >> count`
- Raw Eva safety property: `0 <= count && count < 32`
- Inserted ACSL property: `0 <= count && count < 32`
- ACSL label: `eva_klee_alarm_0020`
- KLEE counterexample inputs: `value=0 (0x00000000); factor=0 (0x00); count=4294967295 (0xFFFFFFFF)`
- Repair status: `REPAIR_POLICY_REQUIRED`
- Repair commit: `NOT_APPLICABLE`
- Script status: `REPAIR_POLICY_REQUIRED`

This launcher asks WP about only `eva_klee_alarm_0020`. It does not enable RTE generation
or select other assertions. The property text and source placement come unchanged from the repair-phase
manifest.
## Repair-policy gate

**REPAIR_POLICY_REQUIRED.** The current implementation has not received the final thesis repair for this target. Both launchers intentionally refuse to execute. No WP conclusion should be drawn until repair policy is resolved and this metadata is regenerated.

## Terminal

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0020/run_terminal.sh
```

Each run creates a fresh directory under `analysis/wp_phase/results/KLEE-ALARM-0020/` containing the
exact command, Git/tool metadata, combined output, elapsed time, exit code, and `wp-report.json`.
The persistent proof session is `analysis/wp_phase/sessions/KLEE-ALARM-0020/`.

## GUI

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0020/run_gui.sh
```

The GUI uses the same source inputs, function selection, property label, machine/WP models,
provers, and persistent target session. The current host still needs Node.js 24+ and Yarn for
the installed GUI launcher; the script reports that prerequisite failure without changing it.

A tool exit code of zero is not a proof classification. Inspect the selected target's WP result
in `wp-report.json` or the GUI before updating `WP_RESULTS.tsv`.
