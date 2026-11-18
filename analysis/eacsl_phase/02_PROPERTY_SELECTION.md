# Property Selection

Validator برابری مجموعه‌ای زیر را بررسی می‌کند:

```text
EACSL = HIGH_PRECISION_149 - WP_VALID_48
EACSL = KLEE_NO_WITNESS_15 union KLEE_TIMEOUT_86
WP intersect EACSL = empty
WP union EACSL = HIGH_PRECISION_149
```

`prepare_scenarios.py` سه source view تولید می‌کند و line count را حفظ می‌کند. ACSL blockهای خارج scenario به comment خنثی تبدیل می‌شوند؛ source canonical تغییر نمی‌کند. generated E-ACSL C نیز از روی `.name = "eva_klee_alarm_NNNN"` audit می‌شود.

Historical generated-code audits دقیقاً ۱۴۹ check در FULL، ۱۰۱ check در SELECTIVE، حذف ۴۸/۴۸ WP label و retention ۱۰۱/۱۰۱ را ثبت کرده‌اند.
