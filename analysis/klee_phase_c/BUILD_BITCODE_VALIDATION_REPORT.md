# KLEE Phase C bitcode build validation

Date: 2026-08-16

Scope: all 149 prepared per-alarm Phase C bitcode builders. This task compiled bitcode only; KLEE symbolic execution was not run.

## Outcome

- Total scripts: **149**
- Baseline PASS: **113**
- Baseline FAIL: **36**
- Final PASS: **149**
- Final FAIL: **0**
- Final linked bitcode paths produced: **149**

All warnings remain enabled and visible. Harness compilation remains under `-Wall -Wextra -Werror` with no relaxation array. No production, analysis-copy, harness, or frozen Eva source content was changed.

## Final warning policy

```bash
ANALYSIS_SOURCE_WARNING_FLAGS=(
    -Wno-error=sign-compare
    -Wno-error=shift-op-parentheses
    -Wno-error=unused-variable
    -Wno-error=unused-but-set-variable
)
```

The existing four flags apply only to analyzed-source compilations. This task added narrower source-specific arrays:

```bash
# Only for mul_Ccode_alarm_NNNN.c in the 35 affected multiplication builds.
MUL_CCODE_WARNING_FLAGS=(
    -Wno-error=return-type
)

# Only for avrg_Ccode_alarm_0125.c.
AVRG_CCODE_WARNING_FLAGS=(
    -Wno-error=self-assign
    -Wno-error=unused-parameter
    -Wno-error=return-type
)
```

In the 32 two-source multiplication layouts, `MUL_CCODE_WARNING_FLAGS` is not passed to `MulHword_alarm_NNNN.c`. No `-w`, global `-Wno-error`, or warning-silencing `-Wno-*` option was added.

## Initial fatal-diagnostic inventory

| Alarm | KLEE function | Source file | Source function | Line | Warning class | Diagnostic |
|---:|---|---|---|---:|---|---|
| 0001 | `root_s32_mul_s32_s16_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0002 | `root_s32_mul_s32_s16_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0003 | `root_s32_mul_s32_s16_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0004 | `root_s32_mul_s32_s8_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0005 | `root_s32_mul_s32_s8_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0006 | `root_s32_mul_s32_s8_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0007 | `root_s32_mul_s32_u16_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0008 | `root_s32_mul_s32_u16_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0009 | `root_s32_mul_s32_u16_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0010 | `root_s32_mul_s32_u16_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0011 | `root_s32_mul_s32_u8_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0012 | `root_s32_mul_s32_u8_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0013 | `root_s32_mul_s32_u8_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0014 | `root_u32_mul_u32_s16_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0015 | `root_u32_mul_u32_s16_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0016 | `root_u32_mul_u32_s32_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0017 | `root_u32_mul_u32_s32_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0018 | `root_u32_mul_u32_s32_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0019 | `root_u32_mul_u32_s32_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0020 | `root_u32_mul_u32_s8_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0021 | `root_u32_mul_u32_s8_fac_less1` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3344 | `-Wreturn-type` | non-void function does not return a value |
| 0106 | `s32_mul_s32_s16_fac2` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3354 | `-Wreturn-type` | non-void function does not return a value |
| 0107 | `s32_mul_s32_s32` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3354 | `-Wreturn-type` | non-void function does not return a value |
| 0108 | `s32_mul_s32_s32` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3354 | `-Wreturn-type` | non-void function does not return a value |
| 0109 | `s32_mul_s32_s32` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3358 | `-Wreturn-type` | non-void function does not return a value |
| 0110 | `s32_mul_s32_s32_fac2` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3354 | `-Wreturn-type` | non-void function does not return a value |
| 0111 | `s32_mul_s32_s32_fac2` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3354 | `-Wreturn-type` | non-void function does not return a value |
| 0112 | `s32_mul_s32_s32_fac2` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3358 | `-Wreturn-type` | non-void function does not return a value |
| 0113 | `s32_mul_s32_s32_fac_twopow_u8` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3354 | `-Wreturn-type` | non-void function does not return a value |
| 0114 | `s32_mul_s32_s32_fac_twopow_u8` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3354 | `-Wreturn-type` | non-void function does not return a value |
| 0115 | `s32_mul_s32_s32_fac_twopow_u8` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3358 | `-Wreturn-type` | non-void function does not return a value |
| 0116 | `s32_mul_s32_s8_fac2` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3354 | `-Wreturn-type` | non-void function does not return a value |
| 0117 | `s32_mul_s32_u16` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3354 | `-Wreturn-type` | non-void function does not return a value |
| 0118 | `s32_mul_s32_u16` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3358 | `-Wreturn-type` | non-void function does not return a value |
| 0119 | `s32_mul_u32_s32` | `src_analysis/sources/mul_Ccode.c` | `s16_mul_s16_u16_fac025` | 3354 | `-Wreturn-type` | non-void function does not return a value |
| 0125 | `u16_mmv_u16_u16_s16_fac1` | `src_analysis/sources/avrg_Ccode.c` | `u16_mmv_u16_u16_s16_fac1` | 313 | `-Wself-assign` | explicitly assigning value of variable of type 's32' (aka 'int') to itself |
| 0125 | `u16_mmv_u16_u16_s16_fac1` | `src_analysis/sources/avrg_Ccode.c` | `u32_mmv_u32_u32_s32_fac1` | 1005 | `-Wunused-parameter` | unused parameter 'mmv' |
| 0125 | `u16_mmv_u16_u16_s16_fac1` | `src_analysis/sources/avrg_Ccode.c` | `u32_mmv_u32_u32_s32_fac1` | 1005 | `-Wunused-parameter` | unused parameter 'measure' |
| 0125 | `u16_mmv_u16_u16_s16_fac1` | `src_analysis/sources/avrg_Ccode.c` | `u32_mmv_u32_u32_s32_fac1` | 1005 | `-Wunused-parameter` | unused parameter 'crlc' |
| 0125 | `u16_mmv_u16_u16_s16_fac1` | `src_analysis/sources/avrg_Ccode.c` | `u32_mmv_u32_u32_s32_fac1` | 1010 | `-Wreturn-type` | non-void function does not return a value |

