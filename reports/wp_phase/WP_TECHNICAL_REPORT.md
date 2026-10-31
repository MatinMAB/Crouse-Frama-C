# گزارش فنی مرحله اثبات قیاسی با Frama-C/WP

## 1. خلاصه مدیریتی

این مرحله ۴۸ مشخصه‌ای را که KLEE برای آن‌ها نمونه‌نقض عینی تولید کرده بود، پس از تصمیم معنایی و اصلاح implementation یا تکمیل specification، با WP بررسی کرد. هر ۴۸ هدف انتخاب‌شده `VALID` شدند: ۳۵ مورد با Qed و ۱۳ مورد با prover خارجی. این نتیجه دربارهٔ همین مشخصه‌هاست، نه ایمنی کل برنامه یا کل تابع.

## 2. جایگاه WP در روند کلی پروژه

زنجیرهٔ evidence عبارت است از Eva High Precision (۱۴۹ مشخصهٔ حل‌نشده)، KLEE (۴۸ نمونه‌نقض، ۱۵ اجرای کامل بدون نمونه‌نقض، ۸۶ timeout/inconclusive)، تصمیم معنایی ۴۸ مورد، و سپس proof همان property با WP. شاخه از commit آمادهٔ campaign `9307d7b68ea4c9b1496cfd0160e337f739827edd` منشعب شده و raw result نهایی commit `09e759283a6f1f9483cb560873e0b97d544fa714` را حفظ می‌کند.

## 3. ورودی مرحله WP

مجموعهٔ ورودی با set equality روی شناسه‌های `KLEE-ALARM-NNNN` تثبیت شد. `analysis/klee_phase_c/results/summary.tsv` شامل ۱۴۹ ردیف و دقیقاً ۴۸ `CONFIRMED_COUNTEREXAMPLE` است. همان ۴۸ شناسه در semantic-resolution، ورودی WP، result نهایی و dataset نرمال‌شده حضور دارند.

## 4. دلیل انتخاب ۴۸ مشخصه

فقط targetهایی وارد WP شدند که KLEE برای آن‌ها witness concrete retained داشت و تصمیم معنایی ثبت شده بود. ۱۰۱ مشخصهٔ دیگر در این campaign WP وارد نشدند و برای پایش زمان اجرا باقی ماندند.

## 5. ارتباط KLEE، تصمیم معنایی و WP

هر ردیف dataset مسیر `Eva property → KLEE witness → semantic decision → source/spec change → ACSL label → wp-report.json` را نگه می‌دارد. Validator علاوه بر شمارش، برابری دقیق مجموعهٔ شناسه‌ها را بررسی می‌کند.

## 6. حفظ هویت مشخصه

متن property در چهار artifact مستقل (final matrix، WP input، repair matrix و normalized dataset) مقایسه می‌شود. ACSL label نیز در source نهایی یکتا و در JSON رسمی WP حاضر است. ۱۳ شماره‌خط ثبت‌شده در manifest قدیمی پس از درج‌های shared جابه‌جا شده‌اند؛ label یکتا همچنان معتبر است و `verified_assertion_line` مکان فعلی را ثبت می‌کند.

## 7. معماری تحلیل WP

runner metadata هر target translation-unit، تابع، property، مدل، timeout و memory limit را تعیین می‌کند. `wp_common.sh` command را می‌سازد، result directory timestamped و غیر-overwriting ایجاد می‌کند، version/Git state/command/log/JSON/time را ثبت می‌کند. wrapperهای جدید اجرای یک target، اجرای sequential و validation را ساده می‌کنند.

## 8. مدل ماشین ppc_32

تمام proofها با `-machdep ppc_32` اجرا شده‌اند تا width و رفتار typeها با experiment Eva سازگار بماند. این claim به همین machine model محدود است.

## 9. مدل حافظه Typed+int

WP model برابر `Typed+int` است. هیچ نتیجه‌ای برای مدل حافظه یا arithmetic دیگری از این campaign استنتاج نمی‌شود.

## 10. ساختار ACSL و مشخصه‌های هدف

