# KLEE / LLVM Compatibility Matrix

## Status vocabulary

- `COMPATIBLE`: exercised successfully for the relevant Phase-A operation.
- `INCOMPATIBLE`: exercised and rejected or failed in a specific way.
- `AVAILABLE_UNVERIFIED`: present, but not fully usable or not exercised for the
  required purpose.
- `NOT_INSTALLED`: absent from the discovered environment.
- `NOT_APPLICABLE`: not needed for this scalar Phase-A probe.
- `BLOCKED`: a required capability exists conceptually but an environmental
  prerequisite prevents its use.

## Matrix

| Component | Path | Installed? | Version | LLVM compatibility | 32-bit capability | Required next? | Evidence | Status |
|---|---|---:|---|---|---|---:|---|---|
| KLEE | `/snap/bin/klee` | yes | 3.2, LLVM 13.0.1 | Accepts LLVM 13 x86-64 | Installed runtime set is 64-bit only | yes | version and microtest logs | `COMPATIBLE` for x86-64 |
| Clang 13 | `/home/matin/opt/clang13/bin/clang` | yes | 13.0.0 | Matches KLEE major LLVM | Emits i386, PowerPC, x86-64 bitcode | yes | compile logs and IR | `COMPATIBLE` |
| Clang 18 | `/usr/bin/clang-18` | yes | 18.1.3 | Bitcode rejected by LLVM/KLEE 13 | emits i386 bitcode, native link blocked | no | compatibility probe | `INCOMPATIBLE` as KLEE producer |
| llvm-config 13 | custom LLVM 13 bin | yes | 13.0.0 | Same family as KLEE | reports X86/PowerPC targets | yes | raw LLVM inventory | `COMPATIBLE` |
| llvm-link 13 | custom LLVM 13 bin | yes | 13.0.0 | Same family as KLEE | target-neutral bitcode linker | yes | version inventory | `COMPATIBLE` |
| llvm-dis 13 | custom LLVM 13 bin | yes | 13.0.0 | Disassembled all LLVM 13 probes | reads i386 and PowerPC IR | yes | generated `.ll` | `COMPATIBLE` |
| llvm-as 13 | custom LLVM 13 bin | yes | 13.0.0 | Same family as KLEE | target-neutral assembler | likely | version inventory | `AVAILABLE_UNVERIFIED` |
| opt 13 | custom LLVM 13 bin | yes | 13.0.0 | Same family as KLEE | target-neutral optimizer | controlled use only | version inventory | `AVAILABLE_UNVERIFIED` |
| ktest-tool | `/snap/bin/klee.ktest-tool` | yes | Snap 3.2 tool | decoded generated KTests | KTest bytes are architecture-neutral; interpretation is not | yes | KTest summaries | `COMPATIBLE` |
| STP | embedded, no shell command | yes | 2.3.4 metadata | KLEE backend tested | bitvector widths supported | yes | STP run logs | `COMPATIBLE` |
| Z3 | `/usr/bin/z3`; KLEE backend | yes | 4.8.12 | KLEE backend tested | bitvector widths supported | optional cross-check | Z3 run log | `COMPATIBLE` |
| KLEE libc | runtime BCA | yes | KLEE 3.2 build | x86-64 test passed | no 32-bit archive found | optional | runtime probe | `COMPATIBLE` for 64-bit |
| KLEE uClibc | `klee-uclibc.bca` | yes | v1.4 metadata | x86-64 test passed with warnings | no separate 32-bit evidence | not needed for closed scalar POCs | runtime probe | `COMPATIBLE` for tested case |
| POSIX runtime | `libkleeRuntimePOSIX64_*` | yes | KLEE 3.2 build | x86-64 test passed with warnings | only 64-bit archives | no for closed POCs | runtime probe | `COMPATIBLE` for tested case |
| UBSan runtime | `libkleeUBSan64_*` | yes | KLEE 3.2 build | signed-overflow probe passed | only 64-bit archive | yes or explicit predicates | UBSan probe | `COMPATIBLE` for 64-bit |
| 32-bit bitcode compiler | Clang 13 `-target i386` | yes | LLVM 13 | IR generation and disassembly pass | pointer/long width 32 | relevant | target probe | `COMPATIBLE` to generate IR |
| 32-bit KLEE runtime | expected runtime path | no | n/a | KLEE requested it | missing | required for direct i386 execution | exact KLEE error | `BLOCKED` |
| 32-bit native linker | host linker/multilib | partial | n/a | n/a | CRT/libc development files missing | useful for replay | link errors | `BLOCKED` |
| PowerPC bitcode compiler | Clang 13 target backend | yes | LLVM 13 | emits big-endian ILP32 IR | widths match ppc_32 | research-relevant | target probe | `COMPATIBLE` to generate IR |
| PowerPC KLEE execution | installed KLEE | attempted | KLEE 3.2 | target selection failed, then assertion | unusable | direct fidelity path | exact failure log | `INCOMPATIBLE` |
| PowerPC native linker | host binutils | no compatible emulation | n/a | object generation only | ELF32 MSB object created | optional replay | linker error | `BLOCKED` |
| Docker client | `/usr/bin/docker` | yes | 29.1.3 | suitable in principle | depends on future image | recommended | Docker output | `AVAILABLE_UNVERIFIED` |
| Docker daemon | local socket | inaccessible | not obtained | not assessed | not assessed | recommended | permission error | `BLOCKED` |

## LLVM 13 versus LLVM 18 experiment

**DIRECT ENVIRONMENT EVIDENCE**

1. Clang 18 successfully emitted `basic_replay_llvm18.bc`.
2. LLVM 18 `llvm-dis` successfully read it.
3. LLVM 13 `llvm-dis` rejected it with:

   ```text
   Not an int attribute (Producer: 'LLVM18.1.3' Reader: 'LLVM 13.0.0')
   ```

4. KLEE rejected it analogously, reporting its LLVM 13.0.1 reader.

**TECHNICAL INTERPRETATION**

The major LLVM version must be pinned. System `clang` currently resolves to the
custom Clang 13 and is compatible, but relying on ambient PATH is fragile because
Clang 18 is also installed. Every later compile command should use an explicit
compiler path or a container image with pinned versions.

## KLEE 3.2 / LLVM 13 alignment

The local binary is direct evidence that this KLEE 3.2 package was built against
LLVM 13.0.1. Official KLEE build documentation also identifies LLVM 13 as the
recommended family for recent KLEE releases. The local experiment, rather than
the generic recommendation, is the controlling evidence for this repository.

Official references consulted:

- <https://klee-se.org/releases/>
- <https://klee-se.org/releases/docs/v3.0/build-llvm13/>
- <https://llvm.org/docs/LangRef.html>
