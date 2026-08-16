# KLEE-ALARM-0067: `s16_hip1_s16_u8_u8_u16_fac1`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `s16_hip1_s16_u8_u8_u16_fac1`
- Eva alarm: `signed overflow. assert s32Temp2 << 1 <= 2147483647;`
- KLEE alarm ID: `KLEE-ALARM-0067`
- Source location: `src_analysis/sources/hip_Ccode.c:53`
- Source statement: `s32Temp2 = s32Temp2 << 1;`
- Source operation: `s32Temp2 << 1`
- Eva alarm category: `integer overflow`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT(s32Temp2,1) <= INT32_MAX`
- Violating predicate: `NOT(MATHEMATICAL_LEFT_SHIFT(s32Temp2,1) <= INT32_MAX)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0067.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `yold` | `int16_t` | 2 | `-32768..32767` |
| `u` | `uint8_t` | 1 | `0..255` |
| `uold` | `uint8_t` | 1 | `0..255` |
| `m` | `uint16_t` | 2 | `0..65535` |

- `klee_make_symbolic` calls: 4
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `yold=Frama_C_short_interval( -32768, 32767); u=Frama_C_unsigned_char_interval( 0, 255); uold=Frama_C_unsigned_char_interval( 0, 255); m=Frama_C_unsigned_short_interval( 0, 65535)`

## Fixed-width adaptations

Project aliases are local to this directory: `s8/u8`, `s16/u16`, and
`s32/u32` map to the corresponding `intN_t/uintN_t` types. Static
assertions in `klee_alarm_support.h` verify all important widths. Safety
arithmetic uses `int64_t`; the selected operation itself remains expressed
with the original fixed-width operands and casts.

## Earlier-alarm handling

The local source copies contain target-specific defined-prefix guards for: `KLEE-ALARM-0063`, `KLEE-ALARM-0064`, `KLEE-ALARM-0065`, `KLEE-ALARM-0066`. If one of those unrelated safety conditions is false on an encountered prefix, the copy returns before executing its operation. These guards do not use `klee_assume`, do not narrow harness domains, and are not proofs that the earlier alarms are safe.

## Later-alarm exclusion strategy

The selected source statement is replaced by evaluation of only
`s32Temp2 << 1`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `hip_Ccode_alarm_0067.c`
- `hip_Ccode.h`
- `rotatefunc.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `s16_hip1_s16_u8_u8_u16_fac1_alarm_0067.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0067

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0067 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
