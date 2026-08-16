# u32_div_s32_s32: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0141` | `src_analysis/sources/div_Ccode.c` | 1168 | invalid shift | `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1` | `alarm_0141` | PREPARED |
| `KLEE-ALARM-0142` | `src_analysis/sources/div_Ccode.c` | 1168 | integer overflow | `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1` | `alarm_0142` | PREPARED |
| `KLEE-ALARM-0143` | `src_analysis/sources/div_Ccode.c` | 1168 | integer overflow | `(s32)(numerator / denominator) * denominator` | `alarm_0143` | PREPARED |
| `KLEE-ALARM-0144` | `src_analysis/sources/div_Ccode.c` | 1182 | integer overflow | `-numerator` | `alarm_0144` | PREPARED |
| `KLEE-ALARM-0145` | `src_analysis/sources/div_Ccode.c` | 1183 | integer overflow | `-denominator` | `alarm_0145` | PREPARED |
| `KLEE-ALARM-0146` | `src_analysis/sources/div_Ccode.c` | 1184 | division by zero | `numerator / denominator` | `alarm_0146` | PREPARED |
| `KLEE-ALARM-0147` | `src_analysis/sources/div_Ccode.c` | 1184 | invalid shift | `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1` | `alarm_0147` | PREPARED |
| `KLEE-ALARM-0148` | `src_analysis/sources/div_Ccode.c` | 1184 | integer overflow | `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1` | `alarm_0148` | PREPARED |
| `KLEE-ALARM-0149` | `src_analysis/sources/div_Ccode.c` | 1184 | integer overflow | `(s32)(numerator / denominator) * denominator` | `alarm_0149` | PREPARED |

- Total Eva alarms: 9
- Prepared: 9
- Blocked: 0
- Count check: 9 = 9 + 0
