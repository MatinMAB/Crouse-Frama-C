# KLEE-ALARM-0020: `root_u32_mul_u32_s8_fac_less1`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `root_u32_mul_u32_s8_fac_less1`
- Eva alarm: `invalid RHS operand for shift. assert 0 <= count < 32;`
- KLEE alarm ID: `KLEE-ALARM-0020`
- Source location: `src_analysis/sources/mul_Ccode.c:5451`
- Source statement: `u32Temp2 = u32Temp2 >> count;`
- Source operation: `u32Temp2 >> count`
- Eva alarm category: `invalid shift`
- Safety predicate: `0 <= count && count < 32`
- Violating predicate: `NOT(0 <= count && count < 32)`
- Mapping confidence/status: `HIGH` / `MAPPED`
- Expected KLEE error suffix: `klee-alarm-0020.err`

The violating branch calls `klee_report_error` before the selected expression.
The satisfying branch evaluates the exact mapped source expression into a
volatile 64-bit sink, then returns to exclude the remaining suffix.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `value` | `uint32_t` | 4 | `0..4294967295` |
| `factor` | `int8_t` | 1 | `-128..127` |
| `count` | `uint32_t` | 4 | `0..4294967295` |

- `klee_make_symbolic` calls: 3
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=(s8) Frama_C_int_interval( -128, 127); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`

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
`u32Temp2 >> count`, followed by an immediate return. This
preserves the selected operation while excluding outer or later unrelated
operations. For helper-scoped targets, the caller also returns immediately
after the mapped helper call.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `mul_Ccode_alarm_0020.c`
- `MulHword_alarm_0020.c`
- `mul_Ccode.h`
- `rotatefunc.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `root_u32_mul_u32_s8_fac_less1_alarm_0020.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0020

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0020 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
