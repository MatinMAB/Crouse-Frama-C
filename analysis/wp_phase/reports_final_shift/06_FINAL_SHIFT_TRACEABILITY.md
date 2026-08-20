# Final Shift Traceability

## KLEE-ALARM-0002

- Eva alarm: `invalid shift` on `u32Temp3 >> count` at `src_analysis/sources/mul_Ccode.c:5089` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= count && count < 32` / `eva_klee_alarm_0002`.
- KLEE counterexample: `value=-2130706432; factor=1; count=4294967295`; evidence `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0002/build/klee-out-alarm-0002/test000003.klee-alarm-0002.err`.
- Resolution: `THESIS_INTERFACE_POLICY` with origin `THESIS_POLICY_SELECTED`.
- Contract: `1 <= count && count < 32` at `src_repaired/sources/mul_Ccode.c:5152`.
- Interface normalization: `65536 -> 16 (static public-macro adapter)`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5198`; resolution commit `371c2e3ca2202f31d0ed9c3be90d7bf028dab514`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0002/20260820-202519Z`; goal 1/1; Qed `VALID`; Alt-Ergo `NOT_NEEDED / NOT_INVOKED`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under THESIS_POLICY_SELECTED interface/domain semantics: under the explicitly adopted helper contract and static public-interface normalization, WP proved the preserved Eva-derived assertion. This does not establish unspecified legacy intent.

## KLEE-ALARM-0003

- Eva alarm: `invalid shift` on `u32Temp4 << (32-count)` at `src_analysis/sources/mul_Ccode.c:5090` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32` / `eva_klee_alarm_0003`.
- KLEE counterexample: `value=0; factor=-32768; count=0`; evidence `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0003/build/klee-out-alarm-0003/test000007.klee-alarm-0003.err`.
- Resolution: `THESIS_INTERFACE_POLICY` with origin `THESIS_POLICY_SELECTED`.
- Contract: `1 <= count && count < 32` at `src_repaired/sources/mul_Ccode.c:5152`.
- Interface normalization: `65536 -> 16 (static public-macro adapter)`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5202`; resolution commit `371c2e3ca2202f31d0ed9c3be90d7bf028dab514`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0003/20260820-202520Z`; goal 1/1; Qed `NOT_SUFFICIENT`; Alt-Ergo `VALID`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under THESIS_POLICY_SELECTED interface/domain semantics: under the explicitly adopted helper contract and static public-interface normalization, WP proved the preserved Eva-derived assertion. This does not establish unspecified legacy intent.

## KLEE-ALARM-0005

- Eva alarm: `invalid shift` on `u32Temp3 >> count` at `src_analysis/sources/mul_Ccode.c:5241` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= count && count < 32` / `eva_klee_alarm_0005`.
- KLEE counterexample: `value=-2130706432; factor=1; count=4294967295`; evidence `analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005/build/klee-out-alarm-0005/test000003.klee-alarm-0005.err`.
- Resolution: `THESIS_INTERFACE_POLICY` with origin `THESIS_POLICY_SELECTED`.
- Contract: `1 <= count && count < 32` at `src_repaired/sources/mul_Ccode.c:5342`.
- Interface normalization: `256 -> 8 (static public-macro adapter)`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5388`; resolution commit `830f84d2f53e7c49f66359a75abd9a7f30a0d188`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0005/20260820-202522Z`; goal 1/1; Qed `VALID`; Alt-Ergo `NOT_NEEDED / NOT_INVOKED`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under THESIS_POLICY_SELECTED interface/domain semantics: under the explicitly adopted helper contract and static public-interface normalization, WP proved the preserved Eva-derived assertion. This does not establish unspecified legacy intent.

## KLEE-ALARM-0006

- Eva alarm: `invalid shift` on `u32Temp4 << (32-count)` at `src_analysis/sources/mul_Ccode.c:5242` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32` / `eva_klee_alarm_0006`.
- KLEE counterexample: `value=-2130706432; factor=1; count=0`; evidence `analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0006/build/klee-out-alarm-0006/test000007.klee-alarm-0006.err`.
- Resolution: `THESIS_INTERFACE_POLICY` with origin `THESIS_POLICY_SELECTED`.
- Contract: `1 <= count && count < 32` at `src_repaired/sources/mul_Ccode.c:5342`.
- Interface normalization: `256 -> 8 (static public-macro adapter)`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5392`; resolution commit `830f84d2f53e7c49f66359a75abd9a7f30a0d188`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0006/20260820-202523Z`; goal 1/1; Qed `NOT_SUFFICIENT`; Alt-Ergo `VALID`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under THESIS_POLICY_SELECTED interface/domain semantics: under the explicitly adopted helper contract and static public-interface normalization, WP proved the preserved Eva-derived assertion. This does not establish unspecified legacy intent.

## KLEE-ALARM-0009

