# s16_div_s32_s16: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0023` | `src_analysis/sources/div_Ccode.c` | 274 | division by zero | `s32Temp1 / denominator` | `alarm_0023` | PREPARED |
| `KLEE-ALARM-0024` | `src_analysis/sources/div_Ccode.c` | 274 | invalid shift | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0024` | PREPARED |
| `KLEE-ALARM-0025` | `src_analysis/sources/div_Ccode.c` | 274 | integer overflow | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0025` | PREPARED |
| `KLEE-ALARM-0026` | `src_analysis/sources/div_Ccode.c` | 274 | integer overflow | `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator` | `alarm_0026` | PREPARED |
| `KLEE-ALARM-0027` | `src_analysis/sources/div_Ccode.c` | 274 | integer overflow | `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator` | `alarm_0027` | PREPARED |
| `KLEE-ALARM-0028` | `src_analysis/sources/div_Ccode.c` | 275 | division by zero | `s32Temp2 / denominator` | `alarm_0028` | PREPARED |
| `KLEE-ALARM-0029` | `src_analysis/sources/div_Ccode.c` | 276 | division by zero | `(numerator) / denominator` | `alarm_0029` | PREPARED |
| `KLEE-ALARM-0030` | `src_analysis/sources/div_Ccode.c` | 276 | integer overflow | `s32Temp1 + (s32)(numerator / (s32)denominator)` | `alarm_0030` | PREPARED |
| `KLEE-ALARM-0031` | `src_analysis/sources/div_Ccode.c` | 276 | integer overflow | `s32Temp1 + (s32)(numerator / (s32)denominator)` | `alarm_0031` | PREPARED |
| `KLEE-ALARM-0032` | `src_analysis/sources/div_Ccode.c` | 297 | division by zero | `s32Temp1 / denominator` | `alarm_0032` | PREPARED |
| `KLEE-ALARM-0033` | `src_analysis/sources/div_Ccode.c` | 297 | invalid shift | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0033` | PREPARED |
| `KLEE-ALARM-0034` | `src_analysis/sources/div_Ccode.c` | 297 | integer overflow | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0034` | PREPARED |
| `KLEE-ALARM-0035` | `src_analysis/sources/div_Ccode.c` | 297 | integer overflow | `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator` | `alarm_0035` | PREPARED |
| `KLEE-ALARM-0036` | `src_analysis/sources/div_Ccode.c` | 297 | integer overflow | `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator` | `alarm_0036` | PREPARED |
| `KLEE-ALARM-0037` | `src_analysis/sources/div_Ccode.c` | 297 | integer overflow | `s32Temp1 / (s32)denominator` | `alarm_0037` | PREPARED |
| `KLEE-ALARM-0038` | `src_analysis/sources/div_Ccode.c` | 298 | division by zero | `s32Temp2 / denominator` | `alarm_0038` | PREPARED |
| `KLEE-ALARM-0039` | `src_analysis/sources/div_Ccode.c` | 299 | division by zero | `(numerator) / denominator` | `alarm_0039` | PREPARED |
| `KLEE-ALARM-0040` | `src_analysis/sources/div_Ccode.c` | 299 | integer overflow | `s32Temp1 + (s32)(numerator / (s32)denominator)` | `alarm_0040` | PREPARED |
| `KLEE-ALARM-0041` | `src_analysis/sources/div_Ccode.c` | 299 | integer overflow | `numerator / (s32)denominator` | `alarm_0041` | PREPARED |
| `KLEE-ALARM-0042` | `src_analysis/sources/div_Ccode.c` | 299 | integer overflow | `s32Temp1 + (s32)(numerator / (s32)denominator)` | `alarm_0042` | PREPARED |

- Total Eva alarms: 20
- Prepared: 20
- Blocked: 0
- Count check: 20 = 20 + 0