هر invocation فقط label متناظر را با `-wp-prop` و تابع مالک را با `-wp-fct` انتخاب می‌کند. `-wp-rte` استفاده نشده است؛ بنابراین proof مربوط به selected assertion است، نه همهٔ runtime errorهای تابع.

## 11. ابزارهای اثبات

### Qed

Qed simplifier داخلی WP است. ۳۵ هدف پس از محاسبه و ساده‌سازی داخلی بسته شدند و prover خارجی لازم نداشتند.

### Alt-Ergo

Alt-Ergo 2.6.2 prover موفق ۱۲ هدف از ۱۳ هدف external بود.

### Z3

Z3 4.8.12 هدف `KLEE-ALARM-0017` را پس از کافی نبودن Qed و timeout ثبت‌شدهٔ Alt-Ergo ثابت کرد.

### CVC5

CVC5 1.1.2 در configuration campaign موجود بود؛ اما در JSON retained هیچ هدفی به‌عنوان نخستین prover موفق به آن منتسب نیست. این به معنی بی‌فایده بودن آن نیست.

## 12. پیکربندی و optionهای WP

فرم ثابت command: `frama-c -machdep ppc_32 ... -wp -wp-fct <function> -wp-prop <label> -wp-model Typed+int -wp-prover alt-ergo,z3,cvc5 -wp-run-all-provers -wp-par 1 -wp-timeout 120 -wp-memlimit 2000 -wp-cache rebuild -wp-session ... -wp-out ... -wp-report-json ... -wp-proof-trace -wp-status`. زمان ۱۲۰ ثانیه per prover، memory limit برابر ۲۰۰۰ MB و parallelism برابر ۱ است.

## 13. روش اجرای یک مشخصه

پس از environment check: `./analysis/wp_phase/scripts/run_one.sh KLEE-ALARM-0001`. گزینه‌های `--timeout` و `--memlimit` override صریح هستند؛ خروجی جدید timestamped است و raw frozen artifact را overwrite نمی‌کند.

## 14. روش اجرای کل مجموعه

`./analysis/wp_phase/scripts/run_all.sh` همهٔ ۴۸ target را sequential اجرا می‌کند. `--resume` target دارای retained JSON کاملاً passed را skip می‌کند. failure یک target مانع ادامهٔ بقیه نمی‌شود.

## 15. ساختار session و artifactها

برای هر اجرا command، log مشترک stdout/stderr، JSON رسمی WP، exit code، elapsed wall، versionها و Git state ثبت می‌شود. session و cacheهای بازتولیدپذیر tracked نیستند؛ raw JSON/logهای frozen و summaryهای کوچک tracked هستند.

## 16. طبقه‌بندی نتایج

taxonomy نرمال‌شده: `VALID_QED`, `VALID_EXTERNAL_PROVER`, `TIMEOUT`, `UNKNOWN`, `PROVER_FAILURE`, `BUILD_OR_PARSE_FAILURE`, `MISSING_TARGET`, `CONFIGURATION_ERROR`. Frozen result فقط شامل ۳۵ `VALID_QED` و ۱۳ `VALID_EXTERNAL_PROVER` است.

## 17. نتایج کلی

| Metric | Value |
| --- | --- |
| Targets | 48 |
| VALID | 48 |
| Unknown | 0 |
| Timeout | 0 |
| Failure | 0 |
| Code Repair | 35 |
| Specification Completion | 13 |

## 18. نتایج به تفکیک Qed و prover خارجی

| proof_mode | Count | Total (s) | Median (s) | Mean (s) | Min (s) | Max (s) |
| --- | --- | --- | --- | --- | --- | --- |
| EXTERNAL_PROVER | 13 | 157.925164972 | 1.521911837 | 12.148089613 | 1.338741983 | 131.908813542 |
| QED_ONLY | 35 | 25.985072436 | 0.774175472 | 0.742430641 | 0.559338023 | 0.944173325 |

توزیع prover موفق: `Alt-Ergo:2.6.2`=12, `Z3:4.8.12`=1, `qed`=35.

## 19. نتایج به تفکیک تابع

