# s16_mul_s16_s16_div_s16: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0068` | `src_analysis/sources/div_Ccode.c` | 964 | division by zero | `s32Temp1 / div` | `alarm_0068` | PREPARED |
| `KLEE-ALARM-0069` | `src_analysis/sources/div_Ccode.c` | 964 | invalid shift | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)) << 1` | `alarm_0069` | PREPARED |
| `KLEE-ALARM-0070` | `src_analysis/sources/div_Ccode.c` | 964 | integer overflow | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)) << 1` | `alarm_0070` | PREPARED |
| `KLEE-ALARM-0071` | `src_analysis/sources/div_Ccode.c` | 964 | integer overflow | `(s32)(s32Temp1 / (s32)div) * (s32)div` | `alarm_0071` | PREPARED |
| `KLEE-ALARM-0072` | `src_analysis/sources/div_Ccode.c` | 964 | integer overflow | `(s32)(s32Temp1 / (s32)div) * (s32)div` | `alarm_0072` | PREPARED |
| `KLEE-ALARM-0073` | `src_analysis/sources/div_Ccode.c` | 965 | division by zero | `s32Temp1 / div` | `alarm_0073` | PREPARED |
| `KLEE-ALARM-0074` | `src_analysis/sources/div_Ccode.c` | 965 | integer overflow | `(s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div)` | `alarm_0074` | PREPARED |
| `KLEE-ALARM-0075` | `src_analysis/sources/div_Ccode.c` | 965 | integer overflow | `(s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div)` | `alarm_0075` | PREPARED |

- Total Eva alarms: 8
- Prepared: 8
- Blocked: 0
- Count check: 8 = 8 + 0
