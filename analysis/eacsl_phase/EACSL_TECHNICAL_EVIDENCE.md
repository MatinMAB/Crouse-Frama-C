# E-ACSL Runtime-Monitoring Technical Evidence

## Scope

این artifact گزارش evidence-oriented مرحله runtime monitoring است. ورودی آن ۱۴۹ property باقی‌ماندهٔ Eva High Precision است. ۴۸ property با WP اثبات و از selective monitoring حذف شدند؛ ۱۰۱ property unresolved باقی ماندند.

## Tool identity

آزمایش تاریخی با **stock Frama-C E-ACSL 33.0 (Arsenic)** و GCC 13.3.0 انجام شد. هیچ evidenceای استفاده از custom E-ACSL2 را نشان نمی‌دهد. repositoryهای E-ACSL2 محلی برای provenance بررسی شدند ولی به experiment attribution داده نشدند.

## Exact selection

```text
High Precision: 149
WP VALID: 48
Selective E-ACSL: 101
Intersection: 0
Union coverage: 149/149

KLEE completed/no-witness: 15
KLEE timeout/inconclusive: 86
15 + 86 = 101 (exact ID-set equality)
```

FULL generated C دارای ۱۴۹ unique target-check site و SELECTIVE دارای ۱۰۱ site بود. auditهای retained حذف ۴۸/۴۸ WP label و حفظ ۱۰۱/۱۰۱ runtime label را تأیید می‌کنند.

## Runtime workload and reaction

Harness کنترل‌شده ۳۳ تابع را فراخوانی می‌کند. performance corpus برای هر تابع input معتبر و deterministic دارد. property-observation corpus برای هر target یک اجرای جدا با zero-divisor یا type-extreme profile تعریف می‌کند. E-ACSL در assertion failure message شامل label و contributing values چاپ کرده و process را abort کرده است.

## Historical runtime outcomes

| Classification | Target executions | Meaning |
|---|---:|---|
| `VIOLATION_OBSERVED` | 7 | Direct target-label failure |
| `NO_VIOLATION_OBSERVED` | 48 | No failure in that recorded run; not proof |
| `NOT_REACHED` | 42 | Earlier check aborted first |
| `AMBIGUOUS_OUTPUT` | 4 | Insufficient target attribution |

## Direct violation inventory

| Alarm ID | Function | Prior KLEE | Concrete runtime input | Raw artifact |
|---|---|---|---|---|
| KLEE-ALARM-0024 | `s16_div_s32_s16` | timeout/inconclusive | `numerator=INT32_MIN; denominator=7` | `evidence/historical/violations/OBS-002/stderr.txt` |
| KLEE-ALARM-0046 | `s16_fac05_div_s16_s16` | timeout/inconclusive | `numerator=INT16_MIN; denominator=7` | `evidence/historical/violations/OBS-022/stderr.txt` |
| KLEE-ALARM-0084 | `s16_mul_s16_u16_div_s16` | timeout/inconclusive | `factor1=INT16_MIN; factor2=UINT16_MAX; denominator=7` | `evidence/historical/violations/OBS-055/stderr.txt` |
| KLEE-ALARM-0089 | `s16_mul_u16_s16_div_u16` | timeout/inconclusive | `factor1=UINT16_MAX; factor2=INT16_MIN; denominator=7` | `evidence/historical/violations/OBS-060/stderr.txt` |
| KLEE-ALARM-0120 | `u16_div_s32_u16` | timeout/inconclusive | `numerator=INT32_MIN; denominator=7` | `evidence/historical/violations/OBS-073/stderr.txt` |
| KLEE-ALARM-0127 | `u16_mul_s16_u16_div_s16` | timeout/inconclusive | `factor1=INT16_MIN; factor2=UINT16_MAX; denominator=7` | `evidence/historical/violations/OBS-080/stderr.txt` |
| KLEE-ALARM-0135 | `u16_mul_s16_u16_div_u16` | timeout/inconclusive | `factor1=INT16_MIN; factor2=UINT16_MAX; denominator=7` | `evidence/historical/violations/OBS-088/stderr.txt` |

هر هفت event direct label match و exit 134 دارند. هیچ violation در مجموعه WP-proved یا KLEE completed/no-witness مشاهده نشده است. این نتیجه complementarity اجرای concrete و symbolic timeout را نشان می‌دهد، نه معادل بودن آن‌ها.

## Performance evidence

| Metric | FULL | SELECTIVE | Reduction |
|---|---:|---:|---:|
| Median instrumentation wall time | 6.710000 s | 6.010000 s | 10.432191% |
| Median runtime wall time | 5.939651870 s | 4.867204497 s | 18.055728% |

Static experiment ده تکرار و dynamic experiment سی تکرار per scenario داشت. هر ۹۰ measured dynamic run exit 0، checksum یکسان `5272412154435795075` و بدون performance-corpus violation بود. نتیجه production benchmark نیست.

## Historical versus current implementation

| Aspect | Historical thesis implementation | Current reproducibility interface |
|---|---|---|
| Tool | stock E-ACSL 33.0 | همان stock E-ACSL 33.0 required |
| Source | commit `09e75928` | byte-identical `src_repaired` در WP base `e79f6240` |
| Selection | generated source views | regenerated با `prepare_scenarios.py` |
| Static model | `ppc_32` | `ppc_32` |
| Runtime model | host x86_64 | host x86_64 |
| Runtime action | diagnostic + abort | diagnostic + abort |
| Result paths | historical `analysis/eacsl_*` work dirs | untracked `analysis/eacsl_phase/work/` |
| Resume | historical scripts بدون resume عمومی | `run_all.sh --resume` |

## Reproducibility

README commands environment، source-view generation، exact generated selection، build و execution را پوشش می‌دهند. Frozen historical results overwrite نمی‌شوند. Generated binaries/C/cache tracked نیستند.

## Claim boundary

هفت statement معتبر شکل «در این concrete execution property نقض شد» دارند. دربارهٔ ۹۴ target دیگر، نبود direct violation proof ایمنی نیست: ۴۸ observation منفی محدود، ۴۲ not-reached و ۴ ambiguous باقی می‌مانند.
