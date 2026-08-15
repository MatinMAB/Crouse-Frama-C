# Recommended Architecture for the Independent KLEE Study

## Strategy comparison

| Strategy | Advantages | Disadvantages | Semantic fidelity | Reproducibility | Complexity | Replay implications |
|---|---|---|---|---|---|---|
| A — existing native toolchain | Already passes x86-64 microtests; STP/Z3/runtimes available | Snap confinement; LP64 `long`; runtime only 64-bit; ambient LLVM 18 risk | low for unmodified `s32/u32`, high for explicitly modeled scalar i32 | medium | low | x86-64 replay works |
| B — dedicated native LLVM/KLEE prefix | versions can be pinned; no Docker permission dependency | install/build work; host drift still possible | depends on model adapter/runtime | medium-high | medium-high | can supply matching replay library |
| C — reproducible Docker environment | strongest dependency pinning and handoff; isolated PATH | daemon currently inaccessible; image must be built/pulled later | depends on model adapter; container alone does not equal ppc_32 | high | medium | replay may occur in container or controlled host build |
| D — 32-bit LLVM target + KLEE | preserves `long`/pointer widths | current KLEE lacks 32-bit runtime; native multilib missing; i386 not PowerPC | high for scalar widths, lower for ABI/endianness | potentially high | high | needs 32-bit replay environment |
| E — host LLVM + explicit-width semantic model | works with verified x86-64 KLEE; directly controls scalar bit widths | requires separate auditable adapter; pointer/layout still LP64; not original binary | high for mapped scalar expressions, conditional elsewhere | high when generated deterministically | medium | controlled adapter replay plus optional target replay |

## Primary recommendation

```text
Strategy C + Strategy E
```

Use a reproducible x86-64 KLEE 3.2 / LLVM 13 environment and a separate,
auditable explicit-width semantic adapter for the targeted scalar functions and
predicates. Use STP as primary solver, Z3 as optional cross-check, `-O0`, no
KLEE optimization, full-domain symbolic inputs, and occurrence-specific,
UB-free safety predicates. Preserve every compile command, IR module, KLEE log,
KTest, decoded input, and replay result.

If Docker remains unavailable, Strategy B + E is the fallback with explicit
absolute binary paths and checksums.

## Why not use the existing source unmodified on x86-64?

Because `s32/u32` are `signed long`/`unsigned long`. They are 32-bit under Eva
`ppc_32` and 64-bit under host LP64. That changes promotions, constants,
overflow bounds, shift widths, branch behavior, and results.

## Why not claim direct i386 equivalence?

i386 matches the relevant scalar widths but differs from PowerPC in byte order,
plain-char signedness, ABI, and some layout details. In addition, the installed
KLEE cannot execute i386 modules because its 32-bit runtime archive is missing.

## Why explicit predicates are primary

- KLEE directly detects division by zero and overshift in the installed build.
- It did not automatically report natural `add nsw` signed overflow.
- Clang UBSan can expose signed overflow, but a canonical predicate more closely
  matches the Eva alarm and differentiates occurrences.
- `-O2` removed an overflow-dependent branch in the microtest.

Therefore each target should have a source-derived, UB-free predicate evaluated
before the target operation. Built-in KLEE errors and UBSan are corroborating
channels, not the sole identity of the target.

## Architecture pipeline

```text
Frozen REMAINING Eva alarm
        |
        v
Phase-B stable target ID + source/type/predicate mapping
        |
        v
Generated KLEE analysis copy (explicit-width scalar model)
        |
        v
Clang 13, -O0, inspected LLVM 13 IR
        |
        v
KLEE 3.2 + STP (optional Z3 cross-check)
        |
        v
KTest + decoded typed inputs
        |
        v
Controlled predicate replay
        |
        +--> optional PowerPC cross/emulated replay for target-sensitive cases
        |
        v
Outcome taxonomy (not a binary safe/unsafe shortcut)
```

## Required setup before Phase C

Not executed in Phase A:

1. Restore Docker daemon access or authorize a dedicated native prefix.
2. Pin KLEE 3.2 and LLVM/Clang 13; prevent LLVM 18 from producing bitcode.
3. Commit a container recipe or native-toolchain manifest with versions and
   checksums.
4. Specify the explicit-width adapter generation policy and compile-time
   assertions.
5. Define UB-free predicate templates for all three categories.
6. Re-run the Phase-A synthetic acceptance tests inside the selected environment.
7. Define controlled replay targets and the escalation rule for PowerPC-sensitive
   operations.

Illustrative setup commands may include multilib or Docker operations, but none
should be run until a separate setup specification authorizes system changes.

## Native replay recommendation

Use two levels:

1. **Controlled semantic replay:** compile the same explicit-width adapter
   natively and verify that the exact predicate evaluates to violated for the
   decoded KTest input.
2. **Target-fidelity replay where necessary:** cross-compile the original-width
   source for PowerPC and replay under a controlled emulator or actual target.

Native host LP64 replay of unmodified source is insufficient for `s32/u32`
targets. A KLEE testcase alone is not a confirmed original-target witness.

## Verdict

```text
READY_FOR_PHASE_B_WITH_TOOLCHAIN_SETUP
```

Phase B is ready because it only maps the frozen dataset. Phase C is gated on
the pinned environment and semantic adapter acceptance tests above.
