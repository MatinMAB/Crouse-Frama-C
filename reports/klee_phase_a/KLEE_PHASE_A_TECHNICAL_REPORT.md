# KLEE Phase A — Environment, Toolchain, and Semantic Feasibility Report

## 1. Executive verdict

```text
SUCCESS — READY_FOR_PHASE_B_WITH_TOOLCHAIN_SETUP
```

This report establishes a technical foundation for a later witness-generation
study over the 149 Eva alarms remaining after High Precision analysis. It does
not execute any project function with KLEE and does not classify any alarm.

The environment already contains a functional KLEE 3.2 / LLVM 13 x86-64 stack.
Synthetic experiments demonstrated symbolic branching, KTest generation and
decoding, STP and Z3 solving, division-by-zero detection, overshift detection,
Clang-UBSan signed-overflow detection, explicit-predicate signed-overflow
detection, KLEE libc/uClibc/POSIX linking, and 64-bit native replay.

The controlling limitation is machine semantics. Eva used Frama-C `ppc_32`,
where project `signed long`/`unsigned long` aliases are 32-bit. The working KLEE
path is host LP64, where those aliases become 64-bit. Clang can emit ILP32 i386
and PowerPC bitcode, but the installed KLEE lacks 32-bit runtime archives and
fails on PowerPC modules. Consequently, direct `ppc_32` execution is not ready.

Phase B is still ready: it can map the frozen 149 occurrences to stable IDs,
source expressions, resolved `ppc_32` types, and UB-free safety predicates.
Before Phase C, the recommended architecture is a pinned KLEE 3.2 / LLVM 13
environment with an explicit-width semantic adapter and controlled replay.

## 2. Research context

The frozen Eva study contains:

| Metric | Verified value |
|---|---:|
| Functions | 46 |
| Baseline alarms | 171 |
| High Precision alarms | 149 |
| Removed | 22 |
| Remaining | 149 |
| New | 0 |
| Remaining integer overflow | 100 |
| Remaining division by zero | 16 |
| Remaining invalid shift | 33 |

The Phase-A validation recomputed the 149-row and category counts from
`reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv`.
All rows are `REMAINING`. The 171-row comparison table independently contains
149 `REMAINING` and 22 `REMOVED` entries.

The long-term question is whether a concrete execution can reach an alarm
location and violate its corresponding safety predicate under the same full
input domain as Eva. This requires three distinct achievements:

1. symbolic reachability and constraint solving;
2. faithful source/machine semantics;
3. controlled replay of a concrete input against the same predicate.

KLEE can support the first, but the latter two require explicit design.

## 3. Repository and Git control

### Direct evidence

- Starting branch: `docs/eva-report-evidence-package`.
- Starting HEAD: `4e9ecee2708419276eb944bbc535f21397606b45`.
- `4e9ecee` ancestor check: success.
- Starting status: no tracked, staged, or untracked path reported.
- The legacy ZIP path mentioned in the request was absent and untouched.
- Phase branch created: `analysis/klee-phase-a-environment`.

The exact initial output is committed as
`analysis/klee_phase_a/raw/git_initial_state.txt`.

### Frozen paths

All source, harness, runner, Baseline result, High Precision result, comparison,
causal-analysis, Eva report, and Eva evidence-package trees were read-only.
Only `analysis/klee_phase_a/` and `reports/klee_phase_a/` received new files.

### Reproducibility consequence

Because Phase A did not modify the input dataset, any later difference in KLEE
results cannot be attributed to a hidden Eva rerun or source patch. The KLEE
dataset begins on a dedicated branch and remains logically independent.

## 4. Host environment

### Direct environment evidence

| Property | Value |
|---|---|
| Operating system | Ubuntu 24.04.3 LTS |
| Kernel | 7.0.0-28-generic |
| CPU architecture | x86_64 |
| Host C data model | LP64 |
| libc | glibc 2.39 |
| Dpkg architecture | amd64 only |

The host is not a 32-bit or PowerPC system. This fact is not itself a blocker to
symbolic execution, because KLEE interprets LLVM bitcode, but KLEE runtime
selection, data layout, and replay all remain target-sensitive.

## 5. Installed KLEE

### Version and build

The installed Snap reports:

