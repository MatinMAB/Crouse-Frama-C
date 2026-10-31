# WP Verification Phase

این directory مرحلهٔ مستقل اثبات قیاسی ۴۸ مشخصهٔ دارای نمونه‌نقض KLEE را نگه می‌دارد. زنجیرهٔ قابل audit چنین است:

```text
Eva property → KLEE witness → semantic decision → code/spec resolution
             → preserved ACSL assertion → selected WP goal → JSON proof evidence
```

نتیجهٔ frozen برابر ۴۸ هدف `VALID` است: ۳۵ `CODE_REPAIR`، ۱۳ `SPECIFICATION_COMPLETION`، ۳۵ Qed-only و ۱۳ external-prover. این نتیجه فقط برای selected property، source/spec revision، `ppc_32` و `Typed+int` معتبر است. `-wp-rte` استفاده نشده و ایمنی کل تابع یا برنامه ادعا نمی‌شود.

## Inputs and evidence

- `data/wp_targets.tsv` و `.json`: dataset نرمال‌شدهٔ ۴۸ هدف.
- `WP_TARGET_INPUTS.tsv`: source set، function و ACSL label هر target.
- `results/KLEE-ALARM-*/<timestamp>/`: raw frozen command، log و `wp-report.json`.
- `results/summary.tsv`: خلاصهٔ machine-readable.
- `SHA256SUMS`: checksum datasetها و summaryهای اصلی.
- `reports/wp_phase/WP_TARGET_PROOF_INVENTORY.md`: جدول audit انسانی.

شماره‌خط ۱۳ assertion در manifest قدیمی پس از درج‌های shared جابه‌جا شده است؛ label یکتای ACSL هویت authoritative است و dataset ستون `verified_assertion_line` را ثبت می‌کند.

## Prerequisites

Frama-C 33.0 با WP، Why3، Alt-Ergo 2.6.2، Z3 4.8.12 و CVC5 1.1.2 configuration تاریخی‌اند. executableها از `PATH` گرفته می‌شوند و با `FRAMAC`, `WHY3`, `ALT_ERGO`, `Z3`, `CVC5` قابل override هستند.

## Quick start

```bash
./analysis/wp_phase/scripts/check_environment.sh
./analysis/wp_phase/scripts/run_one.sh KLEE-ALARM-0001
./analysis/wp_phase/scripts/run_all.sh --resume
python3 analysis/wp_phase/scripts/validate_wp_phase.py
column -s $'\t' -t analysis/wp_phase/results/summary.tsv | less -S
```

اجرای کامل بدون `--resume` proof جدید را در directory timestamped می‌سازد و frozen result را overwrite نمی‌کند. `--resume` هر ID دارای JSON retained و تمام goalهای passed را skip می‌کند. اجرای campaign sequential است و failure یک target بقیه را متوقف نمی‌کند.

```bash
./analysis/wp_phase/scripts/run_one.sh KLEE-ALARM-0003 --timeout 120 --memlimit 2000
./analysis/wp_phase/scripts/run_all.sh --timeout 120 --memlimit 2000
```

Defaultها از metadata هر target می‌آیند: timeout 120 seconds، memory 2000 MiB، `-wp-par 1`. GUI فقط برای inspection اختیاری است: `run_one.sh ID --gui`.

## Result interpretation

`wp-report.json` منبع machine-readable وضعیت goal است؛ process exit code به‌تنهایی proof classification نیست. `elapsed_time.txt` wall time invocation Frama-C/WP (startup، WP، external prover و pipe خروجی) است و solver time نیست. زمان attemptهای Qed/prover از JSON جدا شده است.

Session/cacheهای بازتولیدپذیر ignored هستند. raw frozen logs/JSON کوچک، dataset، summary، validation و reports tracked می‌مانند. هیچ runner نتیجهٔ موجود را حذف یا overwrite نمی‌کند.

## Authoritative and historical artifacts

برای نتیجهٔ نهایی از `data/wp_targets.tsv`، `results/summary.tsv`، `FINAL_WP_RESULTS_48.tsv`، `validation/WP_FINAL_FREEZE_AUDIT.md` و `reports/wp_phase/` استفاده کنید. فایل‌های preparation و campaign مرحله‌ای مانند `WP_RESULTS.tsv`، `WP_PREPARATION_VALIDATION.md`، `WP_VERIFICATION_METHODOLOGY.md`، `FINAL_EVA_KLEE_REPAIR_WP_TRACEABILITY.md` و زیرشاخه‌های `reports/`, `reports_second/`, `reports_final_shift/` chronology آزمایش را حفظ می‌کنند و بعضی شمارش‌های میانی 32/16 یا 35/48 دارند؛ آن‌ها final aggregate source نیستند.

در `KLEE-ALARM-0017`، matrix legacy مقادیر Alt-Ergo=`TIMEOUT` و CVC5=`VALID` دارد که در JSON/log منتخب قابل بازیابی نیستند. attribution authoritative بر اساس `wp-report.json` همان run است: Qed ناکافی و Z3 موفق. CVC5 در شمار موفقیت نهایی صفر است.

