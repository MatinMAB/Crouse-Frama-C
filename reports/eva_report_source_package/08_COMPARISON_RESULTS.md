# Baseline versus High Precision Comparison Results

## DIRECT REPOSITORY EVIDENCE

The comparator preserves alarm multiplicity and matches normalized source path, line, and message. All 46 per-function invariants pass.

| Function | Baseline | High Precision | Delta | Removed | Remaining | New | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `root_s32_mul_s32_s16_fac_less1` | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| `root_s32_mul_s32_s8_fac_less1` | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| `root_s32_mul_s32_u16_fac_less1` | 4 | 4 | 0 | 0 | 4 | 0 | UNCHANGED |
| `root_s32_mul_s32_u8_fac_less1` | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| `root_u32_mul_u32_s16_fac_less1` | 2 | 2 | 0 | 0 | 2 | 0 | UNCHANGED |
| `root_u32_mul_u32_s32_fac_less1` | 4 | 4 | 0 | 0 | 4 | 0 | UNCHANGED |
| `root_u32_mul_u32_s8_fac_less1` | 2 | 2 | 0 | 0 | 2 | 0 | UNCHANGED |
| `rotateLeft` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `rotateRight` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `s16_cos_u32` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `s16_div_s32_s16` | 25 | 20 | -5 | 5 | 20 | 0 | REDUCED |
| `s16_div_s32_u32` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `s16_fac05_div_s16_s16` | 11 | 9 | -2 | 2 | 9 | 0 | REDUCED |
| `s16_fac05_div_s16_u16` | 5 | 5 | 0 | 0 | 5 | 0 | UNCHANGED |
| `s16_hip1_s16_s8_s8_u16_fac1` | 5 | 5 | 0 | 0 | 5 | 0 | UNCHANGED |
| `s16_hip1_s16_u8_u8_u16_fac1` | 5 | 5 | 0 | 0 | 5 | 0 | UNCHANGED |
| `s16_mmv_s16_s16_s16_fac1` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `s16_mul_s16_s16_div_s16` | 11 | 8 | -3 | 3 | 8 | 0 | REDUCED |
| `s16_mul_s16_s16_div_u16` | 7 | 5 | -2 | 2 | 5 | 0 | REDUCED |
| `s16_mul_s16_u16_div_s16` | 11 | 8 | -3 | 3 | 8 | 0 | REDUCED |
| `s16_mul_s16_u16_fac025` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `s16_mul_u16_s16_div_u16` | 7 | 6 | -1 | 1 | 6 | 0 | REDUCED |
| `s16_sin_u32` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `s16_tan_u32` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `s32_div_s32_s32` | 9 | 9 | 0 | 0 | 9 | 0 | UNCHANGED |
| `s32_div_s32_u32` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `s32_div_u32_s32` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `s32_mul_s32_s16_fac2` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `s32_mul_s32_s32` | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| `s32_mul_s32_s32_fac2` | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| `s32_mul_s32_s32_fac_twopow_u8` | 3 | 3 | 0 | 0 | 3 | 0 | UNCHANGED |
| `s32_mul_s32_s8_fac2` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `s32_mul_s32_u16` | 3 | 2 | -1 | 1 | 2 | 0 | REDUCED |
| `s32_mul_u32_s32` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `u16_cos_u16` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `u16_div_s32_u16` | 7 | 5 | -2 | 2 | 5 | 0 | REDUCED |
| `u16_mmv_u16_u16_s16_fac1` | 1 | 1 | 0 | 0 | 1 | 0 | UNCHANGED |
| `u16_mul_s16_u16_div_s16` | 11 | 9 | -2 | 2 | 9 | 0 | REDUCED |
| `u16_mul_s16_u16_div_u16` | 7 | 6 | -1 | 1 | 6 | 0 | REDUCED |
| `u16_mul_u16_u8_fac8` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `u16_sin_u16` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `u16_tan_u16` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `u32_div_s32_s32` | 9 | 9 | 0 | 0 | 9 | 0 | UNCHANGED |
| `u32_div_s32_u32` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `u32_div_u32_s32` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |
| `u32_mmv_u32_u32_s32_fac1` | 0 | 0 | 0 | 0 | 0 | 0 | UNCHANGED |

## Category comparison

| Category | Baseline | High | Removed | Remaining | New | Delta | Reduction |
| --- | --- | --- | --- | --- | --- | --- | --- |
| division by zero | 20 | 16 | 4 | 16 | 0 | -4 | 20.00% |
| integer overflow | 118 | 100 | 18 | 100 | 0 | -18 | 15.25% |
| invalid shift | 33 | 33 | 0 | 33 | 0 | 0 | 0.00% |

## Reduced functions

### s16_div_s32_s16

Baseline 25; High Precision 20; removed 5.
- Removed locations: `div_Ccode.c:274` (integer overflow), `div_Ccode.c:274` (integer overflow), `div_Ccode.c:274` (integer overflow), `div_Ccode.c:297` (integer overflow), `div_Ccode.c:297` (integer overflow)
- Primary mechanisms: BRANCH_PARTITIONING, NONLINEAR_SUBDIVISION
- Confidence: MEDIUM

### s16_fac05_div_s16_s16

Baseline 11; High Precision 9; removed 2.
- Removed locations: `div_Ccode.c:190` (integer overflow), `div_Ccode.c:190` (integer overflow)
- Primary mechanisms: NONLINEAR_SUBDIVISION
- Confidence: MEDIUM

### s16_mul_s16_s16_div_s16

