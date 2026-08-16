# u16_mul_s16_u16_div_s16: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0126` | `src_analysis/sources/div_Ccode.c` | 740 | division by zero | `s32Result / denominator` | `alarm_0126` | PREPARED |
| `KLEE-ALARM-0127` | `src_analysis/sources/div_Ccode.c` | 740 | invalid shift | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0127` | PREPARED |
| `KLEE-ALARM-0128` | `src_analysis/sources/div_Ccode.c` | 740 | integer overflow | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0128` | PREPARED |
| `KLEE-ALARM-0129` | `src_analysis/sources/div_Ccode.c` | 740 | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `alarm_0129` | PREPARED |
| `KLEE-ALARM-0130` | `src_analysis/sources/div_Ccode.c` | 740 | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `alarm_0130` | PREPARED |
| `KLEE-ALARM-0131` | `src_analysis/sources/div_Ccode.c` | 740 | integer overflow | `s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)` | `alarm_0131` | PREPARED |
| `KLEE-ALARM-0132` | `src_analysis/sources/div_Ccode.c` | 741 | division by zero | `s32Result / denominator` | `alarm_0132` | PREPARED |
| `KLEE-ALARM-0133` | `src_analysis/sources/div_Ccode.c` | 741 | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `alarm_0133` | PREPARED |
| `KLEE-ALARM-0134` | `src_analysis/sources/div_Ccode.c` | 741 | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `alarm_0134` | PREPARED |

- Total Eva alarms: 9
- Prepared: 9
- Blocked: 0
- Count check: 9 = 9 + 0
