# KLEE Runtime, libc, Solver, and Replay Capabilities

## Runtime selection evidence

KLEE's installed help exposes:

```text
--libc=none|klee|uclibc
--posix-runtime
--ubsan-runtime
--runtime-build=Release+Debug
```

The Snap includes the corresponding 64-bit runtime archives and
`klee-uclibc.bca`.

## Runtime microtests

| Mode | Exit | Paths/tests | Notable evidence | Status |
|---|---:|---|---|---|
| Freestanding x86-64 | 0 | normal synthetic tests completed | default runtime used | compatible |
| `--libc=klee` | 0 | 1 completed path, 1 test | KLEE libc linked | compatible for probe |
| `--libc=uclibc` | 0 | 1 completed path, 1 test | `Using klee-uclibc` | compatible with external-call warnings |
| `--libc=uclibc --posix-runtime` | 0 | 1 completed path, 1 test | explicit POSIX64 and uClibc notes | compatible with modeling warnings |
| `--ubsan-runtime` with Clang UBSan IR | 0 | error and normal tests | signed-integer-overflow detected | compatible |

The uClibc-only run warned about unresolved or externally called OS functions.
The POSIX run replaced most of that surface with KLEE's model but still warned
about a concrete syscall and modeled malloc alignment. These warnings do not
affect the closed, scalar synthetic probe, but they show why project POCs should
avoid libc/POSIX unless the target actually needs them.

## Solver capabilities

### STP

- Embedded STP 2.3.4 build evidence exists.
- Primary tests state `Using STP solver backend`.
- The packaged build used MiniSat for the tested configuration.
- Basic branching and all three UB-characterization families completed.

### Z3

- System Z3 4.8.12 is installed.
- `--solver-backend=z3` completed the two-path branch probe and generated the
  same concrete values (`42` and `0`) as the STP experiment.

**TECHNICAL INTERPRETATION:** Use STP as the primary solver because it is the
packaged default and historically stable KLEE backend; reserve Z3 for explicit
cross-checks or solver-sensitive cases. Solver agreement is not proof of
semantic fidelity to `ppc_32`.

## KTest generation and decoding

The Snap-prefixed `klee.ktest-tool` decoded:

- symbolic branch: `value=42` and `value=0`;
- division error: `denominator=0`;
- overshift error: unsigned `count=4294967295`;
- explicit overflow: `value=2147483647`;
- UBSan overflow: `value=2147483647`.

KTest stores bytes and object names, not C typedefs. Later extraction must bind
each object to the Phase-B parameter schema and decode it with the selected
machine model's width, signedness, and byte order.

## Native replay probe

The first branch-error microtest could not link against `libkleeRuntest` because
that library does not export `klee_report_error`. This failure is preserved and
is useful: native replay should verify the target predicate in native code, not
expect KLEE-only reporting intrinsics to behave as a native oracle.

A second synthetic program used only `klee_make_symbolic`, compiled to both LLVM
bitcode and a native x86-64 executable linked to `libkleeRuntest`. Two generated
KTests replayed successfully:

| Symbolic value | Symbolic-path return | Native replay return |
|---:|---:|---:|
| 42 | 42 | 42 |
| 0 | 0 | 0 |

This proves the installed 64-bit replay mechanism works for a minimal closed
program. It does not prove 32-bit or PowerPC replay capability.

## Recommended runtime policy for Phase C

1. Prefer `--libc=none` for closed arithmetic functions.
2. Use KLEE special functions only in a separate harness/instrumentation layer.
3. Use built-in div/overshift checks as secondary evidence, while targeting an
   explicit canonical predicate for occurrence-level traceability.
4. For signed overflow, use a UB-free explicit predicate and optionally a
   Clang-UBSan/KLEE-UBSan cross-check.
5. Treat KTests as encoded inputs; confirmation requires controlled predicate
   replay.
6. Do not enable POSIX runtime merely because it is available.
