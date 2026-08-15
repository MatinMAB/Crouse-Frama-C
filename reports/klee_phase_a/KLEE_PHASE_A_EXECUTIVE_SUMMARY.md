# KLEE Phase A — Executive Summary

## Verdict

```text
SUCCESS — READY_FOR_PHASE_B_WITH_TOOLCHAIN_SETUP
```

Phase B can construct a stable, occurrence-preserving mapping for the frozen 149
Eva alarms immediately. Phase C must not compile project functions until the
KLEE environment and semantic adapter are pinned and accepted.

## Direct findings

- KLEE 3.2 is installed as Snap revision 20 and was built against LLVM 13.0.1.
- Compatible Clang/LLVM 13.0.0 tools exist under
  `/home/matin/opt/clang13/bin`.
- System Clang/LLVM 18.1.3 is also installed; its bitcode is rejected by KLEE's
  LLVM 13 reader.
- STP and Z3 KLEE backends both completed synthetic symbolic tests.
- KLEE libc, KLEE-uClibc, POSIX64, UBSan64, and 64-bit native replay support are
  installed and passed bounded synthetic probes.
- Clang 13 generated i386 ILP32 and PowerPC ILP32 big-endian LLVM IR.
- i386 KLEE execution failed because the Snap lacks the requested
  `libkleeRuntimeFreestanding32_Release+Debug.bca`.
- PowerPC KLEE execution warned that no compatible target was selectable and
  terminated on an assertion.
- 32-bit native linking is unavailable because multilib CRT/libc development
  inputs are missing.
- PowerPC cross-linking is unavailable because no compatible linker/sysroot is
  installed.
- Docker client 29.1.3 exists, but Docker daemon/image inspection is blocked by
  socket permission.

## `ppc_32` conclusion

Direct reproduction is not currently available. Eva models `short=16`,
`int=32`, `long=32`, pointer=32, big endian, and unsigned plain char. Host
x86-64 has `long=64`, pointer=64, little endian, and signed plain char. i386
matches the principal scalar widths but differs in byte order, ABI, and plain
char signedness—and cannot be executed by the installed KLEE runtime.

All 46 target signatures are scalar and the 149 remaining properties are
integer overflow (100), division by zero (16), or invalid shift (33). This makes
an explicit-width scalar semantic adapter promising, but not automatically
equivalent for every occurrence.

## UB characterization

| Family | Natural LLVM IR | Installed KLEE behavior | Phase-C implication |
|---|---|---|---|
| signed overflow | Clang emitted `add nsw i32` | no natural overflow report; one ordinary test | explicit UB-free predicate required; UBSan can cross-check |
| division by zero | `sdiv i32` | `divide by zero` error and testcase with divisor 0 | built-in check works; retain canonical explicit predicate |
| invalid shift | `shl i32` | `overshift error` and testcase with count `0xffffffff` | built-in check works; preserve source width/signedness |

Clang UBSan plus KLEE `--ubsan-runtime` produced an `INT_MAX` signed-overflow
testcase. An explicit predicate did likewise. A separate `-O0`/`-O2` probe
showed that optimization removed an overflow-dependent branch at `-O2`.

## Recommended architecture

Use a reproducible KLEE 3.2/LLVM 13 x86-64 environment (preferably a pinned
container) plus a separate, auditable explicit-width project adapter. Compile at
`-O0`, inspect LLVM IR, leave KLEE optimization disabled, model the same full
input domains, and insert occurrence-specific UB-free predicates before target
operations. Use STP primarily and Z3 selectively. Decode KTests using the Phase-B
type schema, then perform controlled semantic replay; use PowerPC cross/emulated
replay when target-sensitive behavior matters.

## Recommended first three POCs

1. Invalid shift: `root_s32_mul_s32_s16_fac_less1`,
   `mul_Ccode.c:5089`.
2. Integer overflow: `s32_mul_s32_s32`, `MulHword.c:47`.
3. Division by zero: `s16_div_s32_s16`, `div_Ccode.c:274`.

These are recommendations from the frozen dataset, not new classifications.

## Phase boundary

No project function was run with KLEE; no project harness was generated; no Eva
artifact was modified; no package, Docker image, or system configuration was
changed. The next authorized phase should create the deterministic 149-row
alarm-to-predicate mapping only.