Baseline 11; High Precision 8; removed 3.
- Removed locations: `div_Ccode.c:964` (integer overflow), `div_Ccode.c:964` (integer overflow), `div_Ccode.c:965` (division by zero)
- Primary mechanisms: BRANCH_PARTITIONING, NONLINEAR_SUBDIVISION
- Confidence: MEDIUM

### s16_mul_s16_s16_div_u16

Baseline 7; High Precision 5; removed 2.
- Removed locations: `div_Ccode.c:1022` (integer overflow), `div_Ccode.c:1022` (integer overflow)
- Primary mechanisms: NONLINEAR_SUBDIVISION
- Confidence: MEDIUM

### s16_mul_s16_u16_div_s16

Baseline 11; High Precision 8; removed 3.
- Removed locations: `div_Ccode.c:628` (integer overflow), `div_Ccode.c:628` (integer overflow), `div_Ccode.c:630` (division by zero)
- Primary mechanisms: BRANCH_PARTITIONING, NONLINEAR_SUBDIVISION
- Confidence: MEDIUM

### s16_mul_u16_s16_div_u16

Baseline 7; High Precision 6; removed 1.
- Removed locations: `div_Ccode.c:684` (integer overflow)
- Primary mechanisms: NONLINEAR_SUBDIVISION
- Confidence: MEDIUM

### s32_mul_s32_u16

Baseline 3; High Precision 2; removed 1.
- Removed locations: `mul_Ccode.c:760` (division by zero)
- Primary mechanisms: EQUALITY_RELATION
- Confidence: HIGH

### u16_div_s32_u16

Baseline 7; High Precision 5; removed 2.
- Removed locations: `div_Ccode.c:495` (integer overflow), `div_Ccode.c:495` (integer overflow)
- Primary mechanisms: NONLINEAR_SUBDIVISION
- Confidence: MEDIUM

### u16_mul_s16_u16_div_s16

Baseline 11; High Precision 9; removed 2.
- Removed locations: `div_Ccode.c:740` (integer overflow), `div_Ccode.c:741` (division by zero)
- Primary mechanisms: BRANCH_PARTITIONING, NONLINEAR_SUBDIVISION
- Confidence: MEDIUM

### u16_mul_s16_u16_div_u16

Baseline 7; High Precision 6; removed 1.
- Removed locations: `div_Ccode.c:795` (integer overflow)
- Primary mechanisms: NONLINEAR_SUBDIVISION
- Confidence: MEDIUM

## TECHNICAL INTERPRETATION

The count reduction is concentrated in dependent division/multiplication/remainder expressions and in guarded divisors. Individual feature contributions cannot be isolated because the High Precision profile changed as a unit.

## Zero-alarm population

The same 13 functions have zero canonical Eva alarms in both modes:

| Function | Active-source observation |
| --- | --- |
| `rotateLeft` | active rotation/bitwise implementation; no canonical marker in either log |
| `s16_cos_u32` | active body is empty and non-void; separate missing-return evidence is not part of the numeric alarm count |
| `s16_mmv_s16_s16_s16_fac1` | active MMV difference/scaling/limiting arithmetic; zero in both modes |
| `s16_mul_s16_u16_fac025` | active fixed-point multiplication/scaling implementation; zero in both modes |
| `s16_sin_u32` | active body is empty and non-void; separate missing-return evidence is kept distinct |
| `s16_tan_u32` | internal fragment is commented and active body is empty; separate missing-return evidence is distinct |
| `u16_cos_u16` | active body is empty and non-void; separate missing-return evidence is distinct |
| `u16_mul_u16_u8_fac8` | active fixed-width multiply/scaling implementation; zero in both modes |
| `u16_sin_u16` | active loop/table/shift implementation; zero in both modes |
| `u16_tan_u16` | active body is empty and non-void; separate missing-return evidence is distinct |
| `u32_div_s32_u32` | active division/guard implementation; zero in both modes |
| `u32_div_u32_s32` | active division/guard implementation; zero in both modes |
| `u32_mmv_u32_u32_s32_fac1` | active MMV arithmetic implementation; zero in both modes |

DIRECT REPOSITORY EVIDENCE is limited to source structure and log counts. Zero canonical alarm does not merge or erase kernel diagnostics and internal properties.

## Target final-state comparison

The frozen table contains 43 `IDENTICAL` and three `CHANGED` target final states.

### `s16_hip1_s16_s8_s8_u16_fac1`

```diff
-s32Temp1 ∈ [-2147450880..2147385345]
+s32Temp1 ∈ [-2147418112..2147385345]
```

Other printed target locals in the comparison block are unchanged. No helper final-state block is present.

### `s16_hip1_s16_u8_u8_u16_fac1`

```diff
-s32Temp1 ∈ [-2147450880..2147385345]
+s32Temp1 ∈ [-2147418112..2147385345]
```

Other printed target locals in the comparison block are unchanged. No helper final-state block is present.

### `u16_sin_u16`

```diff
-Phi ∈ {0; 1; 3; 5; 10; 20; 41}
-u32R30 ∈ [--..--]
-u32R31 ∈ [--..--]
-s32Tabmem ∈ [-41..40]
-Phi1 ∈ [--..--]
-__retres ∈ [--..--]
+Phi ∈ {0; 1}
+u32R30 ∈ [291072128..292164614]
+u32R31 ∈ [188369554..771722789]
+s32Tabmem ∈ {-2; -1; 0; 1}
+Phi1 ∈ [0..771722789]
+__retres ∈ [0..47102]
```

TECHNICAL INTERPRETATION: these textual changes show that state precision can change without an alarm-count transition. Printed end states remain only a projection of Eva's internal information.
