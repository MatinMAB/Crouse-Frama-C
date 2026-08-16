# s16_mul_u16_s16_div_u16: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0089` | `src_analysis/sources/div_Ccode.c` | 684 | invalid shift | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0089` | PREPARED |
| `KLEE-ALARM-0090` | `src_analysis/sources/div_Ccode.c` | 684 | integer overflow | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0090` | PREPARED |
| `KLEE-ALARM-0091` | `src_analysis/sources/div_Ccode.c` | 684 | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `alarm_0091` | PREPARED |
| `KLEE-ALARM-0092` | `src_analysis/sources/div_Ccode.c` | 684 | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `alarm_0092` | PREPARED |
| `KLEE-ALARM-0093` | `src_analysis/sources/div_Ccode.c` | 684 | integer overflow | `s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)` | `alarm_0093` | PREPARED |
| `KLEE-ALARM-0094` | `src_analysis/sources/div_Ccode.c` | 685 | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `alarm_0094` | PREPARED |

- Total Eva alarms: 6
- Prepared: 6
- Blocked: 0
- Count check: 6 = 6 + 0
