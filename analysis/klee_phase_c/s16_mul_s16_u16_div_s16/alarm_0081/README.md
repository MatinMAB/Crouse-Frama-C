# KLEE-ALARM-0081: `s16_mul_s16_u16_div_s16`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `s16_mul_s16_u16_div_s16`
- Eva alarm: `division by zero. assert (s32)denominator != 0;`
- KLEE alarm ID: `KLEE-ALARM-0081`
- Source location: `src_analysis/sources/div_Ccode.c:628`
- Source statement: `s32Temp1 = s32Result -((s32Result/denominator)*denominator);`
- Source operation: `s32Result / denominator`
- Eva alarm category: `division by zero`
- Safety predicate: `(s32)denominator != 0`
- Violating predicate: `NOT((s32)denominator != 0)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0081.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `factor1` | `int16_t` | 2 | `-32768..32767` |
| `factor2` | `uint16_t` | 2 | `0..65535` |
| `denominator` | `int16_t` | 2 | `-32768..32767` |

- `klee_make_symbolic` calls: 3
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`

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
`s32Result / denominator`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `div_Ccode_alarm_0081.c`
- `div_Ccode.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `s16_mul_s16_u16_div_s16_alarm_0081.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0081

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0081 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
