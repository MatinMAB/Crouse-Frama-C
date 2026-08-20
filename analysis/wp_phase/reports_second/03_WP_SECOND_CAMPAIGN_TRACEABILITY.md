# WP Second Campaign Traceability

## KLEE-ALARM-0061

- Eva alarm: `invalid shift` on `s32Temp2 << 1` at `src_analysis/sources/hip_Ccode.c:167` occurrence `1`.
- Eva safety predicate: `s32Temp2 >= 0`.
- KLEE witness: `yold=-137 (0xFF77); u=0 (0x00); uold=0 (0x00); m=32768 (0x8000)`; target evidence `analysis/klee_phase_c/s16_hip1_s16_s8_s8_u16_fac1/alarm_0061/build/klee-out-alarm-0061/test000002.klee-alarm-0061.err`.
- Repair: At the signed-input high-pass occurrence, preserve `s32Temp2 << 1` and the assertion on the nonnegative path; use defined, range-safe `s32Temp2 * 2` for a negative remainder.
- Repair commit: `f5daa364e14957ae7410fd2d347917ab6555f046`.
- Preserved ACSL goal: `eva_klee_alarm_0061` / `s32Temp2 >= 0`.
- Selected run: `analysis/wp_phase/results/KLEE-ALARM-0061/20260820-194527Z`.
- WP evidence: 1/1 proved; Qed `VALID`; Alt-Ergo `NOT_NEEDED / NOT_INVOKED`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.

## KLEE-ALARM-0066

- Eva alarm: `invalid shift` on `s32Temp2 << 1` at `src_analysis/sources/hip_Ccode.c:53` occurrence `1`.
- Eva safety predicate: `s32Temp2 >= 0`.
- KLEE witness: `yold=-137 (0xFF77); u=0 (0x00); uold=0 (0x00); m=32768 (0x8000)`; target evidence `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066/build/klee-out-alarm-0066/test000002.klee-alarm-0066.err`.
- Repair: At the unsigned-input high-pass occurrence, preserve `s32Temp2 << 1` and the assertion on the nonnegative path; use defined, range-safe `s32Temp2 * 2` for a negative remainder.
- Repair commit: `f5daa364e14957ae7410fd2d347917ab6555f046`.
- Preserved ACSL goal: `eva_klee_alarm_0066` / `s32Temp2 >= 0`.
- Selected run: `analysis/wp_phase/results/KLEE-ALARM-0066/20260820-194527Z`.
- WP evidence: 1/1 proved; Qed `VALID`; Alt-Ergo `NOT_NEEDED / NOT_INVOKED`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.

## KLEE-ALARM-0144

- Eva alarm: `integer overflow` on `-numerator` at `src_analysis/sources/div_Ccode.c:1182` occurrence `1`.
- Eva safety predicate: `numerator != INT32_MIN`.
- KLEE witness: `numerator=-2147483648 (0x80000000); denominator=-2147483648 (0x80000000)`; target evidence `analysis/klee_phase_c/u32_div_s32_s32/alarm_0144/build/klee-out-alarm-0144/test000004.klee-alarm-0144.err`.
- Repair: For an `INT32_MIN` numerator on the negative/negative path, use unsigned magnitude `0x80000000U`, safely derive the denominator magnitude, and retain quotient-plus-doubled-remainder rounding; keep the original negation and assertion on the ordinary path.
- Repair commit: `b8b767816bdbe2e38196b9e81b57b48384daeca5`.
- Preserved ACSL goal: `eva_klee_alarm_0144` / `numerator != (-2147483647 - 1)`.
- Selected run: `analysis/wp_phase/results/KLEE-ALARM-0144/20260820-194528Z`.
- WP evidence: 1/1 proved; Qed `VALID`; Alt-Ergo `NOT_NEEDED / NOT_INVOKED`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
