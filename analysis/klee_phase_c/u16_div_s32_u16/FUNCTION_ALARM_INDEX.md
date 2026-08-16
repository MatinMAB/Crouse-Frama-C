# u16_div_s32_u16: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0120` | `src_analysis/sources/div_Ccode.c` | 495 | invalid shift | `(s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)) << 1` | `alarm_0120` | PREPARED |
| `KLEE-ALARM-0121` | `src_analysis/sources/div_Ccode.c` | 495 | integer overflow | `(s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)) << 1` | `alarm_0121` | PREPARED |
| `KLEE-ALARM-0122` | `src_analysis/sources/div_Ccode.c` | 495 | integer overflow | `(s32)(x_value / (s32)y_value) * (s32)y_value` | `alarm_0122` | PREPARED |
| `KLEE-ALARM-0123` | `src_analysis/sources/div_Ccode.c` | 495 | integer overflow | `(s32)(x_value / (s32)y_value) * (s32)y_value` | `alarm_0123` | PREPARED |
| `KLEE-ALARM-0124` | `src_analysis/sources/div_Ccode.c` | 496 | integer overflow | `(s32)(s32Temp1 / (s32)y_value) + (s32)(x_value / (s32)y_value)` | `alarm_0124` | PREPARED |

- Total Eva alarms: 5
- Prepared: 5
- Blocked: 0
- Count check: 5 = 5 + 0
