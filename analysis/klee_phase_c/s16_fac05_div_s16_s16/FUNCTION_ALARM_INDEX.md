# s16_fac05_div_s16_s16: Eva alarm index

| Alarm ID | Source file | Source line | Alarm kind | Expression | Directory | Status |
|---|---|---:|---|---|---|---|
| `KLEE-ALARM-0044` | `src_analysis/sources/div_Ccode.c` | 173 | invalid shift | `(int)numerator << 16` | `alarm_0044` | PREPARED |
| `KLEE-ALARM-0045` | `src_analysis/sources/div_Ccode.c` | 190 | division by zero | `s32Temp1 / denominator` | `alarm_0045` | PREPARED |
| `KLEE-ALARM-0046` | `src_analysis/sources/div_Ccode.c` | 190 | invalid shift | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0046` | PREPARED |
| `KLEE-ALARM-0047` | `src_analysis/sources/div_Ccode.c` | 190 | integer overflow | `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1` | `alarm_0047` | PREPARED |
| `KLEE-ALARM-0048` | `src_analysis/sources/div_Ccode.c` | 190 | integer overflow | `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator` | `alarm_0048` | PREPARED |
| `KLEE-ALARM-0049` | `src_analysis/sources/div_Ccode.c` | 191 | division by zero | `s32Temp2 / denominator` | `alarm_0049` | PREPARED |
| `KLEE-ALARM-0050` | `src_analysis/sources/div_Ccode.c` | 192 | division by zero | `(numerator<<16) / denominator` | `alarm_0050` | PREPARED |
| `KLEE-ALARM-0051` | `src_analysis/sources/div_Ccode.c` | 192 | integer overflow | `s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator))` | `alarm_0051` | PREPARED |
| `KLEE-ALARM-0052` | `src_analysis/sources/div_Ccode.c` | 192 | integer overflow | `s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator))` | `alarm_0052` | PREPARED |

- Total Eva alarms: 9
- Prepared: 9
- Blocked: 0
- Count check: 9 = 9 + 0
