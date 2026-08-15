# Baseline Results

## DIRECT REPOSITORY EVIDENCE

Total canonical Eva alarms: **171**.

| Category | Count |
| --- | --- |
| division by zero | 20 |
| integer overflow | 118 |
| invalid shift | 33 |

| Function | Count | Categories | Locations |
| --- | --- | --- | --- |
| `root_s32_mul_s32_s16_fac_less1` | 3 | integer overflow:1, invalid shift:2 | mul_Ccode.c:5071, mul_Ccode.c:5089, mul_Ccode.c:5090 |
| `root_s32_mul_s32_s8_fac_less1` | 3 | integer overflow:1, invalid shift:2 | mul_Ccode.c:5223, mul_Ccode.c:5241, mul_Ccode.c:5242 |
| `root_s32_mul_s32_u16_fac_less1` | 4 | integer overflow:2, invalid shift:2 | MulHword.c:47, mul_Ccode.c:5147, mul_Ccode.c:5165, mul_Ccode.c:5166 |
| `root_s32_mul_s32_u8_fac_less1` | 3 | integer overflow:1, invalid shift:2 | mul_Ccode.c:5534, mul_Ccode.c:5544, mul_Ccode.c:5545 |
| `root_u32_mul_u32_s16_fac_less1` | 2 | invalid shift:2 | mul_Ccode.c:5309, mul_Ccode.c:5310 |
| `root_u32_mul_u32_s32_fac_less1` | 4 | integer overflow:3, invalid shift:1 | MulHword.c:47, MulHword.c:49, mul_Ccode.c:5364, mul_Ccode.c:5372 |
| `root_u32_mul_u32_s8_fac_less1` | 2 | invalid shift:2 | mul_Ccode.c:5451, mul_Ccode.c:5452 |
| `rotateLeft` | 0 | none | none |
| `rotateRight` | 1 | integer overflow:1 | rotatefunc.c:119 |
| `s16_cos_u32` | 0 | none | none |
| `s16_div_s32_s16` | 25 | division by zero:6, integer overflow:17, invalid shift:2 | div_Ccode.c:274, div_Ccode.c:274, div_Ccode.c:274, div_Ccode.c:297, div_Ccode.c:297, div_Ccode.c:274, div_Ccode.c:274, div_Ccode.c:274, div_Ccode.c:274, div_Ccode.c:274, div_Ccode.c:275, div_Ccode.c:276, div_Ccode.c:276, div_Ccode.c:276, div_Ccode.c:297, div_Ccode.c:297, div_Ccode.c:297, div_Ccode.c:297, div_Ccode.c:297, div_Ccode.c:297, div_Ccode.c:298, div_Ccode.c:299, div_Ccode.c:299, div_Ccode.c:299, div_Ccode.c:299 |
| `s16_div_s32_u32` | 1 | integer overflow:1 | div_Ccode.c:1477 |
| `s16_fac05_div_s16_s16` | 11 | division by zero:3, integer overflow:6, invalid shift:2 | div_Ccode.c:190, div_Ccode.c:190, div_Ccode.c:173, div_Ccode.c:190, div_Ccode.c:190, div_Ccode.c:190, div_Ccode.c:190, div_Ccode.c:191, div_Ccode.c:192, div_Ccode.c:192, div_Ccode.c:192 |
| `s16_fac05_div_s16_u16` | 5 | integer overflow:3, invalid shift:2 | div_Ccode.c:348, div_Ccode.c:362, div_Ccode.c:363, div_Ccode.c:363, div_Ccode.c:365 |
| `s16_hip1_s16_s8_s8_u16_fac1` | 5 | integer overflow:3, invalid shift:2 | hip_Ccode.c:163, hip_Ccode.c:166, hip_Ccode.c:166, hip_Ccode.c:167, hip_Ccode.c:167 |
| `s16_hip1_s16_u8_u8_u16_fac1` | 5 | integer overflow:3, invalid shift:2 | hip_Ccode.c:49, hip_Ccode.c:52, hip_Ccode.c:52, hip_Ccode.c:53, hip_Ccode.c:53 |
| `s16_mmv_s16_s16_s16_fac1` | 0 | none | none |
| `s16_mul_s16_s16_div_s16` | 11 | division by zero:3, integer overflow:7, invalid shift:1 | div_Ccode.c:964, div_Ccode.c:964, div_Ccode.c:965, div_Ccode.c:964, div_Ccode.c:964, div_Ccode.c:964, div_Ccode.c:964, div_Ccode.c:964, div_Ccode.c:965, div_Ccode.c:965, div_Ccode.c:965 |
| `s16_mul_s16_s16_div_u16` | 7 | integer overflow:6, invalid shift:1 | div_Ccode.c:1022, div_Ccode.c:1022, div_Ccode.c:1022, div_Ccode.c:1022, div_Ccode.c:1022, div_Ccode.c:1022, div_Ccode.c:1023 |
| `s16_mul_s16_u16_div_s16` | 11 | division by zero:3, integer overflow:7, invalid shift:1 | div_Ccode.c:628, div_Ccode.c:628, div_Ccode.c:630, div_Ccode.c:628, div_Ccode.c:628, div_Ccode.c:628, div_Ccode.c:629, div_Ccode.c:629, div_Ccode.c:630, div_Ccode.c:630, div_Ccode.c:630 |
| `s16_mul_s16_u16_fac025` | 0 | none | none |
| `s16_mul_u16_s16_div_u16` | 7 | integer overflow:6, invalid shift:1 | div_Ccode.c:684, div_Ccode.c:684, div_Ccode.c:684, div_Ccode.c:684, div_Ccode.c:684, div_Ccode.c:684, div_Ccode.c:685 |
| `s16_sin_u32` | 0 | none | none |
| `s16_tan_u32` | 0 | none | none |
| `s32_div_s32_s32` | 9 | integer overflow:8, invalid shift:1 | div_Ccode.c:1394, div_Ccode.c:1395, div_Ccode.c:1410, div_Ccode.c:1413, div_Ccode.c:1426, div_Ccode.c:1429, div_Ccode.c:1434, div_Ccode.c:1434, div_Ccode.c:1434 |
| `s32_div_s32_u32` | 1 | integer overflow:1 | div_Ccode.c:1330 |
| `s32_div_u32_s32` | 1 | integer overflow:1 | div_Ccode.c:1267 |
| `s32_mul_s32_s16_fac2` | 1 | integer overflow:1 | mul_Ccode.c:1993 |
| `s32_mul_s32_s32` | 3 | integer overflow:3 | MulHword.c:47, mul_Ccode.c:2672, mul_Ccode.c:2681 |
| `s32_mul_s32_s32_fac2` | 3 | integer overflow:3 | MulHword.c:47, mul_Ccode.c:2223, mul_Ccode.c:2232 |
| `s32_mul_s32_s32_fac_twopow_u8` | 3 | integer overflow:3 | MulHword.c:47, mul_Ccode.c:2454, mul_Ccode.c:2463 |
| `s32_mul_s32_s8_fac2` | 1 | integer overflow:1 | mul_Ccode.c:2600 |
| `s32_mul_s32_u16` | 3 | division by zero:1, integer overflow:2 | mul_Ccode.c:760, mul_Ccode.c:767, mul_Ccode.c:778 |
| `s32_mul_u32_s32` | 1 | integer overflow:1 | mul_Ccode.c:1762 |
| `u16_cos_u16` | 0 | none | none |
| `u16_div_s32_u16` | 7 | integer overflow:6, invalid shift:1 | div_Ccode.c:495, div_Ccode.c:495, div_Ccode.c:495, div_Ccode.c:495, div_Ccode.c:495, div_Ccode.c:495, div_Ccode.c:496 |
| `u16_mmv_u16_u16_s16_fac1` | 1 | integer overflow:1 | avrg_Ccode.c:249 |
| `u16_mul_s16_u16_div_s16` | 11 | division by zero:3, integer overflow:7, invalid shift:1 | div_Ccode.c:740, div_Ccode.c:741, div_Ccode.c:740, div_Ccode.c:740, div_Ccode.c:740, div_Ccode.c:740, div_Ccode.c:740, div_Ccode.c:740, div_Ccode.c:741, div_Ccode.c:741, div_Ccode.c:741 |
| `u16_mul_s16_u16_div_u16` | 7 | integer overflow:6, invalid shift:1 | div_Ccode.c:795, div_Ccode.c:795, div_Ccode.c:795, div_Ccode.c:795, div_Ccode.c:795, div_Ccode.c:795, div_Ccode.c:796 |
| `u16_mul_u16_u8_fac8` | 0 | none | none |
| `u16_sin_u16` | 0 | none | none |
| `u16_tan_u16` | 0 | none | none |
| `u32_div_s32_s32` | 9 | division by zero:1, integer overflow:6, invalid shift:2 | div_Ccode.c:1168, div_Ccode.c:1168, div_Ccode.c:1168, div_Ccode.c:1182, div_Ccode.c:1183, div_Ccode.c:1184, div_Ccode.c:1184, div_Ccode.c:1184, div_Ccode.c:1184 |
| `u32_div_s32_u32` | 0 | none | none |
| `u32_div_u32_s32` | 0 | none | none |
| `u32_mmv_u32_u32_s32_fac1` | 0 | none | none |

