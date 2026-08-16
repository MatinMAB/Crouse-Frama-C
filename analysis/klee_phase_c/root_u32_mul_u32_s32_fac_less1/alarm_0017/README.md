# KLEE-ALARM-0017: `root_u32_mul_u32_s32_fac_less1`

Current status: **PREPARED - NOT EXECUTED**

## Alarm identity

- Function name: `root_u32_mul_u32_s32_fac_less1`
- Eva alarm: `signed overflow. assert (int)arg1_HW * (int)arg2_LW <= 2147483647;`
- KLEE alarm ID: `KLEE-ALARM-0017`
- Source location: `src_analysis/sources/MulHword.c:49`
- Source statement: `MulTemp3 = arg1_HW * arg2_LW;`
- Source operation: `(int)arg1_HW * (int)arg2_LW`
- Eva alarm category: `integer overflow`
- Safety predicate: `MATHEMATICAL((int)arg1_HW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX`
- Violating predicate: `MATHEMATICAL((int)arg1_HW) * MATHEMATICAL((int)arg2_LW) > INT32_MAX`
- Mapping confidence/status: `MEDIUM` / `MAPPED_WITH_SEMANTIC_NOTE`
- Expected KLEE error suffix: `klee-alarm-0017.err`

The violating branch calls `klee_report_error` before the selected helper
multiplication. The satisfying branch evaluates the exact signed multiplication
identified by Eva, then the helper returns so later helper operations are
excluded. The frozen Phase-B caller-context mapping identifies the exact
`root_u32_mul_u32_s32_fac_less1 -> MulHighWord` path used by this package.

## Symbolic inputs

| Name | Type | Bytes | Domain |
|---|---|---:|---|
| `value` | `uint32_t` | 4 | `0..4294967295` |
| `factor` | `int32_t` | 4 | `-2147483648..2147483647` |
| `count` | `uint32_t` | 4 | `0..4294967295` |

- `klee_make_symbolic` calls: 3
- `klee_assume` calls: 0
- Domain restrictions: none
- Frozen Eva domain evidence: `value=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL); factor=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`

## Fixed-width adaptations

Project aliases are local to this directory: `s8/u8`, `s16/u16`, and
`s32/u32` map to the corresponding `intN_t/uintN_t` types. Static
assertions in `klee_alarm_support.h` verify all important widths. The target
predicate is evaluated with `int64_t`, while the safe branch executes the
original 32-bit signed multiplication semantics.

## Earlier-alarm handling

Before the helper call, `KLEE-ALARM-0018` uses the unsigned 32-bit magnitude adaptation `UINT32_C(0) - (uint32_t)factor`. Inside `MulHighWord`, the earlier `KLEE-ALARM-0016` product is evaluated as `(u32)arg1_LW * (u32)arg2_LW`, preserving the intended 32-bit product without executing overflowing signed `int` multiplication.

These are target-specific defined-prefix adaptations, not claims that an
earlier Eva alarm is safe. They do not use `klee_assume` and do not restrict
the harness input domains.

## Later-alarm exclusion strategy

The selected helper statement is replaced by the alarm check, evaluation of
only `(int)arg1_HW * (int)arg2_LW`, and an immediate helper return. The caller returns
immediately after the mapped `MulHighWord` invocation. Thus later helper and
caller alarms are not part of this isolated experiment.

## Analysis-copy files

- `klee_harness.c`
- `klee_analysis.h`
- `klee_alarm_support.h`
- `Platform_Types.h`
- `mul_Ccode_alarm_0017.c`
- `MulHword_alarm_0017.c`
- `mul_Ccode.h`
- `rotatefunc.h`
- `MulHword.h`
- `build_bitcode.sh`
- `run_klee.sh`
- `show_ktest.sh`

- Final bitcode filename: `root_u32_mul_u32_s32_fac_less1_alarm_0017.bc`
- Preparation contains no build or KLEE result.

## Manual execution commands

```text
cd /home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0017

bash ./build_bitcode.sh

bash ./run_klee.sh

bash ./show_ktest.sh

find build/klee-out-alarm-0017 \
  -maxdepth 1 \
  -type f \
  -name '*.err' \
  -print
```