The differing multiplication line numbers (3344, 3354, and 3358) are physical locations in independently instrumented analysis copies; every occurrence is the same source function, `s16_mul_s16_u16_fac025`.

## Diagnostic safety analysis

### `s16_mul_s16_u16_fac025` — category B: UNREACHABLE-FROM-KLEE-HARNESS

- Declared return type: `s16`.
- Original source location: `src_analysis/sources/mul_Ccode.c:3341-3344`.
- Body: calls `root_s16_mul_s16_u16_fac_less1(value, factor, 262144)` but does not return its result.
- Affected alarms: 0001-0021 and 0106-0119 (35 builds).
- Role: unrelated wrapper compiled as part of the full `mul_Ccode` analysis copy; it is neither a selected target nor a dependency on these harness call chains.
- Callers in the analyzed source/copies: none. Repository search finds only its definition, declarations, and macro definition.
- Reachable from current KLEE harnesses: no. Representative linked IR contains its definition but no `call` instruction targeting it.
- Return value consumed: no current caller exists.
- Safety decision: source-specific `-Wno-error=return-type` is justified under category B. The fall-through would be undefined if a future harness called this wrapper, so this exception must be reconsidered if the call graph changes.

### `u32_mmv_u32_u32_s32_fac1` — category B: UNREACHABLE-FROM-KLEE-HARNESS

- Declared return type: `u32`.
- Original source location: `src_analysis/sources/avrg_Ccode.c:995-1000`.
- Body: declares locals and falls through without returning.
- Affected alarm: 0125.
- Role: unrelated incomplete helper compiled in the same `avrg_Ccode` analysis copy.
- Current harness target: `u16_mmv_u16_u16_s16_fac1`.
- Callers in the analyzed source/copy: none.
- Reachable from the current KLEE harness: no. The linked alarm-0125 IR defines it but contains no call to it.
- Return value consumed: no current caller exists.
- Safety decision: source-specific `-Wno-error=return-type` is justified under category B only for alarm 0125.

### Self-assignment and unused parameters

- `avrg_Ccode.c:313`: `s32mmv = s32mmv;` is an identity assignment in the target function. Making `-Wself-assign` nonfatal changes no value or control flow.
- `u32_mmv_u32_u32_s32_fac1` parameters `mmv`, `measure`, and `crlc` are unused because the unrelated helper body is empty. Making `-Wunused-parameter` nonfatal changes no semantics.
- Both flags are restricted to `avrg_Ccode_alarm_0125.c`; the alarm-0125 harness remains strict.

## LLVM IR audit

Representative linked modules were disassembled with LLVM 13. The missing-return functions load their uninitialized return slots and return those unknown values; no concrete return value was synthesized. More importantly, neither linked module contains a call to its missing-return function:

