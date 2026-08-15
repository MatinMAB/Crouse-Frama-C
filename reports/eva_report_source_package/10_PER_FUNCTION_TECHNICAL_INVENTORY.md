# Per-Function Technical Inventory

Every subsection follows the same evidence schema. Exact alarm rows are in `data/baseline_alarm_inventory.tsv` and `data/high_precision_alarm_inventory.tsv`.

## root_s32_mul_s32_s16_fac_less1

**Signature:** `s32 root_s32_mul_s32_s16_fac_less1(s32 value, s16 factor, u32 count)`
**Source:** `src_analysis/sources/mul_Ccode.c:5055`
**Header:** `src_analysis/headers/mul_Ccode.h:101`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_short_interval(-32768, 32767); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_root_s32_mul_s32_s16_fac_less1.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`; active helper calls: `MulHighWord`.
**Baseline alarm count:** 3
**High Precision alarm count:** 3
**Difference:** 0 (UNCHANGED); removed 0, remaining 3, new 0.
**Alarm locations:** B `mul_Ccode.c:5071`; B `mul_Ccode.c:5089`; B `mul_Ccode.c:5090`; HP `mul_Ccode.c:5071`; HP `mul_Ccode.c:5089`; HP `mul_Ccode.c:5090`;
**Alarm categories:** Baseline integer overflow=1, invalid shift=2; High Precision integer overflow=1, invalid shift=2.
**Relevant source operations:** multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## root_s32_mul_s32_s8_fac_less1

**Signature:** `s32 root_s32_mul_s32_s8_fac_less1(s32 value, s8 factor, u32 count)`
**Source:** `src_analysis/sources/mul_Ccode.c:5207`
**Header:** `src_analysis/headers/mul_Ccode.h:137`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=(s8) Frama_C_int_interval(-128, 127); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_root_s32_mul_s32_s8_fac_less1.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`; active helper calls: `MulHighWord`.
**Baseline alarm count:** 3
**High Precision alarm count:** 3
**Difference:** 0 (UNCHANGED); removed 0, remaining 3, new 0.
**Alarm locations:** B `mul_Ccode.c:5223`; B `mul_Ccode.c:5241`; B `mul_Ccode.c:5242`; HP `mul_Ccode.c:5223`; HP `mul_Ccode.c:5241`; HP `mul_Ccode.c:5242`;
**Alarm categories:** Baseline integer overflow=1, invalid shift=2; High Precision integer overflow=1, invalid shift=2.
**Relevant source operations:** multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## root_s32_mul_s32_u16_fac_less1

**Signature:** `s32 root_s32_mul_s32_u16_fac_less1(s32 value,u16 factor, u32 count)`
**Source:** `src_analysis/sources/mul_Ccode.c:5131`
**Header:** `src_analysis/headers/mul_Ccode.h:95`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_short_interval(0, 65535); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_root_s32_mul_s32_u16_fac_less1.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`; active helper calls: `MulHighWord`.
**Baseline alarm count:** 4
**High Precision alarm count:** 4
**Difference:** 0 (UNCHANGED); removed 0, remaining 4, new 0.
**Alarm locations:** B `MulHword.c:47`; B `mul_Ccode.c:5147`; B `mul_Ccode.c:5165`; B `mul_Ccode.c:5166`; HP `MulHword.c:47`; HP `mul_Ccode.c:5147`; HP `mul_Ccode.c:5165`; HP `mul_Ccode.c:5166`;
**Alarm categories:** Baseline integer overflow=2, invalid shift=2; High Precision integer overflow=2, invalid shift=2.
**Relevant source operations:** multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## root_s32_mul_s32_u8_fac_less1

**Signature:** `s32 root_s32_mul_s32_u8_fac_less1(s32 value, u8 factor, u32 count)`
**Source:** `src_analysis/sources/mul_Ccode.c:5526`
**Header:** `src_analysis/headers/mul_Ccode.h:131`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_char_interval(0, 255); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_root_s32_mul_s32_u8_fac_less1.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`; active helper calls: `MulHighWord`.
**Baseline alarm count:** 3
**High Precision alarm count:** 3
**Difference:** 0 (UNCHANGED); removed 0, remaining 3, new 0.
**Alarm locations:** B `mul_Ccode.c:5534`; B `mul_Ccode.c:5544`; B `mul_Ccode.c:5545`; HP `mul_Ccode.c:5534`; HP `mul_Ccode.c:5544`; HP `mul_Ccode.c:5545`;
**Alarm categories:** Baseline integer overflow=1, invalid shift=2; High Precision integer overflow=1, invalid shift=2.
**Relevant source operations:** multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## root_u32_mul_u32_s16_fac_less1