| Function | Targets | Code Repair | Spec Completion | Qed-only | External | Total wall (s) | Median wall (s) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| root_s32_mul_s32_s16_fac_less1 | 3 | 1 | 2 | 2 | 1 | 3.271169521 | 0.944173325 |
| root_s32_mul_s32_s8_fac_less1 | 3 | 1 | 2 | 2 | 1 | 3.084533770 | 0.834860717 |
| root_s32_mul_s32_u16_fac_less1 | 4 | 2 | 2 | 2 | 2 | 12.769938762 | 1.189056972 |
| root_s32_mul_s32_u8_fac_less1 | 3 | 1 | 2 | 2 | 1 | 3.146971134 | 0.807940335 |
| root_u32_mul_u32_s16_fac_less1 | 2 | 0 | 2 | 1 | 1 | 2.307590913 | 1.153795456 |
| root_u32_mul_u32_s32_fac_less1 | 4 | 3 | 1 | 2 | 2 | 134.987913243 | 1.158366289 |
| root_u32_mul_u32_s8_fac_less1 | 2 | 0 | 2 | 1 | 1 | 2.289012674 | 1.144506337 |
| rotateRight | 1 | 1 | 0 | 1 | 0 | 0.643334027 | 0.643334027 |
| s16_div_s32_u32 | 1 | 1 | 0 | 1 | 0 | 0.634042626 | 0.634042626 |
| s16_fac05_div_s16_s16 | 1 | 1 | 0 | 1 | 0 | 0.600762044 | 0.600762044 |
| s16_fac05_div_s16_u16 | 1 | 1 | 0 | 1 | 0 | 0.634189306 | 0.634189306 |
| s16_hip1_s16_s8_s8_u16_fac1 | 2 | 2 | 0 | 1 | 1 | 1.908732211 | 0.954366106 |
| s16_hip1_s16_u8_u8_u16_fac1 | 2 | 2 | 0 | 1 | 1 | 1.956278839 | 0.978139419 |
| s32_div_s32_s32 | 4 | 4 | 0 | 2 | 2 | 4.365486368 | 1.072515530 |
| s32_div_s32_u32 | 1 | 1 | 0 | 1 | 0 | 0.601476787 | 0.601476787 |
| s32_div_u32_s32 | 1 | 1 | 0 | 1 | 0 | 0.597309440 | 0.597309440 |
| s32_mul_s32_s16_fac2 | 1 | 1 | 0 | 1 | 0 | 0.808987944 | 0.808987944 |
| s32_mul_s32_s32 | 3 | 3 | 0 | 3 | 0 | 2.359859233 | 0.788547305 |
| s32_mul_s32_s32_fac2 | 3 | 3 | 0 | 3 | 0 | 2.303282372 | 0.761582419 |
| s32_mul_s32_s32_fac_twopow_u8 | 3 | 3 | 0 | 3 | 0 | 2.340316130 | 0.774175472 |
| s32_mul_s32_s8_fac2 | 1 | 1 | 0 | 1 | 0 | 0.779620137 | 0.779620137 |
| s32_mul_u32_s32 | 1 | 1 | 0 | 1 | 0 | 0.823305181 | 0.823305181 |
| u32_div_s32_s32 | 1 | 1 | 0 | 1 | 0 | 0.696124746 | 0.696124746 |

## 20. نتایج به تفکیک نوع تصمیم معنایی

| resolution_type | Count | Total (s) | Median (s) | Mean (s) | Min (s) | Max (s) |
| --- | --- | --- | --- | --- | --- | --- |
| CODE_REPAIR | 35 | 168.499282504 | 0.774175472 | 4.814265214 | 0.559338023 | 131.908813542 |
| SPECIFICATION_COMPLETION | 13 | 15.410954904 | 1.485058726 | 1.185458070 | 0.785077060 | 1.532028366 |

در `CODE_REPAIR` implementation عوض شد و property ثابت ماند. در `SPECIFICATION_COMPLETION` constraint دامنه/رابط ثبت شد و property ثابت ماند. validator equality مستقیم contract با target predicate را به‌عنوان weakening/trivialization flag می‌کند؛ موردی پیدا نشد. این check جای review معنایی انسانی را نمی‌گیرد.

## 21. تحلیل زمان