```text
KLEE 3.2
Build mode: RelWithDebInfo (Asserts: ON)
Build revision: 92ee8201a050184aacaaeef645ade491f5c93c41
Ubuntu LLVM version 13.0.1
Default target: x86_64-pc-linux-gnu
```

Snap metadata identifies revision 20, strict confinement, `core22`, and amd64.
Its build manifest records KLEE v3.2, KLEE-uClibc v1.4, STP 2.3.4, Clang/LLVM
13, POSIX runtime enabled, tcmalloc enabled, and Release+Debug runtimes.

### Runtime inventory

The installation contains Freestanding, Intrinsic, KLEE libc, POSIX, Fortify,
and UBSan archives, plus KLEE-uClibc. All architecture-specific runtime archive
names contain `64`; no 32-bit counterpart exists. Native replay is supplied by
an x86-64 `libkleeRuntest.so.1.0`.

### Snap confinement

The initial sandboxed `klee --version` could not create its Snap runtime
directory under `/run/user/1000`. An approved read-only execution outside the
sandbox succeeded. Subsequent synthetic executions used the same Snap wrapper.
This is an operational constraint, not an LLVM incompatibility.

## 6. LLVM and Clang inventory

Two LLVM families coexist:

| Family | Compiler | LLVM tools | Role |
|---|---|---|---|
| LLVM 13 | `/home/matin/opt/clang13/bin/clang` | same prefix | compatible KLEE producer |
| LLVM 18 | `/usr/bin/clang-18` | suffixed system tools | incompatible KLEE producer |

LLVM 13 includes `llvm-config`, `llvm-link`, `llvm-dis`, `llvm-as`, `opt`, `lli`,
`llc`, and `llvm-bcanalyzer`. Both LLVM installations report X86 and PowerPC
backends.

### Version-mismatch experiment

Clang 18 generated a valid module that LLVM 18 could disassemble. LLVM 13 and
KLEE rejected it with a producer/reader version error. This is direct proof that
system Clang 18 must not be allowed to enter the KLEE compile pipeline.

Later scripts should use an explicit compiler path and validate `target triple`,
`target datalayout`, LLVM producer metadata, and KLEE reader version before
running symbolic execution.

## 7. Solver inventory

### STP

The Snap statically contains STP 2.3.4. The default synthetic runs used STP and
reported MiniSat as the SAT solver. Basic branch, UB checks, runtime, and replay
generation completed.

### Z3

Z3 4.8.12 exists both as a system executable/library and a tested KLEE backend.
The Z3 branch probe completed the same two logical paths and values as STP.

### Interpretation

STP is the primary recommendation because it is the package default and was used
for the characterization suite. Z3 is a useful cross-check. Solver agreement
cannot compensate for a wrong C type width or target data layout.

## 8. Docker feasibility

Docker client 29.1.3 and its Buildx/Compose plugins are installed. Docker daemon
and image inventory are unavailable because the user cannot connect to
`/var/run/docker.sock`; a read-only elevated attempt produced the same denial.
No repository container definition exists.

No image was pulled, built, run, or removed. Container deployment is a future
setup task, not part of Phase A.

## 9. Project C type model

The project uses the following active aliases:

```c
typedef signed char    s8;
typedef unsigned char  u8;
typedef signed short   s16;
typedef unsigned short u16;
typedef signed long    s32;
typedef unsigned long  u32;
```

The explicit signedness of `s8/u8` removes most practical dependence on plain
`char` signedness. The `long` aliases make LP64 versus ILP32 critical.

## 10. Eva `ppc_32` model

The installed Frama-C machine YAML directly records:

```text
short: 2 bytes
int: 4 bytes
long: 4 bytes
long long: 8 bytes
pointer: 4 bytes
plain char: unsigned
byte order: big endian
```

Alignment is 2 for short, 4 for int/long/pointer, and 8 for long long. `size_t`
and `uintptr_t` are unsigned int.

## 11. Target probe results

### Host x86-64

`short=2`, `int=4`, `long=8`, `pointer=8`, little endian, signed plain char.
KLEE execution succeeds, but unmodified `s32/u32` semantics do not match Eva.

### i386

`short=2`, `int=4`, `long=4`, `pointer=4`, little endian, signed plain char.
This is a scalar-width proxy, not PowerPC equivalence.

KLEE selected a 32-bit Freestanding runtime and failed because the file is
absent. Native link also failed due missing multilib development inputs.

### PowerPC

