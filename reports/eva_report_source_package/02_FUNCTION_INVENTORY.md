# Function Inventory

## DIRECT REPOSITORY EVIDENCE

The ordered population is read from `analysis/high_precision/functions.txt` and enriched from the committed manifest, source, headers, harnesses, comparison TSVs, and Git-visible file state. There are 46 rows. Work notes are present on disk for all 46 functions and are ignored rather than tracked.

| Function | Priority | Signature | Definition | Harness | Baseline | High | Removed | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `root_s32_mul_s32_s16_fac_less1` | P0 | `s32 root_s32_mul_s32_s16_fac_less1(s32 value, s16 factor, u32 count)` | `src_analysis/sources/mul_Ccode.c:5055` | `harnesses/P0/eva_main_root_s32_mul_s32_s16_fac_less1.c` | 3 | 3 | 0 | UNCHANGED |
| `root_s32_mul_s32_s8_fac_less1` | P0 | `s32 root_s32_mul_s32_s8_fac_less1(s32 value, s8 factor, u32 count)` | `src_analysis/sources/mul_Ccode.c:5207` | `harnesses/P0/eva_main_root_s32_mul_s32_s8_fac_less1.c` | 3 | 3 | 0 | UNCHANGED |
| `root_s32_mul_s32_u16_fac_less1` | P0 | `s32 root_s32_mul_s32_u16_fac_less1(s32 value,u16 factor, u32 count)` | `src_analysis/sources/mul_Ccode.c:5131` | `harnesses/P0/eva_main_root_s32_mul_s32_u16_fac_less1.c` | 4 | 4 | 0 | UNCHANGED |
| `root_s32_mul_s32_u8_fac_less1` | P0 | `s32 root_s32_mul_s32_u8_fac_less1(s32 value, u8 factor, u32 count)` | `src_analysis/sources/mul_Ccode.c:5526` | `harnesses/P0/eva_main_root_s32_mul_s32_u8_fac_less1.c` | 3 | 3 | 0 | UNCHANGED |
| `root_u32_mul_u32_s16_fac_less1` | P1 | `u32 root_u32_mul_u32_s16_fac_less1(u32 value,s16 factor, u32 count)` | `src_analysis/sources/mul_Ccode.c:5283` | `harnesses/P1/eva_main_root_u32_mul_u32_s16_fac_less1.c` | 2 | 2 | 0 | UNCHANGED |
| `root_u32_mul_u32_s32_fac_less1` | P1 | `u32 root_u32_mul_u32_s32_fac_less1(u32 value, s32 factor, u32 count)` | `src_analysis/sources/mul_Ccode.c:5347` | `harnesses/P1/eva_main_root_u32_mul_u32_s32_fac_less1.c` | 4 | 4 | 0 | UNCHANGED |
| `root_u32_mul_u32_s8_fac_less1` | P1 | `u32 root_u32_mul_u32_s8_fac_less1(u32 value, s8 factor, u32 count)` | `src_analysis/sources/mul_Ccode.c:5425` | `harnesses/P1/eva_main_root_u32_mul_u32_s8_fac_less1.c` | 2 | 2 | 0 | UNCHANGED |
| `rotateLeft` | P0 | `u32 rotateLeft(u32 num, u32 rotation)` | `src_analysis/sources/rotatefunc.c:56` | `harnesses/P0/eva_main_rotateLeft.c` | 0 | 0 | 0 | UNCHANGED |
| `rotateRight` | P0 | `u32 rotateRight(u32 num, u32 rotation)` | `src_analysis/sources/rotatefunc.c:101` | `harnesses/P0/eva_main_rotateRight.c` | 1 | 1 | 0 | UNCHANGED |
| `s16_cos_u32` | P0 | `s16 s16_cos_u32(u32 phi)` | `src_analysis/sources/trig_Ccode.c:127` | `harnesses/P0/eva_main_s16_cos_u32.c` | 0 | 0 | 0 | UNCHANGED |
| `s16_div_s32_s16` | P1 | `s16 s16_div_s32_s16(s32 numerator, s16 denominator)` | `src_analysis/sources/div_Ccode.c:255` | `harnesses/P1/eva_main_s16_div_s32_s16.c` | 25 | 20 | 5 | REDUCED |
| `s16_div_s32_u32` | P0 | `s16 s16_div_s32_u32(s32 numerator, u32 denominator)` | `src_analysis/sources/div_Ccode.c:1457` | `harnesses/P0/eva_main_s16_div_s32_u32.c` | 1 | 1 | 0 | UNCHANGED |
| `s16_fac05_div_s16_s16` | P1 | `s16 s16_fac05_div_s16_s16(s16 numerator, s16 denominator)` | `src_analysis/sources/div_Ccode.c:170` | `harnesses/P1/eva_main_s16_fac05_div_s16_s16.c` | 11 | 9 | 2 | REDUCED |
| `s16_fac05_div_s16_u16` | P1 | `s16 s16_fac05_div_s16_u16(s16 numerator, u16 denominator)` | `src_analysis/sources/div_Ccode.c:343` | `harnesses/P1/eva_main_s16_fac05_div_s16_u16.c` | 5 | 5 | 0 | UNCHANGED |
| `s16_hip1_s16_s8_s8_u16_fac1` | P1 | `s16 s16_hip1_s16_s8_s8_u16_fac1(s16 yold, s8 u, s8 uold, u16 m)` | `src_analysis/sources/hip_Ccode.c:158` | `harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c` | 5 | 5 | 0 | UNCHANGED |
| `s16_hip1_s16_u8_u8_u16_fac1` | P1 | `s16 s16_hip1_s16_u8_u8_u16_fac1(s16 yold, u8 u, u8 uold, u16 m)` | `src_analysis/sources/hip_Ccode.c:44` | `harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c` | 5 | 5 | 0 | UNCHANGED |
| `s16_mmv_s16_s16_s16_fac1` | P1 | `s16 s16_mmv_s16_s16_s16_fac1(register s16 mmv, register s16 measure, register s16 crlc)` | `src_analysis/sources/avrg_Ccode.c:52` | `harnesses/P1/eva_main_s16_mmv_s16_s16_s16_fac1.c` | 0 | 0 | 0 | UNCHANGED |
| `s16_mul_s16_s16_div_s16` | P1 | `s16 s16_mul_s16_s16_div_s16(s16 fak1, s16 fak2, s16 div)` | `src_analysis/sources/div_Ccode.c:947` | `harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c` | 11 | 8 | 3 | REDUCED |
| `s16_mul_s16_s16_div_u16` | P1 | `s16 s16_mul_s16_s16_div_u16(s16 data1,s16 data2,u16 denominator)` | `src_analysis/sources/div_Ccode.c:1000` | `harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c` | 7 | 5 | 2 | REDUCED |
| `s16_mul_s16_u16_div_s16` | P1 | `s16 s16_mul_s16_u16_div_s16(s16 factor1, u16 factor2, s16 denominator)` | `src_analysis/sources/div_Ccode.c:611` | `harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c` | 11 | 8 | 3 | REDUCED |
| `s16_mul_s16_u16_fac025` | P0 | `s16 s16_mul_s16_u16_fac025(s16 value, u16 factor)` | `src_analysis/sources/mul_Ccode.c:3341` | `harnesses/P0/eva_main_s16_mul_s16_u16_fac025.c` | 0 | 0 | 0 | UNCHANGED |
| `s16_mul_u16_s16_div_u16` | P1 | `s16 s16_mul_u16_s16_div_u16(u16 factor1, s16 factor2, u16 denominator)` | `src_analysis/sources/div_Ccode.c:667` | `harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c` | 7 | 6 | 1 | REDUCED |
| `s16_sin_u32` | P0 | `s16 s16_sin_u32(u32 phi)` | `src_analysis/sources/trig_Ccode.c:95` | `harnesses/P0/eva_main_s16_sin_u32.c` | 0 | 0 | 0 | UNCHANGED |
| `s16_tan_u32` | P0 | `s16 s16_tan_u32(u32 phi)` | `src_analysis/sources/trig_Ccode.c:159` | `harnesses/P0/eva_main_s16_tan_u32.c` | 0 | 0 | 0 | UNCHANGED |
| `s32_div_s32_s32` | P0 | `s32 s32_div_s32_s32(s32 numerator, s32 denominator)` | `src_analysis/sources/div_Ccode.c:1379` | `harnesses/P0/eva_main_s32_div_s32_s32.c` | 9 | 9 | 0 | UNCHANGED |
| `s32_div_s32_u32` | P0 | `s32 s32_div_s32_u32(s32 numerator, u32 denominator)` | `src_analysis/sources/div_Ccode.c:1311` | `harnesses/P0/eva_main_s32_div_s32_u32.c` | 1 | 1 | 0 | UNCHANGED |
| `s32_div_u32_s32` | P0 | `s32 s32_div_u32_s32(u32 numerator, s32 denominator)` | `src_analysis/sources/div_Ccode.c:1256` | `harnesses/P0/eva_main_s32_div_u32_s32.c` | 1 | 1 | 0 | UNCHANGED |
| `s32_mul_s32_s16_fac2` | P1 | `s32 s32_mul_s32_s16_fac2(s32 val1,s16 val2)` | `src_analysis/sources/mul_Ccode.c:1977` | `harnesses/P1/eva_main_s32_mul_s32_s16_fac2.c` | 1 | 1 | 0 | UNCHANGED |
| `s32_mul_s32_s32` | P1 | `s32 s32_mul_s32_s32(s32 val1, s32 val2)` | `src_analysis/sources/mul_Ccode.c:2656` | `harnesses/P1/eva_main_s32_mul_s32_s32.c` | 3 | 3 | 0 | UNCHANGED |
| `s32_mul_s32_s32_fac2` | P1 | `s32 s32_mul_s32_s32_fac2(s32 value, s32 factor)` | `src_analysis/sources/mul_Ccode.c:2207` | `harnesses/P1/eva_main_s32_mul_s32_s32_fac2.c` | 3 | 3 | 0 | UNCHANGED |
| `s32_mul_s32_s32_fac_twopow_u8` | P0 | `s32 s32_mul_s32_s32_fac_twopow_u8(s32 value, s32 factor, u8 power)` | `src_analysis/sources/mul_Ccode.c:2425` | `harnesses/P0/eva_main_s32_mul_s32_s32_fac_twopow_u8.c` | 3 | 3 | 0 | UNCHANGED |
| `s32_mul_s32_s8_fac2` | P1 | `s32 s32_mul_s32_s8_fac2(s32 value, s8 factor)` | `src_analysis/sources/mul_Ccode.c:2584` | `harnesses/P1/eva_main_s32_mul_s32_s8_fac2.c` | 1 | 1 | 0 | UNCHANGED |
| `s32_mul_s32_u16` | P1 | `s32 s32_mul_s32_u16(s32 value, u16 factor)` | `src_analysis/sources/mul_Ccode.c:752` | `harnesses/P1/eva_main_s32_mul_s32_u16.c` | 3 | 2 | 1 | REDUCED |
| `s32_mul_u32_s32` | P0 | `s32 s32_mul_u32_s32(u32 val1, s32 val2)` | `src_analysis/sources/mul_Ccode.c:1757` | `harnesses/P0/eva_main_s32_mul_u32_s32.c` | 1 | 1 | 0 | UNCHANGED |
| `u16_cos_u16` | P0 | `u16 u16_cos_u16(u16 phi)` | `src_analysis/sources/trig_Ccode.c:111` | `harnesses/P0/eva_main_u16_cos_u16.c` | 0 | 0 | 0 | UNCHANGED |
| `u16_div_s32_u16` | P1 | `u16 u16_div_s32_u16(s32 x_value, u16 y_value)` | `src_analysis/sources/div_Ccode.c:478` | `harnesses/P1/eva_main_u16_div_s32_u16.c` | 7 | 5 | 2 | REDUCED |
| `u16_mmv_u16_u16_s16_fac1` | P0 | `u16 u16_mmv_u16_u16_s16_fac1(register u16 mmv, register u16 measure, register s16 crlc)` | `src_analysis/sources/avrg_Ccode.c:211` | `harnesses/P0/eva_main_u16_mmv_u16_u16_s16_fac1.c` | 1 | 1 | 0 | UNCHANGED |
| `u16_mul_s16_u16_div_s16` | P1 | `u16 u16_mul_s16_u16_div_s16(s16 factor1, u16 factor2, s16 denominator)` | `src_analysis/sources/div_Ccode.c:721` | `harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c` | 11 | 9 | 2 | REDUCED |
| `u16_mul_s16_u16_div_u16` | P1 | `u16 u16_mul_s16_u16_div_u16(s16 factor1, u16 factor2, u16 denominator)` | `src_analysis/sources/div_Ccode.c:777` | `harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c` | 7 | 6 | 1 | REDUCED |
| `u16_mul_u16_u8_fac8` | P0 | `u16 u16_mul_u16_u8_fac8(u16 x_value, u8 y_value)` | `src_analysis/sources/mul_Ccode.c:4679` | `harnesses/P0/eva_main_u16_mul_u16_u8_fac8.c` | 0 | 0 | 0 | UNCHANGED |
| `u16_sin_u16` | P1 | `u16 u16_sin_u16(u16 Phi)` | `src_analysis/sources/trig_Ccode.c:38` | `harnesses/P1/eva_main_u16_sin_u16.c` | 0 | 0 | 0 | UNCHANGED |
| `u16_tan_u16` | P0 | `u16 u16_tan_u16(u16 phi)` | `src_analysis/sources/trig_Ccode.c:143` | `harnesses/P0/eva_main_u16_tan_u16.c` | 0 | 0 | 0 | UNCHANGED |
| `u32_div_s32_s32` | P1 | `u32 u32_div_s32_s32(s32 numerator, s32 denominator)` | `src_analysis/sources/div_Ccode.c:1138` | `harnesses/P1/eva_main_u32_div_s32_s32.c` | 9 | 9 | 0 | UNCHANGED |
| `u32_div_s32_u32` | P1 | `u32 u32_div_s32_u32(s32 numerator, u32 denominator)` | `src_analysis/sources/div_Ccode.c:1095` | `harnesses/P1/eva_main_u32_div_s32_u32.c` | 0 | 0 | 0 | UNCHANGED |
| `u32_div_u32_s32` | P1 | `u32 u32_div_u32_s32(u32 numerator, s32 denominator)` | `src_analysis/sources/div_Ccode.c:1058` | `harnesses/P1/eva_main_u32_div_u32_s32.c` | 0 | 0 | 0 | UNCHANGED |
| `u32_mmv_u32_u32_s32_fac1` | P0 | `u32 u32_mmv_u32_u32_s32_fac1(u32 mmv, u32 measure, s32 crlc)` | `src_analysis/sources/avrg_Ccode.c:995` | `harnesses/P0/eva_main_u32_mmv_u32_u32_s32_fac1.c` | 0 | 0 | 0 | UNCHANGED |