**Signature:** `u32 root_u32_mul_u32_s16_fac_less1(u32 value,s16 factor, u32 count)`
**Source:** `src_analysis/sources/mul_Ccode.c:5283`
**Header:** `src_analysis/headers/mul_Ccode.h:77`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=Frama_C_short_interval( -32768, 32767); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_root_u32_mul_u32_s16_fac_less1.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`; active helper calls: `MulHighWord`.
**Baseline alarm count:** 2
**High Precision alarm count:** 2
**Difference:** 0 (UNCHANGED); removed 0, remaining 2, new 0.
**Alarm locations:** B `mul_Ccode.c:5309`; B `mul_Ccode.c:5310`; HP `mul_Ccode.c:5309`; HP `mul_Ccode.c:5310`;
**Alarm categories:** Baseline invalid shift=2; High Precision invalid shift=2.
**Relevant source operations:** multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## root_u32_mul_u32_s32_fac_less1

**Signature:** `u32 root_u32_mul_u32_s32_fac_less1(u32 value, s32 factor, u32 count)`
**Source:** `src_analysis/sources/mul_Ccode.c:5347`
**Header:** `src_analysis/headers/mul_Ccode.h:89`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_root_u32_mul_u32_s32_fac_less1.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`; active helper calls: `MulHighWord`.
**Baseline alarm count:** 4
**High Precision alarm count:** 4
**Difference:** 0 (UNCHANGED); removed 0, remaining 4, new 0.
**Alarm locations:** B `MulHword.c:47`; B `MulHword.c:49`; B `mul_Ccode.c:5364`; B `mul_Ccode.c:5372`; HP `MulHword.c:47`; HP `MulHword.c:49`; HP `mul_Ccode.c:5364`; HP `mul_Ccode.c:5372`;
**Alarm categories:** Baseline integer overflow=3, invalid shift=1; High Precision integer overflow=3, invalid shift=1.
**Relevant source operations:** shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## root_u32_mul_u32_s8_fac_less1

**Signature:** `u32 root_u32_mul_u32_s8_fac_less1(u32 value, s8 factor, u32 count)`
**Source:** `src_analysis/sources/mul_Ccode.c:5425`
**Header:** `src_analysis/headers/mul_Ccode.h:125`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=(s8) Frama_C_int_interval( -128, 127); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_root_u32_mul_u32_s8_fac_less1.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`; active helper calls: `MulHighWord`.
**Baseline alarm count:** 2
**High Precision alarm count:** 2
**Difference:** 0 (UNCHANGED); removed 0, remaining 2, new 0.
**Alarm locations:** B `mul_Ccode.c:5451`; B `mul_Ccode.c:5452`; HP `mul_Ccode.c:5451`; HP `mul_Ccode.c:5452`;
**Alarm categories:** Baseline invalid shift=2; High Precision invalid shift=2.
**Relevant source operations:** multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## rotateLeft

**Signature:** `u32 rotateLeft(u32 num, u32 rotation)`
**Source:** `src_analysis/sources/rotatefunc.c:56`
**Header:** `src_analysis/headers/rotatefunc.h:14`
**TECHNICAL INTERPRETATION — structural purpose:** Implements word rotation using active shift and bitwise operations with branch-controlled rotation handling.
**Input domain used by Eva:** `num=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); rotation=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_rotateLeft.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/rotatefunc.c`; active helper calls: `none`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** multiplication, modulo, shift, bitwise, looping, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## rotateRight

**Signature:** `u32 rotateRight(u32 num, u32 rotation)`
**Source:** `src_analysis/sources/rotatefunc.c:101`
**Header:** `src_analysis/headers/rotatefunc.h:15`
**TECHNICAL INTERPRETATION — structural purpose:** Implements word rotation using active shift and bitwise operations with branch-controlled rotation handling.
**Input domain used by Eva:** `num=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); rotation=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_rotateRight.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/rotatefunc.c`; active helper calls: `none`.
**Baseline alarm count:** 1
**High Precision alarm count:** 1
**Difference:** 0 (UNCHANGED); removed 0, remaining 1, new 0.
**Alarm locations:** B `rotatefunc.c:119`; HP `rotatefunc.c:119`;
**Alarm categories:** Baseline integer overflow=1; High Precision integer overflow=1.
**Relevant source operations:** multiplication, modulo, shift, bitwise, looping, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_cos_u32

**Signature:** `s16 s16_cos_u32(u32 phi)`
**Source:** `src_analysis/sources/trig_Ccode.c:127`
**Header:** `src_analysis/headers/trig_Ccode.h:23`
**TECHNICAL INTERPRETATION — structural purpose:** The active function body is empty; the non-void interface reaches its closing brace without an active return expression.
**Input domain used by Eva:** `phi=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_s16_cos_u32.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/trig_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** no active arithmetic/control operation.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_div_s32_s16

