# root_s32_mul_s32_u8_fac_less1: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0011` | `src_analysis/sources/mul_Ccode.c` | 5534 | integer overflow | `-value` | `alarm_0011` | PREPARED |
| `KLEE-ALARM-0012` | `src_analysis/sources/mul_Ccode.c` | 5544 | invalid shift | `u32Temp2 >> count` | `alarm_0012` | PREPARED |
| `KLEE-ALARM-0013` | `src_analysis/sources/mul_Ccode.c` | 5545 | invalid shift | `u32Temp3 << (32-count)` | `alarm_0013` | PREPARED |

- Total Eva alarms: 3
- Prepared: 3
- Blocked: 0
- Count check: 3 = 3 + 0
