# u16_mul_s16_u16_div_u16: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0135` | `src_analysis/sources/div_Ccode.c` | 795 | invalid shift | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0135` | PREPARED |
| `KLEE-ALARM-0136` | `src_analysis/sources/div_Ccode.c` | 795 | integer overflow | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0136` | PREPARED |
| `KLEE-ALARM-0137` | `src_analysis/sources/div_Ccode.c` | 795 | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `alarm_0137` | PREPARED |
| `KLEE-ALARM-0138` | `src_analysis/sources/div_Ccode.c` | 795 | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `alarm_0138` | PREPARED |
| `KLEE-ALARM-0139` | `src_analysis/sources/div_Ccode.c` | 795 | integer overflow | `s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)` | `alarm_0139` | PREPARED |
| `KLEE-ALARM-0140` | `src_analysis/sources/div_Ccode.c` | 796 | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `alarm_0140` | PREPARED |

- Total Eva alarms: 6
- Prepared: 6
- Blocked: 0
- Count check: 6 = 6 + 0