## Artifact mapping and source-derived descriptions

### root_s32_mul_s32_s16_fac_less1

- Declaration: `src_analysis/headers/mul_Ccode.h:101` — `s32 root_s32_mul_s32_s16_fac_less1(s32, s16, u32);`
- Definition: `src_analysis/sources/mul_Ccode.c:5055` — `s32 root_s32_mul_s32_s16_fac_less1(s32 value, s16 factor, u32 count)`
- Sources: `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: multiplication, shift, bitwise, branching, return paths
- Active helpers: `MulHighWord`
- Input model: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_short_interval(-32768, 32767); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P0/eva_main_root_s32_mul_s32_s16_fac_less1.c`
- Baseline runner/result: `scripts/run_root_s32_mul_s32_s16_fac_less1_baseline.sh` / `results/baseline/root_s32_mul_s32_s16_fac_less1`
- High Precision runner/result: `scripts/high_precision/run_root_s32_mul_s32_s16_fac_less1_high_precision.sh` / `results/high_precision/root_s32_mul_s32_s16_fac_less1`
- Alarm detail: `reports/alarm_details/root_s32_mul_s32_s16_fac_less1.md`
- Work note: `reports/work_notes/root_s32_mul_s32_s16_fac_less1_work_report.md` (PRESENT_IGNORED)

### root_s32_mul_s32_s8_fac_less1

