# KLEE-ALARM-0058: `s16_hip1_s16_s8_s8_u16_fac1`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `s16_hip1_s16_s8_s8_u16_fac1`
- Eva alarm: `invalid LHS operand for left shift. assert 0 <= (int)((int)u - (int)uold);`
- KLEE alarm ID: `KLEE-ALARM-0058`
- Source location: `src_analysis/sources/hip_Ccode.c:163`
- Source statement: `s16uold = (u - uold) << 7;`
- Source operation: `(int)((int)u - (int)uold) << 7`
- Eva alarm category: `invalid shift`
- Safety predicate: `(int)((int)u - (int)uold) >= 0`
- Violating predicate: `NOT((int)((int)u - (int)uold) >= 0)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0058.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `yold` | `int16_t` | 2 | `-32768..32767` |
| `u` | `int8_t` | 1 | `-128..127` |
| `uold` | `int8_t` | 1 | `-128..127` |
| `m` | `uint16_t` | 2 | `0..65535` |

- `klee_make_symbolic` calls: 4
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `yold=Frama_C_short_interval( -32768, 32767); u=(s8) Frama_C_int_interval( -128, 127); uold=(s8) Frama_C_int_interval( -128, 127); m=Frama_C_unsigned_short_interval( 0, 65535)`

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
`(int)((int)u - (int)uold) << 7`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `hip_Ccode_alarm_0058.c`
- `hip_Ccode.h`
- `rotatefunc.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `s16_hip1_s16_s8_s8_u16_fac1_alarm_0058.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0058 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