- Alarm 0001: `s16_mul_s16_u16_fac025` is defined; call-site count is zero.
- Alarm 0125: `u32_mmv_u32_u32_s32_fac1` is defined; call-site count is zero.

This corroborates the category-B source-level call-graph analysis. It does not claim these functions are safe if called in another experiment.

## PASS/FAIL by function

| Function | Alarm range | Total | PASS | FAIL |
|---|---:|---:|---:|---:|
| `root_s32_mul_s32_s16_fac_less1` | 0001-0003 | 3 | 3 | 0 |
| `root_s32_mul_s32_s8_fac_less1` | 0004-0006 | 3 | 3 | 0 |
| `root_s32_mul_s32_u16_fac_less1` | 0007-0010 | 4 | 4 | 0 |
| `root_s32_mul_s32_u8_fac_less1` | 0011-0013 | 3 | 3 | 0 |
| `root_u32_mul_u32_s16_fac_less1` | 0014-0015 | 2 | 2 | 0 |
| `root_u32_mul_u32_s32_fac_less1` | 0016-0019 | 4 | 4 | 0 |
| `root_u32_mul_u32_s8_fac_less1` | 0020-0021 | 2 | 2 | 0 |
| `rotateRight` | 0022 | 1 | 1 | 0 |
| `s16_div_s32_s16` | 0023-0042 | 20 | 20 | 0 |
| `s16_div_s32_u32` | 0043 | 1 | 1 | 0 |
| `s16_fac05_div_s16_s16` | 0044-0052 | 9 | 9 | 0 |
| `s16_fac05_div_s16_u16` | 0053-0057 | 5 | 5 | 0 |
| `s16_hip1_s16_s8_s8_u16_fac1` | 0058-0062 | 5 | 5 | 0 |
| `s16_hip1_s16_u8_u8_u16_fac1` | 0063-0067 | 5 | 5 | 0 |
| `s16_mul_s16_s16_div_s16` | 0068-0075 | 8 | 8 | 0 |
| `s16_mul_s16_s16_div_u16` | 0076-0080 | 5 | 5 | 0 |
| `s16_mul_s16_u16_div_s16` | 0081-0088 | 8 | 8 | 0 |
| `s16_mul_u16_s16_div_u16` | 0089-0094 | 6 | 6 | 0 |
| `s32_div_s32_s32` | 0095-0103 | 9 | 9 | 0 |
| `s32_div_s32_u32` | 0104 | 1 | 1 | 0 |
| `s32_div_u32_s32` | 0105 | 1 | 1 | 0 |
| `s32_mul_s32_s16_fac2` | 0106 | 1 | 1 | 0 |
| `s32_mul_s32_s32` | 0107-0109 | 3 | 3 | 0 |
| `s32_mul_s32_s32_fac2` | 0110-0112 | 3 | 3 | 0 |
| `s32_mul_s32_s32_fac_twopow_u8` | 0113-0115 | 3 | 3 | 0 |
| `s32_mul_s32_s8_fac2` | 0116 | 1 | 1 | 0 |
| `s32_mul_s32_u16` | 0117-0118 | 2 | 2 | 0 |
| `s32_mul_u32_s32` | 0119 | 1 | 1 | 0 |
| `u16_div_s32_u16` | 0120-0124 | 5 | 5 | 0 |
| `u16_mmv_u16_u16_s16_fac1` | 0125 | 1 | 1 | 0 |
| `u16_mul_s16_u16_div_s16` | 0126-0134 | 9 | 9 | 0 |
| `u16_mul_s16_u16_div_u16` | 0135-0140 | 6 | 6 | 0 |
| `u32_div_s32_s32` | 0141-0149 | 9 | 9 | 0 |

## Exhaustive per-alarm validation

