# s16_mul_s16_s16_div_u16: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0076` | `src_analysis/sources/div_Ccode.c` | 1022 | invalid shift | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0076` | PREPARED |
| `KLEE-ALARM-0077` | `src_analysis/sources/div_Ccode.c` | 1022 | integer overflow | `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0077` | PREPARED |
| `KLEE-ALARM-0078` | `src_analysis/sources/div_Ccode.c` | 1022 | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `alarm_0078` | PREPARED |
| `KLEE-ALARM-0079` | `src_analysis/sources/div_Ccode.c` | 1022 | integer overflow | `(s32)(s32Result / (s32)denominator) * (s32)denominator` | `alarm_0079` | PREPARED |
| `KLEE-ALARM-0080` | `src_analysis/sources/div_Ccode.c` | 1023 | integer overflow | `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)` | `alarm_0080` | PREPARED |

- Total Eva alarms: 5
- Prepared: 5
- Blocked: 0
- Count check: 5 = 5 + 0