## Complete alarm inventory

### root_s32_mul_s32_s16_fac_less1

- `src_analysis/sources/mul_Ccode.c:5071` — **integer overflow** — signed overflow. assert -value ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:5089` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ count < 32;
- `src_analysis/sources/mul_Ccode.c:5090` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ (u32)(32 - count) < 32;

### root_s32_mul_s32_s8_fac_less1

- `src_analysis/sources/mul_Ccode.c:5223` — **integer overflow** — signed overflow. assert -value ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:5241` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ count < 32;
- `src_analysis/sources/mul_Ccode.c:5242` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ (u32)(32 - count) < 32;

### root_s32_mul_s32_u16_fac_less1

- `src_analysis/sources/MulHword.c:47` — **integer overflow** — signed overflow. assert (int)arg1_LW * (int)arg2_LW ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:5147` — **integer overflow** — signed overflow. assert -value ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:5165` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ count < 32;
- `src_analysis/sources/mul_Ccode.c:5166` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ (u32)(32 - count) < 32;

### root_s32_mul_s32_u8_fac_less1

- `src_analysis/sources/mul_Ccode.c:5534` — **integer overflow** — signed overflow. assert -value ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:5544` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ count < 32;
- `src_analysis/sources/mul_Ccode.c:5545` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ (u32)(32 - count) < 32;

### root_u32_mul_u32_s16_fac_less1

- `src_analysis/sources/mul_Ccode.c:5309` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ count < 32;
- `src_analysis/sources/mul_Ccode.c:5310` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ (u32)(32 - count) < 32;

### root_u32_mul_u32_s32_fac_less1

- `src_analysis/sources/MulHword.c:47` — **integer overflow** — signed overflow. assert (int)arg1_LW * (int)arg2_LW ≤ 2147483647;
- `src_analysis/sources/MulHword.c:49` — **integer overflow** — signed overflow. assert (int)arg1_HW * (int)arg2_LW ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:5364` — **integer overflow** — signed overflow. assert -factor ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:5372` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ (u32)(count - 32) < 32;

### root_u32_mul_u32_s8_fac_less1

- `src_analysis/sources/mul_Ccode.c:5451` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ count < 32;
- `src_analysis/sources/mul_Ccode.c:5452` — **invalid shift** — invalid RHS operand for shift. assert 0 ≤ (u32)(32 - count) < 32;

### rotateLeft

No canonical Eva alarm in this mode.

### rotateRight

- `src_analysis/sources/rotatefunc.c:119` — **integer overflow** — signed overflow. assert 1 << INT_BITS ≤ 2147483647;

### s16_cos_u32

No canonical Eva alarm in this mode.

### s16_div_s32_s16

- `src_analysis/sources/div_Ccode.c:274` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator);
- `src_analysis/sources/div_Ccode.c:274` — **integer overflow** — signed overflow. assert s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:274` — **integer overflow** — signed overflow. assert s32Temp1 / (s32)denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:297` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator);
- `src_analysis/sources/div_Ccode.c:297` — **integer overflow** — signed overflow. assert s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:274` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:274` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator));
- `src_analysis/sources/div_Ccode.c:274` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:274` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:274` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(s32Temp1 / (s32)denominator) * (s32)denominator;
- `src_analysis/sources/div_Ccode.c:275` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:276` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:276` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Temp1 + (s32)(numerator / (s32)denominator);
- `src_analysis/sources/div_Ccode.c:276` — **integer overflow** — signed overflow. assert s32Temp1 + (s32)(numerator / (s32)denominator) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:297` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:297` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator));
- `src_analysis/sources/div_Ccode.c:297` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:297` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:297` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(s32Temp1 / (s32)denominator) * (s32)denominator;
- `src_analysis/sources/div_Ccode.c:297` — **integer overflow** — signed overflow. assert s32Temp1 / (s32)denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:298` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:299` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:299` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Temp1 + (s32)(numerator / (s32)denominator);
- `src_analysis/sources/div_Ccode.c:299` — **integer overflow** — signed overflow. assert numerator / (s32)denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:299` — **integer overflow** — signed overflow. assert s32Temp1 + (s32)(numerator / (s32)denominator) ≤ 2147483647;

### s16_div_s32_u32

- `src_analysis/sources/div_Ccode.c:1477` — **integer overflow** — signed overflow. assert -numerator ≤ 2147483647;

### s16_fac05_div_s16_s16

- `src_analysis/sources/div_Ccode.c:190` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(s32Temp1 / (s32)denominator) * (s32)denominator;
- `src_analysis/sources/div_Ccode.c:190` — **integer overflow** — signed overflow. assert s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:173` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (int)numerator;
- `src_analysis/sources/div_Ccode.c:190` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:190` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator));
- `src_analysis/sources/div_Ccode.c:190` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:190` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:191` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:192` — **division by zero** — division by zero. assert (int)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:192` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator));
- `src_analysis/sources/div_Ccode.c:192` — **integer overflow** — signed overflow. assert s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator)) ≤ 2147483647;

### s16_fac05_div_s16_u16

- `src_analysis/sources/div_Ccode.c:348` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (int)numerator;
- `src_analysis/sources/div_Ccode.c:362` — **integer overflow** — signed overflow. assert (int)((int)((int)numerator << 16) / (int)u16Temp1) * (int)u16Temp1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:363` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ s32Temp1;
- `src_analysis/sources/div_Ccode.c:363` — **integer overflow** — signed overflow. assert s32Temp1 << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:365` — **integer overflow** — signed overflow. assert (s32)((int)((int)((int)numerator << 16) / (int)u16Temp1)) + s32Temp1 ≤ 2147483647;

### s16_hip1_s16_s8_s8_u16_fac1

- `src_analysis/sources/hip_Ccode.c:163` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (int)((int)u - (int)uold);
- `src_analysis/sources/hip_Ccode.c:166` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Temp1 - s32Temp2;
- `src_analysis/sources/hip_Ccode.c:166` — **integer overflow** — signed overflow. assert s32Temp1 - s32Temp2 ≤ 2147483647;
- `src_analysis/sources/hip_Ccode.c:167` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ s32Temp2;
- `src_analysis/sources/hip_Ccode.c:167` — **integer overflow** — signed overflow. assert s32Temp2 << 1 ≤ 2147483647;

### s16_hip1_s16_u8_u8_u16_fac1

- `src_analysis/sources/hip_Ccode.c:49` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (int)((int)u - (int)uold);
- `src_analysis/sources/hip_Ccode.c:52` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Temp1 - s32Temp2;
- `src_analysis/sources/hip_Ccode.c:52` — **integer overflow** — signed overflow. assert s32Temp1 - s32Temp2 ≤ 2147483647;
- `src_analysis/sources/hip_Ccode.c:53` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ s32Temp2;
- `src_analysis/sources/hip_Ccode.c:53` — **integer overflow** — signed overflow. assert s32Temp2 << 1 ≤ 2147483647;

### s16_mmv_s16_s16_s16_fac1

No canonical Eva alarm in this mode.

### s16_mul_s16_s16_div_s16

- `src_analysis/sources/div_Ccode.c:964` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div);
- `src_analysis/sources/div_Ccode.c:964` — **integer overflow** — signed overflow. assert s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:965` — **division by zero** — division by zero. assert (s32)div ≢ 0;
- `src_analysis/sources/div_Ccode.c:964` — **division by zero** — division by zero. assert (s32)div ≢ 0;
- `src_analysis/sources/div_Ccode.c:964` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div));
- `src_analysis/sources/div_Ccode.c:964` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)) << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:964` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 / (s32)div) * (s32)div ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:964` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(s32Temp1 / (s32)div) * (s32)div;
- `src_analysis/sources/div_Ccode.c:965` — **division by zero** — division by zero. assert (s32)div ≢ 0;
- `src_analysis/sources/div_Ccode.c:965` — **integer overflow** — signed overflow. assert (s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:965` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div);

### s16_mul_s16_s16_div_u16

- `src_analysis/sources/div_Ccode.c:1022` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);
- `src_analysis/sources/div_Ccode.c:1022` — **integer overflow** — signed overflow. assert s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1022` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));
- `src_analysis/sources/div_Ccode.c:1022` — **integer overflow** — signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1022` — **integer overflow** — signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1022` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(s32Result / (s32)denominator) * (s32)denominator;
- `src_analysis/sources/div_Ccode.c:1023` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) ≤ 2147483647;

