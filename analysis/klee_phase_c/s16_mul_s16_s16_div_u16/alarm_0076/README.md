# KLEE-ALARM-0076: `s16_mul_s16_s16_div_u16`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `s16_mul_s16_s16_div_u16`
- Eva alarm: `invalid LHS operand for left shift. assert 0 <= (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));`
- KLEE alarm ID: `KLEE-ALARM-0076`
- Source location: `src_analysis/sources/div_Ccode.c:1022`
- Source statement: `s32Temp1 = (s32Result - (s32Result/denominator)*denominator) << 1;`
- Source operation: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1`
- Eva alarm category: `invalid shift`
- Safety predicate: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) >= 0`
- Violating predicate: `NOT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) >= 0)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0076.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `data1` | `int16_t` | 2 | `-32768..32767` |
| `data2` | `int16_t` | 2 | `-32768..32767` |
| `denominator` | `uint16_t` | 2 | `0..65535` |

- `klee_make_symbolic` calls: 3
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `data1=Frama_C_short_interval( -32768, 32767); data2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`

## Fixed-width adaptations

Project aliases are local to this directory: `s8/u8`, `s16/u16`, and
`s32/u32` map to the corresponding `intN_t/uintN_t` types. Static
assertions in `klee_alarm_support.h` verify all important widths. Safety
arithmetic uses `int64_t`; the selected operation itself remains expressed
with the original fixed-width operands and casts.

## Earlier-alarm handling

The local source copies contain target-specific defined-prefix guards for: `KLEE-ALARM-0077`, `KLEE-ALARM-0078`, `KLEE-ALARM-0079`. If one of those unrelated safety conditions is false on an encountered prefix, the copy returns before executing its operation. These guards do not use `klee_assume`, do not narrow harness domains, and are not proofs that the earlier alarms are safe.

## Later-alarm exclusion strategy

The selected source statement is replaced by evaluation of only
`(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `div_Ccode_alarm_0076.c`
- `div_Ccode.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `s16_mul_s16_s16_div_u16_alarm_0076.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0076

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0076 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
