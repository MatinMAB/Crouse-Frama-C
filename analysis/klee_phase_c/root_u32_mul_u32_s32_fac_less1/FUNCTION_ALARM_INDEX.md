# root_u32_mul_u32_s32_fac_less1: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0016` | `src_analysis/sources/MulHword.c` | 47 | integer overflow | `(int)arg1_LW * (int)arg2_LW` | `alarm_0016` | PREPARED |
| `KLEE-ALARM-0017` | `src_analysis/sources/MulHword.c` | 49 | integer overflow | `(int)arg1_HW * (int)arg2_LW` | `alarm_0017` | PREPARED |
| `KLEE-ALARM-0018` | `src_analysis/sources/mul_Ccode.c` | 5364 | integer overflow | `-factor` | `alarm_0018` | PREPARED |
| `KLEE-ALARM-0019` | `src_analysis/sources/mul_Ccode.c` | 5372 | invalid shift | `u32Temp2 >> (count-32)` | `alarm_0019` | PREPARED |

- Total Eva alarms: 4
- Prepared: 4
- Blocked: 0
- Count check: 4 = 4 + 0
