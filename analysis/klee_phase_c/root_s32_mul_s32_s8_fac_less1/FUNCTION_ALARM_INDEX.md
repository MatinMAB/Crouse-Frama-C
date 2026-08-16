# root_s32_mul_s32_s8_fac_less1: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0004` | `src_analysis/sources/mul_Ccode.c` | 5223 | integer overflow | `-value` | `alarm_0004` | PREPARED |
| `KLEE-ALARM-0005` | `src_analysis/sources/mul_Ccode.c` | 5241 | invalid shift | `u32Temp3 >> count` | `alarm_0005` | PREPARED |
| `KLEE-ALARM-0006` | `src_analysis/sources/mul_Ccode.c` | 5242 | invalid shift | `u32Temp4 << (32-count)` | `alarm_0006` | PREPARED |

- Total Eva alarms: 3
- Prepared: 3
- Blocked: 0
- Count check: 3 = 3 + 0