### s16_mul_s16_u16_div_s16

- `src_analysis/sources/div_Ccode.c:628` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);
- `src_analysis/sources/div_Ccode.c:628` — **integer overflow** — signed overflow. assert s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:630` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:628` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:628` — **integer overflow** — signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:628` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(s32Result / (s32)denominator) * (s32)denominator;
- `src_analysis/sources/div_Ccode.c:629` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ s32Temp1;
- `src_analysis/sources/div_Ccode.c:629` — **integer overflow** — signed overflow. assert s32Temp1 << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:630` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:630` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:630` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator);

### s16_mul_s16_u16_fac025

No canonical Eva alarm in this mode.

### s16_mul_u16_s16_div_u16

- `src_analysis/sources/div_Ccode.c:684` — **integer overflow** — signed overflow. assert s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:684` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));
- `src_analysis/sources/div_Ccode.c:684` — **integer overflow** — signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:684` — **integer overflow** — signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:684` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(s32Result / (s32)denominator) * (s32)denominator;
- `src_analysis/sources/div_Ccode.c:684` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);
- `src_analysis/sources/div_Ccode.c:685` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) ≤ 2147483647;

### s16_sin_u32

No canonical Eva alarm in this mode.

### s16_tan_u32

No canonical Eva alarm in this mode.

