# root_s32_mul_s32_s16_fac_less1: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0001` | `src_analysis/sources/mul_Ccode.c` | 5071 | integer overflow | `-value` | `alarm_0001` | PREPARED |
| `KLEE-ALARM-0002` | `src_analysis/sources/mul_Ccode.c` | 5089 | invalid shift | `u32Temp3 >> count` | `alarm_0002` | PREPARED |
| `KLEE-ALARM-0003` | `src_analysis/sources/mul_Ccode.c` | 5090 | invalid shift | `u32Temp4 << (32-count)` | `alarm_0003` | PREPARED |

- Total Eva alarms: 3
- Prepared: 3
- Blocked: 0
- Count check: 3 = 3 + 0
