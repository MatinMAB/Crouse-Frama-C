# Thesis Detailed Experimental Report Package

این بسته از روی ZIP پروژه‌ی `frama-eva-analysis` و artifactهای frozen آن ساخته شده است.

## فایل اصلی

- `THESIS_DETAILED_EXPERIMENTAL_REFERENCE_FA.md` — گزارش جامع فارسی، مرحله‌به‌مرحله و مفهومی برای استنتاج متن پایان‌نامه.

## نمودارها

دایرکتوری `figures/` شامل 11 نمودار آماده است:

1. Eva alarm categories baseline vs high precision
2. Main pipeline counts
3. KLEE outcomes
4. KLEE outcomes by alarm kind
5. Resolution cohorts
6. E-ACSL S1/S2 selection counts
7. Static pruning reductions
8. Dynamic runtime medians
9. Runtime observation outcomes
10. Top functions by Eva alarms
11. KLEE/E-ACSL complementarity

## جدول‌های تکمیلی

دایرکتوری `tables/`:

- `01_PER_FUNCTION_EVA_KLEE_SUMMARY.tsv` — هر 46 تابع با Baseline/High-Precision/KLEE.
- `02_KLEE_BY_ALARM_KIND.tsv` — outcomeهای KLEE به تفکیک نوع alarm.
- `03_SOURCE_FILE_DISTRIBUTION.tsv` — توزیع targetها و outcomeها در source files.
- `04_EACSL_7_RUNTIME_VIOLATIONS.tsv` — هفت violation runtime.
- `05_GLOBAL_PIPELINE_COUNTS.tsv` — شمارش‌های کل pipeline.
- `06_EACSL_STATIC_DYNAMIC_METRICS.tsv` — metricهای static/dynamic.
- `07_FINAL_48_WP_MASTER.tsv` — جدول نهایی 48 property و WP.
- `08_FINAL_101_RUNTIME_MASTER.tsv` — جدول 101 property retained و runtime observations.

## نکته‌ی علمی

این گزارش بین موارد زیر تمایز را حفظ می‌کند:

- alarm در Eva و bug قطعی؛
- KLEE timeout و نتیجه‌ی safe/unsafe؛
- WP target-property proof و whole-program verification؛
- runtime no-violation و proof؛
- repository-derived specification و thesis-selected policy؛
- PPC32 static model و x86-64 runtime experiment.