### s32_div_s32_s32

- `src_analysis/sources/div_Ccode.c:1394` — **integer overflow** — signed overflow. assert -numerator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1395` — **integer overflow** — signed overflow. assert -denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1410` — **integer overflow** — signed overflow. assert (s32)(~numerator) + 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1413` — **integer overflow** — signed overflow. assert (s32)(~s32Temp2) + 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1426` — **integer overflow** — signed overflow. assert (s32)(~denominator) + 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1429` — **integer overflow** — signed overflow. assert (s32)(~s32Temp2) + 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1434` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator));
- `src_analysis/sources/div_Ccode.c:1434` — **integer overflow** — signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1434` — **integer overflow** — signed overflow. assert (s32)(numerator / denominator) * denominator ≤ 2147483647;

### s32_div_s32_u32

- `src_analysis/sources/div_Ccode.c:1330` — **integer overflow** — signed overflow. assert -numerator ≤ 2147483647;

### s32_div_u32_s32

- `src_analysis/sources/div_Ccode.c:1267` — **integer overflow** — signed overflow. assert -denominator ≤ 2147483647;

### s32_mul_s32_s16_fac2

- `src_analysis/sources/mul_Ccode.c:1993` — **integer overflow** — signed overflow. assert -val1 ≤ 2147483647;

### s32_mul_s32_s32

- `src_analysis/sources/MulHword.c:47` — **integer overflow** — signed overflow. assert (int)arg1_LW * (int)arg2_LW ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:2672` — **integer overflow** — signed overflow. assert -val1 ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:2681` — **integer overflow** — signed overflow. assert -val2 ≤ 2147483647;

### s32_mul_s32_s32_fac2

- `src_analysis/sources/MulHword.c:47` — **integer overflow** — signed overflow. assert (int)arg1_LW * (int)arg2_LW ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:2223` — **integer overflow** — signed overflow. assert -value ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:2232` — **integer overflow** — signed overflow. assert -factor ≤ 2147483647;

### s32_mul_s32_s32_fac_twopow_u8

- `src_analysis/sources/MulHword.c:47` — **integer overflow** — signed overflow. assert (int)arg1_LW * (int)arg2_LW ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:2454` — **integer overflow** — signed overflow. assert -value ≤ 2147483647;
- `src_analysis/sources/mul_Ccode.c:2463` — **integer overflow** — signed overflow. assert -factor ≤ 2147483647;