- Declaration: `src_analysis/headers/mul_Ccode.h:137` — `s32 root_s32_mul_s32_s8_fac_less1(s32, s8, u32);`
- Definition: `src_analysis/sources/mul_Ccode.c:5207` — `s32 root_s32_mul_s32_s8_fac_less1(s32 value, s8 factor, u32 count)`
- Sources: `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: multiplication, shift, bitwise, branching, return paths
- Active helpers: `MulHighWord`
- Input model: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=(s8) Frama_C_int_interval(-128, 127); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P0/eva_main_root_s32_mul_s32_s8_fac_less1.c`
- Baseline runner/result: `scripts/run_root_s32_mul_s32_s8_fac_less1_baseline.sh` / `results/baseline/root_s32_mul_s32_s8_fac_less1`
- High Precision runner/result: `scripts/high_precision/run_root_s32_mul_s32_s8_fac_less1_high_precision.sh` / `results/high_precision/root_s32_mul_s32_s8_fac_less1`
- Alarm detail: `reports/alarm_details/root_s32_mul_s32_s8_fac_less1.md`
- Work note: `reports/work_notes/root_s32_mul_s32_s8_fac_less1_work_report.md` (PRESENT_IGNORED)

### root_s32_mul_s32_u16_fac_less1

- Declaration: `src_analysis/headers/mul_Ccode.h:95` — `s32 root_s32_mul_s32_u16_fac_less1(s32,u16, u32);`
- Definition: `src_analysis/sources/mul_Ccode.c:5131` — `s32 root_s32_mul_s32_u16_fac_less1(s32 value,u16 factor, u32 count)`
- Sources: `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: multiplication, shift, bitwise, branching, return paths
- Active helpers: `MulHighWord`
- Input model: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_short_interval(0, 65535); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P0/eva_main_root_s32_mul_s32_u16_fac_less1.c`
- Baseline runner/result: `scripts/run_root_s32_mul_s32_u16_fac_less1_baseline.sh` / `results/baseline/root_s32_mul_s32_u16_fac_less1`
- High Precision runner/result: `scripts/high_precision/run_root_s32_mul_s32_u16_fac_less1_high_precision.sh` / `results/high_precision/root_s32_mul_s32_u16_fac_less1`
- Alarm detail: `reports/alarm_details/root_s32_mul_s32_u16_fac_less1.md`
- Work note: `reports/work_notes/root_s32_mul_s32_u16_fac_less1_work_report.md` (PRESENT_IGNORED)

### root_s32_mul_s32_u8_fac_less1

- Declaration: `src_analysis/headers/mul_Ccode.h:131` — `s32 root_s32_mul_s32_u8_fac_less1(s32, u8, u32);`
- Definition: `src_analysis/sources/mul_Ccode.c:5526` — `s32 root_s32_mul_s32_u8_fac_less1(s32 value, u8 factor, u32 count)`
- Sources: `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: multiplication, shift, bitwise, branching, return paths
- Active helpers: `MulHighWord`
- Input model: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_char_interval(0, 255); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P0/eva_main_root_s32_mul_s32_u8_fac_less1.c`
- Baseline runner/result: `scripts/run_root_s32_mul_s32_u8_fac_less1_baseline.sh` / `results/baseline/root_s32_mul_s32_u8_fac_less1`
- High Precision runner/result: `scripts/high_precision/run_root_s32_mul_s32_u8_fac_less1_high_precision.sh` / `results/high_precision/root_s32_mul_s32_u8_fac_less1`
- Alarm detail: `reports/alarm_details/root_s32_mul_s32_u8_fac_less1.md`
- Work note: `reports/work_notes/root_s32_mul_s32_u8_fac_less1_work_report.md` (PRESENT_IGNORED)

### root_u32_mul_u32_s16_fac_less1

- Declaration: `src_analysis/headers/mul_Ccode.h:77` — `u32 root_u32_mul_u32_s16_fac_less1(u32,s16, u32);`
- Definition: `src_analysis/sources/mul_Ccode.c:5283` — `u32 root_u32_mul_u32_s16_fac_less1(u32 value,s16 factor, u32 count)`
- Sources: `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: multiplication, shift, bitwise, branching, return paths
- Active helpers: `MulHighWord`
- Input model: `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=Frama_C_short_interval( -32768, 32767); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P1/eva_main_root_u32_mul_u32_s16_fac_less1.c`
- Baseline runner/result: `scripts/run_root_u32_mul_u32_s16_fac_less1_baseline.sh` / `results/baseline/root_u32_mul_u32_s16_fac_less1`
- High Precision runner/result: `scripts/high_precision/run_root_u32_mul_u32_s16_fac_less1_high_precision.sh` / `results/high_precision/root_u32_mul_u32_s16_fac_less1`
- Alarm detail: `reports/alarm_details/root_u32_mul_u32_s16_fac_less1.md`
- Work note: `reports/work_notes/root_u32_mul_u32_s16_fac_less1_work_report.md` (PRESENT_IGNORED)

### root_u32_mul_u32_s32_fac_less1

- Declaration: `src_analysis/headers/mul_Ccode.h:89` — `u32 root_u32_mul_u32_s32_fac_less1(u32, s32, u32);`
- Definition: `src_analysis/sources/mul_Ccode.c:5347` — `u32 root_u32_mul_u32_s32_fac_less1(u32 value, s32 factor, u32 count)`
- Sources: `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: shift, branching, return paths
- Active helpers: `MulHighWord`
- Input model: `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P1/eva_main_root_u32_mul_u32_s32_fac_less1.c`
- Baseline runner/result: `scripts/run_root_u32_mul_u32_s32_fac_less1_baseline.sh` / `results/baseline/root_u32_mul_u32_s32_fac_less1`
- High Precision runner/result: `scripts/high_precision/run_root_u32_mul_u32_s32_fac_less1_high_precision.sh` / `results/high_precision/root_u32_mul_u32_s32_fac_less1`
- Alarm detail: `reports/alarm_details/root_u32_mul_u32_s32_fac_less1.md`
- Work note: `reports/work_notes/root_u32_mul_u32_s32_fac_less1_work_report.md` (PRESENT_IGNORED)

### root_u32_mul_u32_s8_fac_less1

- Declaration: `src_analysis/headers/mul_Ccode.h:125` — `u32 root_u32_mul_u32_s8_fac_less1(u32, s8, u32);`
- Definition: `src_analysis/sources/mul_Ccode.c:5425` — `u32 root_u32_mul_u32_s8_fac_less1(u32 value, s8 factor, u32 count)`
- Sources: `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: multiplication, shift, bitwise, branching, return paths
- Active helpers: `MulHighWord`
- Input model: `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=(s8) Frama_C_int_interval( -128, 127); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P1/eva_main_root_u32_mul_u32_s8_fac_less1.c`
- Baseline runner/result: `scripts/run_root_u32_mul_u32_s8_fac_less1_baseline.sh` / `results/baseline/root_u32_mul_u32_s8_fac_less1`
- High Precision runner/result: `scripts/high_precision/run_root_u32_mul_u32_s8_fac_less1_high_precision.sh` / `results/high_precision/root_u32_mul_u32_s8_fac_less1`
- Alarm detail: `reports/alarm_details/root_u32_mul_u32_s8_fac_less1.md`
- Work note: `reports/work_notes/root_u32_mul_u32_s8_fac_less1_work_report.md` (PRESENT_IGNORED)

### rotateLeft

- Declaration: `src_analysis/headers/rotatefunc.h:14` — `u32 rotateLeft(u32 num, u32 rotation);`
- Definition: `src_analysis/sources/rotatefunc.c:56` — `u32 rotateLeft(u32 num, u32 rotation)`
- Sources: `src_analysis/sources/rotatefunc.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements word rotation using active shift and bitwise operations with branch-controlled rotation handling.
- Active operation profile: multiplication, modulo, shift, bitwise, looping, return paths
- Active helpers: `none`
- Input model: `num=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); rotation=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P0/eva_main_rotateLeft.c`
- Baseline runner/result: `scripts/run_rotateLeft_baseline.sh` / `results/baseline/rotateLeft`
- High Precision runner/result: `scripts/high_precision/run_rotateLeft_high_precision.sh` / `results/high_precision/rotateLeft`
- Alarm detail: `reports/alarm_details/rotateLeft.md`
- Work note: `reports/work_notes/rotateLeft_work_report.md` (PRESENT_IGNORED)

### rotateRight

