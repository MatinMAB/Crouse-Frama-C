# KLEE-ALARM-0012: `root_s32_mul_s32_u8_fac_less1`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `root_s32_mul_s32_u8_fac_less1`
- Eva alarm: `invalid RHS operand for shift. assert 0 <= count < 32;`
- KLEE alarm ID: `KLEE-ALARM-0012`
- Source location: `src_analysis/sources/mul_Ccode.c:5544`
- Source statement: `u32Temp2 = u32Temp2 >> count;`
- Source operation: `u32Temp2 >> count`
- Eva alarm category: `invalid shift`
- Safety predicate: `0 <= count && count < 32`
- Violating predicate: `NOT(0 <= count && count < 32)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0012.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `value` | `int32_t` | 4 | `-2147483648..2147483647` |
| `factor` | `uint8_t` | 1 | `0..255` |
| `count` | `uint32_t` | 4 | `0..4294967295` |

- `klee_make_symbolic` calls: 3
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_char_interval(0, 255); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`

## Fixed-width adaptations

Project aliases are local to this directory: `s8/u8`, `s16/u16`, and
`s32/u32` map to the corresponding `intN_t/uintN_t` types. Static
assertions in `klee_alarm_support.h` verify all important widths. Safety
arithmetic uses `int64_t`; the selected operation itself remains expressed
with the original fixed-width operands and casts.

## Earlier-alarm handling

The local source copies contain target-specific defined-prefix guards for: `KLEE-ALARM-0011`. If one of those unrelated safety conditions is false on an encountered prefix, the copy returns before executing its operation. These guards do not use `klee_assume`, do not narrow harness domains, and are not proofs that the earlier alarms are safe.

## Later-alarm exclusion strategy

The selected source statement is replaced by evaluation of only
`u32Temp2 >> count`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `mul_Ccode_alarm_0012.c`
- `MulHword_alarm_0012.c`
- `mul_Ccode.h`
- `rotatefunc.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `root_s32_mul_s32_u8_fac_less1_alarm_0012.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0012

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0012 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
