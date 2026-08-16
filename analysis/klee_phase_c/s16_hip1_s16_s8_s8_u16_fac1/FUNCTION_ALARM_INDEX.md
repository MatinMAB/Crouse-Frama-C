# s16_hip1_s16_s8_s8_u16_fac1: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0058` | `src_analysis/sources/hip_Ccode.c` | 163 | invalid shift | `(int)((int)u - (int)uold) << 7` | `alarm_0058` | PREPARED |
| `KLEE-ALARM-0059` | `src_analysis/sources/hip_Ccode.c` | 166 | integer overflow | `s32Temp1 - s32Temp2` | `alarm_0059` | PREPARED |
| `KLEE-ALARM-0060` | `src_analysis/sources/hip_Ccode.c` | 166 | integer overflow | `s32Temp1 - s32Temp2` | `alarm_0060` | PREPARED |
| `KLEE-ALARM-0061` | `src_analysis/sources/hip_Ccode.c` | 167 | invalid shift | `s32Temp2 << 1` | `alarm_0061` | PREPARED |
| `KLEE-ALARM-0062` | `src_analysis/sources/hip_Ccode.c` | 167 | integer overflow | `s32Temp2 << 1` | `alarm_0062` | PREPARED |

- Total Eva alarms: 5
- Prepared: 5
- Blocked: 0
- Count check: 5 = 5 + 0
