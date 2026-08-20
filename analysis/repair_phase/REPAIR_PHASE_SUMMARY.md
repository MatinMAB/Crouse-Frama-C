# Eva/KLEE ACSL Repair Phase Summary

## Scope and outcome

The prior validated state contains 149 High-Precision Eva alarms: 48 with
confirmed KLEE counterexamples and 101 without a confirmed counterexample.
All 149 Eva-derived properties were materialized before implementation repair.

- High-Precision targets: 149
- ACSL properties present with unique labels: 149
- Confirmed-counterexample targets: 48
- Successfully repaired targets: 34
- Repair-policy-required targets: 14
- Distinct implementation repair commits: 4
- Runtime-only properties: 101
- Runtime-only completed/no-counterexample: 15
- Runtime-only timeout/inconclusive: 86
- WP-ready targets: 34
- WP execution in this phase: NOT RUN

The state is intentionally partial: policy-required targets were not given an invented fallback. The 101 runtime-only target operations retain their original statements and are not included in the WP-next manifest.

## Repaired target to commit mapping

| Alarm | Status | Repair commit | ACSL label |
|---|---|---|---|
| KLEE-ALARM-0001 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0001` |
| KLEE-ALARM-0004 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0004` |
| KLEE-ALARM-0007 | REPAIRED_SHARED | `afea04153ccb966d0911b7404d7bc88eb7361b81` | `eva_klee_alarm_0007` |
| KLEE-ALARM-0008 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0008` |
| KLEE-ALARM-0011 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0011` |
| KLEE-ALARM-0016 | REPAIRED_SHARED | `afea04153ccb966d0911b7404d7bc88eb7361b81` | `eva_klee_alarm_0016` |
| KLEE-ALARM-0017 | REPAIRED_SHARED | `afea04153ccb966d0911b7404d7bc88eb7361b81` | `eva_klee_alarm_0017` |
| KLEE-ALARM-0018 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0018` |
| KLEE-ALARM-0022 | REPAIRED | `61a2ce39e49409f7139327fe5f10450eb4ccd88d` | `eva_klee_alarm_0022` |
| KLEE-ALARM-0043 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0043` |
| KLEE-ALARM-0044 | REPAIRED_SHARED | `57864b43199db1c7046c201d40fb52dabafdb3a6` | `eva_klee_alarm_0044` |
| KLEE-ALARM-0053 | REPAIRED_SHARED | `57864b43199db1c7046c201d40fb52dabafdb3a6` | `eva_klee_alarm_0053` |
| KLEE-ALARM-0058 | REPAIRED_SHARED | `57864b43199db1c7046c201d40fb52dabafdb3a6` | `eva_klee_alarm_0058` |
| KLEE-ALARM-0061 | REPAIRED_SHARED | `57864b43199db1c7046c201d40fb52dabafdb3a6` | `eva_klee_alarm_0061` |
| KLEE-ALARM-0063 | REPAIRED_SHARED | `57864b43199db1c7046c201d40fb52dabafdb3a6` | `eva_klee_alarm_0063` |
| KLEE-ALARM-0066 | REPAIRED_SHARED | `57864b43199db1c7046c201d40fb52dabafdb3a6` | `eva_klee_alarm_0066` |
| KLEE-ALARM-0095 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0095` |
| KLEE-ALARM-0096 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0096` |
| KLEE-ALARM-0097 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0097` |
| KLEE-ALARM-0099 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0099` |
| KLEE-ALARM-0104 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0104` |
| KLEE-ALARM-0105 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0105` |
| KLEE-ALARM-0106 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0106` |
| KLEE-ALARM-0107 | REPAIRED_SHARED | `afea04153ccb966d0911b7404d7bc88eb7361b81` | `eva_klee_alarm_0107` |
| KLEE-ALARM-0108 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0108` |
| KLEE-ALARM-0109 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0109` |
| KLEE-ALARM-0110 | REPAIRED_SHARED | `afea04153ccb966d0911b7404d7bc88eb7361b81` | `eva_klee_alarm_0110` |
| KLEE-ALARM-0111 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0111` |
| KLEE-ALARM-0112 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0112` |
| KLEE-ALARM-0113 | REPAIRED_SHARED | `afea04153ccb966d0911b7404d7bc88eb7361b81` | `eva_klee_alarm_0113` |
| KLEE-ALARM-0114 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0114` |
| KLEE-ALARM-0115 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0115` |
| KLEE-ALARM-0116 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0116` |
| KLEE-ALARM-0119 | REPAIRED_SHARED | `7aa2299eac6e789a51e1288ecc4959f558bd728b` | `eva_klee_alarm_0119` |

