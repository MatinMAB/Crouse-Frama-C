# WP Executive Summary

- **Input:** ۴۸ property دارای concrete KLEE witness از campaign ۱۴۹ هدفی.
- **Semantic resolution:** ۳۵ `CODE_REPAIR` و ۱۳ `SPECIFICATION_COMPLETION`.
- **Result:** ۴۸ `VALID`، صفر unknown، صفر timeout، صفر failure.
- **Proof mode:** ۳۵ Qed-only و ۱۳ external-prover (۱۲ Alt-Ergo، یک Z3).
- **Configuration:** Frama-C 33.0, `ppc_32`, `Typed+int`, target-property-only، timeout 120 s، memory 2000 MB، `-wp-par 1`، بدون `-wp-rte`.
- **Historical runner-wall total:** 183.910237408 s؛ این مقدار زمان کل invocation است، نه solver time.
- **Runtime-monitoring interface:** ۱۴۹ هدف اولیه منهای ۴۸ هدف اثبات‌شده برابر ۱۰۱ هدف باقی‌مانده است.

`48/48 VALID` فقط برای property، function، source/specification revision و proof model ثبت‌شده معتبر است و ایمنی کل برنامه را اثبات نمی‌کند. برای audit کامل، `WP_TARGET_PROOF_INVENTORY.md` و `analysis/wp_phase/data/wp_targets.tsv` را ببینید.
