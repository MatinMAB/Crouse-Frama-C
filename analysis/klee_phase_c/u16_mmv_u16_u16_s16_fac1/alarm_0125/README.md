# KLEE-ALARM-0125: `u16_mmv_u16_u16_s16_fac1`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `u16_mmv_u16_u16_s16_fac1`
- Eva alarm: `signed overflow. assert -s32mmv <= 2147483647;`
- KLEE alarm ID: `KLEE-ALARM-0125`
- Source location: `src_analysis/sources/avrg_Ccode.c:249`
- Source statement: `s32mmv = -s32mmv;`
- Source operation: `-s32mmv`
- Eva alarm category: `integer overflow`
- Safety predicate: `s32mmv != INT32_MIN`
- Violating predicate: `NOT(s32mmv != INT32_MIN)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0125.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `mmv` | `uint16_t` | 2 | `0..65535` |
| `measure` | `uint16_t` | 2 | `0..65535` |
| `crlc` | `int16_t` | 2 | `-32768..32767` |

- `klee_make_symbolic` calls: 3
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `mmv=Frama_C_unsigned_short_interval(0, 65535); measure=Frama_C_unsigned_short_interval(0, 65535); crlc=Frama_C_short_interval(-32768, 32767)`

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
`-s32mmv`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `avrg_Ccode_alarm_0125.c`
- `avrg_Ccode.h`
- `rotatefunc.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `u16_mmv_u16_u16_s16_fac1_alarm_0125.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0125 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