زمان retained، wall-clock کل invocation Frama-C/WP از لحظهٔ شروع process تا پایان آن (شامل startup، WP، proverها و pipe به `tee`) است؛ solver time نامیده نمی‌شود. آمار توصیفی ۴۸ اجرا:

| Statistic | Seconds |
| --- | --- |
| TOTAL | 183.910237408 |
| MEAN | 3.831463279 |
| MEDIAN | 0.791684023 |
| MIN | 0.559338023 |
| MAX | 131.908813542 |
| P25 | 0.760939875 |
| P75 | 1.341405034 |
| P90 | 1.525219229 |
| P95 | 1.573897535 |

### بر حسب category

| alarm_category | Count | Total (s) | Median (s) | Mean (s) | Min (s) | Max (s) |
| --- | --- | --- | --- | --- | --- | --- |
| integer overflow | 29 | 163.399320104 | 0.779620137 | 5.634459314 | 0.597309440 | 131.908813542 |
| invalid shift | 19 | 20.510917304 | 0.834860717 | 1.079521963 | 0.559338023 | 1.532028366 |

### بر حسب prover موفق

| successful_prover | Count | Total (s) | Median (s) | Mean (s) | Min (s) | Max (s) |
| --- | --- | --- | --- | --- | --- | --- |
| Alt-Ergo:2.6.2 | 12 | 26.016351430 | 1.520176726 | 2.168029286 | 1.338741983 | 9.604214701 |
| Z3:4.8.12 | 1 | 131.908813542 | 131.908813542 | 131.908813542 | 131.908813542 | 131.908813542 |
| qed | 35 | 25.985072436 | 0.774175472 | 0.742430641 | 0.559338023 | 0.944173325 |

زمان Qed و proverهای external از JSON رسمی، در صورت موجود بودن، جداگانه در dataset آمده است. فیلد خالی یعنی آن prover در JSON آن target attempt ثبت‌شده‌ای نداشت؛ صفر جعل نشده است.

## 22. مطالعات موردی

### KLEE-ALARM-0001: root_s32_mul_s32_s16_fac_less1

- زنگ Eva: `integer overflow` روی `-value`؛ مشخصهٔ ثابت: `value != INT32_MIN`.
- نمونه‌نقض KLEE: `value=-2147483648 (0x80000000); factor=1 (0x0001); count=0 (0x00000000)`؛ فایل KTest: `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0001/build/klee-out-alarm-0001/test000001.ktest`.
- تصمیم معنایی: `CODE_REPAIR` (`IMPLEMENTATION_REPAIR`, منشأ `REPOSITORY_INFERRED`).
- اصلاح/قرارداد: Use exact unsigned 0x80000000 magnitude for INT32_MIN; retain each original signed operation and ACSL assertion on the predicate-satisfying branch.
- هدف WP: `eva_klee_alarm_0001` با `ppc_32` و `Typed+int`.
- نتیجه: `VALID`، روش `QED_ONLY`، prover موفق `qed`، زمان wall runner برابر `0.944173325 s`.
- شواهد: `analysis/wp_phase/results/KLEE-ALARM-0001/20260820-185801Z/wp-report.json` و `analysis/wp_phase/results/KLEE-ALARM-0001/20260820-185801Z/stdout_stderr.log`.
### KLEE-ALARM-0003: root_s32_mul_s32_s16_fac_less1

