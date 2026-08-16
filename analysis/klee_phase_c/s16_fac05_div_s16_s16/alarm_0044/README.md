# KLEE-ALARM-0044: `s16_fac05_div_s16_s16`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `s16_fac05_div_s16_s16`
- Eva alarm: `invalid LHS operand for left shift. assert 0 <= (int)numerator;`
- KLEE alarm ID: `KLEE-ALARM-0044`
- Source location: `src_analysis/sources/div_Ccode.c:173`
- Source statement: `s32Temp1 = numerator<<16;`
- Source operation: `(int)numerator << 16`
- Eva alarm category: `invalid shift`
- Safety predicate: `(int)numerator >= 0`
- Violating predicate: `NOT((int)numerator >= 0)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0044.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `numerator` | `int16_t` | 2 | `-32768..32767` |
| `denominator` | `int16_t` | 2 | `-32768..32767` |

- `klee_make_symbolic` calls: 2
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_short_interval( -32768, 32767)`

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
`(int)numerator << 16`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `div_Ccode_alarm_0044.c`
- `div_Ccode.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `s16_fac05_div_s16_s16_alarm_0044.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0044

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0044 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
