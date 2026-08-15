# 32-bit Target Feasibility

## Question

Can the current system generate, execute symbolically, and replay a 32-bit model
whose scalar C widths match Eva `ppc_32`?

## Capability table

| Step | i386 result | PowerPC result |
|---|---|---|
| Clang 13 preprocess/compile without system headers | success | success |
| LLVM 13 bitcode generation | success | success |
| LLVM 13 disassembly | success | success |
| Widths (`short/int/long/pointer`) | 16/32/32/32 | 16/32/32/32 |
| Byte order | little | big |
| Relocatable native object | not separately required; supported by backend | success, ELF32 MSB PowerPC |
| Native executable link | failed: missing 32-bit CRT/libc/libgcc | failed: no PowerPC linker emulation/sysroot |
| Current KLEE execution | failed: missing 32-bit Freestanding runtime | failed: incompatible target selection and assertion |
| Native replay library | only x86-64 library installed | none |

## i386 details

Compilation to bitcode was successful and produced the desired ILP32 data
layout. Both `target_probe_i386.bc` and `basic_symbolic_i386.bc` are preserved.
KLEE's exact decisive error was:

```text
Loading file .../libkleeRuntimeFreestanding32_Release+Debug.bca failed:
No such file or directory
```

This is not a Clang failure and not an LLVM-IR syntax failure. It is a missing
KLEE runtime artifact selected for the module pointer width.

Native linking with Clang 13 and Clang 18 failed because `crt1.o`/`Scrt1.o`,
`crti.o`, compiler CRT endpoints, 32-bit libc, and libgcc inputs were absent.
The dpkg inventory confirms that `gcc-multilib` and `libc6-dev-i386` are not
installed.

## PowerPC details

PowerPC compilation generated:

```text
ELF 32-bit MSB relocatable, PowerPC ...
```

The native link failed because the host linker does not support
`elf32ppclinux`. KLEE issued a module/host triple warning and:

```text
unable to select target: No available targets are compatible with triple
"powerpc-unknown-linux-gnu"
```

It then hit an enabled assertion while creating a constant. Both the clean
diagnostic and stack trace are preserved. This attempt demonstrates that having
PowerPC in `llvm-config --targets-built` is insufficient for KLEE execution.

## Can `ppc_32` be reproduced directly now?

```text
No.
```

The installed KLEE can neither execute the emitted PowerPC module nor execute
the i386 ILP32 proxy due to the missing 32-bit runtime. The working x86-64 path
changes the width of the project's `long`-based `s32/u32` typedefs.

## What can be reproduced now?

- Exact 32-bit integer IR can be generated and inspected.
- Exact PowerPC big-endian data layout can be emitted by Clang 13.
- KLEE can characterize equivalent 32-bit LLVM integer operations inside an
  x86-64 module when the analysis adapter uses explicit-width integer types.
- KLEE can generate and decode testcases and replay x86-64 synthetic programs.

## Setup candidates for a later phase (not executed)

### Candidate 1: add native 32-bit development support

Illustrative package plan, subject to a separately authorized setup phase:

```bash
sudo apt-get install gcc-multilib g++-multilib libc6-dev-i386
```

This would address native i386 linking, not the missing KLEE 32-bit bitcode
runtime by itself.

### Candidate 2: build/pin a KLEE runtime set that contains 32-bit archives

A dedicated KLEE/LLVM 13 build must explicitly verify creation of
`libkleeRuntimeFreestanding32_*` and any other required 32-bit archives. The
current Snap cannot be repaired merely by changing the compile target.

### Candidate 3: explicit-width x86-64 analysis adapter

Compile a separate KLEE copy/model in which project scalar aliases use
`int8_t`, `uint8_t`, `int16_t`, `uint16_t`, `int32_t`, and `uint32_t`, with
`_Static_assert` checks. Host pointers remain 64-bit, so Phase B must reject or
separately handle predicates depending on pointer/layout semantics.

This candidate uses the already verified KLEE path and is the recommended POC
route because all current target signatures are scalar and all remaining alarm
categories are scalar arithmetic checks.

### Candidate 4: PowerPC cross/emulated replay

A separate cross compiler, PowerPC sysroot, and emulator could replay concrete
inputs against an original-width/endianness build. It would strengthen
confirmation when ABI or implementation-defined behavior matters, but it does
not solve direct KLEE execution of PowerPC bitcode.

## Feasibility conclusion

**TECHNICAL INTERPRETATION:** An ILP32 or explicit-width strategy can preserve the
dominant scalar arithmetic semantics, but it must be presented as controlled
equivalence, not as direct PowerPC execution. The strongest design combines
explicit-width KLEE predicates with controlled replay and escalates target-
sensitive cases to PowerPC cross/emulated replay.