- زنگ Eva: `invalid shift` روی `u32Temp4 << (32-count)`؛ مشخصهٔ ثابت: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32`.
- نمونه‌نقض KLEE: `value=0 (0x00000000); factor=-32768 (0x8000); count=0 (0x00000000)`؛ فایل KTest: `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0003/build/klee-out-alarm-0003/test000007.ktest`.
- تصمیم معنایی: `SPECIFICATION_COMPLETION` (`THESIS_POLICY_INTERFACE_SPECIFICATION`, منشأ `THESIS_POLICY_SELECTED`).
- اصلاح/قرارداد: The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented.
- هدف WP: `eva_klee_alarm_0003` با `ppc_32` و `Typed+int`.
- نتیجه: `VALID`، روش `EXTERNAL_PROVER`، prover موفق `Alt-Ergo:2.6.2`، زمان wall runner برابر `1.532028366 s`.
- شواهد: `analysis/wp_phase/results/KLEE-ALARM-0003/20260820-202520Z/wp-report.json` و `analysis/wp_phase/results/KLEE-ALARM-0003/20260820-202520Z/stdout_stderr.log`.
### KLEE-ALARM-0017: root_u32_mul_u32_s32_fac_less1

- زنگ Eva: `integer overflow` روی `(int)arg1_HW * (int)arg2_LW`؛ مشخصهٔ ثابت: `MATHEMATICAL((int)arg1_HW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX`.
- نمونه‌نقض KLEE: `value=4294443008 (0xFFF80000); factor=53761 (0x0000D201); count=0 (0x00000000)`؛ فایل KTest: `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0017/build/klee-out-alarm-0017/test000001.ktest`.
- تصمیم معنایی: `CODE_REPAIR` (`IMPLEMENTATION_REPAIR`, منشأ `REPOSITORY_INFERRED`).
- اصلاح/قرارداد: Compute 16-bit limb products as unsigned on the violating path; retain original promoted multiplication and ACSL assertions behind an overflow-free unsigned guard.
- هدف WP: `eva_klee_alarm_0017` با `ppc_32` و `Typed+int`.
- نتیجه: `VALID`، روش `EXTERNAL_PROVER`، prover موفق `Z3:4.8.12`، زمان wall runner برابر `131.908813542 s`.
- شواهد: `analysis/wp_phase/results/KLEE-ALARM-0017/20260820-185816Z/wp-report.json` و `analysis/wp_phase/results/KLEE-ALARM-0017/20260820-185816Z/stdout_stderr.log`.


در ۴۸ witness این مرحله، ۲۹ مورد `integer overflow` و ۱۹ مورد `invalid shift` وجود دارد؛ target واقعی `division by zero` وجود ندارد. بنابراین مطالعهٔ موردی تقسیم بر صفر بدون جعل evidence ممکن نبود و عمداً ساخته نشد.

## 23. محدودیت‌ها

- proofها فقط selected target property را پوشش می‌دهند و `-wp-rte` فعال نبوده است.
- validity به source revision، contracts، `ppc_32`، `Typed+int` و نسخه‌های ابزار ثبت‌شده وابسته است.
- پنج specification completion از evidence repository و هشت مورد از thesis policy آمده‌اند؛ دومی ادعای legacy intent نمی‌کند.
- wall time به host load وابسته است و زمان خالص solver نیست.
- JSON retained وضعیت goal و prover attempt را می‌دهد، اما proof certificate مستقل از toolchain نگهداری نشده است.

## 24. برداشت صحیح از ۴۸/۴۸

`48/48 VALID` یعنی WP همان ۴۸ assertion انتخاب‌شده را روی source/specification ثبت‌شده و configuration ثبت‌شده ثابت کرده است. این عدد به معنی اثبات کل برنامه، کل تابع، همهٔ خطاهای زمان اجرا یا همهٔ environmentهای واقعی نیست.

## 25. ارتباط خروجی WP با E-ACSL

این ۴۸ property مبنای حذف انتخابی از پایش runtime هستند: `149 - 48 = 101`. خود مرحله WP دربارهٔ نتیجهٔ runtime این ۱۰۱ مورد ادعایی نمی‌کند.

## 26. راهنمای بازتولید

دستورهای دقیق در `reports/wp_phase/WP_COMMAND_REFERENCE.md` و quick start در `analysis/wp_phase/README.md` آمده‌اند. validation آفلاین از raw evidence: `python3 analysis/wp_phase/scripts/validate_wp_phase.py`. rerun همهٔ targetها اختیاری و جدا از frozen result است.

## 27. جمع‌بندی

مرحله WP اکنون یک آزمایش مستقل با ورودی ثابت، ۴۸ mapping قابل ردیابی، raw JSON رسمی، configuration دقیق، runner غیر-overwriting، summary ماشین‌خوان، hash و validator است. reconciliation عددی و scientific claim boundaries صریح‌اند.
