# KLEE-ALARM-0118: `s32_mul_s32_u16`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `s32_mul_s32_u16`
- Eva alarm: `signed overflow. assert value * (s32)factor <= 2147483647;`
- KLEE alarm ID: `KLEE-ALARM-0118`
- Source location: `src_analysis/sources/mul_Ccode.c:778`
- Source statement: `return (value*factor);`
- Source operation: `value * (s32)factor`
- Eva alarm category: `integer overflow`
- Safety predicate: `MATHEMATICAL(value) * MATHEMATICAL((s32)factor) <= INT32_MAX`
- Violating predicate: `NOT(MATHEMATICAL(value) * MATHEMATICAL((s32)factor) <= INT32_MAX)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0118.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `value` | `int32_t` | 4 | `-2147483648..2147483647` |
| `factor` | `uint16_t` | 2 | `0..65535` |

- `klee_make_symbolic` calls: 2
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_short_interval( 0, 65535)`

## Fixed-width adaptations

Project aliases are local to this directory: `s8/u8`, `s16/u16`, and
`s32/u32` map to the corresponding `intN_t/uintN_t` types. Static
assertions in `klee_alarm_support.h` verify all important widths. Safety
arithmetic uses `int64_t`; the selected operation itself remains expressed
with the original fixed-width operands and casts.

## Earlier-alarm handling

The local source copies contain target-specific defined-prefix guards for: `KLEE-ALARM-0117`. If one of those unrelated safety conditions is false on an encountered prefix, the copy returns before executing its operation. These guards do not use `klee_assume`, do not narrow harness domains, and are not proofs that the earlier alarms are safe.

## Later-alarm exclusion strategy

The selected source statement is replaced by evaluation of only
`value * (s32)factor`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `mul_Ccode_alarm_0118.c`
- `mul_Ccode.h`
- `rotatefunc.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `s32_mul_s32_u16_alarm_0118.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0118 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
