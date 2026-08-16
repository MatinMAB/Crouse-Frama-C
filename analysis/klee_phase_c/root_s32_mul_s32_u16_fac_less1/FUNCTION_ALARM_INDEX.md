# root_s32_mul_s32_u16_fac_less1: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0007` | `src_analysis/sources/MulHword.c` | 47 | integer overflow | `(int)arg1_LW * (int)arg2_LW` | `alarm_0007` | PREPARED |
| `KLEE-ALARM-0008` | `src_analysis/sources/mul_Ccode.c` | 5147 | integer overflow | `-value` | `alarm_0008` | PREPARED |
| `KLEE-ALARM-0009` | `src_analysis/sources/mul_Ccode.c` | 5165 | invalid shift | `u32Temp3 >> count` | `alarm_0009` | PREPARED |
| `KLEE-ALARM-0010` | `src_analysis/sources/mul_Ccode.c` | 5166 | invalid shift | `u32Temp4 << (32-count)` | `alarm_0010` | PREPARED |

- Total Eva alarms: 4
- Prepared: 4
- Blocked: 0
- Count check: 4 = 4 + 0
