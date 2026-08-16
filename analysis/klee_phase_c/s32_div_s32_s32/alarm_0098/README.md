# KLEE-ALARM-0098: `s32_div_s32_s32`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `s32_div_s32_s32`
- Eva alarm: `signed overflow. assert (s32)(~s32Temp2) + 1 <= 2147483647;`
- KLEE alarm ID: `KLEE-ALARM-0098`
- Source location: `src_analysis/sources/div_Ccode.c:1413`
- Source statement: `return (~s32Temp2 + 1);`
- Source operation: `(s32)(~s32Temp2) + 1`
- Eva alarm category: `integer overflow`
- Safety predicate: `MATHEMATICAL((s32)(~s32Temp2)) + MATHEMATICAL(1) <= INT32_MAX`
- Violating predicate: `NOT(MATHEMATICAL((s32)(~s32Temp2)) + MATHEMATICAL(1) <= INT32_MAX)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0098.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `numerator` | `int32_t` | 4 | `-2147483648..2147483647` |
| `denominator` | `int32_t` | 4 | `-2147483648..2147483647` |

- `klee_make_symbolic` calls: 2
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`

## Fixed-width adaptations

Project aliases are local to this directory: `s8/u8`, `s16/u16`, and
`s32/u32` map to the corresponding `intN_t/uintN_t` types. Static
assertions in `klee_alarm_support.h` verify all important widths. Safety
arithmetic uses `int64_t`; the selected operation itself remains expressed
with the original fixed-width operands and casts.

## Earlier-alarm handling

The local source copies contain target-specific defined-prefix guards for: `KLEE-ALARM-0095`, `KLEE-ALARM-0096`, `KLEE-ALARM-0097`. If one of those unrelated safety conditions is false on an encountered prefix, the copy returns before executing its operation. These guards do not use `klee_assume`, do not narrow harness domains, and are not proofs that the earlier alarms are safe.

## Later-alarm exclusion strategy

The selected source statement is replaced by evaluation of only
`(s32)(~s32Temp2) + 1`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `div_Ccode_alarm_0098.c`
- `div_Ccode.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `s32_div_s32_s32_alarm_0098.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0098

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0098 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