| Function | Alarm | Build | Final bitcode | Remaining visible warnings | Fatal error | Return-type relaxation |
|---|---:|---|---|---|---|---|
| `root_s32_mul_s32_s16_fac_less1` | 0001 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001/build/root_s32_mul_s32_s16_fac_less1_alarm_0001.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_s32_mul_s32_s16_fac_less1` | 0002 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0002/build/root_s32_mul_s32_s16_fac_less1_alarm_0002.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_s32_mul_s32_s16_fac_less1` | 0003 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0003/build/root_s32_mul_s32_s16_fac_less1_alarm_0003.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_s32_mul_s32_s8_fac_less1` | 0004 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0004/build/root_s32_mul_s32_s8_fac_less1_alarm_0004.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_s32_mul_s32_s8_fac_less1` | 0005 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005/build/root_s32_mul_s32_s8_fac_less1_alarm_0005.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_s32_mul_s32_s8_fac_less1` | 0006 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0006/build/root_s32_mul_s32_s8_fac_less1_alarm_0006.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_s32_mul_s32_u16_fac_less1` | 0007 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0007/build/root_s32_mul_s32_u16_fac_less1_alarm_0007.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_s32_mul_s32_u16_fac_less1` | 0008 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0008/build/root_s32_mul_s32_u16_fac_less1_alarm_0008.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_s32_mul_s32_u16_fac_less1` | 0009 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0009/build/root_s32_mul_s32_u16_fac_less1_alarm_0009.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_s32_mul_s32_u16_fac_less1` | 0010 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0010/build/root_s32_mul_s32_u16_fac_less1_alarm_0010.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_s32_mul_s32_u8_fac_less1` | 0011 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0011/build/root_s32_mul_s32_u8_fac_less1_alarm_0011.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_s32_mul_s32_u8_fac_less1` | 0012 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0012/build/root_s32_mul_s32_u8_fac_less1_alarm_0012.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_s32_mul_s32_u8_fac_less1` | 0013 | PASS | `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0013/build/root_s32_mul_s32_u8_fac_less1_alarm_0013.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_u32_mul_u32_s16_fac_less1` | 0014 | PASS | `analysis/klee_phase_c/root_u32_mul_u32_s16_fac_less1/alarm_0014/build/root_u32_mul_u32_s16_fac_less1_alarm_0014.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_u32_mul_u32_s16_fac_less1` | 0015 | PASS | `analysis/klee_phase_c/root_u32_mul_u32_s16_fac_less1/alarm_0015/build/root_u32_mul_u32_s16_fac_less1_alarm_0015.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_u32_mul_u32_s32_fac_less1` | 0016 | PASS | `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0016/build/root_u32_mul_u32_s32_fac_less1_alarm_0016.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_u32_mul_u32_s32_fac_less1` | 0017 | PASS | `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0017/build/root_u32_mul_u32_s32_fac_less1_alarm_0017.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_u32_mul_u32_s32_fac_less1` | 0018 | PASS | `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0018/build/root_u32_mul_u32_s32_fac_less1_alarm_0018.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_u32_mul_u32_s32_fac_less1` | 0019 | PASS | `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019/build/root_u32_mul_u32_s32_fac_less1_alarm_0019.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_u32_mul_u32_s8_fac_less1` | 0020 | PASS | `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0020/build/root_u32_mul_u32_s8_fac_less1_alarm_0020.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `root_u32_mul_u32_s8_fac_less1` | 0021 | PASS | `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0021/build/root_u32_mul_u32_s8_fac_less1_alarm_0021.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `rotateRight` | 0022 | PASS | `analysis/klee_phase_c/rotateRight/alarm_0022/build/rotateRight_alarm_0022.bc` | - | - | NO |
| `s16_div_s32_s16` | 0023 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0023/build/s16_div_s32_s16_alarm_0023.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0024 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0024/build/s16_div_s32_s16_alarm_0024.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0025 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0025/build/s16_div_s32_s16_alarm_0025.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0026 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0026/build/s16_div_s32_s16_alarm_0026.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0027 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0027/build/s16_div_s32_s16_alarm_0027.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0028 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0028/build/s16_div_s32_s16_alarm_0028.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0029 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0029/build/s16_div_s32_s16_alarm_0029.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0030 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0030/build/s16_div_s32_s16_alarm_0030.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0031 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0031/build/s16_div_s32_s16_alarm_0031.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0032 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0032/build/s16_div_s32_s16_alarm_0032.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0033 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0033/build/s16_div_s32_s16_alarm_0033.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0034 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0034/build/s16_div_s32_s16_alarm_0034.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0035 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0035/build/s16_div_s32_s16_alarm_0035.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0036 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0036/build/s16_div_s32_s16_alarm_0036.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0037 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0037/build/s16_div_s32_s16_alarm_0037.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0038 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0038/build/s16_div_s32_s16_alarm_0038.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0039 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0039/build/s16_div_s32_s16_alarm_0039.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0040 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0040/build/s16_div_s32_s16_alarm_0040.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0041 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0041/build/s16_div_s32_s16_alarm_0041.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_s16` | 0042 | PASS | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0042/build/s16_div_s32_s16_alarm_0042.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_div_s32_u32` | 0043 | PASS | `analysis/klee_phase_c/s16_div_s32_u32/alarm_0043/build/s16_div_s32_u32_alarm_0043.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_s16` | 0044 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0044/build/s16_fac05_div_s16_s16_alarm_0044.bc` | -Wshift-op-parentheses (2); -Wsign-compare (1); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_s16` | 0045 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0045/build/s16_fac05_div_s16_s16_alarm_0045.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_s16` | 0046 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0046/build/s16_fac05_div_s16_s16_alarm_0046.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_s16` | 0047 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0047/build/s16_fac05_div_s16_s16_alarm_0047.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_s16` | 0048 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0048/build/s16_fac05_div_s16_s16_alarm_0048.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_s16` | 0049 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0049/build/s16_fac05_div_s16_s16_alarm_0049.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_s16` | 0050 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0050/build/s16_fac05_div_s16_s16_alarm_0050.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_s16` | 0051 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0051/build/s16_fac05_div_s16_s16_alarm_0051.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_s16` | 0052 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0052/build/s16_fac05_div_s16_s16_alarm_0052.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_u16` | 0053 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053/build/s16_fac05_div_s16_u16_alarm_0053.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_u16` | 0054 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0054/build/s16_fac05_div_s16_u16_alarm_0054.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_u16` | 0055 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0055/build/s16_fac05_div_s16_u16_alarm_0055.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_u16` | 0056 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0056/build/s16_fac05_div_s16_u16_alarm_0056.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_fac05_div_s16_u16` | 0057 | PASS | `analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0057/build/s16_fac05_div_s16_u16_alarm_0057.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_hip1_s16_s8_s8_u16_fac1` | 0058 | PASS | `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058/build/s16_hip1_s16_s8_s8_u16_fac1_alarm_0058.bc` | - | - | NO |
| `s16_hip1_s16_s8_s8_u16_fac1` | 0059 | PASS | `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0059/build/s16_hip1_s16_s8_s8_u16_fac1_alarm_0059.bc` | - | - | NO |
| `s16_hip1_s16_s8_s8_u16_fac1` | 0060 | PASS | `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0060/build/s16_hip1_s16_s8_s8_u16_fac1_alarm_0060.bc` | - | - | NO |
| `s16_hip1_s16_s8_s8_u16_fac1` | 0061 | PASS | `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0061/build/s16_hip1_s16_s8_s8_u16_fac1_alarm_0061.bc` | - | - | NO |
| `s16_hip1_s16_s8_s8_u16_fac1` | 0062 | PASS | `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0062/build/s16_hip1_s16_s8_s8_u16_fac1_alarm_0062.bc` | - | - | NO |
| `s16_hip1_s16_u8_u8_u16_fac1` | 0063 | PASS | `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0063/build/s16_hip1_s16_u8_u8_u16_fac1_alarm_0063.bc` | - | - | NO |
| `s16_hip1_s16_u8_u8_u16_fac1` | 0064 | PASS | `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0064/build/s16_hip1_s16_u8_u8_u16_fac1_alarm_0064.bc` | - | - | NO |
| `s16_hip1_s16_u8_u8_u16_fac1` | 0065 | PASS | `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0065/build/s16_hip1_s16_u8_u8_u16_fac1_alarm_0065.bc` | - | - | NO |
| `s16_hip1_s16_u8_u8_u16_fac1` | 0066 | PASS | `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066/build/s16_hip1_s16_u8_u8_u16_fac1_alarm_0066.bc` | - | - | NO |
| `s16_hip1_s16_u8_u8_u16_fac1` | 0067 | PASS | `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0067/build/s16_hip1_s16_u8_u8_u16_fac1_alarm_0067.bc` | - | - | NO |
| `s16_mul_s16_s16_div_s16` | 0068 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0068/build/s16_mul_s16_s16_div_s16_alarm_0068.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_s16_div_s16` | 0069 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0069/build/s16_mul_s16_s16_div_s16_alarm_0069.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_s16_div_s16` | 0070 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0070/build/s16_mul_s16_s16_div_s16_alarm_0070.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_s16_div_s16` | 0071 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0071/build/s16_mul_s16_s16_div_s16_alarm_0071.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_s16_div_s16` | 0072 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0072/build/s16_mul_s16_s16_div_s16_alarm_0072.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_s16_div_s16` | 0073 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0073/build/s16_mul_s16_s16_div_s16_alarm_0073.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (2); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_s16_div_s16` | 0074 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0074/build/s16_mul_s16_s16_div_s16_alarm_0074.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_s16_div_s16` | 0075 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0075/build/s16_mul_s16_s16_div_s16_alarm_0075.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_s16_div_u16` | 0076 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0076/build/s16_mul_s16_s16_div_u16_alarm_0076.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_s16_div_u16` | 0077 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0077/build/s16_mul_s16_s16_div_u16_alarm_0077.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_s16_div_u16` | 0078 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0078/build/s16_mul_s16_s16_div_u16_alarm_0078.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_s16_div_u16` | 0079 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0079/build/s16_mul_s16_s16_div_u16_alarm_0079.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_s16_div_u16` | 0080 | PASS | `analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0080/build/s16_mul_s16_s16_div_u16_alarm_0080.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_u16_div_s16` | 0081 | PASS | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0081/build/s16_mul_s16_u16_div_s16_alarm_0081.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_u16_div_s16` | 0082 | PASS | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0082/build/s16_mul_s16_u16_div_s16_alarm_0082.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_u16_div_s16` | 0083 | PASS | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0083/build/s16_mul_s16_u16_div_s16_alarm_0083.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_u16_div_s16` | 0084 | PASS | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0084/build/s16_mul_s16_u16_div_s16_alarm_0084.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_u16_div_s16` | 0085 | PASS | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0085/build/s16_mul_s16_u16_div_s16_alarm_0085.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_u16_div_s16` | 0086 | PASS | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0086/build/s16_mul_s16_u16_div_s16_alarm_0086.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_u16_div_s16` | 0087 | PASS | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0087/build/s16_mul_s16_u16_div_s16_alarm_0087.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_s16_u16_div_s16` | 0088 | PASS | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0088/build/s16_mul_s16_u16_div_s16_alarm_0088.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_u16_s16_div_u16` | 0089 | PASS | `analysis/klee_phase_c/s16_mul_u16_s16_div_u16/alarm_0089/build/s16_mul_u16_s16_div_u16_alarm_0089.bc` | -Wshift-op-parentheses (1); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_u16_s16_div_u16` | 0090 | PASS | `analysis/klee_phase_c/s16_mul_u16_s16_div_u16/alarm_0090/build/s16_mul_u16_s16_div_u16_alarm_0090.bc` | -Wshift-op-parentheses (1); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_u16_s16_div_u16` | 0091 | PASS | `analysis/klee_phase_c/s16_mul_u16_s16_div_u16/alarm_0091/build/s16_mul_u16_s16_div_u16_alarm_0091.bc` | -Wshift-op-parentheses (1); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_u16_s16_div_u16` | 0092 | PASS | `analysis/klee_phase_c/s16_mul_u16_s16_div_u16/alarm_0092/build/s16_mul_u16_s16_div_u16_alarm_0092.bc` | -Wshift-op-parentheses (1); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_u16_s16_div_u16` | 0093 | PASS | `analysis/klee_phase_c/s16_mul_u16_s16_div_u16/alarm_0093/build/s16_mul_u16_s16_div_u16_alarm_0093.bc` | -Wshift-op-parentheses (1); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s16_mul_u16_s16_div_u16` | 0094 | PASS | `analysis/klee_phase_c/s16_mul_u16_s16_div_u16/alarm_0094/build/s16_mul_u16_s16_div_u16_alarm_0094.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s32_div_s32_s32` | 0095 | PASS | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0095/build/s32_div_s32_s32_alarm_0095.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s32_div_s32_s32` | 0096 | PASS | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0096/build/s32_div_s32_s32_alarm_0096.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s32_div_s32_s32` | 0097 | PASS | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0097/build/s32_div_s32_s32_alarm_0097.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s32_div_s32_s32` | 0098 | PASS | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0098/build/s32_div_s32_s32_alarm_0098.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s32_div_s32_s32` | 0099 | PASS | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0099/build/s32_div_s32_s32_alarm_0099.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s32_div_s32_s32` | 0100 | PASS | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0100/build/s32_div_s32_s32_alarm_0100.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s32_div_s32_s32` | 0101 | PASS | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0101/build/s32_div_s32_s32_alarm_0101.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s32_div_s32_s32` | 0102 | PASS | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0102/build/s32_div_s32_s32_alarm_0102.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s32_div_s32_s32` | 0103 | PASS | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0103/build/s32_div_s32_s32_alarm_0103.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s32_div_s32_u32` | 0104 | PASS | `analysis/klee_phase_c/s32_div_s32_u32/alarm_0104/build/s32_div_s32_u32_alarm_0104.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s32_div_u32_s32` | 0105 | PASS | `analysis/klee_phase_c/s32_div_u32_s32/alarm_0105/build/s32_div_u32_s32_alarm_0105.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `s32_mul_s32_s16_fac2` | 0106 | PASS | `analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106/build/s32_mul_s32_s16_fac2_alarm_0106.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `s32_mul_s32_s32` | 0107 | PASS | `analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107/build/s32_mul_s32_s32_alarm_0107.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `s32_mul_s32_s32` | 0108 | PASS | `analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108/build/s32_mul_s32_s32_alarm_0108.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `s32_mul_s32_s32` | 0109 | PASS | `analysis/klee_phase_c/s32_mul_s32_s32/alarm_0109/build/s32_mul_s32_s32_alarm_0109.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `s32_mul_s32_s32_fac2` | 0110 | PASS | `analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0110/build/s32_mul_s32_s32_fac2_alarm_0110.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `s32_mul_s32_s32_fac2` | 0111 | PASS | `analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0111/build/s32_mul_s32_s32_fac2_alarm_0111.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `s32_mul_s32_s32_fac2` | 0112 | PASS | `analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112/build/s32_mul_s32_s32_fac2_alarm_0112.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `s32_mul_s32_s32_fac_twopow_u8` | 0113 | PASS | `analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113/build/s32_mul_s32_s32_fac_twopow_u8_alarm_0113.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `s32_mul_s32_s32_fac_twopow_u8` | 0114 | PASS | `analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0114/build/s32_mul_s32_s32_fac_twopow_u8_alarm_0114.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `s32_mul_s32_s32_fac_twopow_u8` | 0115 | PASS | `analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115/build/s32_mul_s32_s32_fac_twopow_u8_alarm_0115.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `s32_mul_s32_s8_fac2` | 0116 | PASS | `analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116/build/s32_mul_s32_s8_fac2_alarm_0116.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-but-set-variable (1); -Wunused-variable (5) | - | YES |
| `s32_mul_s32_u16` | 0117 | PASS | `analysis/klee_phase_c/s32_mul_s32_u16/alarm_0117/build/s32_mul_s32_u16_alarm_0117.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-variable (4) | - | YES |
| `s32_mul_s32_u16` | 0118 | PASS | `analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118/build/s32_mul_s32_u16_alarm_0118.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-variable (4) | - | YES |
| `s32_mul_u32_s32` | 0119 | PASS | `analysis/klee_phase_c/s32_mul_u32_s32/alarm_0119/build/s32_mul_u32_s32_alarm_0119.bc` | -Wreturn-type (1); -Wsign-compare (3); -Wunused-variable (4) | - | YES |
| `u16_div_s32_u16` | 0120 | PASS | `analysis/klee_phase_c/u16_div_s32_u16/alarm_0120/build/u16_div_s32_u16_alarm_0120.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_div_s32_u16` | 0121 | PASS | `analysis/klee_phase_c/u16_div_s32_u16/alarm_0121/build/u16_div_s32_u16_alarm_0121.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_div_s32_u16` | 0122 | PASS | `analysis/klee_phase_c/u16_div_s32_u16/alarm_0122/build/u16_div_s32_u16_alarm_0122.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_div_s32_u16` | 0123 | PASS | `analysis/klee_phase_c/u16_div_s32_u16/alarm_0123/build/u16_div_s32_u16_alarm_0123.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_div_s32_u16` | 0124 | PASS | `analysis/klee_phase_c/u16_div_s32_u16/alarm_0124/build/u16_div_s32_u16_alarm_0124.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mmv_u16_u16_s16_fac1` | 0125 | PASS | `analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125/build/u16_mmv_u16_u16_s16_fac1_alarm_0125.bc` | -Wreturn-type (1); -Wself-assign (1); -Wsign-compare (1); -Wunused-but-set-variable (1); -Wunused-parameter (3); -Wunused-variable (6) | - | YES |
| `u16_mul_s16_u16_div_s16` | 0126 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0126/build/u16_mul_s16_u16_div_s16_alarm_0126.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_s16` | 0127 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0127/build/u16_mul_s16_u16_div_s16_alarm_0127.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_s16` | 0128 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0128/build/u16_mul_s16_u16_div_s16_alarm_0128.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_s16` | 0129 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0129/build/u16_mul_s16_u16_div_s16_alarm_0129.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_s16` | 0130 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0130/build/u16_mul_s16_u16_div_s16_alarm_0130.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_s16` | 0131 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0131/build/u16_mul_s16_u16_div_s16_alarm_0131.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_s16` | 0132 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0132/build/u16_mul_s16_u16_div_s16_alarm_0132.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (2); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_s16` | 0133 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0133/build/u16_mul_s16_u16_div_s16_alarm_0133.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_s16` | 0134 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0134/build/u16_mul_s16_u16_div_s16_alarm_0134.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_u16` | 0135 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0135/build/u16_mul_s16_u16_div_u16_alarm_0135.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_u16` | 0136 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0136/build/u16_mul_s16_u16_div_u16_alarm_0136.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_u16` | 0137 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0137/build/u16_mul_s16_u16_div_u16_alarm_0137.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_u16` | 0138 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0138/build/u16_mul_s16_u16_div_u16_alarm_0138.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_u16` | 0139 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0139/build/u16_mul_s16_u16_div_u16_alarm_0139.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u16_mul_s16_u16_div_u16` | 0140 | PASS | `analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0140/build/u16_mul_s16_u16_div_u16_alarm_0140.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u32_div_s32_s32` | 0141 | PASS | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0141/build/u32_div_s32_s32_alarm_0141.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u32_div_s32_s32` | 0142 | PASS | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0142/build/u32_div_s32_s32_alarm_0142.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u32_div_s32_s32` | 0143 | PASS | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0143/build/u32_div_s32_s32_alarm_0143.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u32_div_s32_s32` | 0144 | PASS | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0144/build/u32_div_s32_s32_alarm_0144.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u32_div_s32_s32` | 0145 | PASS | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0145/build/u32_div_s32_s32_alarm_0145.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u32_div_s32_s32` | 0146 | PASS | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0146/build/u32_div_s32_s32_alarm_0146.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u32_div_s32_s32` | 0147 | PASS | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0147/build/u32_div_s32_s32_alarm_0147.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u32_div_s32_s32` | 0148 | PASS | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0148/build/u32_div_s32_s32_alarm_0148.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |
| `u32_div_s32_s32` | 0149 | PASS | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0149/build/u32_div_s32_s32_alarm_0149.bc` | -Wshift-op-parentheses (2); -Wsign-compare (2); -Wunused-but-set-variable (1); -Wunused-variable (6) | - | NO |