- Eva alarm: `invalid shift` on `u32Temp3 >> count` at `src_analysis/sources/mul_Ccode.c:5165` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= count && count < 32` / `eva_klee_alarm_0009`.
- KLEE counterexample: `value=61696; factor=65394; count=4294967295`; evidence `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0009/build/klee-out-alarm-0009/test000003.klee-alarm-0009.err`.
- Resolution: `THESIS_INTERFACE_POLICY` with origin `THESIS_POLICY_SELECTED`.
- Contract: `1 <= count && count < 32` at `src_repaired/sources/mul_Ccode.c:5247`.
- Interface normalization: `131072 -> 17 (static public-macro adapter)`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5293`; resolution commit `9b0ac88fd7411c6469360b76c329546c9f12a0ff`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0009/20260820-202525Z`; goal 1/1; Qed `VALID`; Alt-Ergo `NOT_NEEDED / NOT_INVOKED`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under THESIS_POLICY_SELECTED interface/domain semantics: under the explicitly adopted helper contract and static public-interface normalization, WP proved the preserved Eva-derived assertion. This does not establish unspecified legacy intent.

## KLEE-ALARM-0010

- Eva alarm: `invalid shift` on `u32Temp4 << (32-count)` at `src_analysis/sources/mul_Ccode.c:5166` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32` / `eva_klee_alarm_0010`.
- KLEE counterexample: `value=61696; factor=65394; count=0`; evidence `analysis/klee_phase_c/root_s32_mul_s32_u16_fac_less1/alarm_0010/build/klee-out-alarm-0010/test000007.klee-alarm-0010.err`.
- Resolution: `THESIS_INTERFACE_POLICY` with origin `THESIS_POLICY_SELECTED`.
- Contract: `1 <= count && count < 32` at `src_repaired/sources/mul_Ccode.c:5247`.
- Interface normalization: `131072 -> 17 (static public-macro adapter)`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5297`; resolution commit `9b0ac88fd7411c6469360b76c329546c9f12a0ff`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0010/20260820-202526Z`; goal 1/1; Qed `NOT_SUFFICIENT`; Alt-Ergo `VALID`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under THESIS_POLICY_SELECTED interface/domain semantics: under the explicitly adopted helper contract and static public-interface normalization, WP proved the preserved Eva-derived assertion. This does not establish unspecified legacy intent.

## KLEE-ALARM-0012

- Eva alarm: `invalid shift` on `u32Temp2 >> count` at `src_analysis/sources/mul_Ccode.c:5544` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= count && count < 32` / `eva_klee_alarm_0012`.
- KLEE counterexample: `value=0; factor=0; count=4294967295`; evidence `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0012/build/klee-out-alarm-0012/test000002.klee-alarm-0012.err`.
- Resolution: `THESIS_INTERFACE_POLICY` with origin `THESIS_POLICY_SELECTED`.
- Contract: `1 <= count && count < 32` at `src_repaired/sources/mul_Ccode.c:5714`.
- Interface normalization: `512 -> 9 (static public-macro adapter)`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5744`; resolution commit `f4b910ba1e64a01f4bd3ae9056eb5321af5296a6`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0012/20260820-202527Z`; goal 1/1; Qed `VALID`; Alt-Ergo `NOT_NEEDED / NOT_INVOKED`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under THESIS_POLICY_SELECTED interface/domain semantics: under the explicitly adopted helper contract and static public-interface normalization, WP proved the preserved Eva-derived assertion. This does not establish unspecified legacy intent.

## KLEE-ALARM-0013

- Eva alarm: `invalid shift` on `u32Temp3 << (32-count)` at `src_analysis/sources/mul_Ccode.c:5545` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32` / `eva_klee_alarm_0013`.
- KLEE counterexample: `value=0; factor=0; count=0`; evidence `analysis/klee_phase_c/root_s32_mul_s32_u8_fac_less1/alarm_0013/build/klee-out-alarm-0013/test000006.klee-alarm-0013.err`.
- Resolution: `THESIS_INTERFACE_POLICY` with origin `THESIS_POLICY_SELECTED`.
- Contract: `1 <= count && count < 32` at `src_repaired/sources/mul_Ccode.c:5714`.
- Interface normalization: `512 -> 9 (static public-macro adapter)`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5748`; resolution commit `f4b910ba1e64a01f4bd3ae9056eb5321af5296a6`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0013/20260820-202528Z`; goal 1/1; Qed `NOT_SUFFICIENT`; Alt-Ergo `VALID`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under THESIS_POLICY_SELECTED interface/domain semantics: under the explicitly adopted helper contract and static public-interface normalization, WP proved the preserved Eva-derived assertion. This does not establish unspecified legacy intent.

## KLEE-ALARM-0014

