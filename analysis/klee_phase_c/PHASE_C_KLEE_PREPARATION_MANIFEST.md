# Phase C KLEE preparation manifest

Sources of truth:

- `analysis/high_precision/manifest.tsv` (the frozen 46-function population)
- `analysis/eva_precision_study_final/final_function_summary.tsv` (including
  the 13 functions with zero High Precision alarms)
- `analysis/klee_phase_b/data/klee_alarm_targets.tsv` (all 149 frozen
  `HIGH_PRECISION / REMAINING` alarm occurrences)

| Function | Alarm ID | Source location | Alarm kind | Target operation | Directory | Status |
|---|---|---|---|---|---|---|
| `root_s32_mul_s32_s16_fac_less1` | `KLEE-ALARM-0001` | `src_analysis/sources/mul_Ccode.c:5071` | integer overflow | `-value` | `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001` | PREPARED |
| `root_s32_mul_s32_s16_fac_less1` | `KLEE-ALARM-0002` | `src_analysis/sources/mul_Ccode.c:5089` | invalid shift | `u32Temp3 >> count` | `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0002` | PREPARED |
| `root_s32_mul_s32_s16_fac_less1` | `KLEE-ALARM-0003` | `src_analysis/sources/mul_Ccode.c:5090` | invalid shift | `u32Temp4 << (32-count)` | `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0003` | PREPARED |
| `root_s32_mul_s32_s8_fac_less1` | `KLEE-ALARM-0004` | `src_analysis/sources/mul_Ccode.c:5223` | integer overflow | `-value` | `analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0004` | PREPARED |
| `root_s32_mul_s32_s8_fac_less1` | `KLEE-ALARM-0005` | `src_analysis/sources/mul_Ccode.c:5241` | invalid shift | `u32Temp3 >> count` | `analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005` | PREPARED |
| `root_s32_mul_s32_s8_fac_less1` | `KLEE-ALARM-0006` | `src_analysis/sources/mul_Ccode.c:5242` | invalid shift | `u32Temp4 << (32-count)` | `analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0006` | PREPARED |
| `root_s32_mul_s32_u16_fac_less1` | `KLEE-ALARM-0007` | `src_analysis/sources/MulHword.c:47` | integer overflow | `(int)arg1_LW * (int)arg2_LW` | `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0007` | PREPARED |
| `root_s32_mul_s32_u16_fac_less1` | `KLEE-ALARM-0008` | `src_analysis/sources/mul_Ccode.c:5147` | integer overflow | `-value` | `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0008` | PREPARED |
| `root_s32_mul_s32_u16_fac_less1` | `KLEE-ALARM-0009` | `src_analysis/sources/mul_Ccode.c:5165` | invalid shift | `u32Temp3 >> count` | `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0009` | PREPARED |
| `root_s32_mul_s32_u16_fac_less1` | `KLEE-ALARM-0010` | `src_analysis/sources/mul_Ccode.c:5166` | invalid shift | `u32Temp4 << (32-count)` | `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0010` | PREPARED |
| `root_s32_mul_s32_u8_fac_less1` | `KLEE-ALARM-0011` | `src_analysis/sources/mul_Ccode.c:5534` | integer overflow | `-value` | `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0011` | PREPARED |
| `root_s32_mul_s32_u8_fac_less1` | `KLEE-ALARM-0012` | `src_analysis/sources/mul_Ccode.c:5544` | invalid shift | `u32Temp2 >> count` | `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0012` | PREPARED |
| `root_s32_mul_s32_u8_fac_less1` | `KLEE-ALARM-0013` | `src_analysis/sources/mul_Ccode.c:5545` | invalid shift | `u32Temp3 << (32-count)` | `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0013` | PREPARED |
| `root_u32_mul_u32_s16_fac_less1` | `KLEE-ALARM-0014` | `src_analysis/sources/mul_Ccode.c:5309` | invalid shift | `u32Temp2 >> count` | `analysis/klee_phase_c/root_u32_mul_u32_s16_fac_less1/alarm_0014` | PREPARED |
| `root_u32_mul_u32_s16_fac_less1` | `KLEE-ALARM-0015` | `src_analysis/sources/mul_Ccode.c:5310` | invalid shift | `u32Temp3 << (32-count)` | `analysis/klee_phase_c/root_u32_mul_u32_s16_fac_less1/alarm_0015` | PREPARED |
| `root_u32_mul_u32_s32_fac_less1` | `KLEE-ALARM-0016` | `src_analysis/sources/MulHword.c:47` | integer overflow | `(int)arg1_LW * (int)arg2_LW` | `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0016` | PREPARED |
| `root_u32_mul_u32_s32_fac_less1` | `KLEE-ALARM-0017` | `src_analysis/sources/MulHword.c:49` | integer overflow | `(int)arg1_HW * (int)arg2_LW` | `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0017` | PREPARED |
| `root_u32_mul_u32_s32_fac_less1` | `KLEE-ALARM-0018` | `src_analysis/sources/mul_Ccode.c:5364` | integer overflow | `-factor` | `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0018` | PREPARED |
| `root_u32_mul_u32_s32_fac_less1` | `KLEE-ALARM-0019` | `src_analysis/sources/mul_Ccode.c:5372` | invalid shift | `u32Temp2 >> (count-32)` | `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019` | PREPARED |
| `root_u32_mul_u32_s8_fac_less1` | `KLEE-ALARM-0020` | `src_analysis/sources/mul_Ccode.c:5451` | invalid shift | `u32Temp2 >> count` | `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0020` | PREPARED |
| `root_u32_mul_u32_s8_fac_less1` | `KLEE-ALARM-0021` | `src_analysis/sources/mul_Ccode.c:5452` | invalid shift | `u32Temp3 << (32-count)` | `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0021` | PREPARED |
| `rotateRight` | `KLEE-ALARM-0022` | `src_analysis/sources/rotatefunc.c:119` | integer overflow | `1 << INT_BITS` | `analysis/klee_phase_c/rotateRight/alarm_0022` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0023` | `src_analysis/sources/div_Ccode.c:274` | division by zero | `s32Temp1 / denominator` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0023` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0024` | `src_analysis/sources/div_Ccode.c:274` | invalid shift | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0024` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0025` | `src_analysis/sources/div_Ccode.c:274` | integer overflow | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0025` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0026` | `src_analysis/sources/div_Ccode.c:274` | integer overflow | `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0026` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0027` | `src_analysis/sources/div_Ccode.c:274` | integer overflow | `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0027` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0028` | `src_analysis/sources/div_Ccode.c:275` | division by zero | `s32Temp2 / denominator` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0028` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0029` | `src_analysis/sources/div_Ccode.c:276` | division by zero | `(numerator) / denominator` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0029` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0030` | `src_analysis/sources/div_Ccode.c:276` | integer overflow | `s32Temp1 + (s32)(numerator / (s32)denominator)` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0030` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0031` | `src_analysis/sources/div_Ccode.c:276` | integer overflow | `s32Temp1 + (s32)(numerator / (s32)denominator)` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0031` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0032` | `src_analysis/sources/div_Ccode.c:297` | division by zero | `s32Temp1 / denominator` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0032` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0033` | `src_analysis/sources/div_Ccode.c:297` | invalid shift | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0033` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0034` | `src_analysis/sources/div_Ccode.c:297` | integer overflow | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0034` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0035` | `src_analysis/sources/div_Ccode.c:297` | integer overflow | `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0035` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0036` | `src_analysis/sources/div_Ccode.c:297` | integer overflow | `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0036` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0037` | `src_analysis/sources/div_Ccode.c:297` | integer overflow | `s32Temp1 / (s32)denominator` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0037` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0038` | `src_analysis/sources/div_Ccode.c:298` | division by zero | `s32Temp2 / denominator` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0038` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0039` | `src_analysis/sources/div_Ccode.c:299` | division by zero | `(numerator) / denominator` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0039` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0040` | `src_analysis/sources/div_Ccode.c:299` | integer overflow | `s32Temp1 + (s32)(numerator / (s32)denominator)` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0040` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0041` | `src_analysis/sources/div_Ccode.c:299` | integer overflow | `numerator / (s32)denominator` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0041` | PREPARED |
| `s16_div_s32_s16` | `KLEE-ALARM-0042` | `src_analysis/sources/div_Ccode.c:299` | integer overflow | `s32Temp1 + (s32)(numerator / (s32)denominator)` | `analysis/klee_phase_c/s16_div_s32_s16/alarm_0042` | PREPARED |
| `s16_div_s32_u32` | `KLEE-ALARM-0043` | `src_analysis/sources/div_Ccode.c:1477` | integer overflow | `-numerator` | `analysis/klee_phase_c/s16_div_s32_u32/alarm_0043` | PREPARED |
| `s16_fac05_div_s16_s16` | `KLEE-ALARM-0044` | `src_analysis/sources/div_Ccode.c:173` | invalid shift | `(int)numerator << 16` | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0044` | PREPARED |
| `s16_fac05_div_s16_s16` | `KLEE-ALARM-0045` | `src_analysis/sources/div_Ccode.c:190` | division by zero | `s32Temp1 / denominator` | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0045` | PREPARED |
| `s16_fac05_div_s16_s16` | `KLEE-ALARM-0046` | `src_analysis/sources/div_Ccode.c:190` | invalid shift | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0046` | PREPARED |
| `s16_fac05_div_s16_s16` | `KLEE-ALARM-0047` | `src_analysis/sources/div_Ccode.c:190` | integer overflow | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0047` | PREPARED |
| `s16_fac05_div_s16_s16` | `KLEE-ALARM-0048` | `src_analysis/sources/div_Ccode.c:190` | integer overflow | `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0048` | PREPARED |
| `s16_fac05_div_s16_s16` | `KLEE-ALARM-0049` | `src_analysis/sources/div_Ccode.c:191` | division by zero | `s32Temp2 / denominator` | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0049` | PREPARED |
| `s16_fac05_div_s16_s16` | `KLEE-ALARM-0050` | `src_analysis/sources/div_Ccode.c:192` | division by zero | `(numerator<<16) / denominator` | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0050` | PREPARED |
| `s16_fac05_div_s16_s16` | `KLEE-ALARM-0051` | `src_analysis/sources/div_Ccode.c:192` | integer overflow | `s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator))` | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0051` | PREPARED |
| `s16_fac05_div_s16_s16` | `KLEE-ALARM-0052` | `src_analysis/sources/div_Ccode.c:192` | integer overflow | `s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator))` | `analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0052` | PREPARED |
| `s16_fac05_div_s16_u16` | `KLEE-ALARM-0053` | `src_analysis/sources/div_Ccode.c:348` | invalid shift | `(int)numerator << 16` | `analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053` | PREPARED |
| `s16_fac05_div_s16_u16` | `KLEE-ALARM-0054` | `src_analysis/sources/div_Ccode.c:362` | integer overflow | `(int)((int)((int)numerator << 16) / (int)u16Temp1) * (int)u16Temp1` | `analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0054` | PREPARED |
| `s16_fac05_div_s16_u16` | `KLEE-ALARM-0055` | `src_analysis/sources/div_Ccode.c:363` | invalid shift | `s32Temp1 << 1` | `analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0055` | PREPARED |
| `s16_fac05_div_s16_u16` | `KLEE-ALARM-0056` | `src_analysis/sources/div_Ccode.c:363` | integer overflow | `s32Temp1 << 1` | `analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0056` | PREPARED |
| `s16_fac05_div_s16_u16` | `KLEE-ALARM-0057` | `src_analysis/sources/div_Ccode.c:365` | integer overflow | `(s32)((int)((int)((int)numerator << 16) / (int)u16Temp1)) + s32Temp1` | `analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0057` | PREPARED |
| `s16_hip1_s16_s8_s8_u16_fac1` | `KLEE-ALARM-0058` | `src_analysis/sources/hip_Ccode.c:163` | invalid shift | `(int)((int)u - (int)uold) << 7` | `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0058` | PREPARED |
| `s16_hip1_s16_s8_s8_u16_fac1` | `KLEE-ALARM-0059` | `src_analysis/sources/hip_Ccode.c:166` | integer overflow | `s32Temp1 - s32Temp2` | `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0059` | PREPARED |
| `s16_hip1_s16_s8_s8_u16_fac1` | `KLEE-ALARM-0060` | `src_analysis/sources/hip_Ccode.c:166` | integer overflow | `s32Temp1 - s32Temp2` | `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0060` | PREPARED |
| `s16_hip1_s16_s8_s8_u16_fac1` | `KLEE-ALARM-0061` | `src_analysis/sources/hip_Ccode.c:167` | invalid shift | `s32Temp2 << 1` | `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0061` | PREPARED |
| `s16_hip1_s16_s8_s8_u16_fac1` | `KLEE-ALARM-0062` | `src_analysis/sources/hip_Ccode.c:167` | integer overflow | `s32Temp2 << 1` | `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0062` | PREPARED |
| `s16_hip1_s16_u8_u8_u16_fac1` | `KLEE-ALARM-0063` | `src_analysis/sources/hip_Ccode.c:49` | invalid shift | `(int)((int)u - (int)uold) << 7` | `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0063` | PREPARED |
| `s16_hip1_s16_u8_u8_u16_fac1` | `KLEE-ALARM-0064` | `src_analysis/sources/hip_Ccode.c:52` | integer overflow | `s32Temp1 - s32Temp2` | `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0064` | PREPARED |
| `s16_hip1_s16_u8_u8_u16_fac1` | `KLEE-ALARM-0065` | `src_analysis/sources/hip_Ccode.c:52` | integer overflow | `s32Temp1 - s32Temp2` | `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0065` | PREPARED |
| `s16_hip1_s16_u8_u8_u16_fac1` | `KLEE-ALARM-0066` | `src_analysis/sources/hip_Ccode.c:53` | invalid shift | `s32Temp2 << 1` | `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066` | PREPARED |
| `s16_hip1_s16_u8_u8_u16_fac1` | `KLEE-ALARM-0067` | `src_analysis/sources/hip_Ccode.c:53` | integer overflow | `s32Temp2 << 1` | `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0067` | PREPARED |
| `s16_mul_s16_s16_div_s16` | `KLEE-ALARM-0068` | `src_analysis/sources/div_Ccode.c:964` | division by zero | `s32Temp1 / div` | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0068` | PREPARED |
| `s16_mul_s16_s16_div_s16` | `KLEE-ALARM-0069` | `src_analysis/sources/div_Ccode.c:964` | invalid shift | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)) << 1` | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0069` | PREPARED |
| `s16_mul_s16_s16_div_s16` | `KLEE-ALARM-0070` | `src_analysis/sources/div_Ccode.c:964` | integer overflow | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)) << 1` | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0070` | PREPARED |
| `s16_mul_s16_s16_div_s16` | `KLEE-ALARM-0071` | `src_analysis/sources/div_Ccode.c:964` | integer overflow | `(s32)(s32Temp1 / (s32)div) * (s32)div` | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0071` | PREPARED |
| `s16_mul_s16_s16_div_s16` | `KLEE-ALARM-0072` | `src_analysis/sources/div_Ccode.c:964` | integer overflow | `(s32)(s32Temp1 / (s32)div) * (s32)div` | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0072` | PREPARED |
| `s16_mul_s16_s16_div_s16` | `KLEE-ALARM-0073` | `src_analysis/sources/div_Ccode.c:965` | division by zero | `s32Temp1 / div` | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0073` | PREPARED |
| `s16_mul_s16_s16_div_s16` | `KLEE-ALARM-0074` | `src_analysis/sources/div_Ccode.c:965` | integer overflow | `(s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div)` | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0074` | PREPARED |
| `s16_mul_s16_s16_div_s16` | `KLEE-ALARM-0075` | `src_analysis/sources/div_Ccode.c:965` | integer overflow | `(s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div)` | `analysis/klee_phase_c/s16_mul_s16_s16_div_s16/alarm_0075` | PREPARED |
| `s16_mul_s16_s16_div_u16` | `KLEE-ALARM-0076` | `src_analysis/sources/div_Ccode.c:1022` | invalid shift | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0076` | PREPARED |
| `s16_mul_s16_s16_div_u16` | `KLEE-ALARM-0077` | `src_analysis/sources/div_Ccode.c:1022` | integer overflow | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0077` | PREPARED |
| `s16_mul_s16_s16_div_u16` | `KLEE-ALARM-0078` | `src_analysis/sources/div_Ccode.c:1022` | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0078` | PREPARED |
| `s16_mul_s16_s16_div_u16` | `KLEE-ALARM-0079` | `src_analysis/sources/div_Ccode.c:1022` | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0079` | PREPARED |
| `s16_mul_s16_s16_div_u16` | `KLEE-ALARM-0080` | `src_analysis/sources/div_Ccode.c:1023` | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `analysis/klee_phase_c/s16_mul_s16_s16_div_u16/alarm_0080` | PREPARED |
| `s16_mul_s16_u16_div_s16` | `KLEE-ALARM-0081` | `src_analysis/sources/div_Ccode.c:628` | division by zero | `s32Result / denominator` | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0081` | PREPARED |
| `s16_mul_s16_u16_div_s16` | `KLEE-ALARM-0082` | `src_analysis/sources/div_Ccode.c:628` | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0082` | PREPARED |
| `s16_mul_s16_u16_div_s16` | `KLEE-ALARM-0083` | `src_analysis/sources/div_Ccode.c:628` | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0083` | PREPARED |
| `s16_mul_s16_u16_div_s16` | `KLEE-ALARM-0084` | `src_analysis/sources/div_Ccode.c:629` | invalid shift | `s32Temp1 << 1` | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0084` | PREPARED |
| `s16_mul_s16_u16_div_s16` | `KLEE-ALARM-0085` | `src_analysis/sources/div_Ccode.c:629` | integer overflow | `s32Temp1 << 1` | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0085` | PREPARED |
| `s16_mul_s16_u16_div_s16` | `KLEE-ALARM-0086` | `src_analysis/sources/div_Ccode.c:630` | division by zero | `s32Result / denominator` | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0086` | PREPARED |
| `s16_mul_s16_u16_div_s16` | `KLEE-ALARM-0087` | `src_analysis/sources/div_Ccode.c:630` | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0087` | PREPARED |
| `s16_mul_s16_u16_div_s16` | `KLEE-ALARM-0088` | `src_analysis/sources/div_Ccode.c:630` | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0088` | PREPARED |
| `s16_mul_u16_s16_div_u16` | `KLEE-ALARM-0089` | `src_analysis/sources/div_Ccode.c:684` | invalid shift | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/s16_mul_u16_s16_div_u16/alarm_0089` | PREPARED |
| `s16_mul_u16_s16_div_u16` | `KLEE-ALARM-0090` | `src_analysis/sources/div_Ccode.c:684` | integer overflow | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/s16_mul_u16_s16_div_u16/alarm_0090` | PREPARED |
| `s16_mul_u16_s16_div_u16` | `KLEE-ALARM-0091` | `src_analysis/sources/div_Ccode.c:684` | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/s16_mul_u16_s16_div_u16/alarm_0091` | PREPARED |
| `s16_mul_u16_s16_div_u16` | `KLEE-ALARM-0092` | `src_analysis/sources/div_Ccode.c:684` | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/s16_mul_u16_s16_div_u16/alarm_0092` | PREPARED |
| `s16_mul_u16_s16_div_u16` | `KLEE-ALARM-0093` | `src_analysis/sources/div_Ccode.c:684` | integer overflow | `s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)` | `analysis/klee_phase_c/s16_mul_u16_s16_div_u16/alarm_0093` | PREPARED |
| `s16_mul_u16_s16_div_u16` | `KLEE-ALARM-0094` | `src_analysis/sources/div_Ccode.c:685` | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `analysis/klee_phase_c/s16_mul_u16_s16_div_u16/alarm_0094` | PREPARED |
| `s32_div_s32_s32` | `KLEE-ALARM-0095` | `src_analysis/sources/div_Ccode.c:1394` | integer overflow | `-numerator` | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0095` | PREPARED |
| `s32_div_s32_s32` | `KLEE-ALARM-0096` | `src_analysis/sources/div_Ccode.c:1395` | integer overflow | `-denominator` | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0096` | PREPARED |
| `s32_div_s32_s32` | `KLEE-ALARM-0097` | `src_analysis/sources/div_Ccode.c:1410` | integer overflow | `(s32)(~numerator) + 1` | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0097` | PREPARED |
| `s32_div_s32_s32` | `KLEE-ALARM-0098` | `src_analysis/sources/div_Ccode.c:1413` | integer overflow | `(s32)(~s32Temp2) + 1` | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0098` | PREPARED |
| `s32_div_s32_s32` | `KLEE-ALARM-0099` | `src_analysis/sources/div_Ccode.c:1426` | integer overflow | `(s32)(~denominator) + 1` | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0099` | PREPARED |
| `s32_div_s32_s32` | `KLEE-ALARM-0100` | `src_analysis/sources/div_Ccode.c:1429` | integer overflow | `(s32)(~s32Temp2) + 1` | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0100` | PREPARED |
| `s32_div_s32_s32` | `KLEE-ALARM-0101` | `src_analysis/sources/div_Ccode.c:1434` | invalid shift | `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1` | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0101` | PREPARED |
| `s32_div_s32_s32` | `KLEE-ALARM-0102` | `src_analysis/sources/div_Ccode.c:1434` | integer overflow | `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1` | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0102` | PREPARED |
| `s32_div_s32_s32` | `KLEE-ALARM-0103` | `src_analysis/sources/div_Ccode.c:1434` | integer overflow | `(s32)(numerator / denominator) * denominator` | `analysis/klee_phase_c/s32_div_s32_s32/alarm_0103` | PREPARED |
| `s32_div_s32_u32` | `KLEE-ALARM-0104` | `src_analysis/sources/div_Ccode.c:1330` | integer overflow | `-numerator` | `analysis/klee_phase_c/s32_div_s32_u32/alarm_0104` | PREPARED |
| `s32_div_u32_s32` | `KLEE-ALARM-0105` | `src_analysis/sources/div_Ccode.c:1267` | integer overflow | `-denominator` | `analysis/klee_phase_c/s32_div_u32_s32/alarm_0105` | PREPARED |
| `s32_mul_s32_s16_fac2` | `KLEE-ALARM-0106` | `src_analysis/sources/mul_Ccode.c:1993` | integer overflow | `-val1` | `analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106` | PREPARED |
| `s32_mul_s32_s32` | `KLEE-ALARM-0107` | `src_analysis/sources/MulHword.c:47` | integer overflow | `(int)arg1_LW * (int)arg2_LW` | `analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107` | PREPARED |
| `s32_mul_s32_s32` | `KLEE-ALARM-0108` | `src_analysis/sources/mul_Ccode.c:2672` | integer overflow | `-val1` | `analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108` | PREPARED |
| `s32_mul_s32_s32` | `KLEE-ALARM-0109` | `src_analysis/sources/mul_Ccode.c:2681` | integer overflow | `-val2` | `analysis/klee_phase_c/s32_mul_s32_s32/alarm_0109` | PREPARED |
| `s32_mul_s32_s32_fac2` | `KLEE-ALARM-0110` | `src_analysis/sources/MulHword.c:47` | integer overflow | `(int)arg1_LW * (int)arg2_LW` | `analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0110` | PREPARED |
| `s32_mul_s32_s32_fac2` | `KLEE-ALARM-0111` | `src_analysis/sources/mul_Ccode.c:2223` | integer overflow | `-value` | `analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0111` | PREPARED |
| `s32_mul_s32_s32_fac2` | `KLEE-ALARM-0112` | `src_analysis/sources/mul_Ccode.c:2232` | integer overflow | `-factor` | `analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112` | PREPARED |
| `s32_mul_s32_s32_fac_twopow_u8` | `KLEE-ALARM-0113` | `src_analysis/sources/MulHword.c:47` | integer overflow | `(int)arg1_LW * (int)arg2_LW` | `analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113` | PREPARED |
| `s32_mul_s32_s32_fac_twopow_u8` | `KLEE-ALARM-0114` | `src_analysis/sources/mul_Ccode.c:2454` | integer overflow | `-value` | `analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0114` | PREPARED |
| `s32_mul_s32_s32_fac_twopow_u8` | `KLEE-ALARM-0115` | `src_analysis/sources/mul_Ccode.c:2463` | integer overflow | `-factor` | `analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115` | PREPARED |
| `s32_mul_s32_s8_fac2` | `KLEE-ALARM-0116` | `src_analysis/sources/mul_Ccode.c:2600` | integer overflow | `-value` | `analysis/klee_phase_c/s32_mul_s32_s8_fac2/alarm_0116` | PREPARED |
| `s32_mul_s32_u16` | `KLEE-ALARM-0117` | `src_analysis/sources/mul_Ccode.c:767` | integer overflow | `value * (s32)factor` | `analysis/klee_phase_c/s32_mul_s32_u16/alarm_0117` | PREPARED |
| `s32_mul_s32_u16` | `KLEE-ALARM-0118` | `src_analysis/sources/mul_Ccode.c:778` | integer overflow | `value * (s32)factor` | `analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118` | PREPARED |
| `s32_mul_u32_s32` | `KLEE-ALARM-0119` | `src_analysis/sources/mul_Ccode.c:1762` | integer overflow | `-val2` | `analysis/klee_phase_c/s32_mul_u32_s32/alarm_0119` | PREPARED |
| `u16_div_s32_u16` | `KLEE-ALARM-0120` | `src_analysis/sources/div_Ccode.c:495` | invalid shift | `(s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)) << 1` | `analysis/klee_phase_c/u16_div_s32_u16/alarm_0120` | PREPARED |
| `u16_div_s32_u16` | `KLEE-ALARM-0121` | `src_analysis/sources/div_Ccode.c:495` | integer overflow | `(s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)) << 1` | `analysis/klee_phase_c/u16_div_s32_u16/alarm_0121` | PREPARED |
| `u16_div_s32_u16` | `KLEE-ALARM-0122` | `src_analysis/sources/div_Ccode.c:495` | integer overflow | `(s32)(x_value / (s32)y_value) * (s32)y_value` | `analysis/klee_phase_c/u16_div_s32_u16/alarm_0122` | PREPARED |
| `u16_div_s32_u16` | `KLEE-ALARM-0123` | `src_analysis/sources/div_Ccode.c:495` | integer overflow | `(s32)(x_value / (s32)y_value) * (s32)y_value` | `analysis/klee_phase_c/u16_div_s32_u16/alarm_0123` | PREPARED |
| `u16_div_s32_u16` | `KLEE-ALARM-0124` | `src_analysis/sources/div_Ccode.c:496` | integer overflow | `(s32)(s32Temp1 / (s32)y_value) + (s32)(x_value / (s32)y_value)` | `analysis/klee_phase_c/u16_div_s32_u16/alarm_0124` | PREPARED |
| `u16_mmv_u16_u16_s16_fac1` | `KLEE-ALARM-0125` | `src_analysis/sources/avrg_Ccode.c:249` | integer overflow | `-s32mmv` | `analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125` | PREPARED |
| `u16_mul_s16_u16_div_s16` | `KLEE-ALARM-0126` | `src_analysis/sources/div_Ccode.c:740` | division by zero | `s32Result / denominator` | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0126` | PREPARED |
| `u16_mul_s16_u16_div_s16` | `KLEE-ALARM-0127` | `src_analysis/sources/div_Ccode.c:740` | invalid shift | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0127` | PREPARED |
| `u16_mul_s16_u16_div_s16` | `KLEE-ALARM-0128` | `src_analysis/sources/div_Ccode.c:740` | integer overflow | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0128` | PREPARED |
| `u16_mul_s16_u16_div_s16` | `KLEE-ALARM-0129` | `src_analysis/sources/div_Ccode.c:740` | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0129` | PREPARED |
| `u16_mul_s16_u16_div_s16` | `KLEE-ALARM-0130` | `src_analysis/sources/div_Ccode.c:740` | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0130` | PREPARED |
| `u16_mul_s16_u16_div_s16` | `KLEE-ALARM-0131` | `src_analysis/sources/div_Ccode.c:740` | integer overflow | `s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)` | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0131` | PREPARED |
| `u16_mul_s16_u16_div_s16` | `KLEE-ALARM-0132` | `src_analysis/sources/div_Ccode.c:741` | division by zero | `s32Result / denominator` | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0132` | PREPARED |
| `u16_mul_s16_u16_div_s16` | `KLEE-ALARM-0133` | `src_analysis/sources/div_Ccode.c:741` | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0133` | PREPARED |
| `u16_mul_s16_u16_div_s16` | `KLEE-ALARM-0134` | `src_analysis/sources/div_Ccode.c:741` | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0134` | PREPARED |
| `u16_mul_s16_u16_div_u16` | `KLEE-ALARM-0135` | `src_analysis/sources/div_Ccode.c:795` | invalid shift | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0135` | PREPARED |
| `u16_mul_s16_u16_div_u16` | `KLEE-ALARM-0136` | `src_analysis/sources/div_Ccode.c:795` | integer overflow | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0136` | PREPARED |
| `u16_mul_s16_u16_div_u16` | `KLEE-ALARM-0137` | `src_analysis/sources/div_Ccode.c:795` | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0137` | PREPARED |
| `u16_mul_s16_u16_div_u16` | `KLEE-ALARM-0138` | `src_analysis/sources/div_Ccode.c:795` | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0138` | PREPARED |
| `u16_mul_s16_u16_div_u16` | `KLEE-ALARM-0139` | `src_analysis/sources/div_Ccode.c:795` | integer overflow | `s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)` | `analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0139` | PREPARED |
| `u16_mul_s16_u16_div_u16` | `KLEE-ALARM-0140` | `src_analysis/sources/div_Ccode.c:796` | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0140` | PREPARED |
| `u32_div_s32_s32` | `KLEE-ALARM-0141` | `src_analysis/sources/div_Ccode.c:1168` | invalid shift | `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1` | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0141` | PREPARED |
| `u32_div_s32_s32` | `KLEE-ALARM-0142` | `src_analysis/sources/div_Ccode.c:1168` | integer overflow | `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1` | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0142` | PREPARED |
| `u32_div_s32_s32` | `KLEE-ALARM-0143` | `src_analysis/sources/div_Ccode.c:1168` | integer overflow | `(s32)(numerator / denominator) * denominator` | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0143` | PREPARED |
| `u32_div_s32_s32` | `KLEE-ALARM-0144` | `src_analysis/sources/div_Ccode.c:1182` | integer overflow | `-numerator` | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0144` | PREPARED |
| `u32_div_s32_s32` | `KLEE-ALARM-0145` | `src_analysis/sources/div_Ccode.c:1183` | integer overflow | `-denominator` | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0145` | PREPARED |
| `u32_div_s32_s32` | `KLEE-ALARM-0146` | `src_analysis/sources/div_Ccode.c:1184` | division by zero | `numerator / denominator` | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0146` | PREPARED |
| `u32_div_s32_s32` | `KLEE-ALARM-0147` | `src_analysis/sources/div_Ccode.c:1184` | invalid shift | `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1` | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0147` | PREPARED |
| `u32_div_s32_s32` | `KLEE-ALARM-0148` | `src_analysis/sources/div_Ccode.c:1184` | integer overflow | `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1` | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0148` | PREPARED |
| `u32_div_s32_s32` | `KLEE-ALARM-0149` | `src_analysis/sources/div_Ccode.c:1184` | integer overflow | `(s32)(numerator / denominator) * denominator` | `analysis/klee_phase_c/u32_div_s32_s32/alarm_0149` | PREPARED |

