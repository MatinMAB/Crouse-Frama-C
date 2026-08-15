# Undefined-Behavior Semantics Characterization

## Method

Only synthetic programs under `microtests/` were compiled. Clang 13 generated
LLVM bitcode at controlled optimization levels. KLEE 3.2 executed x86-64 LLVM 13
bitcode with a ten-second watchdog and STP unless stated otherwise. Commands,
LLVM IR, logs, exit statuses, KTests, and decoded concrete values are retained
under `microtests/generated/`.

The tests characterize this installed pipeline. They do not classify any frozen
Eva alarm.

## Signed integer overflow

### Natural C expression

Synthetic source:

```c
sum = value + 1;
```

Clang 13 at `-O0` emitted:

```llvm
%add = add nsw i32 %1, 1
```

The `nsw` flag states that a signed-overflow result is poison in LLVM IR.
Official LLVM language-reference semantics support that interpretation.

**DIRECT ENVIRONMENT EVIDENCE:** KLEE completed one path, generated one ordinary
test (`value=0`), and emitted no overflow error for the natural `add nsw`.

**TECHNICAL INTERPRETATION:** This KLEE configuration does not automatically turn
every `nsw` violation into a reportable witness. Natural C signed overflow must
not be targeted solely by waiting for a built-in KLEE error.

### Explicit safety predicate

The synthetic explicit version checks `value == INT_MAX` before performing an
overflowing addition and calls `klee_report_error` on that state. KLEE generated
an error testcase with `value=2147483647` and one non-error testcase.

**TECHNICAL INTERPRETATION:** A predicate that is mathematically equivalent to
the Eva safety condition and is evaluated without first executing the UB gives a
stable witness target. For multiplication/addition/subtraction, Phase B should
define predicates using widened arithmetic or boundary comparisons so the
predicate itself cannot overflow.

### UBSan instrumentation

Clang 13 with:

```text
-fsanitize=signed-integer-overflow
-fno-sanitize-recover=signed-integer-overflow
```

emitted `llvm.sadd.with.overflow.i32` and a call to
`__ubsan_handle_add_overflow_abort`. KLEE with `--ubsan-runtime` reported
`signed-integer-overflow` and generated a testcase with
`value=2147483647`.

**TECHNICAL INTERPRETATION:** KLEE's UBSan runtime is a viable cross-check for
simple signed overflow. Explicit per-alarm predicates remain preferable as the
primary research oracle because they can match the exact normalized Eva
predicate, distinguish multiple occurrences on one line, and state the intended
source-level arithmetic width.

## Division by zero

Synthetic source:

```c
quotient = 100 / denominator;
```

Clang 13 emitted `sdiv i32`. KLEE's installed CLI reports
`--check-div-zero=true` by default.

**DIRECT ENVIRONMENT EVIDENCE:** KLEE emitted:

```text
division_by_zero_natural.c:12: divide by zero
```

It generated an error testcase where the four-byte signed denominator is zero,
plus a non-error testcase. KLEE continued other states because
`--exit-on-error` was not enabled.

**TECHNICAL INTERPRETATION:** Natural integer division is directly detectable by
this KLEE build. Phase B should still map a predicate `divisor != 0` and include
the signed `MIN / -1` overflow case where applicable, because the exact Eva alarm
occurrence and source conversions remain the research unit.

## Invalid shift

Synthetic source:

```c
shifted = 1U << count;
```

Clang 13 emitted `shl i32`. KLEE's installed CLI reports
`--check-overshift=true` by default.

**DIRECT ENVIRONMENT EVIDENCE:** KLEE emitted:

```text
invalid_shift_natural.c:12: overshift error
```

It generated an error testcase with unsigned `count=4294967295` and a normal
testcase with `count=0`.

For a signed source-level count, negative values become a large unsigned shift
amount in the LLVM shift operand's bitvector representation and are covered by
an unsigned-width check. Phase B must nevertheless preserve the source-level
predicate, because Eva separately reports negative left operands and out-of-range
right operands.

## Compiler optimization hazard

Synthetic source:

```c
if (value + 1 < value) {
    klee_report_error(...);
}
```

At `-O0`, LLVM IR retained `add nsw`, `icmp`, and the branch. KLEE generated an
error testcase with `value=INT_MAX`.

At `-O2`, Clang removed the overflow-dependent branch. The disassembled module
contains no add, compare, or `klee_report_error`, and KLEE generated only an
ordinary `value=0` testcase.

**DIRECT ENVIRONMENT EVIDENCE:** the two runs used the same source and KLEE
version; their retained IR and path counts differ exactly as recorded above.

**TECHNICAL INTERPRETATION:** Optimization before predicate capture can erase a
target by exploiting C/LLVM UB assumptions. Later phases should compile at
`-O0`, retain debug information and value names, disable O0 `optnone` only when
required by KLEE's documented pipeline, inspect emitted IR, and leave KLEE's
`--optimize` disabled unless a separate controlled experiment justifies it.

## Recommended target predicate pattern

For each alarm occurrence, a later KLEE harness/instrumented analysis copy should
check a UB-free predicate immediately before the target expression:

| Eva category | Predicate design |
|---|---|
| signed overflow | widened mathematical result within destination/source operation bounds, or a checked-overflow intrinsic |
| division by zero | divisor after source conversions is nonzero; separately model signed minimum divided by `-1` |
| invalid RHS shift | source shift count is nonnegative when signed and strictly less than promoted LHS width |
| invalid LHS left shift | LHS is nonnegative and mathematical shifted value is representable when required by C semantics |

The predicate must be identified by function, canonical signature, and occurrence,
not merely by source line.

## Result boundary

These synthetic successes show that the installed KLEE can produce concrete
inputs for the three predicate families on compatible LLVM 13 x86-64 bitcode.
They do not show that any of the 149 project alarms has a witness, and they do not
resolve the `ppc_32` type-width gap.
