# KLEE-ALARM-0022: `rotateRight`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `rotateRight`
- Eva alarm: `signed overflow. assert 1 << INT_BITS <= 2147483647;`
- KLEE alarm ID: `KLEE-ALARM-0022`
- Source location: `src_analysis/sources/rotatefunc.c:119`
- Source statement: `num = (num >> 1) & (~(1 << INT_BITS));`
- Source operation: `1 << INT_BITS`
- Eva alarm category: `integer overflow`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT(1,INT_BITS) <= INT32_MAX`
- Violating predicate: `NOT(MATHEMATICAL_LEFT_SHIFT(1,INT_BITS) <= INT32_MAX)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0022.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `num` | `uint32_t` | 4 | `0..4294967295` |
| `rotation` | `uint32_t` | 4 | `0..4294967295` |

- `klee_make_symbolic` calls: 2
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `num=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); rotation=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`

## Fixed-width adaptations

Project aliases are local to this directory: `s8/u8`, `s16/u16`, and
`s32/u32` map to the corresponding `intN_t/uintN_t` types. Static
assertions in `klee_alarm_support.h` verify all important widths. Safety
arithmetic uses `int64_t`; the selected operation itself remains expressed
with the original fixed-width operands and casts.

## Earlier-alarm handling

No non-target Eva alarm guard is required before this selected expression in the generated slice. Fixed-width project aliases are still replaced locally.

## Later-alarm exclusion strategy

The selected source statement is replaced by evaluation of only
`1 << INT_BITS`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `rotatefunc_alarm_0022.c`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `rotateRight_alarm_0022.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/rotateRight/alarm_0022

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0022 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
