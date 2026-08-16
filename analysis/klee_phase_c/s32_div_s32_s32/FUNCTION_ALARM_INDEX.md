# s32_div_s32_s32: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0095` | `src_analysis/sources/div_Ccode.c` | 1394 | integer overflow | `-numerator` | `alarm_0095` | PREPARED |
| `KLEE-ALARM-0096` | `src_analysis/sources/div_Ccode.c` | 1395 | integer overflow | `-denominator` | `alarm_0096` | PREPARED |
| `KLEE-ALARM-0097` | `src_analysis/sources/div_Ccode.c` | 1410 | integer overflow | `(s32)(~numerator) + 1` | `alarm_0097` | PREPARED |
| `KLEE-ALARM-0098` | `src_analysis/sources/div_Ccode.c` | 1413 | integer overflow | `(s32)(~s32Temp2) + 1` | `alarm_0098` | PREPARED |
| `KLEE-ALARM-0099` | `src_analysis/sources/div_Ccode.c` | 1426 | integer overflow | `(s32)(~denominator) + 1` | `alarm_0099` | PREPARED |
| `KLEE-ALARM-0100` | `src_analysis/sources/div_Ccode.c` | 1429 | integer overflow | `(s32)(~s32Temp2) + 1` | `alarm_0100` | PREPARED |
| `KLEE-ALARM-0101` | `src_analysis/sources/div_Ccode.c` | 1434 | invalid shift | `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1` | `alarm_0101` | PREPARED |
| `KLEE-ALARM-0102` | `src_analysis/sources/div_Ccode.c` | 1434 | integer overflow | `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1` | `alarm_0102` | PREPARED |
| `KLEE-ALARM-0103` | `src_analysis/sources/div_Ccode.c` | 1434 | integer overflow | `(s32)(numerator / denominator) * denominator` | `alarm_0103` | PREPARED |

- Total Eva alarms: 9
- Prepared: 9
- Blocked: 0
- Count check: 9 = 9 + 0
