# s16_fac05_div_s16_u16: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0053` | `src_analysis/sources/div_Ccode.c` | 348 | invalid shift | `(int)numerator << 16` | `alarm_0053` | PREPARED |
| `KLEE-ALARM-0054` | `src_analysis/sources/div_Ccode.c` | 362 | integer overflow | `(int)((int)((int)numerator << 16) / (int)u16Temp1) * (int)u16Temp1` | `alarm_0054` | PREPARED |
| `KLEE-ALARM-0055` | `src_analysis/sources/div_Ccode.c` | 363 | invalid shift | `s32Temp1 << 1` | `alarm_0055` | PREPARED |
| `KLEE-ALARM-0056` | `src_analysis/sources/div_Ccode.c` | 363 | integer overflow | `s32Temp1 << 1` | `alarm_0056` | PREPARED |
| `KLEE-ALARM-0057` | `src_analysis/sources/div_Ccode.c` | 365 | integer overflow | `(s32)((int)((int)((int)numerator << 16) / (int)u16Temp1)) + s32Temp1` | `alarm_0057` | PREPARED |

- Total Eva alarms: 5
- Prepared: 5
- Blocked: 0
- Count check: 5 = 5 + 0