## Targets requiring a repair-policy decision

| Alarm | Function | Reason |
|---|---|---|
| KLEE-ALARM-0002 | `root_s32_mul_s32_s16_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0003 | `root_s32_mul_s32_s16_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0005 | `root_s32_mul_s32_s8_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0006 | `root_s32_mul_s32_s8_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0009 | `root_s32_mul_s32_u16_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0010 | `root_s32_mul_s32_u16_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0012 | `root_s32_mul_s32_u8_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0013 | `root_s32_mul_s32_u8_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0014 | `root_u32_mul_u32_s16_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0015 | `root_u32_mul_u32_s16_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0019 | `root_u32_mul_u32_s32_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0020 | `root_u32_mul_u32_s8_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0021 | `root_u32_mul_u32_s8_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0144 | `u32_div_s32_s32` | The witness also violates runtime-only denominator and downstream properties in the same path; defining an unsigned-magnitude quotient path would change implementation behavior associated with those inconclusive targets, so a phase-separation and quotient-policy decision is required. |

## Complete target-to-ACSL mapping

| Alarm | ACSL label | Current assertion | Future mode |
|---|---|---|---|
| KLEE-ALARM-0001 | `eva_klee_alarm_0001` | `src_repaired/sources/mul_Ccode.c:5173` | WP |
| KLEE-ALARM-0002 | `eva_klee_alarm_0002` | `src_repaired/sources/mul_Ccode.c:5195` | WP |
| KLEE-ALARM-0003 | `eva_klee_alarm_0003` | `src_repaired/sources/mul_Ccode.c:5199` | WP |
| KLEE-ALARM-0004 | `eva_klee_alarm_0004` | `src_repaired/sources/mul_Ccode.c:5357` | WP |
| KLEE-ALARM-0005 | `eva_klee_alarm_0005` | `src_repaired/sources/mul_Ccode.c:5379` | WP |
| KLEE-ALARM-0006 | `eva_klee_alarm_0006` | `src_repaired/sources/mul_Ccode.c:5383` | WP |
| KLEE-ALARM-0007 | `eva_klee_alarm_0007` | `src_repaired/sources/MulHword.c:49` | WP |
| KLEE-ALARM-0008 | `eva_klee_alarm_0008` | `src_repaired/sources/mul_Ccode.c:5265` | WP |
| KLEE-ALARM-0009 | `eva_klee_alarm_0009` | `src_repaired/sources/mul_Ccode.c:5287` | WP |
| KLEE-ALARM-0010 | `eva_klee_alarm_0010` | `src_repaired/sources/mul_Ccode.c:5291` | WP |
| KLEE-ALARM-0011 | `eva_klee_alarm_0011` | `src_repaired/sources/mul_Ccode.c:5709` | WP |
| KLEE-ALARM-0012 | `eva_klee_alarm_0012` | `src_repaired/sources/mul_Ccode.c:5723` | WP |
| KLEE-ALARM-0013 | `eva_klee_alarm_0013` | `src_repaired/sources/mul_Ccode.c:5727` | WP |
| KLEE-ALARM-0014 | `eva_klee_alarm_0014` | `src_repaired/sources/mul_Ccode.c:5453` | WP |
| KLEE-ALARM-0015 | `eva_klee_alarm_0015` | `src_repaired/sources/mul_Ccode.c:5457` | WP |
| KLEE-ALARM-0016 | `eva_klee_alarm_0016` | `src_repaired/sources/MulHword.c:52` | WP |
| KLEE-ALARM-0017 | `eva_klee_alarm_0017` | `src_repaired/sources/MulHword.c:73` | WP |
| KLEE-ALARM-0018 | `eva_klee_alarm_0018` | `src_repaired/sources/mul_Ccode.c:5520` | WP |
| KLEE-ALARM-0019 | `eva_klee_alarm_0019` | `src_repaired/sources/mul_Ccode.c:5532` | WP |
| KLEE-ALARM-0020 | `eva_klee_alarm_0020` | `src_repaired/sources/mul_Ccode.c:5614` | WP |
| KLEE-ALARM-0021 | `eva_klee_alarm_0021` | `src_repaired/sources/mul_Ccode.c:5618` | WP |
| KLEE-ALARM-0022 | `eva_klee_alarm_0022` | `src_repaired/sources/rotatefunc.c:121` | WP |
| KLEE-ALARM-0023 | `eva_klee_alarm_0023` | `src_repaired/sources/div_Ccode.c:308` | RUNTIME_ONLY |
| KLEE-ALARM-0024 | `eva_klee_alarm_0024` | `src_repaired/sources/div_Ccode.c:311` | RUNTIME_ONLY |
| KLEE-ALARM-0025 | `eva_klee_alarm_0025` | `src_repaired/sources/div_Ccode.c:314` | RUNTIME_ONLY |
| KLEE-ALARM-0026 | `eva_klee_alarm_0026` | `src_repaired/sources/div_Ccode.c:317` | RUNTIME_ONLY |
| KLEE-ALARM-0027 | `eva_klee_alarm_0027` | `src_repaired/sources/div_Ccode.c:320` | RUNTIME_ONLY |
| KLEE-ALARM-0028 | `eva_klee_alarm_0028` | `src_repaired/sources/div_Ccode.c:324` | RUNTIME_ONLY |
| KLEE-ALARM-0029 | `eva_klee_alarm_0029` | `src_repaired/sources/div_Ccode.c:328` | RUNTIME_ONLY |
| KLEE-ALARM-0030 | `eva_klee_alarm_0030` | `src_repaired/sources/div_Ccode.c:331` | RUNTIME_ONLY |
| KLEE-ALARM-0031 | `eva_klee_alarm_0031` | `src_repaired/sources/div_Ccode.c:334` | RUNTIME_ONLY |
| KLEE-ALARM-0032 | `eva_klee_alarm_0032` | `src_repaired/sources/div_Ccode.c:358` | RUNTIME_ONLY |
| KLEE-ALARM-0033 | `eva_klee_alarm_0033` | `src_repaired/sources/div_Ccode.c:361` | RUNTIME_ONLY |
| KLEE-ALARM-0034 | `eva_klee_alarm_0034` | `src_repaired/sources/div_Ccode.c:364` | RUNTIME_ONLY |
| KLEE-ALARM-0035 | `eva_klee_alarm_0035` | `src_repaired/sources/div_Ccode.c:367` | RUNTIME_ONLY |
| KLEE-ALARM-0036 | `eva_klee_alarm_0036` | `src_repaired/sources/div_Ccode.c:370` | RUNTIME_ONLY |
| KLEE-ALARM-0037 | `eva_klee_alarm_0037` | `src_repaired/sources/div_Ccode.c:373` | RUNTIME_ONLY |
| KLEE-ALARM-0038 | `eva_klee_alarm_0038` | `src_repaired/sources/div_Ccode.c:377` | RUNTIME_ONLY |
| KLEE-ALARM-0039 | `eva_klee_alarm_0039` | `src_repaired/sources/div_Ccode.c:381` | RUNTIME_ONLY |
| KLEE-ALARM-0040 | `eva_klee_alarm_0040` | `src_repaired/sources/div_Ccode.c:384` | RUNTIME_ONLY |
| KLEE-ALARM-0041 | `eva_klee_alarm_0041` | `src_repaired/sources/div_Ccode.c:387` | RUNTIME_ONLY |
| KLEE-ALARM-0042 | `eva_klee_alarm_0042` | `src_repaired/sources/div_Ccode.c:390` | RUNTIME_ONLY |
| KLEE-ALARM-0043 | `eva_klee_alarm_0043` | `src_repaired/sources/div_Ccode.c:1842` | WP |
| KLEE-ALARM-0044 | `eva_klee_alarm_0044` | `src_repaired/sources/div_Ccode.c:175` | WP |
| KLEE-ALARM-0045 | `eva_klee_alarm_0045` | `src_repaired/sources/div_Ccode.c:200` | RUNTIME_ONLY |
| KLEE-ALARM-0046 | `eva_klee_alarm_0046` | `src_repaired/sources/div_Ccode.c:203` | RUNTIME_ONLY |
| KLEE-ALARM-0047 | `eva_klee_alarm_0047` | `src_repaired/sources/div_Ccode.c:206` | RUNTIME_ONLY |
| KLEE-ALARM-0048 | `eva_klee_alarm_0048` | `src_repaired/sources/div_Ccode.c:209` | RUNTIME_ONLY |
| KLEE-ALARM-0049 | `eva_klee_alarm_0049` | `src_repaired/sources/div_Ccode.c:213` | RUNTIME_ONLY |
| KLEE-ALARM-0050 | `eva_klee_alarm_0050` | `src_repaired/sources/div_Ccode.c:217` | RUNTIME_ONLY |
| KLEE-ALARM-0051 | `eva_klee_alarm_0051` | `src_repaired/sources/div_Ccode.c:220` | RUNTIME_ONLY |
| KLEE-ALARM-0052 | `eva_klee_alarm_0052` | `src_repaired/sources/div_Ccode.c:223` | RUNTIME_ONLY |
| KLEE-ALARM-0053 | `eva_klee_alarm_0053` | `src_repaired/sources/div_Ccode.c:444` | WP |
| KLEE-ALARM-0054 | `eva_klee_alarm_0054` | `src_repaired/sources/div_Ccode.c:466` | RUNTIME_ONLY |
| KLEE-ALARM-0055 | `eva_klee_alarm_0055` | `src_repaired/sources/div_Ccode.c:470` | RUNTIME_ONLY |
| KLEE-ALARM-0056 | `eva_klee_alarm_0056` | `src_repaired/sources/div_Ccode.c:473` | RUNTIME_ONLY |
| KLEE-ALARM-0057 | `eva_klee_alarm_0057` | `src_repaired/sources/div_Ccode.c:478` | RUNTIME_ONLY |
| KLEE-ALARM-0058 | `eva_klee_alarm_0058` | `src_repaired/sources/hip_Ccode.c:194` | WP |
| KLEE-ALARM-0059 | `eva_klee_alarm_0059` | `src_repaired/sources/hip_Ccode.c:205` | RUNTIME_ONLY |
| KLEE-ALARM-0060 | `eva_klee_alarm_0060` | `src_repaired/sources/hip_Ccode.c:208` | RUNTIME_ONLY |
| KLEE-ALARM-0061 | `eva_klee_alarm_0061` | `src_repaired/sources/hip_Ccode.c:217` | WP |
| KLEE-ALARM-0062 | `eva_klee_alarm_0062` | `src_repaired/sources/hip_Ccode.c:212` | RUNTIME_ONLY |
| KLEE-ALARM-0063 | `eva_klee_alarm_0063` | `src_repaired/sources/hip_Ccode.c:51` | WP |
| KLEE-ALARM-0064 | `eva_klee_alarm_0064` | `src_repaired/sources/hip_Ccode.c:62` | RUNTIME_ONLY |
| KLEE-ALARM-0065 | `eva_klee_alarm_0065` | `src_repaired/sources/hip_Ccode.c:65` | RUNTIME_ONLY |
| KLEE-ALARM-0066 | `eva_klee_alarm_0066` | `src_repaired/sources/hip_Ccode.c:74` | WP |
| KLEE-ALARM-0067 | `eva_klee_alarm_0067` | `src_repaired/sources/hip_Ccode.c:69` | RUNTIME_ONLY |
| KLEE-ALARM-0068 | `eva_klee_alarm_0068` | `src_repaired/sources/div_Ccode.c:1182` | RUNTIME_ONLY |
| KLEE-ALARM-0069 | `eva_klee_alarm_0069` | `src_repaired/sources/div_Ccode.c:1185` | RUNTIME_ONLY |
| KLEE-ALARM-0070 | `eva_klee_alarm_0070` | `src_repaired/sources/div_Ccode.c:1188` | RUNTIME_ONLY |
| KLEE-ALARM-0071 | `eva_klee_alarm_0071` | `src_repaired/sources/div_Ccode.c:1191` | RUNTIME_ONLY |
| KLEE-ALARM-0072 | `eva_klee_alarm_0072` | `src_repaired/sources/div_Ccode.c:1194` | RUNTIME_ONLY |
| KLEE-ALARM-0073 | `eva_klee_alarm_0073` | `src_repaired/sources/div_Ccode.c:1198` | RUNTIME_ONLY |
| KLEE-ALARM-0074 | `eva_klee_alarm_0074` | `src_repaired/sources/div_Ccode.c:1201` | RUNTIME_ONLY |
| KLEE-ALARM-0075 | `eva_klee_alarm_0075` | `src_repaired/sources/div_Ccode.c:1204` | RUNTIME_ONLY |
| KLEE-ALARM-0076 | `eva_klee_alarm_0076` | `src_repaired/sources/div_Ccode.c:1264` | RUNTIME_ONLY |
| KLEE-ALARM-0077 | `eva_klee_alarm_0077` | `src_repaired/sources/div_Ccode.c:1267` | RUNTIME_ONLY |
| KLEE-ALARM-0078 | `eva_klee_alarm_0078` | `src_repaired/sources/div_Ccode.c:1270` | RUNTIME_ONLY |
| KLEE-ALARM-0079 | `eva_klee_alarm_0079` | `src_repaired/sources/div_Ccode.c:1273` | RUNTIME_ONLY |
| KLEE-ALARM-0080 | `eva_klee_alarm_0080` | `src_repaired/sources/div_Ccode.c:1277` | RUNTIME_ONLY |
| KLEE-ALARM-0081 | `eva_klee_alarm_0081` | `src_repaired/sources/div_Ccode.c:759` | RUNTIME_ONLY |
| KLEE-ALARM-0082 | `eva_klee_alarm_0082` | `src_repaired/sources/div_Ccode.c:762` | RUNTIME_ONLY |
| KLEE-ALARM-0083 | `eva_klee_alarm_0083` | `src_repaired/sources/div_Ccode.c:765` | RUNTIME_ONLY |
| KLEE-ALARM-0084 | `eva_klee_alarm_0084` | `src_repaired/sources/div_Ccode.c:769` | RUNTIME_ONLY |
| KLEE-ALARM-0085 | `eva_klee_alarm_0085` | `src_repaired/sources/div_Ccode.c:772` | RUNTIME_ONLY |
| KLEE-ALARM-0086 | `eva_klee_alarm_0086` | `src_repaired/sources/div_Ccode.c:776` | RUNTIME_ONLY |
| KLEE-ALARM-0087 | `eva_klee_alarm_0087` | `src_repaired/sources/div_Ccode.c:779` | RUNTIME_ONLY |
| KLEE-ALARM-0088 | `eva_klee_alarm_0088` | `src_repaired/sources/div_Ccode.c:782` | RUNTIME_ONLY |
| KLEE-ALARM-0089 | `eva_klee_alarm_0089` | `src_repaired/sources/div_Ccode.c:839` | RUNTIME_ONLY |
| KLEE-ALARM-0090 | `eva_klee_alarm_0090` | `src_repaired/sources/div_Ccode.c:842` | RUNTIME_ONLY |
| KLEE-ALARM-0091 | `eva_klee_alarm_0091` | `src_repaired/sources/div_Ccode.c:845` | RUNTIME_ONLY |
| KLEE-ALARM-0092 | `eva_klee_alarm_0092` | `src_repaired/sources/div_Ccode.c:848` | RUNTIME_ONLY |
| KLEE-ALARM-0093 | `eva_klee_alarm_0093` | `src_repaired/sources/div_Ccode.c:851` | RUNTIME_ONLY |
| KLEE-ALARM-0094 | `eva_klee_alarm_0094` | `src_repaired/sources/div_Ccode.c:855` | RUNTIME_ONLY |
| KLEE-ALARM-0095 | `eva_klee_alarm_0095` | `src_repaired/sources/div_Ccode.c:1704` | WP |
| KLEE-ALARM-0096 | `eva_klee_alarm_0096` | `src_repaired/sources/div_Ccode.c:1715` | WP |
| KLEE-ALARM-0097 | `eva_klee_alarm_0097` | `src_repaired/sources/div_Ccode.c:1740` | WP |
| KLEE-ALARM-0098 | `eva_klee_alarm_0098` | `src_repaired/sources/div_Ccode.c:1747` | RUNTIME_ONLY |
| KLEE-ALARM-0099 | `eva_klee_alarm_0099` | `src_repaired/sources/div_Ccode.c:1769` | WP |
| KLEE-ALARM-0100 | `eva_klee_alarm_0100` | `src_repaired/sources/div_Ccode.c:1776` | RUNTIME_ONLY |
| KLEE-ALARM-0101 | `eva_klee_alarm_0101` | `src_repaired/sources/div_Ccode.c:1784` | RUNTIME_ONLY |
| KLEE-ALARM-0102 | `eva_klee_alarm_0102` | `src_repaired/sources/div_Ccode.c:1787` | RUNTIME_ONLY |
| KLEE-ALARM-0103 | `eva_klee_alarm_0103` | `src_repaired/sources/div_Ccode.c:1790` | RUNTIME_ONLY |
| KLEE-ALARM-0104 | `eva_klee_alarm_0104` | `src_repaired/sources/div_Ccode.c:1630` | WP |
| KLEE-ALARM-0105 | `eva_klee_alarm_0105` | `src_repaired/sources/div_Ccode.c:1557` | WP |
| KLEE-ALARM-0106 | `eva_klee_alarm_0106` | `src_repaired/sources/mul_Ccode.c:2015` | WP |
| KLEE-ALARM-0107 | `eva_klee_alarm_0107` | `src_repaired/sources/MulHword.c:55` | WP |
| KLEE-ALARM-0108 | `eva_klee_alarm_0108` | `src_repaired/sources/mul_Ccode.c:2754` | WP |
| KLEE-ALARM-0109 | `eva_klee_alarm_0109` | `src_repaired/sources/mul_Ccode.c:2773` | WP |
| KLEE-ALARM-0110 | `eva_klee_alarm_0110` | `src_repaired/sources/MulHword.c:58` | WP |
| KLEE-ALARM-0111 | `eva_klee_alarm_0111` | `src_repaired/sources/mul_Ccode.c:2255` | WP |
| KLEE-ALARM-0112 | `eva_klee_alarm_0112` | `src_repaired/sources/mul_Ccode.c:2274` | WP |
| KLEE-ALARM-0113 | `eva_klee_alarm_0113` | `src_repaired/sources/MulHword.c:61` | WP |
| KLEE-ALARM-0114 | `eva_klee_alarm_0114` | `src_repaired/sources/mul_Ccode.c:2506` | WP |
| KLEE-ALARM-0115 | `eva_klee_alarm_0115` | `src_repaired/sources/mul_Ccode.c:2525` | WP |
| KLEE-ALARM-0116 | `eva_klee_alarm_0116` | `src_repaired/sources/mul_Ccode.c:2672` | WP |
| KLEE-ALARM-0117 | `eva_klee_alarm_0117` | `src_repaired/sources/mul_Ccode.c:767` | RUNTIME_ONLY |
| KLEE-ALARM-0118 | `eva_klee_alarm_0118` | `src_repaired/sources/mul_Ccode.c:781` | RUNTIME_ONLY |
| KLEE-ALARM-0119 | `eva_klee_alarm_0119` | `src_repaired/sources/mul_Ccode.c:1774` | WP |
| KLEE-ALARM-0120 | `eva_klee_alarm_0120` | `src_repaired/sources/div_Ccode.c:611` | RUNTIME_ONLY |
| KLEE-ALARM-0121 | `eva_klee_alarm_0121` | `src_repaired/sources/div_Ccode.c:614` | RUNTIME_ONLY |
| KLEE-ALARM-0122 | `eva_klee_alarm_0122` | `src_repaired/sources/div_Ccode.c:617` | RUNTIME_ONLY |
| KLEE-ALARM-0123 | `eva_klee_alarm_0123` | `src_repaired/sources/div_Ccode.c:620` | RUNTIME_ONLY |
| KLEE-ALARM-0124 | `eva_klee_alarm_0124` | `src_repaired/sources/div_Ccode.c:624` | RUNTIME_ONLY |
| KLEE-ALARM-0125 | `eva_klee_alarm_0125` | `src_repaired/sources/avrg_Ccode.c:249` | RUNTIME_ONLY |
| KLEE-ALARM-0126 | `eva_klee_alarm_0126` | `src_repaired/sources/div_Ccode.c:913` | RUNTIME_ONLY |
| KLEE-ALARM-0127 | `eva_klee_alarm_0127` | `src_repaired/sources/div_Ccode.c:916` | RUNTIME_ONLY |
| KLEE-ALARM-0128 | `eva_klee_alarm_0128` | `src_repaired/sources/div_Ccode.c:919` | RUNTIME_ONLY |
| KLEE-ALARM-0129 | `eva_klee_alarm_0129` | `src_repaired/sources/div_Ccode.c:922` | RUNTIME_ONLY |
| KLEE-ALARM-0130 | `eva_klee_alarm_0130` | `src_repaired/sources/div_Ccode.c:925` | RUNTIME_ONLY |
| KLEE-ALARM-0131 | `eva_klee_alarm_0131` | `src_repaired/sources/div_Ccode.c:928` | RUNTIME_ONLY |
| KLEE-ALARM-0132 | `eva_klee_alarm_0132` | `src_repaired/sources/div_Ccode.c:932` | RUNTIME_ONLY |
| KLEE-ALARM-0133 | `eva_klee_alarm_0133` | `src_repaired/sources/div_Ccode.c:935` | RUNTIME_ONLY |
| KLEE-ALARM-0134 | `eva_klee_alarm_0134` | `src_repaired/sources/div_Ccode.c:938` | RUNTIME_ONLY |
| KLEE-ALARM-0135 | `eva_klee_alarm_0135` | `src_repaired/sources/div_Ccode.c:995` | RUNTIME_ONLY |
| KLEE-ALARM-0136 | `eva_klee_alarm_0136` | `src_repaired/sources/div_Ccode.c:998` | RUNTIME_ONLY |
| KLEE-ALARM-0137 | `eva_klee_alarm_0137` | `src_repaired/sources/div_Ccode.c:1001` | RUNTIME_ONLY |
| KLEE-ALARM-0138 | `eva_klee_alarm_0138` | `src_repaired/sources/div_Ccode.c:1004` | RUNTIME_ONLY |
| KLEE-ALARM-0139 | `eva_klee_alarm_0139` | `src_repaired/sources/div_Ccode.c:1007` | RUNTIME_ONLY |
| KLEE-ALARM-0140 | `eva_klee_alarm_0140` | `src_repaired/sources/div_Ccode.c:1011` | RUNTIME_ONLY |
| KLEE-ALARM-0141 | `eva_klee_alarm_0141` | `src_repaired/sources/div_Ccode.c:1425` | RUNTIME_ONLY |
| KLEE-ALARM-0142 | `eva_klee_alarm_0142` | `src_repaired/sources/div_Ccode.c:1428` | RUNTIME_ONLY |
| KLEE-ALARM-0143 | `eva_klee_alarm_0143` | `src_repaired/sources/div_Ccode.c:1431` | RUNTIME_ONLY |
| KLEE-ALARM-0144 | `eva_klee_alarm_0144` | `src_repaired/sources/div_Ccode.c:1448` | WP |
| KLEE-ALARM-0145 | `eva_klee_alarm_0145` | `src_repaired/sources/div_Ccode.c:1452` | RUNTIME_ONLY |
| KLEE-ALARM-0146 | `eva_klee_alarm_0146` | `src_repaired/sources/div_Ccode.c:1456` | RUNTIME_ONLY |
| KLEE-ALARM-0147 | `eva_klee_alarm_0147` | `src_repaired/sources/div_Ccode.c:1459` | RUNTIME_ONLY |
| KLEE-ALARM-0148 | `eva_klee_alarm_0148` | `src_repaired/sources/div_Ccode.c:1462` | RUNTIME_ONLY |
| KLEE-ALARM-0149 | `eva_klee_alarm_0149` | `src_repaired/sources/div_Ccode.c:1465` | RUNTIME_ONLY |

## Validation

Validation status: **VALIDATED PARTIAL STATE**

- 34 repaired + 14 policy-required = 48 confirmed targets
- 15 completed/no-counterexample + 86 timeout = 101 runtime-only targets
- 48 confirmed + 101 runtime-only = 149 total targets
- All assertions were parsed separately with Frama-C's kernel only; Eva and WP were not invoked.
