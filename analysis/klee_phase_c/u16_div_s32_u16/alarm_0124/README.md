# KLEE-ALARM-0124: `u16_div_s32_u16`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `u16_div_s32_u16`
- Eva alarm: `signed overflow. assert (s32)(s32Temp1 / (s32)y_value) + (s32)(x_value / (s32)y_value) <= 2147483647;`
- KLEE alarm ID: `KLEE-ALARM-0124`
- Source location: `src_analysis/sources/div_Ccode.c:496`
- Source statement: `s32Temp1 = (s32Temp1/y_value) + (x_value/y_value);`
- Source operation: `(s32)(s32Temp1 / (s32)y_value) + (s32)(x_value / (s32)y_value)`
- Eva alarm category: `integer overflow`
- Safety predicate: `MATHEMATICAL((s32)(s32Temp1 / (s32)y_value)) + MATHEMATICAL((s32)(x_value / (s32)y_value)) <= INT32_MAX`
- Violating predicate: `NOT(MATHEMATICAL((s32)(s32Temp1 / (s32)y_value)) + MATHEMATICAL((s32)(x_value / (s32)y_value)) <= INT32_MAX)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0124.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `x_value` | `int32_t` | 4 | `-2147483648..2147483647` |
| `y_value` | `uint16_t` | 2 | `0..65535` |

- `klee_make_symbolic` calls: 2
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `x_value<-numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); y_value<-denominator=Frama_C_unsigned_short_interval(0, 65535)`

## Fixed-width adaptations

Project aliases are local to this directory: `s8/u8`, `s16/u16`, and
`s32/u32` map to the corresponding `intN_t/uintN_t` types. Static
assertions in `klee_alarm_support.h` verify all important widths. Safety
arithmetic uses `int64_t`; the selected operation itself remains expressed
with the original fixed-width operands and casts.

## Earlier-alarm handling

The local source copies contain target-specific defined-prefix guards for: `KLEE-ALARM-0120`, `KLEE-ALARM-0121`, `KLEE-ALARM-0122`, `KLEE-ALARM-0123`. If one of those unrelated safety conditions is false on an encountered prefix, the copy returns before executing its operation. These guards do not use `klee_assume`, do not narrow harness domains, and are not proofs that the earlier alarms are safe.

## Later-alarm exclusion strategy

The selected source statement is replaced by evaluation of only
`(s32)(s32Temp1 / (s32)y_value) + (s32)(x_value / (s32)y_value)`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `div_Ccode_alarm_0124.c`
- `div_Ccode.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `u16_div_s32_u16_alarm_0124.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0124

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0124 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
