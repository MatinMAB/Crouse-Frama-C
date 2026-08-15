# Eva Baseline vs High Precision Comparator

این مرحله ۴۶ جفت log ثبت‌شده‌ی Baseline و High Precision را بدون اجرای مجدد Frama-C مقایسه می‌کند.

## ورودی‌ها

- فهرست قطعی تابع‌ها: `analysis/high_precision/functions.txt`
- Eva logهای Baseline: `results/baseline/<FUNCTION>/<FUNCTION>_eva.log`
- Eva logهای High Precision: `results/high_precision/<FUNCTION>/<FUNCTION>_eva.log`
- parse logهای متناظر برای کنترل diagnosticها
- Runnerهای Baseline و High Precision برای تأیید ثابت‌ماندن parse stage و استخراج configuration

هیچ report قدیمی منبع شمارش alarm نیست. شمارش‌ها مستقیماً از Eva logها استخراج و با `ANALYSIS SUMMARY` همان log تطبیق داده می‌شوند.

## روش تطبیق alarmها

واحد اصلی، alarmهای source-located با marker برابر `[eva:alarm]` است که در شمار رسمی `ANALYSIS SUMMARY` نیز وارد شده‌اند. marker داخلی `missing_return` جداگانه ثبت می‌شود، چون Summary عددی Eva آن را در alarm count اصلی وارد نمی‌کند.

برای هر alarm یک signature شامل مسیر normalize‌شده، شماره خط و پیام normalize‌شده ساخته می‌شود. تفاوت‌های Unicode/ASCII در relationها مانند `≢` و `!=` یا `≤` و `<=` و همچنین whitespace حذف می‌شوند. تطبیق به‌صورت multiset است و multiplicity alarmهای تکراری حفظ می‌شود.

وضعیت‌ها فقط حضور alarm در دو اجرای ثبت‌شده را بیان می‌کنند:

- `REMOVED`: فقط در Baseline
- `REMAINING`: occurrence متناظر در هر دو اجرا
- `NEW`: فقط در High Precision

هیچ ارزیابی درباره رفتار زیرین برنامه در این مرحله انجام نمی‌شود.

## اجرا

از root repository:

```bash
python3 scripts/comparison/compare_baseline_high_precision.py
```

این command فقط artifactهای Comparison را در مسیرهای زیر می‌نویسد:

```text
analysis/high_precision_comparison/
reports/high_precision_comparison/
```

هیچ Runner و هیچ Eva analysis اجرا نمی‌شود.

## خروجی‌ها

- `function_summary.tsv`: یک ردیف برای هر یک از ۴۶ تابع
- `alarm_diff.tsv`: یک ردیف برای هر occurrence تطبیقی، با حفظ multiplicity
- `category_summary.tsv`: جمع alarmها به تفکیک category
- `global_summary.md`: خلاصه‌ی global و transitionهای zero-alarm
- `per_function/<FUNCTION>.md`: alarmها، summaryها و final state هر تابع
- `reports/high_precision_comparison/eva_high_precision_comparison.md`: گزارش جامع فنی

## Self-checkها

Comparator در صورت نقض هر مورد با exit غیرصفر متوقف می‌شود:

```text
baseline = removed + remaining
high_precision = remaining + new
delta = high_precision - baseline
delta = new - removed
```

جمع functionها، categoryها و alarm-diff نیز cross-check می‌شود. شمار parse‌شده‌ی alarmهای هر log باید با Summary رسمی همان log برابر باشد. دو sanity check از خود logها برای `s32_mul_s32_u16` و `s32_mul_s32_s32` اعمال می‌شوند؛ هیچ نتیجه‌ای در comparator hard-code نشده است.
