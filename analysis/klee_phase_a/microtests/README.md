# Synthetic Phase-A Microtests

These programs characterize the installed KLEE/LLVM toolchain. They do not
include, compile, call, or transform any project function.

## Sources

| Source | Purpose |
|---|---|
| `target_probe.c` | target triple/data layout/type/alignment probe |
| `basic_symbolic.c` | symbolic branch and KLEE error/KTest generation |
| `basic_replay.c` | KTest decoding and native replay without KLEE-only error calls |
| `division_by_zero_natural.c` | natural `sdiv` zero-divisor behavior |
| `invalid_shift_natural.c` | natural LLVM overshift behavior |
| `signed_overflow_natural.c` | natural `add nsw` behavior |
| `signed_overflow_explicit.c` | UB-free explicit precondition target |
| `signed_overflow_ubsan.c` | Clang UBSan plus KLEE UBSan runtime |
| `optimization_ub_probe.c` | comparison of retained target at `-O0` and removal at `-O2` |
| `runtime_probe.c` | KLEE libc, uClibc, and POSIX runtime linking |

## Reproduction scripts

```text
run_microtests.sh
run_native_replay_probe.sh
run_ubsan_and_solver_probe.sh
run_compatibility_probe.sh
run_runtime_probe.sh
```

Each script refuses to overwrite its existing generated directory. Reproduction
therefore requires a fresh copy/worktree or an explicitly reviewed cleanup step;
the committed evidence is preserved by default.

The scripts use absolute paths for the discovered local Clang/LLVM 13 tools and
the Snap KLEE entrypoint. They are environment-characterization artifacts, not
portable final experiment runners. A future pinned container should replace
these environment-specific paths with image-controlled paths.

## Generated evidence policy

`generated/` is intentionally tracked because it is bounded (approximately six
MiB) and contains the actual Phase-A evidence:

- exact command lines and exit statuses;
- stdout and stderr;
- LLVM bitcode and disassembled IR;
- KLEE assembly output, statistics, warnings, and errors;
- KTest files and decoded input summaries;
- native replay executable and replay results;
- expected failure diagnostics for LLVM 18, i386, and PowerPC probes.

No generated file is a project analysis result.

## Safety boundary

Do not interpret an error KTest as a project witness. These are deliberately
constructed synthetic examples. No project/Eva path was modified or used.