- Declaration: `src_analysis/headers/rotatefunc.h:15` — `u32 rotateRight(u32 num, u32 rotation);`
- Definition: `src_analysis/sources/rotatefunc.c:101` — `u32 rotateRight(u32 num, u32 rotation)`
- Sources: `src_analysis/sources/rotatefunc.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements word rotation using active shift and bitwise operations with branch-controlled rotation handling.
- Active operation profile: multiplication, modulo, shift, bitwise, looping, return paths
- Active helpers: `none`
- Input model: `num=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); rotation=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P0/eva_main_rotateRight.c`
- Baseline runner/result: `scripts/run_rotateRight_baseline.sh` / `results/baseline/rotateRight`
- High Precision runner/result: `scripts/high_precision/run_rotateRight_high_precision.sh` / `results/high_precision/rotateRight`
- Alarm detail: `reports/alarm_details/rotateRight.md`
- Work note: `reports/work_notes/rotateRight_work_report.md` (PRESENT_IGNORED)

### s16_cos_u32

- Declaration: `src_analysis/headers/trig_Ccode.h:23` — `s16 s16_cos_u32(u32);`
- Definition: `src_analysis/sources/trig_Ccode.c:127` — `s16 s16_cos_u32(u32 phi)`
- Sources: `src_analysis/sources/trig_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: The active function body is empty; the non-void interface reaches its closing brace without an active return expression.
- Active operation profile: no active arithmetic/control operation
- Active helpers: `none`
- Input model: `phi=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P0/eva_main_s16_cos_u32.c`
- Baseline runner/result: `scripts/run_s16_cos_u32_baseline.sh` / `results/baseline/s16_cos_u32`
- High Precision runner/result: `scripts/high_precision/run_s16_cos_u32_high_precision.sh` / `results/high_precision/s16_cos_u32`
- Alarm detail: `reports/alarm_details/s16_cos_u32.md`
- Work note: `reports/work_notes/s16_cos_u32_work_report.md` (PRESENT_IGNORED)

### s16_div_s32_s16

