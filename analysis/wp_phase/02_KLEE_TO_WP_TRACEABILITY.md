# KLEE-to-WP Traceability

کلید پایدار همهٔ artifactها `KLEE-ALARM-NNNN` است. برای هر ID، dataset تابع، source/line، expression، original predicate، KTest و error witness، semantic decision، repair/spec commit، ACSL label، raw JSON/log و prover موفق را نگه می‌دارد.

هویت property با مقایسهٔ متن predicate در چهار dataset و هویت proof با ACSL label یکتا در source و `property` داخل JSON بررسی می‌شود. ستون `verified_assertion_line` محل فعلی label را ثبت می‌کند؛ خط قدیمی صرفاً provenance است.