## In-scope functions with zero Eva alarms

These frozen-study functions have indexes but no alarm directories, because
their High Precision Eva count is zero.

| Function | Eva alarms | Function index | Status |
|---|---:|---|---|
| `rotateLeft` | 0 | `analysis/klee_phase_c/rotateLeft/FUNCTION_ALARM_INDEX.md` | PREPARED |
| `s16_cos_u32` | 0 | `analysis/klee_phase_c/s16_cos_u32/FUNCTION_ALARM_INDEX.md` | PREPARED |
| `s16_mmv_s16_s16_s16_fac1` | 0 | `analysis/klee_phase_c/s16_mmv_s16_s16_s16_fac1/FUNCTION_ALARM_INDEX.md` | PREPARED |
| `s16_mul_s16_u16_fac025` | 0 | `analysis/klee_phase_c/s16_mul_s16_u16_fac025/FUNCTION_ALARM_INDEX.md` | PREPARED |
| `s16_sin_u32` | 0 | `analysis/klee_phase_c/s16_sin_u32/FUNCTION_ALARM_INDEX.md` | PREPARED |
| `s16_tan_u32` | 0 | `analysis/klee_phase_c/s16_tan_u32/FUNCTION_ALARM_INDEX.md` | PREPARED |
| `u16_cos_u16` | 0 | `analysis/klee_phase_c/u16_cos_u16/FUNCTION_ALARM_INDEX.md` | PREPARED |
| `u16_mul_u16_u8_fac8` | 0 | `analysis/klee_phase_c/u16_mul_u16_u8_fac8/FUNCTION_ALARM_INDEX.md` | PREPARED |
| `u16_sin_u16` | 0 | `analysis/klee_phase_c/u16_sin_u16/FUNCTION_ALARM_INDEX.md` | PREPARED |
| `u16_tan_u16` | 0 | `analysis/klee_phase_c/u16_tan_u16/FUNCTION_ALARM_INDEX.md` | PREPARED |
| `u32_div_s32_u32` | 0 | `analysis/klee_phase_c/u32_div_s32_u32/FUNCTION_ALARM_INDEX.md` | PREPARED |
| `u32_div_u32_s32` | 0 | `analysis/klee_phase_c/u32_div_u32_s32/FUNCTION_ALARM_INDEX.md` | PREPARED |
| `u32_mmv_u32_u32_s32_fac1` | 0 | `analysis/klee_phase_c/u32_mmv_u32_u32_s32_fac1/FUNCTION_ALARM_INDEX.md` | PREPARED |

## Totals

- Total functions: 46
- Functions with one or more Eva alarms: 33
- Functions with zero Eva alarms: 13
- Total Eva alarms: 149
- Total prepared: 149
- Total blocked: 0
- Global count check: 149 = 149 + 0

No experiment has been built or executed by this preparation.
