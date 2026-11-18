# Runtime Execution Model

Harness تاریخی ۳۳ تابع target-bearing را پوشش می‌دهد.

- Performance mode: `p 100000`; seed `20260821`; ۵ warmup و ۳۰ measured run برای هر scenario؛ CPU 0؛ `-O2`.
- Property-observation mode: `o <function_id> <profile>`؛ ۱۰۱ process مستقل، یک case برای هر property.
- Input corpus repository-derived و thesis-controlled است، production workload نیست.

خروجی هر rerun شامل stdout، stderr، exit status، timing و status normalized است. `run_all.sh --resume` فقط item دارای marker را skip می‌کند و result directory قبلی را حذف نمی‌کند.
