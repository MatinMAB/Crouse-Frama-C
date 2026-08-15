# Frama-C `ppc_32` versus LLVM/KLEE Semantic Gap

## Why this comparison is mandatory

The Eva alarms were generated after parsing with `-machdep ppc_32`. A KLEE
testcase is scientifically relevant only if the compiled symbolic program uses
the same operand widths, promotions, operation semantics, and input domain for
the targeted predicate—or if every intentional deviation is explicitly modeled
and later replayed under a controlled equivalent.

## Project typedef evidence

`src_analysis/headers/Platform_Types.h` defines:

```c
typedef unsigned char  u8;
typedef signed char    s8;
typedef unsigned short u16;
typedef signed short   s16;
typedef unsigned long  u32;
typedef signed long    s32;
```

`rotatefunc.c` repeats the same local typedefs. The important portability issue
is that `s32`/`u32` are `long`, not fixed-width `int32_t`/`uint32_t`.

## Frama-C machine-model evidence

The installed Frama-C 33.0 `machdep_ppc_32.yaml` directly records:

| Property | `ppc_32` |
|---|---:|
| `sizeof(short)` | 2 |
| `sizeof(int)` | 4 |
| `sizeof(long)` | 4 |
| `sizeof(long long)` | 8 |
| `sizeof(void *)` | 4 |
| `alignof(short)` | 2 |
| `alignof(int)` | 4 |
| `alignof(long)` | 4 |
| `alignof(long long)` | 8 |
| `alignof(void *)` | 4 |
| plain `char` unsigned | true |
| little endian | false |
| `size_t` | `unsigned int` |
| `uintptr_t` | `unsigned int` |

Thus `s32` and `u32` have 32-bit ranges in Eva.

## Clang 13 target probes

The synthetic `target_probe.c` was compiled to LLVM 13 bitcode for three
targets. The emitted globals and data-layout strings provide direct evidence.

| Property | Eva/Clang PowerPC 32 | Clang i386 | Clang x86-64 host |
|---|---:|---:|---:|
| byte order | big | little | little |
| plain char signed? | no | yes | yes |
| short | 16 | 16 | 16 |
| int | 32 | 32 | 32 |
| long | 32 | 32 | 64 |
| long long | 64 | 64 | 64 |
| pointer | 32 | 32 | 64 |
| test struct size | 12 | 12 | 24 |
| long alignment | 4 | 4 | 8 |
| pointer alignment | 4 | 4 | 8 |

PowerPC LLVM IR:

```text
target datalayout = "E-m:e-p:32:32-i64:64-n32"
target triple = "powerpc-unknown-linux-gnu"
```

i386 LLVM IR:

```text
target datalayout = "e-m:e-p:32:32-...-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"
```

x86-64 LLVM IR:

```text
target datalayout = "e-m:e-...-i64:64-...-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
```

## Direct target-execution findings

### x86-64

KLEE accepted LLVM 13 x86-64 modules, executed symbolic paths, generated KTests,
and supported native replay. However, compiling the unmodified project typedefs
on LP64 changes `s32` and `u32` to 64-bit types. It is tool-compatible but not a
direct C-machine-model equivalent.

### i386

Clang 13 generated valid ILP32 bitcode: `short=16`, `int=32`, `long=32`, and
pointer=32. This matches the key arithmetic widths of `ppc_32`, but differs in
byte order and plain-char signedness. KLEE did not execute it because its Snap
contains no `libkleeRuntimeFreestanding32_Release+Debug.bca`.

Native i386 linking also failed because CRT objects, 32-bit libc development
files, and libgcc link inputs are not installed.

### PowerPC

Clang 13 generated PowerPC ILP32 big-endian bitcode and an ELF32 MSB relocatable
object. Native cross-linking failed because host binutils lacks the
`elf32ppclinux` emulation and no PowerPC sysroot was provided.

KLEE warned that it could not select a target compatible with the PowerPC
triple, then terminated on an assertion. Direct PowerPC bitcode execution is
therefore incompatible with this KLEE installation.

## 32-bit equivalent is not PowerPC equivalent

i386 preserves the widths of `short`, `int`, `long`, `long long`, and pointers,
but differs from `ppc_32` in:

- little versus big endian;
- default plain-char signedness;
- ABI calling conventions;
- some alignment and aggregate-layout rules;
- native replay target and instruction set.

For scalar integer values already represented as LLVM integers, add/subtract,
multiply, divide, comparison, and bitwise operations primarily depend on bit
width and signed/unsigned opcode choice. They generally do not encode byte order
until values are reinterpreted through memory. This is a technical
interpretation, not a proof that every project expression is target-independent.

## Relevance to the frozen alarms

**DIRECT REPOSITORY EVIDENCE**

- All 46 analyzed function signatures use scalar parameters and scalar returns.
- None contains a pointer or array parameter.
- All 149 remaining alarms are integer overflow, division by zero, or invalid
  shift reports in six arithmetic-oriented C files.
- The inspected alarm expressions use scalar locals, casts, arithmetic,
  comparisons, shifts, masks, and helper calls. No remaining alarm signature
  names an out-of-bounds, pointer, or memory validity property.

**TECHNICAL INTERPRETATION**

Most target predicates are likely governed by integer width, promotions, and
control flow rather than endianness. This makes a 32-bit-width or explicit-width
x86-64 semantic adapter defensible for POCs, provided Phase B records all casts,
promotion types, and memory dependencies for each occurrence. It does not make
i386 globally equivalent to PowerPC.

## Recommended semantic control

Because direct PowerPC KLEE execution failed and the current i386 runtime is
missing, the recommended Phase-C architecture is:

1. KLEE 3.2/LLVM 13 on a pinned x86-64 environment;
2. a separate KLEE analysis copy/adapter that represents `s8/u8/s16/u16/s32/u32`
   with explicit-width integer types and compile-time size assertions;
3. target-specific explicit safety predicates evaluated before the C UB;
4. exact full-domain symbolic inputs matching the Eva harnesses;
5. controlled replay of extracted inputs in a matching-width build;
6. optional PowerPC cross/emulated replay for cases where byte order, layout, or
   implementation-defined behavior can affect the predicate.

The adapter must not modify the frozen project source and must be auditable as a
separate KLEE artifact.