- Declaration: `src_analysis/headers/div_Ccode.h:19` — `s16 s16_div_s32_s16(s32, s16);`
- Definition: `src_analysis/sources/div_Ccode.c:255` — `s16 s16_div_s32_s16(s32 numerator, s16 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- Baseline runner/result: `scripts/run_s16_div_s32_s16_baseline.sh` / `results/baseline/s16_div_s32_s16`
- High Precision runner/result: `scripts/high_precision/run_s16_div_s32_s16_high_precision.sh` / `results/high_precision/s16_div_s32_s16`
- Alarm detail: `reports/alarm_details/s16_div_s32_s16.md`
- Work note: `reports/work_notes/s16_div_s32_s16_work_report.md` (PRESENT_IGNORED)

### s16_div_s32_u32

- Declaration: `src_analysis/headers/div_Ccode.h:65` — `s16 s16_div_s32_u32(s32, u32);`
- Definition: `src_analysis/sources/div_Ccode.c:1457` — `s16 s16_div_s32_u32(s32 numerator, u32 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, bitwise, branching, return paths
- Active helpers: `none`
- Input model: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P0/eva_main_s16_div_s32_u32.c`
- Baseline runner/result: `scripts/run_s16_div_s32_u32_baseline.sh` / `results/baseline/s16_div_s32_u32`
- High Precision runner/result: `scripts/high_precision/run_s16_div_s32_u32_high_precision.sh` / `results/high_precision/s16_div_s32_u32`
- Alarm detail: `reports/alarm_details/s16_div_s32_u32.md`
- Work note: `reports/work_notes/s16_div_s32_u32_work_report.md` (PRESENT_IGNORED)

### s16_fac05_div_s16_s16

- Declaration: `src_analysis/headers/div_Ccode.h:17` — `s16 s16_fac05_div_s16_s16(s16, s16 );`
- Definition: `src_analysis/sources/div_Ccode.c:170` — `s16 s16_fac05_div_s16_s16(s16 numerator, s16 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_short_interval( -32768, 32767)`
- Harness: `harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`
- Baseline runner/result: `scripts/run_s16_fac05_div_s16_s16_baseline.sh` / `results/baseline/s16_fac05_div_s16_s16`
- High Precision runner/result: `scripts/high_precision/run_s16_fac05_div_s16_s16_high_precision.sh` / `results/high_precision/s16_fac05_div_s16_s16`
- Alarm detail: `reports/alarm_details/s16_fac05_div_s16_s16.md`
- Work note: `reports/work_notes/s16_fac05_div_s16_s16_work_report.md` (PRESENT_IGNORED)

### s16_fac05_div_s16_u16

- Declaration: `src_analysis/headers/div_Ccode.h:21` — `s16 s16_fac05_div_s16_u16(s16, u16);`
- Definition: `src_analysis/sources/div_Ccode.c:343` — `s16 s16_fac05_div_s16_u16(s16 numerator, u16 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, bitwise, branching, return paths
- Active helpers: `none`
- Input model: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Harness: `harnesses/P1/eva_main_s16_fac05_div_s16_u16.c`
- Baseline runner/result: `scripts/run_s16_fac05_div_s16_u16_baseline.sh` / `results/baseline/s16_fac05_div_s16_u16`
- High Precision runner/result: `scripts/high_precision/run_s16_fac05_div_s16_u16_high_precision.sh` / `results/high_precision/s16_fac05_div_s16_u16`
- Alarm detail: `reports/alarm_details/s16_fac05_div_s16_u16.md`
- Work note: `reports/work_notes/s16_fac05_div_s16_u16_work_report.md` (PRESENT_IGNORED)

### s16_hip1_s16_s8_s8_u16_fac1

- Declaration: `src_analysis/headers/hip_Ccode.h:17` — `s16 s16_hip1_s16_s8_s8_u16_fac1(s16, s8, s8, u16);`
- Definition: `src_analysis/sources/hip_Ccode.c:158` — `s16 s16_hip1_s16_s8_s8_u16_fac1(s16 yold, s8 u, s8 uold, u16 m)`
- Sources: `src_analysis/sources/hip_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements the project HIP arithmetic interface using active mixed-width arithmetic and branch-controlled limiting.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `yold=Frama_C_short_interval( -32768, 32767); u=(s8) Frama_C_int_interval( -128, 127); uold=(s8) Frama_C_int_interval( -128, 127); m=Frama_C_unsigned_short_interval( 0, 65535)`
- Harness: `harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c`
- Baseline runner/result: `scripts/run_s16_hip1_s16_s8_s8_u16_fac1_baseline.sh` / `results/baseline/s16_hip1_s16_s8_s8_u16_fac1`
- High Precision runner/result: `scripts/high_precision/run_s16_hip1_s16_s8_s8_u16_fac1_high_precision.sh` / `results/high_precision/s16_hip1_s16_s8_s8_u16_fac1`
- Alarm detail: `reports/alarm_details/s16_hip1_s16_s8_s8_u16_fac1.md`
- Work note: `reports/work_notes/s16_hip1_s16_s8_s8_u16_fac1_work_report.md` (PRESENT_IGNORED)

### s16_hip1_s16_u8_u8_u16_fac1

- Declaration: `src_analysis/headers/hip_Ccode.h:14` — `s16 s16_hip1_s16_u8_u8_u16_fac1(s16, u8, u8, u16);`
- Definition: `src_analysis/sources/hip_Ccode.c:44` — `s16 s16_hip1_s16_u8_u8_u16_fac1(s16 yold, u8 u, u8 uold, u16 m)`
- Sources: `src_analysis/sources/hip_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements the project HIP arithmetic interface using active mixed-width arithmetic and branch-controlled limiting.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `yold=Frama_C_short_interval( -32768, 32767); u=Frama_C_unsigned_char_interval( 0, 255); uold=Frama_C_unsigned_char_interval( 0, 255); m=Frama_C_unsigned_short_interval( 0, 65535)`
- Harness: `harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c`
- Baseline runner/result: `scripts/run_s16_hip1_s16_u8_u8_u16_fac1_baseline.sh` / `results/baseline/s16_hip1_s16_u8_u8_u16_fac1`
- High Precision runner/result: `scripts/high_precision/run_s16_hip1_s16_u8_u8_u16_fac1_high_precision.sh` / `results/high_precision/s16_hip1_s16_u8_u8_u16_fac1`
- Alarm detail: `reports/alarm_details/s16_hip1_s16_u8_u8_u16_fac1.md`
- Work note: `reports/work_notes/s16_hip1_s16_u8_u8_u16_fac1_work_report.md` (PRESENT_IGNORED)

### s16_mmv_s16_s16_s16_fac1

- Declaration: `src_analysis/headers/avrg_Ccode.h:30` — `s16 s16_mmv_s16_s16_s16_fac1( s16, s16, s16);`
- Definition: `src_analysis/sources/avrg_Ccode.c:52` — `s16 s16_mmv_s16_s16_s16_fac1(register s16 mmv, register s16 measure, register s16 crlc)`
- Sources: `src_analysis/sources/avrg_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements the project MMV arithmetic interface using the active difference, scaling, and limiting operations in the source.
- Active operation profile: multiplication, shift, bitwise, branching, return paths
- Active helpers: `none`
- Input model: `mmv=Frama_C_short_interval( -32768, 32767); measure=Frama_C_short_interval( -32768, 32767); crlc=Frama_C_short_interval( -32768, 32767)`
- Harness: `harnesses/P1/eva_main_s16_mmv_s16_s16_s16_fac1.c`
- Baseline runner/result: `scripts/run_s16_mmv_s16_s16_s16_fac1_baseline.sh` / `results/baseline/s16_mmv_s16_s16_s16_fac1`
- High Precision runner/result: `scripts/high_precision/run_s16_mmv_s16_s16_s16_fac1_high_precision.sh` / `results/high_precision/s16_mmv_s16_s16_s16_fac1`
- Alarm detail: `reports/alarm_details/s16_mmv_s16_s16_s16_fac1.md`
- Work note: `reports/work_notes/s16_mmv_s16_s16_s16_fac1_work_report.md` (PRESENT_IGNORED)

### s16_mul_s16_s16_div_s16

- Declaration: `src_analysis/headers/div_Ccode.h:47` — `s16 s16_mul_s16_s16_div_s16(s16, s16, s16);`
- Definition: `src_analysis/sources/div_Ccode.c:947` — `s16 s16_mul_s16_s16_div_s16(s16 fak1, s16 fak2, s16 div)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width multiply/divide scaling routine with guarded arithmetic and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `fak1<-data1=Frama_C_short_interval(-32768, 32767); fak2<-data2=Frama_C_short_interval(-32768, 32767); div<-denominator=Frama_C_short_interval(-32768, 32767)`
- Harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`
- Baseline runner/result: `scripts/run_s16_mul_s16_s16_div_s16_baseline.sh` / `results/baseline/s16_mul_s16_s16_div_s16`
- High Precision runner/result: `scripts/high_precision/run_s16_mul_s16_s16_div_s16_high_precision.sh` / `results/high_precision/s16_mul_s16_s16_div_s16`
- Alarm detail: `reports/alarm_details/s16_mul_s16_s16_div_s16.md`
- Work note: `reports/work_notes/s16_mul_s16_s16_div_s16_work_report.md` (PRESENT_IGNORED)

### s16_mul_s16_s16_div_u16

- Declaration: `src_analysis/headers/div_Ccode.h:49` — `s16 s16_mul_s16_s16_div_u16(s16, s16, u16);`
- Definition: `src_analysis/sources/div_Ccode.c:1000` — `s16 s16_mul_s16_s16_div_u16(s16 data1,s16 data2,u16 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width multiply/divide scaling routine with guarded arithmetic and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `data1=Frama_C_short_interval( -32768, 32767); data2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c`
- Baseline runner/result: `scripts/run_s16_mul_s16_s16_div_u16_baseline.sh` / `results/baseline/s16_mul_s16_s16_div_u16`
- High Precision runner/result: `scripts/high_precision/run_s16_mul_s16_s16_div_u16_high_precision.sh` / `results/high_precision/s16_mul_s16_s16_div_u16`
- Alarm detail: `reports/alarm_details/s16_mul_s16_s16_div_u16.md`
- Work note: `reports/work_notes/s16_mul_s16_s16_div_u16_work_report.md` (PRESENT_IGNORED)

### s16_mul_s16_u16_div_s16

- Declaration: `src_analysis/headers/div_Ccode.h:33` — `s16 s16_mul_s16_u16_div_s16(s16, u16, s16);`
- Definition: `src_analysis/sources/div_Ccode.c:611` — `s16 s16_mul_s16_u16_div_s16(s16 factor1, u16 factor2, s16 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width multiply/divide scaling routine with guarded arithmetic and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Harness: `harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`
- Baseline runner/result: `scripts/run_s16_mul_s16_u16_div_s16_baseline.sh` / `results/baseline/s16_mul_s16_u16_div_s16`
- High Precision runner/result: `scripts/high_precision/run_s16_mul_s16_u16_div_s16_high_precision.sh` / `results/high_precision/s16_mul_s16_u16_div_s16`
- Alarm detail: `reports/alarm_details/s16_mul_s16_u16_div_s16.md`
- Work note: `reports/work_notes/s16_mul_s16_u16_div_s16_work_report.md` (PRESENT_IGNORED)

### s16_mul_s16_u16_fac025

- Declaration: `src_analysis/headers/mul_Ccode.h:41` — `s16 s16_mul_s16_u16_fac025(s16, u16);`
- Definition: `src_analysis/sources/mul_Ccode.c:3341` — `s16 s16_mul_s16_u16_fac025(s16 value, u16 factor)`
- Sources: `src_analysis/sources/mul_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: no active arithmetic/control operation
- Active helpers: `root_s16_mul_s16_u16_fac_less1`
- Input model: `value=Frama_C_short_interval(-32768, 32767); factor=Frama_C_unsigned_short_interval(0, 65535)`
- Harness: `harnesses/P0/eva_main_s16_mul_s16_u16_fac025.c`
- Baseline runner/result: `scripts/run_s16_mul_s16_u16_fac025_baseline.sh` / `results/baseline/s16_mul_s16_u16_fac025`
- High Precision runner/result: `scripts/high_precision/run_s16_mul_s16_u16_fac025_high_precision.sh` / `results/high_precision/s16_mul_s16_u16_fac025`
- Alarm detail: `reports/alarm_details/s16_mul_s16_u16_fac025.md`
- Work note: `reports/work_notes/s16_mul_s16_u16_fac025_work_report.md` (PRESENT_IGNORED)

### s16_mul_u16_s16_div_u16

- Declaration: `src_analysis/headers/div_Ccode.h:35` — `s16 s16_mul_u16_s16_div_u16(u16, s16, u16);`
- Definition: `src_analysis/sources/div_Ccode.c:667` — `s16 s16_mul_u16_s16_div_u16(u16 factor1, s16 factor2, u16 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width multiply/divide scaling routine with guarded arithmetic and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `factor1=Frama_C_unsigned_short_interval( 0, 65535); factor2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Harness: `harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`
- Baseline runner/result: `scripts/run_s16_mul_u16_s16_div_u16_baseline.sh` / `results/baseline/s16_mul_u16_s16_div_u16`
- High Precision runner/result: `scripts/high_precision/run_s16_mul_u16_s16_div_u16_high_precision.sh` / `results/high_precision/s16_mul_u16_s16_div_u16`
- Alarm detail: `reports/alarm_details/s16_mul_u16_s16_div_u16.md`
- Work note: `reports/work_notes/s16_mul_u16_s16_div_u16_work_report.md` (PRESENT_IGNORED)

### s16_sin_u32

- Declaration: `src_analysis/headers/trig_Ccode.h:17` — `s16 s16_sin_u32(u32);`
- Definition: `src_analysis/sources/trig_Ccode.c:95` — `s16 s16_sin_u32(u32 phi)`
- Sources: `src_analysis/sources/trig_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: The active function body is empty; the non-void interface reaches its closing brace without an active return expression.
- Active operation profile: no active arithmetic/control operation
- Active helpers: `none`
- Input model: `phi=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P0/eva_main_s16_sin_u32.c`
- Baseline runner/result: `scripts/run_s16_sin_u32_baseline.sh` / `results/baseline/s16_sin_u32`
- High Precision runner/result: `scripts/high_precision/run_s16_sin_u32_high_precision.sh` / `results/high_precision/s16_sin_u32`
- Alarm detail: `reports/alarm_details/s16_sin_u32.md`
- Work note: `reports/work_notes/s16_sin_u32_work_report.md` (PRESENT_IGNORED)

### s16_tan_u32

- Declaration: `src_analysis/headers/trig_Ccode.h:29` — `s16 s16_tan_u32(u32);`
- Definition: `src_analysis/sources/trig_Ccode.c:159` — `s16 s16_tan_u32(u32 phi)`
- Sources: `src_analysis/sources/trig_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: The active function body is empty; the non-void interface reaches its closing brace without an active return expression.
- Active operation profile: no active arithmetic/control operation
- Active helpers: `none`
- Input model: `phi=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P0/eva_main_s16_tan_u32.c`
- Baseline runner/result: `scripts/run_s16_tan_u32_baseline.sh` / `results/baseline/s16_tan_u32`
- High Precision runner/result: `scripts/high_precision/run_s16_tan_u32_high_precision.sh` / `results/high_precision/s16_tan_u32`
- Alarm detail: `reports/alarm_details/s16_tan_u32.md`
- Work note: `reports/work_notes/s16_tan_u32_work_report.md` (PRESENT_IGNORED)

### s32_div_s32_s32

- Declaration: `src_analysis/headers/div_Ccode.h:63` — `s32 s32_div_s32_s32(s32, s32);`
- Definition: `src_analysis/sources/div_Ccode.c:1379` — `s32 s32_div_s32_s32(s32 numerator, s32 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, bitwise, branching, return paths
- Active helpers: `none`
- Input model: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Harness: `harnesses/P0/eva_main_s32_div_s32_s32.c`
- Baseline runner/result: `scripts/run_s32_div_s32_s32_baseline.sh` / `results/baseline/s32_div_s32_s32`
- High Precision runner/result: `scripts/high_precision/run_s32_div_s32_s32_high_precision.sh` / `results/high_precision/s32_div_s32_s32`
- Alarm detail: `reports/alarm_details/s32_div_s32_s32.md`
- Work note: `reports/work_notes/s32_div_s32_s32_work_report.md` (PRESENT_IGNORED)

### s32_div_s32_u32

- Declaration: `src_analysis/headers/div_Ccode.h:61` — `s32 s32_div_s32_u32(s32, u32);`
- Definition: `src_analysis/sources/div_Ccode.c:1311` — `s32 s32_div_s32_u32(s32 numerator, u32 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, bitwise, branching, return paths
- Active helpers: `none`
- Input model: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P0/eva_main_s32_div_s32_u32.c`
- Baseline runner/result: `scripts/run_s32_div_s32_u32_baseline.sh` / `results/baseline/s32_div_s32_u32`
- High Precision runner/result: `scripts/high_precision/run_s32_div_s32_u32_high_precision.sh` / `results/high_precision/s32_div_s32_u32`
- Alarm detail: `reports/alarm_details/s32_div_s32_u32.md`
- Work note: `reports/work_notes/s32_div_s32_u32_work_report.md` (PRESENT_IGNORED)

### s32_div_u32_s32

- Declaration: `src_analysis/headers/div_Ccode.h:59` — `s32 s32_div_u32_s32(u32, s32);`
- Definition: `src_analysis/sources/div_Ccode.c:1256` — `s32 s32_div_u32_s32(u32 numerator, s32 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `numerator=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Harness: `harnesses/P0/eva_main_s32_div_u32_s32.c`
- Baseline runner/result: `scripts/run_s32_div_u32_s32_baseline.sh` / `results/baseline/s32_div_u32_s32`
- High Precision runner/result: `scripts/high_precision/run_s32_div_u32_s32_high_precision.sh` / `results/high_precision/s32_div_u32_s32`
- Alarm detail: `reports/alarm_details/s32_div_u32_s32.md`
- Work note: `reports/work_notes/s32_div_u32_s32_work_report.md` (PRESENT_IGNORED)

### s32_mul_s32_s16_fac2

- Declaration: `src_analysis/headers/mul_Ccode.h:105` — `s32 s32_mul_s32_s16_fac2( s32, s16);`
- Definition: `src_analysis/sources/mul_Ccode.c:1977` — `s32 s32_mul_s32_s16_fac2(s32 val1,s16 val2)`
- Sources: `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: multiplication, shift, bitwise, branching, return paths
- Active helpers: `MulHighWord`
- Input model: `val1=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); val2=Frama_C_short_interval( -32768, 32767)`
- Harness: `harnesses/P1/eva_main_s32_mul_s32_s16_fac2.c`
- Baseline runner/result: `scripts/run_s32_mul_s32_s16_fac2_baseline.sh` / `results/baseline/s32_mul_s32_s16_fac2`
- High Precision runner/result: `scripts/high_precision/run_s32_mul_s32_s16_fac2_high_precision.sh` / `results/high_precision/s32_mul_s32_s16_fac2`
- Alarm detail: `reports/alarm_details/s32_mul_s32_s16_fac2.md`
- Work note: `reports/work_notes/s32_mul_s32_s16_fac2_work_report.md` (PRESENT_IGNORED)

### s32_mul_s32_s32

- Declaration: `src_analysis/headers/mul_Ccode.h:171` — `s32 s32_mul_s32_s32(s32 , s32 );`
- Definition: `src_analysis/sources/mul_Ccode.c:2656` — `s32 s32_mul_s32_s32(s32 val1, s32 val2)`
- Sources: `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: multiplication, branching, return paths
- Active helpers: `MulHighWord`
- Input model: `val1=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); val2=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Harness: `harnesses/P1/eva_main_s32_mul_s32_s32.c`
- Baseline runner/result: `scripts/run_s32_mul_s32_s32_baseline.sh` / `results/baseline/s32_mul_s32_s32`
- High Precision runner/result: `scripts/high_precision/run_s32_mul_s32_s32_high_precision.sh` / `results/high_precision/s32_mul_s32_s32`
- Alarm detail: `reports/alarm_details/s32_mul_s32_s32.md`
- Work note: `reports/work_notes/s32_mul_s32_s32_work_report.md` (PRESENT_IGNORED)

### s32_mul_s32_s32_fac2

- Declaration: `src_analysis/headers/mul_Ccode.h:115` — `s32 s32_mul_s32_s32_fac2( s32, s32);`
- Definition: `src_analysis/sources/mul_Ccode.c:2207` — `s32 s32_mul_s32_s32_fac2(s32 value, s32 factor)`
- Sources: `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: multiplication, shift, bitwise, branching, return paths
- Active helpers: `MulHighWord`
- Input model: `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Harness: `harnesses/P1/eva_main_s32_mul_s32_s32_fac2.c`
- Baseline runner/result: `scripts/run_s32_mul_s32_s32_fac2_baseline.sh` / `results/baseline/s32_mul_s32_s32_fac2`
- High Precision runner/result: `scripts/high_precision/run_s32_mul_s32_s32_fac2_high_precision.sh` / `results/high_precision/s32_mul_s32_s32_fac2`
- Alarm detail: `reports/alarm_details/s32_mul_s32_s32_fac2.md`
- Work note: `reports/work_notes/s32_mul_s32_s32_fac2_work_report.md` (PRESENT_IGNORED)

### s32_mul_s32_s32_fac_twopow_u8

- Declaration: `src_analysis/headers/mul_Ccode.h:175` — `s32 s32_mul_s32_s32_fac_twopow_u8(s32 , s32 , u8 );`
- Definition: `src_analysis/sources/mul_Ccode.c:2425` — `s32 s32_mul_s32_s32_fac_twopow_u8(s32 value, s32 factor, u8 power)`
- Sources: `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: multiplication, shift, bitwise, branching, return paths
- Active helpers: `MulHighWord`
- Input model: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); power=Frama_C_unsigned_char_interval(0, 255)`
- Harness: `harnesses/P0/eva_main_s32_mul_s32_s32_fac_twopow_u8.c`
- Baseline runner/result: `scripts/run_s32_mul_s32_s32_fac_twopow_u8_baseline.sh` / `results/baseline/s32_mul_s32_s32_fac_twopow_u8`
- High Precision runner/result: `scripts/high_precision/run_s32_mul_s32_s32_fac_twopow_u8_high_precision.sh` / `results/high_precision/s32_mul_s32_s32_fac_twopow_u8`
- Alarm detail: `reports/alarm_details/s32_mul_s32_s32_fac_twopow_u8.md`
- Work note: `reports/work_notes/s32_mul_s32_s32_fac_twopow_u8_work_report.md` (PRESENT_IGNORED)

### s32_mul_s32_s8_fac2

- Declaration: `src_analysis/headers/mul_Ccode.h:141` — `s32 s32_mul_s32_s8_fac2( s32, s8);`
- Definition: `src_analysis/sources/mul_Ccode.c:2584` — `s32 s32_mul_s32_s8_fac2(s32 value, s8 factor)`
- Sources: `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: multiplication, shift, bitwise, branching, return paths
- Active helpers: `MulHighWord`
- Input model: `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=(s8) Frama_C_int_interval( -128, 127)`
- Harness: `harnesses/P1/eva_main_s32_mul_s32_s8_fac2.c`
- Baseline runner/result: `scripts/run_s32_mul_s32_s8_fac2_baseline.sh` / `results/baseline/s32_mul_s32_s8_fac2`
- High Precision runner/result: `scripts/high_precision/run_s32_mul_s32_s8_fac2_high_precision.sh` / `results/high_precision/s32_mul_s32_s8_fac2`
- Alarm detail: `reports/alarm_details/s32_mul_s32_s8_fac2.md`
- Work note: `reports/work_notes/s32_mul_s32_s8_fac2_work_report.md` (PRESENT_IGNORED)

### s32_mul_s32_u16

- Declaration: `src_analysis/headers/mul_Ccode.h:149` — `s32 s32_mul_s32_u16(s32, u16);`
- Definition: `src_analysis/sources/mul_Ccode.c:752` — `s32 s32_mul_s32_u16(s32 value, u16 factor)`
- Sources: `src_analysis/sources/mul_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: division, multiplication, branching, return paths
- Active helpers: `none`
- Input model: `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_short_interval( 0, 65535)`
- Harness: `harnesses/P1/eva_main_s32_mul_s32_u16.c`
- Baseline runner/result: `scripts/run_s32_mul_s32_u16_baseline.sh` / `results/baseline/s32_mul_s32_u16`
- High Precision runner/result: `scripts/high_precision/run_s32_mul_s32_u16_high_precision.sh` / `results/high_precision/s32_mul_s32_u16`
- Alarm detail: `reports/alarm_details/s32_mul_s32_u16.md`
- Work note: `reports/work_notes/s32_mul_s32_u16_work_report.md` (PRESENT_IGNORED)

### s32_mul_u32_s32

- Declaration: `src_analysis/headers/mul_Ccode.h:169` — `s32 s32_mul_u32_s32(u32 , s32 );`
- Definition: `src_analysis/sources/mul_Ccode.c:1757` — `s32 s32_mul_u32_s32(u32 val1, s32 val2)`
- Sources: `src_analysis/sources/mul_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: division, multiplication, branching, return paths
- Active helpers: `none`
- Input model: `val1=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL); val2=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Harness: `harnesses/P0/eva_main_s32_mul_u32_s32.c`
- Baseline runner/result: `scripts/run_s32_mul_u32_s32_baseline.sh` / `results/baseline/s32_mul_u32_s32`
- High Precision runner/result: `scripts/high_precision/run_s32_mul_u32_s32_high_precision.sh` / `results/high_precision/s32_mul_u32_s32`
- Alarm detail: `reports/alarm_details/s32_mul_u32_s32.md`
- Work note: `reports/work_notes/s32_mul_u32_s32_work_report.md` (PRESENT_IGNORED)

### u16_cos_u16

- Declaration: `src_analysis/headers/trig_Ccode.h:20` — `u16 u16_cos_u16(u16);`
- Definition: `src_analysis/sources/trig_Ccode.c:111` — `u16 u16_cos_u16(u16 phi)`
- Sources: `src_analysis/sources/trig_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: The active function body is empty; the non-void interface reaches its closing brace without an active return expression.
- Active operation profile: no active arithmetic/control operation
- Active helpers: `none`
- Input model: `phi=Frama_C_unsigned_short_interval( 0, 65535)`
- Harness: `harnesses/P0/eva_main_u16_cos_u16.c`
- Baseline runner/result: `scripts/run_u16_cos_u16_baseline.sh` / `results/baseline/u16_cos_u16`
- High Precision runner/result: `scripts/high_precision/run_u16_cos_u16_high_precision.sh` / `results/high_precision/u16_cos_u16`
- Alarm detail: `reports/alarm_details/u16_cos_u16.md`
- Work note: `reports/work_notes/u16_cos_u16_work_report.md` (PRESENT_IGNORED)

### u16_div_s32_u16

- Declaration: `src_analysis/headers/div_Ccode.h:27` — `u16 u16_div_s32_u16(s32, u16);`
- Definition: `src_analysis/sources/div_Ccode.c:478` — `u16 u16_div_s32_u16(s32 x_value, u16 y_value)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, bitwise, branching, return paths
- Active helpers: `none`
- Input model: `x_value<-numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); y_value<-denominator=Frama_C_unsigned_short_interval(0, 65535)`
- Harness: `harnesses/P1/eva_main_u16_div_s32_u16.c`
- Baseline runner/result: `scripts/run_u16_div_s32_u16_baseline.sh` / `results/baseline/u16_div_s32_u16`
- High Precision runner/result: `scripts/high_precision/run_u16_div_s32_u16_high_precision.sh` / `results/high_precision/u16_div_s32_u16`
- Alarm detail: `reports/alarm_details/u16_div_s32_u16.md`
- Work note: `reports/work_notes/u16_div_s32_u16_work_report.md` (PRESENT_IGNORED)

### u16_mmv_u16_u16_s16_fac1

- Declaration: `src_analysis/headers/avrg_Ccode.h:33` — `u16 u16_mmv_u16_u16_s16_fac1(u16, u16, s16);`
- Definition: `src_analysis/sources/avrg_Ccode.c:211` — `u16 u16_mmv_u16_u16_s16_fac1(register u16 mmv, register u16 measure, register s16 crlc)`
- Sources: `src_analysis/sources/avrg_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements the project MMV arithmetic interface using the active difference, scaling, and limiting operations in the source.
- Active operation profile: multiplication, shift, bitwise, branching, return paths
- Active helpers: `none`
- Input model: `mmv=Frama_C_unsigned_short_interval(0, 65535); measure=Frama_C_unsigned_short_interval(0, 65535); crlc=Frama_C_short_interval(-32768, 32767)`
- Harness: `harnesses/P0/eva_main_u16_mmv_u16_u16_s16_fac1.c`
- Baseline runner/result: `scripts/run_u16_mmv_u16_u16_s16_fac1_baseline.sh` / `results/baseline/u16_mmv_u16_u16_s16_fac1`
- High Precision runner/result: `scripts/high_precision/run_u16_mmv_u16_u16_s16_fac1_high_precision.sh` / `results/high_precision/u16_mmv_u16_u16_s16_fac1`
- Alarm detail: `reports/alarm_details/u16_mmv_u16_u16_s16_fac1.md`
- Work note: `reports/work_notes/u16_mmv_u16_u16_s16_fac1_work_report.md` (PRESENT_IGNORED)

### u16_mul_s16_u16_div_s16

- Declaration: `src_analysis/headers/div_Ccode.h:37` — `u16 u16_mul_s16_u16_div_s16(s16, u16, s16);`
- Definition: `src_analysis/sources/div_Ccode.c:721` — `u16 u16_mul_s16_u16_div_s16(s16 factor1, u16 factor2, s16 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width multiply/divide scaling routine with guarded arithmetic and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`
- Baseline runner/result: `scripts/run_u16_mul_s16_u16_div_s16_baseline.sh` / `results/baseline/u16_mul_s16_u16_div_s16`
- High Precision runner/result: `scripts/high_precision/run_u16_mul_s16_u16_div_s16_high_precision.sh` / `results/high_precision/u16_mul_s16_u16_div_s16`
- Alarm detail: `reports/alarm_details/u16_mul_s16_u16_div_s16.md`
- Work note: `reports/work_notes/u16_mul_s16_u16_div_s16_work_report.md` (PRESENT_IGNORED)

### u16_mul_s16_u16_div_u16

- Declaration: `src_analysis/headers/div_Ccode.h:39` — `u16 u16_mul_s16_u16_div_u16(s16, u16, u16);`
- Definition: `src_analysis/sources/div_Ccode.c:777` — `u16 u16_mul_s16_u16_div_u16(s16 factor1, u16 factor2, u16 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width multiply/divide scaling routine with guarded arithmetic and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`
- Baseline runner/result: `scripts/run_u16_mul_s16_u16_div_u16_baseline.sh` / `results/baseline/u16_mul_s16_u16_div_u16`
- High Precision runner/result: `scripts/high_precision/run_u16_mul_s16_u16_div_u16_high_precision.sh` / `results/high_precision/u16_mul_s16_u16_div_u16`
- Alarm detail: `reports/alarm_details/u16_mul_s16_u16_div_u16.md`
- Work note: `reports/work_notes/u16_mul_s16_u16_div_u16_work_report.md` (PRESENT_IGNORED)

### u16_mul_u16_u8_fac8

- Declaration: `src_analysis/headers/mul_Ccode.h:62` — `u16 u16_mul_u16_u8_fac8(u16, u8);`
- Definition: `src_analysis/sources/mul_Ccode.c:4679` — `u16 u16_mul_u16_u8_fac8(u16 x_value, u8 y_value)`
- Sources: `src_analysis/sources/mul_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
- Active operation profile: shift, return paths
- Active helpers: `root_u16_mul_u16_u8_fac_greater_1`
- Input model: `x_value=Frama_C_unsigned_short_interval(0, 65535); y_value=Frama_C_unsigned_char_interval(0, 255)`
- Harness: `harnesses/P0/eva_main_u16_mul_u16_u8_fac8.c`
- Baseline runner/result: `scripts/run_u16_mul_u16_u8_fac8_baseline.sh` / `results/baseline/u16_mul_u16_u8_fac8`
- High Precision runner/result: `scripts/high_precision/run_u16_mul_u16_u8_fac8_high_precision.sh` / `results/high_precision/u16_mul_u16_u8_fac8`
- Alarm detail: `reports/alarm_details/u16_mul_u16_u8_fac8.md`
- Work note: `reports/work_notes/u16_mul_u16_u8_fac8_work_report.md` (PRESENT_IGNORED)

### u16_sin_u16

- Declaration: `src_analysis/headers/trig_Ccode.h:14` — `u16 u16_sin_u16(u16);`
- Definition: `src_analysis/sources/trig_Ccode.c:38` — `u16 u16_sin_u16(u16 Phi)`
- Sources: `src_analysis/sources/trig_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements or exposes the named trigonometric/fixed-point interface; the structural operation profile is taken from the active body.
- Active operation profile: shift, bitwise, branching, looping, return paths
- Active helpers: `none`
- Input model: `Phi=Frama_C_unsigned_short_interval( 0, 65535)`
- Harness: `harnesses/P1/eva_main_u16_sin_u16.c`
- Baseline runner/result: `scripts/run_u16_sin_u16_baseline.sh` / `results/baseline/u16_sin_u16`
- High Precision runner/result: `scripts/high_precision/run_u16_sin_u16_high_precision.sh` / `results/high_precision/u16_sin_u16`
- Alarm detail: `reports/alarm_details/u16_sin_u16.md`
- Work note: `reports/work_notes/u16_sin_u16_work_report.md` (PRESENT_IGNORED)

### u16_tan_u16

- Declaration: `src_analysis/headers/trig_Ccode.h:26` — `u16 u16_tan_u16(u16);`
- Definition: `src_analysis/sources/trig_Ccode.c:143` — `u16 u16_tan_u16(u16 phi)`
- Sources: `src_analysis/sources/trig_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: The active function body is empty; the non-void interface reaches its closing brace without an active return expression.
- Active operation profile: no active arithmetic/control operation
- Active helpers: `none`
- Input model: `phi=Frama_C_unsigned_short_interval( 0, 65535)`
- Harness: `harnesses/P0/eva_main_u16_tan_u16.c`
- Baseline runner/result: `scripts/run_u16_tan_u16_baseline.sh` / `results/baseline/u16_tan_u16`
- High Precision runner/result: `scripts/high_precision/run_u16_tan_u16_high_precision.sh` / `results/high_precision/u16_tan_u16`
- Alarm detail: `reports/alarm_details/u16_tan_u16.md`
- Work note: `reports/work_notes/u16_tan_u16_work_report.md` (PRESENT_IGNORED)

### u32_div_s32_s32

- Declaration: `src_analysis/headers/div_Ccode.h:55` — `u32 u32_div_s32_s32(s32, s32);`
- Definition: `src_analysis/sources/div_Ccode.c:1138` — `u32 u32_div_s32_s32(s32 numerator, s32 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Harness: `harnesses/P1/eva_main_u32_div_s32_s32.c`
- Baseline runner/result: `scripts/run_u32_div_s32_s32_baseline.sh` / `results/baseline/u32_div_s32_s32`
- High Precision runner/result: `scripts/high_precision/run_u32_div_s32_s32_high_precision.sh` / `results/high_precision/u32_div_s32_s32`
- Alarm detail: `reports/alarm_details/u32_div_s32_s32.md`
- Work note: `reports/work_notes/u32_div_s32_s32_work_report.md` (PRESENT_IGNORED)

### u32_div_s32_u32

- Declaration: `src_analysis/headers/div_Ccode.h:53` — `u32 u32_div_s32_u32(s32, u32);`
- Definition: `src_analysis/sources/div_Ccode.c:1095` — `u32 u32_div_s32_u32(s32 numerator, u32 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Harness: `harnesses/P1/eva_main_u32_div_s32_u32.c`
- Baseline runner/result: `scripts/run_u32_div_s32_u32_baseline.sh` / `results/baseline/u32_div_s32_u32`
- High Precision runner/result: `scripts/high_precision/run_u32_div_s32_u32_high_precision.sh` / `results/high_precision/u32_div_s32_u32`
- Alarm detail: `reports/alarm_details/u32_div_s32_u32.md`
- Work note: `reports/work_notes/u32_div_s32_u32_work_report.md` (PRESENT_IGNORED)

### u32_div_u32_s32

- Declaration: `src_analysis/headers/div_Ccode.h:51` — `u32 u32_div_u32_s32(u32, s32);`
- Definition: `src_analysis/sources/div_Ccode.c:1058` — `u32 u32_div_u32_s32(u32 numerator, s32 denominator)`
- Sources: `src_analysis/sources/div_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
- Active operation profile: division, multiplication, shift, branching, return paths
- Active helpers: `none`
- Input model: `numerator=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Harness: `harnesses/P1/eva_main_u32_div_u32_s32.c`
- Baseline runner/result: `scripts/run_u32_div_u32_s32_baseline.sh` / `results/baseline/u32_div_u32_s32`
- High Precision runner/result: `scripts/high_precision/run_u32_div_u32_s32_high_precision.sh` / `results/high_precision/u32_div_u32_s32`
- Alarm detail: `reports/alarm_details/u32_div_u32_s32.md`
- Work note: `reports/work_notes/u32_div_u32_s32_work_report.md` (PRESENT_IGNORED)

### u32_mmv_u32_u32_s32_fac1

- Declaration: `src_analysis/headers/avrg_Ccode.h:27` — `u32 u32_mmv_u32_u32_s32_fac1(u32, u32, s32);`
- Definition: `src_analysis/sources/avrg_Ccode.c:995` — `u32 u32_mmv_u32_u32_s32_fac1(u32 mmv, u32 measure, s32 crlc)`
- Sources: `src_analysis/sources/avrg_Ccode.c`
- TECHNICAL INTERPRETATION — structural purpose: Implements the project MMV arithmetic interface using the active difference, scaling, and limiting operations in the source.
- Active operation profile: no active arithmetic/control operation
- Active helpers: `none`
- Input model: `mmv=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL); measure=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL); crlc=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Harness: `harnesses/P0/eva_main_u32_mmv_u32_u32_s32_fac1.c`
- Baseline runner/result: `scripts/run_u32_mmv_u32_u32_s32_fac1_baseline.sh` / `results/baseline/u32_mmv_u32_u32_s32_fac1`
- High Precision runner/result: `scripts/high_precision/run_u32_mmv_u32_u32_s32_fac1_high_precision.sh` / `results/high_precision/u32_mmv_u32_u32_s32_fac1`
- Alarm detail: `reports/alarm_details/u32_mmv_u32_u32_s32_fac1.md`
- Work note: `reports/work_notes/u32_mmv_u32_u32_s32_fac1_work_report.md` (PRESENT_IGNORED)

## TECHNICAL INTERPRETATION

Function names and source structure indicate a fixed-width/fixed-point arithmetic library. Purpose wording above is intentionally structural: external operational requirements not present in tracked source or documentation are `NOT RECORDED`.