`short=2`, `int=4`, `long=4`, `pointer=4`, big endian, unsigned plain char. The
synthetic struct size and primary alignments match the Frama model.

Clang emitted LLVM IR and a valid ELF32 MSB PowerPC object. Host linking lacks a
PowerPC linker/sysroot. KLEE could not select the target and hit an assertion.

## 12. Width equivalence versus target equivalence

i386 is width-equivalent for the project's core scalar typedefs but differs in
endianness, plain char, calling convention, ABI, and potentially aggregate
layout. LLVM integer operations such as `add i32`, `sdiv i32`, and `shl i32`
operate on bitvectors whose width is explicit; byte order becomes material when
values move through memory or byte-level reinterpretation.

All 46 analyzed signatures are scalar and none has pointer or array parameters.
All 149 remaining alarms are scalar arithmetic classes. That evidence supports
prioritizing an explicit-width scalar adapter. It does not establish whole-
program equivalence and must be rechecked per occurrence in Phase B.

## 13. Synthetic test design

Every test is independent of project source. The suite includes:

- target/data-layout probe;
- basic symbolic branch;
- natural division by zero;
- natural invalid shift;
- natural signed overflow;
- explicit signed-overflow predicate;
- Clang UBSan signed overflow;
- optimization-dependent UB branch;
- STP/Z3 solver probe;
- KLEE libc/uClibc/POSIX probe;
- native replay probe;
- LLVM 13/18 compatibility probe;
- i386 and PowerPC compile/execute/link probes.

All KLEE runs had a ten-second watchdog. No exploration approached the bound.

## 14. Basic symbolic execution

The branch test makes a four-byte integer symbolic and reports a KLEE error when
it equals 42. KLEE generated:

- an error KTest with `value=42`;
- a normal KTest with `value=0`.

The result confirms bitcode generation, symbolic memory, branching, solver use,
test generation, and KTest decoding for LLVM 13 x86-64.

## 15. Division-by-zero behavior

Natural source:

```c
quotient = 100 / denominator;
```

IR contains `sdiv i32`. KLEE's default `--check-div-zero=true` emitted a
`divide by zero` error and generated a testcase whose denominator bytes decode
to signed/unsigned zero. A separate normal state also produced a test.

The LLVM language reference defines integer division by zero as undefined. The
installed KLEE adds an operational check before executing that invalid state.
For project mapping, the exact converted divisor and any `MIN / -1` condition
must still be modeled occurrence by occurrence.

## 16. Invalid-shift behavior

Natural source:

```c
shifted = 1U << count;
```

IR contains `shl i32`. KLEE's default `--check-overshift=true` emitted an
`overshift error`. The error KTest decodes to unsigned `count=4294967295`; the
normal KTest uses zero.

LLVM shift semantics treat an amount greater than or equal to the operand width
as poison/invalid. Eva distinguishes RHS-range predicates and signed-LHS
left-shift predicates, so Phase B must not reduce every shift alarm to the same
instrumentation template.

## 17. Signed-overflow behavior

### Natural expression

Clang emitted `add nsw i32`. KLEE completed one path and generated a normal
test but no overflow error. The Phase-A result is specific to this installed
KLEE pipeline; it shows that `nsw` is not a sufficient automatic witness oracle.

### Explicit predicate

A pre-operation `value == INT_MAX` predicate reported an error and generated an
`INT_MAX` KTest. The predicate itself did not execute signed overflow.

### UBSan path

Clang's signed-overflow sanitizer emitted `llvm.sadd.with.overflow.i32` and an
abort handler. KLEE with `--ubsan-runtime` generated an `INT_MAX` error KTest.

### Recommended interpretation

Use an explicit mathematical predicate as the primary per-alarm target and UBSan
as an independent cross-check. The explicit predicate should evaluate in a wider
safe type or use checked arithmetic, and it must correspond to the exact Eva
message and operation width.

## 18. Optimization control experiment

The same overflow-dependent source branch was compiled at `-O0` and `-O2`.

At `-O0`, IR retained `add nsw`, compare, branch, and error call. KLEE generated
an `INT_MAX` error testcase.

At `-O2`, the branch and error call disappeared. KLEE had only one ordinary
path. This is direct evidence that preprocessing/optimization can destroy the
target before symbolic execution.

Later phases should:

