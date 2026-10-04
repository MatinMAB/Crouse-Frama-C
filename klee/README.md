# Standalone KLEE witness targets

This branch packages the 149 non-`missing_return` alarms remaining in the frozen High Precision Eva logs as one occurrence-specific KLEE target per alarm. Stable IDs, source locations, Eva messages, source expressions, required sources, and safety predicates are recorded in `manifest.tsv`. Original project sources are never modified; each harness embeds the previously validated fixed-width target adapter and checks its property before the selected potentially undefined operation.

## Prerequisites

KLEE 3.2 with LLVM/Clang 13 is the recommended toolchain. The following commands must be available: `clang`, `llvm-link`, `llvm-dis`, `klee`, and `ktest-tool`; `klee/klee.h` must also be visible. The Snap command name `klee.ktest-tool` is detected as a fallback. Override discovery when needed with `CLANG`, `LLVM_LINK`, `LLVM_DIS`, `KLEE`, `KTEST_TOOL`, or `KLEE_INCLUDE` (the include prefix containing `klee/klee.h`). No personal absolute tool paths are embedded.

Check the environment before a campaign:

```bash
./klee/scripts/check_environment.sh
```

The check rejects mismatched Clang/LLVM major versions and also rejects a KLEE-reported LLVM major mismatch. If KLEE does not expose its LLVM version, the script reports that limitation rather than guessing.

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

Plain integer budgets are seconds; KLEE duration forms such as `5m` are also accepted. Precedence is CLI `--max-time`, then `KLEE_MAX_TIME`, then the 60-second default. The budget is applied independently to every target. The default KLEE search strategy is retained; no POSIX runtime or uClibc model is enabled because these scalar targets do not require them.

An existing `klee/results/KLEE-ALARM-NNNN` directory is never overwritten. With `--resume`, targets carrying a valid terminal status (`WITNESS_FOUND`, `COMPLETED_NO_WITNESS`, `TIMEOUT`, or `UNSUPPORTED`) are skipped. Failed or incomplete directories are reported but are still not overwritten. To rerun one target, deliberately remove only that target's generated result directory first.

## Results and statuses

Generated data is ignored by Git and is placed under:

```text
klee/results/KLEE-ALARM-NNNN/
├── build/
├── klee-out/
├── run.log
├── status.txt
└── testcase.txt        # only when a target witness is found and extraction succeeds
```

`run_all.sh` also generates `klee/results/environment.txt` and `klee/results/summary.tsv`. Status values are:

- `WITNESS_FOUND`: KLEE emitted an error/test for this target's uniquely named assertion.
- `COMPLETED_NO_WITNESS`: KLEE completed without a target assertion testcase.
- `TIMEOUT`: the per-target time budget was reached without a target witness.
- `BUILD_FAILED`: LLVM bitcode preparation failed.
- `KLEE_FAILED`: KLEE exited unsuccessfully for a reason other than the detected time limit.
- `UNSUPPORTED`: reserved for an explicitly unsupported target model.

`testcase.txt` contains actual `ktest-tool` output for target-associated `.ktest` files. Absence of a testcase, including `COMPLETED_NO_WITNESS` or `TIMEOUT`, is **not** proof that the property is safe.
