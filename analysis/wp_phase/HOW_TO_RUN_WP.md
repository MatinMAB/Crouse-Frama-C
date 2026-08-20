# How to Run the Target-only WP Scripts

Run one eligible target from any directory:

```bash
cd /home/matin/frama-work/frama-eva-analysis
./analysis/wp_phase/targets/KLEE-ALARM-0001/run_terminal.sh
```

Or use the dispatcher:

```bash
./analysis/wp_phase/run_one.sh KLEE-ALARM-0001 terminal
```

Override resource limits only when needed:

```bash
WP_TIMEOUT=300 WP_MEMLIMIT=4000 ./analysis/wp_phase/run_one.sh KLEE-ALARM-0001 terminal
```

Each run creates a fresh UTC timestamped directory under
`analysis/wp_phase/results/KLEE-ALARM-XXXX/`. It contains `command.sh`, `command.txt`,
`metadata.txt`, `git_state.txt`, `frama_c_version.txt`, `prover_versions.txt`,
`stdout_stderr.log`, `exit_code.txt`, `elapsed_time.txt`, `wp-report.json`, and WP working files.
The reusable target session is under `analysis/wp_phase/sessions/KLEE-ALARM-XXXX/`.

Launch the same isolated target in the GUI with:

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0001/run_gui.sh
```

The installed GUI wrapper currently needs Node.js 24+ and Yarn, which are not present. The launch
script is ready but will not work until the user supplies that external prerequisite. No GUI was
started during preparation.

Interpret `Valid` as proof of this named ACSL assertion under the recorded source revision, model,
and hypotheses. `Unknown` means the configured provers did not decide the goal. `Timeout` means a
prover reached its configured limit. Exit code 0 means Frama-C completed; it does not mean the
property is Valid.

After a run, provide the entire timestamped result directory for later classification. Update
`WP_RESULTS.tsv` only from the selected property's WP JSON/output, never from exit code alone.
The batch launcher contains only WP-ready alarms and is intentionally not run during preparation.