### s32_mul_s32_s8_fac2

- `src_analysis/sources/mul_Ccode.c:2600` — **integer overflow** — signed overflow. assert -value ≤ 2147483647;

### s32_mul_s32_u16

- `src_analysis/sources/mul_Ccode.c:760` — **division by zero** — division by zero. assert s32Factor ≢ 0;
- `src_analysis/sources/mul_Ccode.c:767` — **integer overflow** — signed overflow. assert -2147483648 ≤ value * (s32)factor;
- `src_analysis/sources/mul_Ccode.c:778` — **integer overflow** — signed overflow. assert value * (s32)factor ≤ 2147483647;

### s32_mul_u32_s32

- `src_analysis/sources/mul_Ccode.c:1762` — **integer overflow** — signed overflow. assert -val2 ≤ 2147483647;

### u16_cos_u16

No canonical Eva alarm in this mode.

### u16_div_s32_u16

- `src_analysis/sources/div_Ccode.c:495` — **integer overflow** — signed overflow. assert -2147483648 ≤ x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value);
- `src_analysis/sources/div_Ccode.c:495` — **integer overflow** — signed overflow. assert x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:495` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value));
- `src_analysis/sources/div_Ccode.c:495` — **integer overflow** — signed overflow. assert (s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)) << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:495` — **integer overflow** — signed overflow. assert (s32)(x_value / (s32)y_value) * (s32)y_value ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:495` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(x_value / (s32)y_value) * (s32)y_value;
- `src_analysis/sources/div_Ccode.c:496` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 / (s32)y_value) + (s32)(x_value / (s32)y_value) ≤ 2147483647;

### u16_mmv_u16_u16_s16_fac1

- `src_analysis/sources/avrg_Ccode.c:249` — **integer overflow** — signed overflow. assert -s32mmv ≤ 2147483647;

### u16_mul_s16_u16_div_s16

- `src_analysis/sources/div_Ccode.c:740` — **integer overflow** — signed overflow. assert s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:741` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:740` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:740` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));
- `src_analysis/sources/div_Ccode.c:740` — **integer overflow** — signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:740` — **integer overflow** — signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:740` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(s32Result / (s32)denominator) * (s32)denominator;
- `src_analysis/sources/div_Ccode.c:740` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);
- `src_analysis/sources/div_Ccode.c:741` — **division by zero** — division by zero. assert (s32)denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:741` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:741` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator);

