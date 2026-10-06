# Standalone KLEE witness targets

This branch packages the 149 non-`missing_return` alarms remaining in the frozen High Precision Eva logs as one occurrence-specific KLEE target per alarm. Stable IDs, source locations, Eva messages, source expressions, required sources, and safety predicates are recorded in `manifest.tsv`. Original project sources are never modified; each harness embeds the previously validated fixed-width target adapter and checks its property before the selected potentially undefined operation.

## Prerequisites

KLEE 3.2 with LLVM/Clang 13 is the recommended toolchain. The following commands must be available: `clang`, `llvm-link`, `llvm-dis`, `klee`, `ktest-tool`, and GNU `timeout`; `klee/klee.h` must also be visible. The Snap command name `klee.ktest-tool` is detected as a fallback. Override discovery when needed with `CLANG`, `LLVM_LINK`, `LLVM_DIS`, `KLEE`, `KTEST_TOOL`, `GNU_TIMEOUT`, or `KLEE_INCLUDE` (the include prefix containing `klee/klee.h`). No personal absolute tool paths are embedded.

Check the environment before a campaign:

```bash
./klee/scripts/check_environment.sh
```

The check rejects mismatched Clang/LLVM major versions and also rejects a KLEE-reported LLVM major mismatch. If KLEE does not expose its LLVM version, the script reports that limitation rather than guessing.

Run the disposable shell-level watchdog checks without executing campaign targets:

```bash
./klee/tests/test_hard_timeout.sh
```

## Run targets

Run all targets sequentially with 60 seconds per alarm:

```bash
./klee/run_all.sh --max-time 60
```

Resume without overwriting existing per-target results:

```bash
./klee/run_all.sh --max-time 60 --resume
```

Run one alarm:

```bash
./klee/scripts/run_one.sh KLEE-ALARM-0023 --max-time 60
```

Plain integer budgets are seconds; `60s`, `5m`, `5min`, and `1h` are also accepted and normalized once to seconds. Precedence is CLI `--max-time`, then `KLEE_MAX_TIME`, then the 60-second default. Durations must be positive. The budget is applied independently to every target. KLEE receives the same internal `--max-time` value together with its process-based `--watchdog`, which can terminate an executor blocked inside a solver query. GNU `timeout` provides a second, external process-group deadline at the requested budget plus `KLEE_TIMEOUT_GRACE` (default: `5s`); it sends `SIGTERM`, then `SIGKILL` one second later. After an external timeout, the wrapper rechecks the process group for at most five seconds and repeats KILL if necessary. This layering is important for Snap-confined KLEE installations, where only the KLEE watchdog is guaranteed to share the executor's signal confinement. The default KLEE search strategy and solver behavior are retained; no solver-query timeout, POSIX runtime, or uClibc model is enabled.

An existing `klee/results/KLEE-ALARM-NNNN` directory is never overwritten. With `--resume`, targets carrying a valid terminal status (`WITNESS_FOUND`, `COMPLETED_NO_WITNESS`, `TIMEOUT`, or `UNSUPPORTED`) are skipped. Failed or incomplete directories are reported but are still not overwritten. To rerun one target, deliberately remove only that target's generated result directory first.

## Results and statuses

Generated data is ignored by Git and is placed under:

```text
klee/results/KLEE-ALARM-NNNN/
├── build/
├── klee-out/
├── run.log
├── status.txt
├── build_seconds.txt   # bitcode build/link/disassembly wall time
├── klee_seconds.txt    # KLEE invocation wall time, including watchdog cleanup
├── elapsed_seconds.txt # total target wall time (backward-compatible field)
└── testcase.txt        # only when a target witness is found and extraction succeeds
```

`run_all.sh` also generates `klee/results/environment.txt` and `klee/results/summary.tsv`. Status values are:

- `WITNESS_FOUND`: KLEE emitted an error/test for this target's uniquely named assertion.
- `COMPLETED_NO_WITNESS`: KLEE completed without a target assertion testcase.
- `TIMEOUT`: the per-target time budget was reached without a target witness.
- `BUILD_FAILED`: LLVM bitcode preparation failed.
- `KLEE_FAILED`: KLEE exited unsuccessfully for a reason other than the detected time limit.
- `UNSUPPORTED`: reserved for an explicitly unsupported target model.

`elapsed_seconds.txt` preserves its original meaning: total time from immediately before the build through status classification. `build_seconds.txt` and `klee_seconds.txt` separate preparation from KLEE execution. `testcase.txt` contains actual `ktest-tool` output for target-associated `.ktest` files. Absence of a testcase, including `COMPLETED_NO_WITNESS` or `TIMEOUT`, is **not** proof that the property is safe.
