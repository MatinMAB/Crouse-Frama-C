# s16_hip1_s16_u8_u8_u16_fac1: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0063` | `src_analysis/sources/hip_Ccode.c` | 49 | invalid shift | `(int)((int)u - (int)uold) << 7` | `alarm_0063` | PREPARED |
| `KLEE-ALARM-0064` | `src_analysis/sources/hip_Ccode.c` | 52 | integer overflow | `s32Temp1 - s32Temp2` | `alarm_0064` | PREPARED |
| `KLEE-ALARM-0065` | `src_analysis/sources/hip_Ccode.c` | 52 | integer overflow | `s32Temp1 - s32Temp2` | `alarm_0065` | PREPARED |
| `KLEE-ALARM-0066` | `src_analysis/sources/hip_Ccode.c` | 53 | invalid shift | `s32Temp2 << 1` | `alarm_0066` | PREPARED |
| `KLEE-ALARM-0067` | `src_analysis/sources/hip_Ccode.c` | 53 | integer overflow | `s32Temp2 << 1` | `alarm_0067` | PREPARED |

- Total Eva alarms: 5
- Prepared: 5
- Blocked: 0
- Count check: 5 = 5 + 0
