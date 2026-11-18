# E-ACSL Runtime-Monitoring Phase

این phase رابط نهایی قابل‌بازتولید برای پایش ۱۰۱ مشخصه‌ای است که پس از Eva، KLEE و WP بدون proof باقی ماندند. مجموعه‌ها با شناسهٔ پایدار `KLEE-ALARM-NNNN` تعریف می‌شوند:

```text
149 High-Precision properties - 48 WP-proved properties = 101 E-ACSL checks
15 KLEE completed/no-witness + 86 KLEE timeout/inconclusive = 101
```

این پروژه از **stock Frama-C E-ACSL 33.0 (Arsenic)** استفاده کرده است؛ checkoutهای محلی E-ACSL2 در آزمایش تاریخی به کار نرفته‌اند.

## Quick start

```bash
./analysis/eacsl_phase/scripts/check_environment.sh
python3 analysis/eacsl_phase/scripts/validate_eacsl_phase.py
./analysis/eacsl_phase/scripts/build_scenarios.sh
./analysis/eacsl_phase/scripts/run_scenario.sh selective observation OBS-002
./analysis/eacsl_phase/scripts/run_scenario.sh full performance 100000
./analysis/eacsl_phase/scripts/run_all.sh --observations
./analysis/eacsl_phase/scripts/run_all.sh --observations --resume
./analysis/eacsl_phase/scripts/run_all.sh --performance
```

Generated C، executables و rerun outputs زیر `analysis/eacsl_phase/work/` قرار می‌گیرند، tracked نیستند و هیچ frozen result را overwrite نمی‌کنند.

## Scenarios

- `control` / S0: بدون target assertion.
- `full` / S1: هر ۱۴۹ assertion مشتق‌شده از Eva.
- `selective` / S2: دقیقاً ۱۰۱ assertion فاقد proof WP.

Static instrumentation با `-machdep ppc_32` انجام می‌شود. اجرای native به‌سبب نبود PPC compiler/emulator و ناسازگاری pointer-size E-ACSL، با مدل host `x86_64` انجام شده است؛ این محدودیت در evidence ثبت شده است.

`run_all.sh --performance` به‌طور پیش‌فرض protocol تاریخی را بازسازی می‌کند: seed برابر `20260821`، پنج warm-up، سی round اندازه‌گیری، ۱۰۰۰۰۰ iteration، ترتیب interleaved سه scenario و pinning روی CPU 0. گزینه‌های `--seed`، `--warmups`، `--runs`، `--iterations` و `--cpu` قابل تنظیم‌اند. Override محیطی `EACSL_CPU_ID` نیز برای اجرای یک scenario پشتیبانی می‌شود.

## Data and evidence

- `data/eacsl_selection_matrix.tsv`: تمام ۱۴۹ property و دلیل inclusion/exclusion.
- `data/eacsl_targets.tsv` و `.json`: ۱۰۱ target runtime.
- `data/runtime_violations.tsv` و `.json`: هفت violation مستقیم و target-matched.
- `data/performance_measurements.tsv`: ۳۰ static و ۹۰ dynamic measurement تاریخی.
- `results/summary.tsv`: وضعیت ۱۰۱ observation.
- `evidence/historical/`: raw normalized evidence و logهای واقعی هفت violation.
- `validation/`: set/performance reconciliation و rerun نماینده.

## Result meaning

`RUNTIME_VIOLATION` یعنی در execution ثبت‌شده check نقض شده است. `NO_VIOLATION_OBSERVED` فقط می‌گوید در inputهای ثبت‌شده نقض دیده نشد؛ proof عمومی نیست. `NOT_REACHED` و `AMBIGUOUS_OUTPUT` نیز inconclusive هستند.

برای regenerate کردن datasetها بدون اجرای ابزار:

```bash
python3 analysis/eacsl_phase/scripts/normalize_eacsl_evidence.py
sha256sum -c analysis/eacsl_phase/SHA256SUMS
```