**Signature:** `s16 s16_div_s32_s16(s32 numerator, s16 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:255`
**Header:** `src_analysis/headers/div_Ccode.h:19`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
**Input domain used by Eva:** `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s16_div_s32_s16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 25
**High Precision alarm count:** 20
**Difference:** -5 (REDUCED); removed 5, remaining 20, new 0.
**Alarm locations:** B `div_Ccode.c:274`; B `div_Ccode.c:274`; B `div_Ccode.c:274`; B `div_Ccode.c:297`; B `div_Ccode.c:297`; B `div_Ccode.c:274`; B `div_Ccode.c:274`; B `div_Ccode.c:274`; B `div_Ccode.c:274`; B `div_Ccode.c:274`; B `div_Ccode.c:275`; B `div_Ccode.c:276`; B `div_Ccode.c:276`; B `div_Ccode.c:276`; B `div_Ccode.c:297`; B `div_Ccode.c:297`; B `div_Ccode.c:297`; B `div_Ccode.c:297`; B `div_Ccode.c:297`; B `div_Ccode.c:297`; B `div_Ccode.c:298`; B `div_Ccode.c:299`; B `div_Ccode.c:299`; B `div_Ccode.c:299`; B `div_Ccode.c:299`; HP `div_Ccode.c:274`; HP `div_Ccode.c:274`; HP `div_Ccode.c:274`; HP `div_Ccode.c:274`; HP `div_Ccode.c:274`; HP `div_Ccode.c:275`; HP `div_Ccode.c:276`; HP `div_Ccode.c:276`; HP `div_Ccode.c:276`; HP `div_Ccode.c:297`; HP `div_Ccode.c:297`; HP `div_Ccode.c:297`; HP `div_Ccode.c:297`; HP `div_Ccode.c:297`; HP `div_Ccode.c:297`; HP `div_Ccode.c:298`; HP `div_Ccode.c:299`; HP `div_Ccode.c:299`; HP `div_Ccode.c:299`; HP `div_Ccode.c:299`;
**Alarm categories:** Baseline division by zero=6, integer overflow=17, invalid shift=2; High Precision division by zero=6, integer overflow=12, invalid shift=2.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_div_s32_u32

**Signature:** `s16 s16_div_s32_u32(s32 numerator, u32 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:1457`
**Header:** `src_analysis/headers/div_Ccode.h:65`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
**Input domain used by Eva:** `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_s16_div_s32_u32.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 1
**High Precision alarm count:** 1
**Difference:** 0 (UNCHANGED); removed 0, remaining 1, new 0.
**Alarm locations:** B `div_Ccode.c:1477`; HP `div_Ccode.c:1477`;
**Alarm categories:** Baseline integer overflow=1; High Precision integer overflow=1.
**Relevant source operations:** division, multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_fac05_div_s16_s16

**Signature:** `s16 s16_fac05_div_s16_s16(s16 numerator, s16 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:170`
**Header:** `src_analysis/headers/div_Ccode.h:17`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
**Input domain used by Eva:** `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_short_interval( -32768, 32767)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 11
**High Precision alarm count:** 9
**Difference:** -2 (REDUCED); removed 2, remaining 9, new 0.
**Alarm locations:** B `div_Ccode.c:190`; B `div_Ccode.c:190`; B `div_Ccode.c:173`; B `div_Ccode.c:190`; B `div_Ccode.c:190`; B `div_Ccode.c:190`; B `div_Ccode.c:190`; B `div_Ccode.c:191`; B `div_Ccode.c:192`; B `div_Ccode.c:192`; B `div_Ccode.c:192`; HP `div_Ccode.c:173`; HP `div_Ccode.c:190`; HP `div_Ccode.c:190`; HP `div_Ccode.c:190`; HP `div_Ccode.c:190`; HP `div_Ccode.c:191`; HP `div_Ccode.c:192`; HP `div_Ccode.c:192`; HP `div_Ccode.c:192`;
**Alarm categories:** Baseline division by zero=3, integer overflow=6, invalid shift=2; High Precision division by zero=3, integer overflow=4, invalid shift=2.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_fac05_div_s16_u16

**Signature:** `s16 s16_fac05_div_s16_u16(s16 numerator, u16 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:343`
**Header:** `src_analysis/headers/div_Ccode.h:21`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
**Input domain used by Eva:** `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s16_fac05_div_s16_u16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 5
**High Precision alarm count:** 5
**Difference:** 0 (UNCHANGED); removed 0, remaining 5, new 0.
**Alarm locations:** B `div_Ccode.c:348`; B `div_Ccode.c:362`; B `div_Ccode.c:363`; B `div_Ccode.c:363`; B `div_Ccode.c:365`; HP `div_Ccode.c:348`; HP `div_Ccode.c:362`; HP `div_Ccode.c:363`; HP `div_Ccode.c:363`; HP `div_Ccode.c:365`;
**Alarm categories:** Baseline integer overflow=3, invalid shift=2; High Precision integer overflow=3, invalid shift=2.
**Relevant source operations:** division, multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_hip1_s16_s8_s8_u16_fac1

**Signature:** `s16 s16_hip1_s16_s8_s8_u16_fac1(s16 yold, s8 u, s8 uold, u16 m)`
**Source:** `src_analysis/sources/hip_Ccode.c:158`
**Header:** `src_analysis/headers/hip_Ccode.h:17`
**TECHNICAL INTERPRETATION — structural purpose:** Implements the project HIP arithmetic interface using active mixed-width arithmetic and branch-controlled limiting.
**Input domain used by Eva:** `yold=Frama_C_short_interval( -32768, 32767); u=(s8) Frama_C_int_interval( -128, 127); uold=(s8) Frama_C_int_interval( -128, 127); m=Frama_C_unsigned_short_interval( 0, 65535)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/hip_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 5
**High Precision alarm count:** 5
**Difference:** 0 (UNCHANGED); removed 0, remaining 5, new 0.
**Alarm locations:** B `hip_Ccode.c:163`; B `hip_Ccode.c:166`; B `hip_Ccode.c:166`; B `hip_Ccode.c:167`; B `hip_Ccode.c:167`; HP `hip_Ccode.c:163`; HP `hip_Ccode.c:166`; HP `hip_Ccode.c:166`; HP `hip_Ccode.c:167`; HP `hip_Ccode.c:167`;
**Alarm categories:** Baseline integer overflow=3, invalid shift=2; High Precision integer overflow=3, invalid shift=2.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** CHANGED.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_hip1_s16_u8_u8_u16_fac1

**Signature:** `s16 s16_hip1_s16_u8_u8_u16_fac1(s16 yold, u8 u, u8 uold, u16 m)`
**Source:** `src_analysis/sources/hip_Ccode.c:44`
**Header:** `src_analysis/headers/hip_Ccode.h:14`
**TECHNICAL INTERPRETATION — structural purpose:** Implements the project HIP arithmetic interface using active mixed-width arithmetic and branch-controlled limiting.
**Input domain used by Eva:** `yold=Frama_C_short_interval( -32768, 32767); u=Frama_C_unsigned_char_interval( 0, 255); uold=Frama_C_unsigned_char_interval( 0, 255); m=Frama_C_unsigned_short_interval( 0, 65535)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/hip_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 5
**High Precision alarm count:** 5
**Difference:** 0 (UNCHANGED); removed 0, remaining 5, new 0.
**Alarm locations:** B `hip_Ccode.c:49`; B `hip_Ccode.c:52`; B `hip_Ccode.c:52`; B `hip_Ccode.c:53`; B `hip_Ccode.c:53`; HP `hip_Ccode.c:49`; HP `hip_Ccode.c:52`; HP `hip_Ccode.c:52`; HP `hip_Ccode.c:53`; HP `hip_Ccode.c:53`;
**Alarm categories:** Baseline integer overflow=3, invalid shift=2; High Precision integer overflow=3, invalid shift=2.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** CHANGED.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_mmv_s16_s16_s16_fac1

**Signature:** `s16 s16_mmv_s16_s16_s16_fac1(register s16 mmv, register s16 measure, register s16 crlc)`
**Source:** `src_analysis/sources/avrg_Ccode.c:52`
**Header:** `src_analysis/headers/avrg_Ccode.h:30`
**TECHNICAL INTERPRETATION — structural purpose:** Implements the project MMV arithmetic interface using the active difference, scaling, and limiting operations in the source.
**Input domain used by Eva:** `mmv=Frama_C_short_interval( -32768, 32767); measure=Frama_C_short_interval( -32768, 32767); crlc=Frama_C_short_interval( -32768, 32767)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s16_mmv_s16_s16_s16_fac1.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/avrg_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_mul_s16_s16_div_s16

**Signature:** `s16 s16_mul_s16_s16_div_s16(s16 fak1, s16 fak2, s16 div)`
**Source:** `src_analysis/sources/div_Ccode.c:947`
**Header:** `src_analysis/headers/div_Ccode.h:47`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width multiply/divide scaling routine with guarded arithmetic and result conversion/saturation paths.
**Input domain used by Eva:** `fak1<-data1=Frama_C_short_interval(-32768, 32767); fak2<-data2=Frama_C_short_interval(-32768, 32767); div<-denominator=Frama_C_short_interval(-32768, 32767)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 11
**High Precision alarm count:** 8
**Difference:** -3 (REDUCED); removed 3, remaining 8, new 0.
**Alarm locations:** B `div_Ccode.c:964`; B `div_Ccode.c:964`; B `div_Ccode.c:965`; B `div_Ccode.c:964`; B `div_Ccode.c:964`; B `div_Ccode.c:964`; B `div_Ccode.c:964`; B `div_Ccode.c:964`; B `div_Ccode.c:965`; B `div_Ccode.c:965`; B `div_Ccode.c:965`; HP `div_Ccode.c:964`; HP `div_Ccode.c:964`; HP `div_Ccode.c:964`; HP `div_Ccode.c:964`; HP `div_Ccode.c:964`; HP `div_Ccode.c:965`; HP `div_Ccode.c:965`; HP `div_Ccode.c:965`;
**Alarm categories:** Baseline division by zero=3, integer overflow=7, invalid shift=1; High Precision division by zero=2, integer overflow=5, invalid shift=1.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_mul_s16_s16_div_u16

**Signature:** `s16 s16_mul_s16_s16_div_u16(s16 data1,s16 data2,u16 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:1000`
**Header:** `src_analysis/headers/div_Ccode.h:49`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width multiply/divide scaling routine with guarded arithmetic and result conversion/saturation paths.
**Input domain used by Eva:** `data1=Frama_C_short_interval( -32768, 32767); data2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 7
**High Precision alarm count:** 5
**Difference:** -2 (REDUCED); removed 2, remaining 5, new 0.
**Alarm locations:** B `div_Ccode.c:1022`; B `div_Ccode.c:1022`; B `div_Ccode.c:1022`; B `div_Ccode.c:1022`; B `div_Ccode.c:1022`; B `div_Ccode.c:1022`; B `div_Ccode.c:1023`; HP `div_Ccode.c:1022`; HP `div_Ccode.c:1022`; HP `div_Ccode.c:1022`; HP `div_Ccode.c:1022`; HP `div_Ccode.c:1023`;
**Alarm categories:** Baseline integer overflow=6, invalid shift=1; High Precision integer overflow=4, invalid shift=1.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_mul_s16_u16_div_s16

**Signature:** `s16 s16_mul_s16_u16_div_s16(s16 factor1, u16 factor2, s16 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:611`
**Header:** `src_analysis/headers/div_Ccode.h:33`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width multiply/divide scaling routine with guarded arithmetic and result conversion/saturation paths.
**Input domain used by Eva:** `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 11
**High Precision alarm count:** 8
**Difference:** -3 (REDUCED); removed 3, remaining 8, new 0.
**Alarm locations:** B `div_Ccode.c:628`; B `div_Ccode.c:628`; B `div_Ccode.c:630`; B `div_Ccode.c:628`; B `div_Ccode.c:628`; B `div_Ccode.c:628`; B `div_Ccode.c:629`; B `div_Ccode.c:629`; B `div_Ccode.c:630`; B `div_Ccode.c:630`; B `div_Ccode.c:630`; HP `div_Ccode.c:628`; HP `div_Ccode.c:628`; HP `div_Ccode.c:628`; HP `div_Ccode.c:629`; HP `div_Ccode.c:629`; HP `div_Ccode.c:630`; HP `div_Ccode.c:630`; HP `div_Ccode.c:630`;
**Alarm categories:** Baseline division by zero=3, integer overflow=7, invalid shift=1; High Precision division by zero=2, integer overflow=5, invalid shift=1.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_mul_s16_u16_fac025

**Signature:** `s16 s16_mul_s16_u16_fac025(s16 value, u16 factor)`
**Source:** `src_analysis/sources/mul_Ccode.c:3341`
**Header:** `src_analysis/headers/mul_Ccode.h:41`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `value=Frama_C_short_interval(-32768, 32767); factor=Frama_C_unsigned_short_interval(0, 65535)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_s16_mul_s16_u16_fac025.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c`; active helper calls: `root_s16_mul_s16_u16_fac_less1`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** no active arithmetic/control operation.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_mul_u16_s16_div_u16

**Signature:** `s16 s16_mul_u16_s16_div_u16(u16 factor1, s16 factor2, u16 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:667`
**Header:** `src_analysis/headers/div_Ccode.h:35`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width multiply/divide scaling routine with guarded arithmetic and result conversion/saturation paths.
**Input domain used by Eva:** `factor1=Frama_C_unsigned_short_interval( 0, 65535); factor2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 7
**High Precision alarm count:** 6
**Difference:** -1 (REDUCED); removed 1, remaining 6, new 0.
**Alarm locations:** B `div_Ccode.c:684`; B `div_Ccode.c:684`; B `div_Ccode.c:684`; B `div_Ccode.c:684`; B `div_Ccode.c:684`; B `div_Ccode.c:684`; B `div_Ccode.c:685`; HP `div_Ccode.c:684`; HP `div_Ccode.c:684`; HP `div_Ccode.c:684`; HP `div_Ccode.c:684`; HP `div_Ccode.c:684`; HP `div_Ccode.c:685`;
**Alarm categories:** Baseline integer overflow=6, invalid shift=1; High Precision integer overflow=5, invalid shift=1.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_sin_u32

**Signature:** `s16 s16_sin_u32(u32 phi)`
**Source:** `src_analysis/sources/trig_Ccode.c:95`
**Header:** `src_analysis/headers/trig_Ccode.h:17`
**TECHNICAL INTERPRETATION — structural purpose:** The active function body is empty; the non-void interface reaches its closing brace without an active return expression.
**Input domain used by Eva:** `phi=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_s16_sin_u32.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/trig_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** no active arithmetic/control operation.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s16_tan_u32

**Signature:** `s16 s16_tan_u32(u32 phi)`
**Source:** `src_analysis/sources/trig_Ccode.c:159`
**Header:** `src_analysis/headers/trig_Ccode.h:29`
**TECHNICAL INTERPRETATION — structural purpose:** The active function body is empty; the non-void interface reaches its closing brace without an active return expression.
**Input domain used by Eva:** `phi=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_s16_tan_u32.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/trig_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** no active arithmetic/control operation.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s32_div_s32_s32

**Signature:** `s32 s32_div_s32_s32(s32 numerator, s32 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:1379`
**Header:** `src_analysis/headers/div_Ccode.h:63`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
**Input domain used by Eva:** `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_s32_div_s32_s32.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 9
**High Precision alarm count:** 9
**Difference:** 0 (UNCHANGED); removed 0, remaining 9, new 0.
**Alarm locations:** B `div_Ccode.c:1394`; B `div_Ccode.c:1395`; B `div_Ccode.c:1410`; B `div_Ccode.c:1413`; B `div_Ccode.c:1426`; B `div_Ccode.c:1429`; B `div_Ccode.c:1434`; B `div_Ccode.c:1434`; B `div_Ccode.c:1434`; HP `div_Ccode.c:1394`; HP `div_Ccode.c:1395`; HP `div_Ccode.c:1410`; HP `div_Ccode.c:1413`; HP `div_Ccode.c:1426`; HP `div_Ccode.c:1429`; HP `div_Ccode.c:1434`; HP `div_Ccode.c:1434`; HP `div_Ccode.c:1434`;
**Alarm categories:** Baseline integer overflow=8, invalid shift=1; High Precision integer overflow=8, invalid shift=1.
**Relevant source operations:** division, multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s32_div_s32_u32

**Signature:** `s32 s32_div_s32_u32(s32 numerator, u32 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:1311`
**Header:** `src_analysis/headers/div_Ccode.h:61`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
**Input domain used by Eva:** `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_s32_div_s32_u32.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 1
**High Precision alarm count:** 1
**Difference:** 0 (UNCHANGED); removed 0, remaining 1, new 0.
**Alarm locations:** B `div_Ccode.c:1330`; HP `div_Ccode.c:1330`;
**Alarm categories:** Baseline integer overflow=1; High Precision integer overflow=1.
**Relevant source operations:** division, multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s32_div_u32_s32

**Signature:** `s32 s32_div_u32_s32(u32 numerator, s32 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:1256`
**Header:** `src_analysis/headers/div_Ccode.h:59`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
**Input domain used by Eva:** `numerator=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_s32_div_u32_s32.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 1
**High Precision alarm count:** 1
**Difference:** 0 (UNCHANGED); removed 0, remaining 1, new 0.
**Alarm locations:** B `div_Ccode.c:1267`; HP `div_Ccode.c:1267`;
**Alarm categories:** Baseline integer overflow=1; High Precision integer overflow=1.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s32_mul_s32_s16_fac2

**Signature:** `s32 s32_mul_s32_s16_fac2(s32 val1,s16 val2)`
**Source:** `src_analysis/sources/mul_Ccode.c:1977`
**Header:** `src_analysis/headers/mul_Ccode.h:105`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `val1=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); val2=Frama_C_short_interval( -32768, 32767)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s32_mul_s32_s16_fac2.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`; active helper calls: `MulHighWord`.
**Baseline alarm count:** 1
**High Precision alarm count:** 1
**Difference:** 0 (UNCHANGED); removed 0, remaining 1, new 0.
**Alarm locations:** B `mul_Ccode.c:1993`; HP `mul_Ccode.c:1993`;
**Alarm categories:** Baseline integer overflow=1; High Precision integer overflow=1.
**Relevant source operations:** multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s32_mul_s32_s32

**Signature:** `s32 s32_mul_s32_s32(s32 val1, s32 val2)`
**Source:** `src_analysis/sources/mul_Ccode.c:2656`
**Header:** `src_analysis/headers/mul_Ccode.h:171`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `val1=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); val2=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s32_mul_s32_s32.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`; active helper calls: `MulHighWord`.
**Baseline alarm count:** 3
**High Precision alarm count:** 3
**Difference:** 0 (UNCHANGED); removed 0, remaining 3, new 0.
**Alarm locations:** B `MulHword.c:47`; B `mul_Ccode.c:2672`; B `mul_Ccode.c:2681`; HP `MulHword.c:47`; HP `mul_Ccode.c:2672`; HP `mul_Ccode.c:2681`;
**Alarm categories:** Baseline integer overflow=3; High Precision integer overflow=3.
**Relevant source operations:** multiplication, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s32_mul_s32_s32_fac2

**Signature:** `s32 s32_mul_s32_s32_fac2(s32 value, s32 factor)`
**Source:** `src_analysis/sources/mul_Ccode.c:2207`
**Header:** `src_analysis/headers/mul_Ccode.h:115`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s32_mul_s32_s32_fac2.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`; active helper calls: `MulHighWord`.
**Baseline alarm count:** 3
**High Precision alarm count:** 3
**Difference:** 0 (UNCHANGED); removed 0, remaining 3, new 0.
**Alarm locations:** B `MulHword.c:47`; B `mul_Ccode.c:2223`; B `mul_Ccode.c:2232`; HP `MulHword.c:47`; HP `mul_Ccode.c:2223`; HP `mul_Ccode.c:2232`;
**Alarm categories:** Baseline integer overflow=3; High Precision integer overflow=3.
**Relevant source operations:** multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s32_mul_s32_s32_fac_twopow_u8

**Signature:** `s32 s32_mul_s32_s32_fac_twopow_u8(s32 value, s32 factor, u8 power)`
**Source:** `src_analysis/sources/mul_Ccode.c:2425`
**Header:** `src_analysis/headers/mul_Ccode.h:175`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); power=Frama_C_unsigned_char_interval(0, 255)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_s32_mul_s32_s32_fac_twopow_u8.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`; active helper calls: `MulHighWord`.
**Baseline alarm count:** 3
**High Precision alarm count:** 3
**Difference:** 0 (UNCHANGED); removed 0, remaining 3, new 0.
**Alarm locations:** B `MulHword.c:47`; B `mul_Ccode.c:2454`; B `mul_Ccode.c:2463`; HP `MulHword.c:47`; HP `mul_Ccode.c:2454`; HP `mul_Ccode.c:2463`;
**Alarm categories:** Baseline integer overflow=3; High Precision integer overflow=3.
**Relevant source operations:** multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s32_mul_s32_s8_fac2

**Signature:** `s32 s32_mul_s32_s8_fac2(s32 value, s8 factor)`
**Source:** `src_analysis/sources/mul_Ccode.c:2584`
**Header:** `src_analysis/headers/mul_Ccode.h:141`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=(s8) Frama_C_int_interval( -128, 127)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s32_mul_s32_s8_fac2.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c;src_analysis/sources/MulHword.c`; active helper calls: `MulHighWord`.
**Baseline alarm count:** 1
**High Precision alarm count:** 1
**Difference:** 0 (UNCHANGED); removed 0, remaining 1, new 0.
**Alarm locations:** B `mul_Ccode.c:2600`; HP `mul_Ccode.c:2600`;
**Alarm categories:** Baseline integer overflow=1; High Precision integer overflow=1.
**Relevant source operations:** multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s32_mul_s32_u16

**Signature:** `s32 s32_mul_s32_u16(s32 value, u16 factor)`
**Source:** `src_analysis/sources/mul_Ccode.c:752`
**Header:** `src_analysis/headers/mul_Ccode.h:149`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_short_interval( 0, 65535)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_s32_mul_s32_u16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 3
**High Precision alarm count:** 2
**Difference:** -1 (REDUCED); removed 1, remaining 2, new 0.
**Alarm locations:** B `mul_Ccode.c:760`; B `mul_Ccode.c:767`; B `mul_Ccode.c:778`; HP `mul_Ccode.c:767`; HP `mul_Ccode.c:778`;
**Alarm categories:** Baseline division by zero=1, integer overflow=2; High Precision integer overflow=2.
**Relevant source operations:** division, multiplication, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## s32_mul_u32_s32

**Signature:** `s32 s32_mul_u32_s32(u32 val1, s32 val2)`
**Source:** `src_analysis/sources/mul_Ccode.c:1757`
**Header:** `src_analysis/headers/mul_Ccode.h:169`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `val1=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL); val2=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_s32_mul_u32_s32.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 1
**High Precision alarm count:** 1
**Difference:** 0 (UNCHANGED); removed 0, remaining 1, new 0.
**Alarm locations:** B `mul_Ccode.c:1762`; HP `mul_Ccode.c:1762`;
**Alarm categories:** Baseline integer overflow=1; High Precision integer overflow=1.
**Relevant source operations:** division, multiplication, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## u16_cos_u16

**Signature:** `u16 u16_cos_u16(u16 phi)`
**Source:** `src_analysis/sources/trig_Ccode.c:111`
**Header:** `src_analysis/headers/trig_Ccode.h:20`
**TECHNICAL INTERPRETATION — structural purpose:** The active function body is empty; the non-void interface reaches its closing brace without an active return expression.
**Input domain used by Eva:** `phi=Frama_C_unsigned_short_interval( 0, 65535)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_u16_cos_u16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/trig_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** no active arithmetic/control operation.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## u16_div_s32_u16

**Signature:** `u16 u16_div_s32_u16(s32 x_value, u16 y_value)`
**Source:** `src_analysis/sources/div_Ccode.c:478`
**Header:** `src_analysis/headers/div_Ccode.h:27`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
**Input domain used by Eva:** `x_value<-numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); y_value<-denominator=Frama_C_unsigned_short_interval(0, 65535)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_u16_div_s32_u16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 7
**High Precision alarm count:** 5
**Difference:** -2 (REDUCED); removed 2, remaining 5, new 0.
**Alarm locations:** B `div_Ccode.c:495`; B `div_Ccode.c:495`; B `div_Ccode.c:495`; B `div_Ccode.c:495`; B `div_Ccode.c:495`; B `div_Ccode.c:495`; B `div_Ccode.c:496`; HP `div_Ccode.c:495`; HP `div_Ccode.c:495`; HP `div_Ccode.c:495`; HP `div_Ccode.c:495`; HP `div_Ccode.c:496`;
**Alarm categories:** Baseline integer overflow=6, invalid shift=1; High Precision integer overflow=4, invalid shift=1.
**Relevant source operations:** division, multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## u16_mmv_u16_u16_s16_fac1

**Signature:** `u16 u16_mmv_u16_u16_s16_fac1(register u16 mmv, register u16 measure, register s16 crlc)`
**Source:** `src_analysis/sources/avrg_Ccode.c:211`
**Header:** `src_analysis/headers/avrg_Ccode.h:33`
**TECHNICAL INTERPRETATION — structural purpose:** Implements the project MMV arithmetic interface using the active difference, scaling, and limiting operations in the source.
**Input domain used by Eva:** `mmv=Frama_C_unsigned_short_interval(0, 65535); measure=Frama_C_unsigned_short_interval(0, 65535); crlc=Frama_C_short_interval(-32768, 32767)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_u16_mmv_u16_u16_s16_fac1.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/avrg_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 1
**High Precision alarm count:** 1
**Difference:** 0 (UNCHANGED); removed 0, remaining 1, new 0.
**Alarm locations:** B `avrg_Ccode.c:249`; HP `avrg_Ccode.c:249`;
**Alarm categories:** Baseline integer overflow=1; High Precision integer overflow=1.
**Relevant source operations:** multiplication, shift, bitwise, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## u16_mul_s16_u16_div_s16

**Signature:** `u16 u16_mul_s16_u16_div_s16(s16 factor1, u16 factor2, s16 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:721`
**Header:** `src_analysis/headers/div_Ccode.h:37`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width multiply/divide scaling routine with guarded arithmetic and result conversion/saturation paths.
**Input domain used by Eva:** `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 11
**High Precision alarm count:** 9
**Difference:** -2 (REDUCED); removed 2, remaining 9, new 0.
**Alarm locations:** B `div_Ccode.c:740`; B `div_Ccode.c:741`; B `div_Ccode.c:740`; B `div_Ccode.c:740`; B `div_Ccode.c:740`; B `div_Ccode.c:740`; B `div_Ccode.c:740`; B `div_Ccode.c:740`; B `div_Ccode.c:741`; B `div_Ccode.c:741`; B `div_Ccode.c:741`; HP `div_Ccode.c:740`; HP `div_Ccode.c:740`; HP `div_Ccode.c:740`; HP `div_Ccode.c:740`; HP `div_Ccode.c:740`; HP `div_Ccode.c:740`; HP `div_Ccode.c:741`; HP `div_Ccode.c:741`; HP `div_Ccode.c:741`;
**Alarm categories:** Baseline division by zero=3, integer overflow=7, invalid shift=1; High Precision division by zero=2, integer overflow=6, invalid shift=1.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## u16_mul_s16_u16_div_u16

**Signature:** `u16 u16_mul_s16_u16_div_u16(s16 factor1, u16 factor2, u16 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:777`
**Header:** `src_analysis/headers/div_Ccode.h:39`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width multiply/divide scaling routine with guarded arithmetic and result conversion/saturation paths.
**Input domain used by Eva:** `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 7
**High Precision alarm count:** 6
**Difference:** -1 (REDUCED); removed 1, remaining 6, new 0.
**Alarm locations:** B `div_Ccode.c:795`; B `div_Ccode.c:795`; B `div_Ccode.c:795`; B `div_Ccode.c:795`; B `div_Ccode.c:795`; B `div_Ccode.c:795`; B `div_Ccode.c:796`; HP `div_Ccode.c:795`; HP `div_Ccode.c:795`; HP `div_Ccode.c:795`; HP `div_Ccode.c:795`; HP `div_Ccode.c:795`; HP `div_Ccode.c:796`;
**Alarm categories:** Baseline integer overflow=6, invalid shift=1; High Precision integer overflow=5, invalid shift=1.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## u16_mul_u16_u8_fac8

**Signature:** `u16 u16_mul_u16_u8_fac8(u16 x_value, u8 y_value)`
**Source:** `src_analysis/sources/mul_Ccode.c:4679`
**Header:** `src_analysis/headers/mul_Ccode.h:62`
**TECHNICAL INTERPRETATION — structural purpose:** Implements fixed-width multiplication/scaling arithmetic, including the shifts, guards, and helper calls present in the active body.
**Input domain used by Eva:** `x_value=Frama_C_unsigned_short_interval(0, 65535); y_value=Frama_C_unsigned_char_interval(0, 255)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_u16_mul_u16_u8_fac8.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/mul_Ccode.c`; active helper calls: `root_u16_mul_u16_u8_fac_greater_1`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** shift, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## u16_sin_u16

**Signature:** `u16 u16_sin_u16(u16 Phi)`
**Source:** `src_analysis/sources/trig_Ccode.c:38`
**Header:** `src_analysis/headers/trig_Ccode.h:14`
**TECHNICAL INTERPRETATION — structural purpose:** Implements or exposes the named trigonometric/fixed-point interface; the structural operation profile is taken from the active body.
**Input domain used by Eva:** `Phi=Frama_C_unsigned_short_interval( 0, 65535)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_u16_sin_u16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/trig_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** shift, bitwise, branching, looping, return paths.
**Final-state observation:** CHANGED.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## u16_tan_u16

**Signature:** `u16 u16_tan_u16(u16 phi)`
**Source:** `src_analysis/sources/trig_Ccode.c:143`
**Header:** `src_analysis/headers/trig_Ccode.h:26`
**TECHNICAL INTERPRETATION — structural purpose:** The active function body is empty; the non-void interface reaches its closing brace without an active return expression.
**Input domain used by Eva:** `phi=Frama_C_unsigned_short_interval( 0, 65535)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_u16_tan_u16.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/trig_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** no active arithmetic/control operation.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## u32_div_s32_s32

**Signature:** `u32 u32_div_s32_s32(s32 numerator, s32 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:1138`
**Header:** `src_analysis/headers/div_Ccode.h:55`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
**Input domain used by Eva:** `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_u32_div_s32_s32.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 9
**High Precision alarm count:** 9
**Difference:** 0 (UNCHANGED); removed 0, remaining 9, new 0.
**Alarm locations:** B `div_Ccode.c:1168`; B `div_Ccode.c:1168`; B `div_Ccode.c:1168`; B `div_Ccode.c:1182`; B `div_Ccode.c:1183`; B `div_Ccode.c:1184`; B `div_Ccode.c:1184`; B `div_Ccode.c:1184`; B `div_Ccode.c:1184`; HP `div_Ccode.c:1168`; HP `div_Ccode.c:1168`; HP `div_Ccode.c:1168`; HP `div_Ccode.c:1182`; HP `div_Ccode.c:1183`; HP `div_Ccode.c:1184`; HP `div_Ccode.c:1184`; HP `div_Ccode.c:1184`; HP `div_Ccode.c:1184`;
**Alarm categories:** Baseline division by zero=1, integer overflow=6, invalid shift=2; High Precision division by zero=1, integer overflow=6, invalid shift=2.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## u32_div_s32_u32

**Signature:** `u32 u32_div_s32_u32(s32 numerator, u32 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:1095`
**Header:** `src_analysis/headers/div_Ccode.h:53`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
**Input domain used by Eva:** `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_u32_div_s32_u32.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## u32_div_u32_s32

**Signature:** `u32 u32_div_u32_s32(u32 numerator, s32 denominator)`
**Source:** `src_analysis/sources/div_Ccode.c:1058`
**Header:** `src_analysis/headers/div_Ccode.h:51`
**TECHNICAL INTERPRETATION — structural purpose:** Implements a fixed-width division/scaling routine with denominator guards and result conversion/saturation paths.
**Input domain used by Eva:** `numerator=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
**Harness strategy:** one abstract call through `harnesses/P1/eva_main_u32_div_u32_s32.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/div_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** division, multiplication, shift, branching, return paths.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.

## u32_mmv_u32_u32_s32_fac1

**Signature:** `u32 u32_mmv_u32_u32_s32_fac1(u32 mmv, u32 measure, s32 crlc)`
**Source:** `src_analysis/sources/avrg_Ccode.c:995`
**Header:** `src_analysis/headers/avrg_Ccode.h:27`
**TECHNICAL INTERPRETATION — structural purpose:** Implements the project MMV arithmetic interface using the active difference, scaling, and limiting operations in the source.
**Input domain used by Eva:** `mmv=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL); measure=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL); crlc=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
**Harness strategy:** one abstract call through `harnesses/P0/eva_main_u32_mmv_u32_u32_s32_fac1.c`; result retained with `(void) result`.
**Dependencies/helper files:** `src_analysis/sources/avrg_Ccode.c`; active helper calls: `none`.
**Baseline alarm count:** 0
**High Precision alarm count:** 0
**Difference:** 0 (UNCHANGED); removed 0, remaining 0, new 0.
**Alarm locations:** Baseline none;  High Precision none.
**Alarm categories:** Baseline none; High Precision none.
**Relevant source operations:** no active arithmetic/control operation.
**Final-state observation:** IDENTICAL.
**Notes — DIRECT REPOSITORY EVIDENCE:** counts, paths, input models, operation tokens, and final-state status above come from committed artifacts.
**Notes — TECHNICAL INTERPRETATION:** purpose wording summarizes active source structure; requirements outside tracked artifacts are not asserted.