## Modified build scripts

The following 36 scripts received only the source-specific policy described above:

- `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001/build_bitcode.sh`
- `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0002/build_bitcode.sh`
- `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0003/build_bitcode.sh`
- `analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0004/build_bitcode.sh`
- `analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005/build_bitcode.sh`
- `analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0006/build_bitcode.sh`
- `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0007/build_bitcode.sh`
- `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0008/build_bitcode.sh`
- `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0009/build_bitcode.sh`
- `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0010/build_bitcode.sh`
- `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0011/build_bitcode.sh`
- `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0012/build_bitcode.sh`
- `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0013/build_bitcode.sh`
- `analysis/klee_phase_c/root_u32_mul_u32_s16_fac_less1/alarm_0014/build_bitcode.sh`
- `analysis/klee_phase_c/root_u32_mul_u32_s16_fac_less1/alarm_0015/build_bitcode.sh`
- `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0016/build_bitcode.sh`
- `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0017/build_bitcode.sh`
- `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0018/build_bitcode.sh`
- `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019/build_bitcode.sh`
- `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0020/build_bitcode.sh`
- `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0021/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_s32/alarm_0109/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0110/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0111/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0114/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_u16/alarm_0117/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118/build_bitcode.sh`
- `analysis/klee_phase_c/s32_mul_u32_s32/alarm_0119/build_bitcode.sh`
- `analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125/build_bitcode.sh`

## Remaining unsafe or unresolved cases

None remain build-blocking under the current harness call graphs. The two missing-return bodies remain semantically invalid if called; they were not repaired or declared generally safe. Their exceptions are justified only because the affected current harnesses cannot reach them. A future harness or dependency change that introduces a call must remove the applicable exception or address the source defect through an independently reviewed source change.

## Validation and preservation checks

- Executed every `./build_bitcode.sh` from its alarm directory: 149/149 PASS.
- Harnesses remain strict: yes.
- Analyzed source files changed: no.
- Analysis-copy C files changed: no.
- Frozen Eva artifacts changed: no.
- Arbitrary return statements added: no.
- Global warning suppression added: no.
- Warnings remain printed: yes.
- KLEE symbolic execution performed during this task: no.
