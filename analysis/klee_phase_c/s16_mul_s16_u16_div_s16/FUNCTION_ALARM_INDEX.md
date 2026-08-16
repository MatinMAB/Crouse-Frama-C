# s16_mul_s16_u16_div_s16: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0081` | `src_analysis/sources/div_Ccode.c` | 628 | division by zero | `s32Result / denominator` | `alarm_0081` | PREPARED |
| `KLEE-ALARM-0082` | `src_analysis/sources/div_Ccode.c` | 628 | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `alarm_0082` | PREPARED |
| `KLEE-ALARM-0083` | `src_analysis/sources/div_Ccode.c` | 628 | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `alarm_0083` | PREPARED |
| `KLEE-ALARM-0084` | `src_analysis/sources/div_Ccode.c` | 629 | invalid shift | `s32Temp1 << 1` | `alarm_0084` | PREPARED |
| `KLEE-ALARM-0085` | `src_analysis/sources/div_Ccode.c` | 629 | integer overflow | `s32Temp1 << 1` | `alarm_0085` | PREPARED |
| `KLEE-ALARM-0086` | `src_analysis/sources/div_Ccode.c` | 630 | division by zero | `s32Result / denominator` | `alarm_0086` | PREPARED |
| `KLEE-ALARM-0087` | `src_analysis/sources/div_Ccode.c` | 630 | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `alarm_0087` | PREPARED |
| `KLEE-ALARM-0088` | `src_analysis/sources/div_Ccode.c` | 630 | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `alarm_0088` | PREPARED |

- Total Eva alarms: 8
- Prepared: 8
- Blocked: 0
- Count check: 8 = 8 + 0