- Eva alarm: `invalid shift` on `u32Temp2 >> count` at `src_analysis/sources/mul_Ccode.c:5309` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= count && count < 32` / `eva_klee_alarm_0014`.
- KLEE counterexample: `value=0; factor=0; count=4294967295`; evidence `analysis/klee_phase_c/root_u32_mul_u32_s16_fac_less1/alarm_0014/build/klee-out-alarm-0014/test000001.klee-alarm-0014.err`.
- Resolution: `REPOSITORY_CONTRACT` with origin `REPOSITORY_INFERRED`.
- Contract: `1 <= count && count < 32` at `src_repaired/sources/mul_Ccode.c:5437`.
- Interface normalization: `NONE`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5465`; resolution commit `220e3e2e674ac5edc39acbc59cd30311c12c6436`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0014/20260820-202530Z`; goal 1/1; Qed `VALID`; Alt-Ergo `NOT_NEEDED / NOT_INVOKED`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under REPOSITORY_INFERRED input-domain semantics: under the repository-supported helper contract, WP proved the preserved Eva-derived assertion. The proof is conditional on the stated function precondition.

## KLEE-ALARM-0015

- Eva alarm: `invalid shift` on `u32Temp3 << (32-count)` at `src_analysis/sources/mul_Ccode.c:5310` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32` / `eva_klee_alarm_0015`.
- KLEE counterexample: `value=0; factor=0; count=0`; evidence `analysis/klee_phase_c/root_u32_mul_u32_s16_fac_less1/alarm_0015/build/klee-out-alarm-0015/test000005.klee-alarm-0015.err`.
- Resolution: `REPOSITORY_CONTRACT` with origin `REPOSITORY_INFERRED`.
- Contract: `1 <= count && count < 32` at `src_repaired/sources/mul_Ccode.c:5437`.
- Interface normalization: `NONE`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5469`; resolution commit `220e3e2e674ac5edc39acbc59cd30311c12c6436`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0015/20260820-202531Z`; goal 1/1; Qed `NOT_SUFFICIENT`; Alt-Ergo `VALID`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under REPOSITORY_INFERRED input-domain semantics: under the repository-supported helper contract, WP proved the preserved Eva-derived assertion. The proof is conditional on the stated function precondition.

## KLEE-ALARM-0019

- Eva alarm: `invalid shift` on `u32Temp2 >> (count-32)` at `src_analysis/sources/mul_Ccode.c:5372` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= (u32)(count - 32) && (u32)(count - 32) < 32` / `eva_klee_alarm_0019`.
- KLEE counterexample: `value=65528; factor=53761; count=0`; evidence `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019/build/klee-out-alarm-0019/test000002.klee-alarm-0019.err`.
- Resolution: `REPOSITORY_CONTRACT` with origin `REPOSITORY_INFERRED`.
- Contract: `32 <= count && count < 64` at `src_repaired/sources/mul_Ccode.c:5510`.
- Interface normalization: `NONE`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5547`; resolution commit `12c3299c286e364dd0cb18c5f8582452381150b1`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0019/20260820-202533Z`; goal 1/1; Qed `NOT_SUFFICIENT`; Alt-Ergo `VALID`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under REPOSITORY_INFERRED input-domain semantics: under the repository-supported helper contract, WP proved the preserved Eva-derived assertion. The proof is conditional on the stated function precondition.

## KLEE-ALARM-0020

- Eva alarm: `invalid shift` on `u32Temp2 >> count` at `src_analysis/sources/mul_Ccode.c:5451` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= count && count < 32` / `eva_klee_alarm_0020`.
- KLEE counterexample: `value=0; factor=0; count=4294967295`; evidence `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0020/build/klee-out-alarm-0020/test000001.klee-alarm-0020.err`.
- Resolution: `REPOSITORY_CONTRACT` with origin `REPOSITORY_INFERRED`.
- Contract: `1 <= count && count < 32` at `src_repaired/sources/mul_Ccode.c:5604`.
- Interface normalization: `NONE`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5632`; resolution commit `41d79fffb2cc054e3ac5c86eacc611ab7a46b489`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0020/20260820-202534Z`; goal 1/1; Qed `VALID`; Alt-Ergo `NOT_NEEDED / NOT_INVOKED`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under REPOSITORY_INFERRED input-domain semantics: under the repository-supported helper contract, WP proved the preserved Eva-derived assertion. The proof is conditional on the stated function precondition.

## KLEE-ALARM-0021

- Eva alarm: `invalid shift` on `u32Temp3 << (32-count)` at `src_analysis/sources/mul_Ccode.c:5452` occurrence `1`.
- Eva property / preserved ACSL goal: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32` / `eva_klee_alarm_0021`.
- KLEE counterexample: `value=0; factor=0; count=0`; evidence `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0021/build/klee-out-alarm-0021/test000005.klee-alarm-0021.err`.
- Resolution: `REPOSITORY_CONTRACT` with origin `REPOSITORY_INFERRED`.
- Contract: `1 <= count && count < 32` at `src_repaired/sources/mul_Ccode.c:5604`.
- Interface normalization: `NONE`.
- Assertion: `src_repaired/sources/mul_Ccode.c:5636`; resolution commit `41d79fffb2cc054e3ac5c86eacc611ab7a46b489`.
- WP run: `analysis/wp_phase/results/KLEE-ALARM-0021/20260820-202535Z`; goal 1/1; Qed `NOT_SUFFICIENT`; Alt-Ergo `VALID`; Z3 `NOT_NEEDED / NOT_INVOKED`; CVC5 `NOT_NEEDED / NOT_INVOKED`.
- Final classification: **VALID_AUTOMATIC**.
- Interpretation: VALID under REPOSITORY_INFERRED input-domain semantics: under the repository-supported helper contract, WP proved the preserved Eva-derived assertion. The proof is conditional on the stated function precondition.