- compile with Clang 13 at `-O0`;
- preserve debug locations and value names;
- inspect disassembled IR;
- leave KLEE `--optimize` disabled;
- evaluate the explicit predicate before the UB;
- record exact command lines and module hashes.

## 19. libc and POSIX capabilities

The KLEE libc probe completed. The uClibc probe completed but exposed expected
external-system warnings. The uClibc+POSIX probe explicitly loaded both runtime
models and completed with modeling warnings.

The 46 target functions are arithmetic and their source lists do not require a
symbolic POSIX environment. The recommended default is `--libc=none`; enabling a
larger runtime would add external behavior and analysis cost without a target-
specific reason.

## 20. Native replay characterization

The installed `libkleeRuntest` is x86-64. A minimal branch program was compiled
both to bitcode and native code. KTests for 42 and 0 replayed with native exit
statuses 42 and 0 respectively.

The first attempt to replay a program calling `klee_report_error` failed at
native link because that KLEE-only error symbol is not in the replay library.
This reinforces the correct architecture: a native replay should evaluate the
safety predicate itself and record the violation, not depend on KLEE's internal
reporting call.

No 32-bit or PowerPC replay was possible in this environment.

## 21. Architecture alternatives

### Existing native Snap/toolchain

Low setup effort and proven x86-64 function, but weak reproducibility and wrong
unmodified `long` width.

### Dedicated native prefix

Can pin versions and support custom runtimes, but requires installation/build
work and remains host-specific.

### Reproducible container

Best dependency and PATH control. Currently blocked by daemon permission and
still requires a semantic adapter.

### Direct 32-bit module

Best scalar-width preservation if a compatible KLEE 32-bit runtime can be built,
but current runtime and native replay are missing. It remains i386, not PowerPC.

### Host x86-64 with explicit widths

Works with the verified KLEE executable. It can faithfully model targeted scalar
bit widths if adapters and predicates are reviewed, but cannot claim ABI/layout
equivalence and needs controlled replay.

## 22. Recommended architecture

The primary recommendation is a **reproducible container plus explicit-width
semantic adapter**:

```text
Frozen alarm occurrence
  -> stable Phase-B ID
  -> source/type/guard/predicate mapping under ppc_32
  -> generated separate KLEE analysis copy
  -> int8_t/uint8_t/int16_t/uint16_t/int32_t/uint32_t adapter
  -> full-domain symbolic inputs
  -> UB-free occurrence predicate before operation
  -> Clang 13 -O0 LLVM 13 bitcode, inspected before run
  -> KLEE 3.2 + STP, optional Z3/UBSan corroboration
  -> KTest decode using Phase-B schema
  -> controlled semantic replay
  -> optional PowerPC cross/emulated replay
```

If Docker remains inaccessible, use a dedicated native prefix with absolute
paths and checksums.

## 23. Replay strategy

### Native host replay

Useful only for explicit-width adapter builds. Unmodified LP64 project source is
not an acceptable `s32/u32` replay target.

### 32-bit native replay

Potentially strong for scalar widths, but requires multilib installation and a
matching replay build. It remains little-endian i386.

### PowerPC cross/emulated replay

Strongest for byte order, ABI, and implementation-defined target behavior, but
requires a separately installed cross toolchain, sysroot, and emulator.

### Predicate-only controlled replay

Suitable first confirmation for scalar-width-only targets if the adapter,
operand values, operation width, and predicate are traceably equivalent.
Target-sensitive cases must be escalated.

## 24. Phase-B mapping proposal

Assign deterministic IDs `KLEE-ALARM-0001` through `KLEE-ALARM-0149` after
sorting by the existing function order and alarm identity. Bind each ID to:

```text
function + canonical_signature + occurrence
```

For every row, record resolved operand types, promotions, guards, helper
context, UB-free predicate, instrumentation site, source-context hash, input
model, semantic-sensitivity flags, and replay target. Preserve multiplicity;
source line alone is not an identity.

Phase B must produce exactly 149 rows and reject missing, duplicate, invented,
or UB-containing predicates.

## 25. Recommended POC candidates

### Integer overflow

`s32_mul_s32_s32`, `MulHword.c:47`:

```c
MulTemp1 = arg1_LW * arg2_LW;
```

Eva predicate:

```text
(int)arg1_LW * (int)arg2_LW <= 2147483647
```

This tests integer promotions, helper inclusion, multiplication overflow, and
the explicit-width adapter.

