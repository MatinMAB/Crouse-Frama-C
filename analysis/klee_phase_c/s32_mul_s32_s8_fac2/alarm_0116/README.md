# KLEE-ALARM-0116: `s32_mul_s32_s8_fac2`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `s32_mul_s32_s8_fac2`
- Eva alarm: `signed overflow. assert -value <= 2147483647;`
- KLEE alarm ID: `KLEE-ALARM-0116`
- Source location: `src_analysis/sources/mul_Ccode.c:2600`
- Source statement: `u32Temp1 = -value;`
- Source operation: `-value`
- Eva alarm category: `integer overflow`
- Safety predicate: `value != INT32_MIN`
- Violating predicate: `NOT(value != INT32_MIN)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0116.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `value` | `int32_t` | 4 | `-2147483648..2147483647` |
| `factor` | `int8_t` | 1 | `-128..127` |

- `klee_make_symbolic` calls: 2
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=(s8) Frama_C_int_interval( -128, 127)`

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
`-value`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `mul_Ccode_alarm_0116.c`
- `MulHword_alarm_0116.c`
- `mul_Ccode.h`
- `rotatefunc.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `s32_mul_s32_s8_fac2_alarm_0116.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0116 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