### u16_mul_s16_u16_div_u16

- `src_analysis/sources/div_Ccode.c:795` — **integer overflow** — signed overflow. assert s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator) ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:795` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));
- `src_analysis/sources/div_Ccode.c:795` — **integer overflow** — signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:795` — **integer overflow** — signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:795` — **integer overflow** — signed overflow. assert -2147483648 ≤ (s32)(s32Result / (s32)denominator) * (s32)denominator;
- `src_analysis/sources/div_Ccode.c:795` — **integer overflow** — signed overflow. assert -2147483648 ≤ s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);
- `src_analysis/sources/div_Ccode.c:796` — **integer overflow** — signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) ≤ 2147483647;

### u16_mul_u16_u8_fac8

No canonical Eva alarm in this mode.

### u16_sin_u16

No canonical Eva alarm in this mode.

### u16_tan_u16

No canonical Eva alarm in this mode.

### u32_div_s32_s32

- `src_analysis/sources/div_Ccode.c:1168` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator));
- `src_analysis/sources/div_Ccode.c:1168` — **integer overflow** — signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1168` — **integer overflow** — signed overflow. assert (s32)(numerator / denominator) * denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1182` — **integer overflow** — signed overflow. assert -numerator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1183` — **integer overflow** — signed overflow. assert -denominator ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1184` — **division by zero** — division by zero. assert denominator ≢ 0;
- `src_analysis/sources/div_Ccode.c:1184` — **invalid shift** — invalid LHS operand for left shift. assert 0 ≤ (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator));
- `src_analysis/sources/div_Ccode.c:1184` — **integer overflow** — signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 ≤ 2147483647;
- `src_analysis/sources/div_Ccode.c:1184` — **integer overflow** — signed overflow. assert (s32)(numerator / denominator) * denominator ≤ 2147483647;

### u32_div_s32_u32

No canonical Eva alarm in this mode.

### u32_div_u32_s32

No canonical Eva alarm in this mode.

### u32_mmv_u32_u32_s32_fac1

No canonical Eva alarm in this mode.