### Division by zero

`s16_div_s32_s16`, `div_Ccode.c:274`, divisor predicate:

```text
(s32)denominator != 0
```

This tests a guarded compound expression with multiple target categories and
occurrences. No result is predicted.

### Invalid shift

`root_s32_mul_s32_s16_fac_less1`, `mul_Ccode.c:5089`:

```c
u32Temp3 = u32Temp3 >> count;
```

Eva predicate requires unsigned `count < 32`; the full domain is
`0..4294967295`. This is the recommended first end-to-end POC.

## 26. Setup plan before Phase C

No command in this section was executed.

1. Obtain Docker daemon access or approve a dedicated native prefix.
2. Pin KLEE 3.2 and LLVM/Clang 13.
3. Commit an environment recipe and immutable version manifest.
4. Implement and review the explicit-width adapter outside frozen paths.
5. Implement Phase-B-generated predicates and IR validation.
6. Re-run the synthetic acceptance suite in the pinned environment.
7. Define test budgets and solver cross-check policy.
8. Define KTest decoding and replay schemas.
9. If 32-bit native replay is required, separately authorize installation such
   as `gcc-multilib`, `g++-multilib`, and `libc6-dev-i386`.
10. If PowerPC replay is required, separately authorize a pinned cross compiler,
    sysroot, and emulator.

Official KLEE build documentation provides illustrative LLVM 13 and dependency
commands, but the exact recipe must be pinned and tested in its own setup phase:

- <https://klee-se.org/releases/docs/v3.0/build-llvm13/>
- <https://klee-se.org/releases/>

## 27. Evidence versus interpretation

Direct evidence includes versions, paths, package state, runtime filenames,
source typedefs, Frama machine YAML, LLVM IR, KLEE diagnostics, KTests, replay
exit statuses, and frozen TSV counts.

Interpretations include the expected adequacy of explicit-width modeling, the
relevance of endianness to an individual alarm, and which environment strategy
best balances fidelity and reproducibility. Every per-alarm decision remains a
Phase-B review task.

## 28. Threats and limitations

- The characterization microtests are small and synthetic.
- No project source was compiled with KLEE.
- Direct PowerPC execution failed.
- Direct i386 execution is blocked by runtime absence.
- Container daemon/image state is unknown.
- No ablation or solver-performance study was conducted.
- Natural signed overflow was characterized for representative addition, not
  every possible operation form.
- The explicit-width adapter is proposed, not yet implemented.
- A scalar signature does not prove every internal expression is insensitive to
  layout or implementation-defined behavior.
- No KLEE result can yet classify an Eva alarm.

## 29. Required outcome taxonomy for later phases

Later phases should preserve states such as:

```text
WITNESS_CONFIRMED
KLEE_WITNESS_ONLY
NO_WITNESS_WITHIN_BUDGET
UNSUPPORTED
KLEE_ERROR
```

Absence of a testcase does not prove safety. A KLEE testcase requires controlled
replay before it can be called a confirmed violation witness for the selected
semantic model.

## 30. Reproducibility map

| Evidence | Location |
|---|---|
| initial Git state | `analysis/klee_phase_a/raw/git_initial_state.txt` |
| OS/CPU | `analysis/klee_phase_a/raw/os_environment.txt`, `cpu_architecture.txt` |
| KLEE version/help/build | `raw/klee_version.txt`, `klee_help.txt`, `klee_build_metadata.txt` |
| Clang/LLVM inventory | `raw/clang_versions.txt`, `llvm_versions.txt` |
| package inventory | `raw/package_inventory.txt` |
| runtimes/solvers | `raw/klee_runtime_inventory.txt`, `solver_inventory.txt` |
| machine models | `raw/machine_model_evidence.txt` |
| 32-bit/PowerPC failures | `raw/target_32bit_tests.txt` |
| Docker | `raw/docker_inventory.txt` |
| dataset counts | `raw/frozen_dataset_validation.txt` |
| synthetic sources/scripts | `analysis/klee_phase_a/microtests/` |
| LLVM IR/KLEE/KTest/replay output | `analysis/klee_phase_a/microtests/generated/` |

## 31. Stop boundary

Phase A ends with this report and its commit. It does not begin Phase B mapping,
project POC development, harness generation, mass execution, testcase
extraction for project alarms, native project replay, or witness classification.
