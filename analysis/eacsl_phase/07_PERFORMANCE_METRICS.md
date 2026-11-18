# Performance Metrics

Historical static campaign: ده تکرار interleaved برای S0/S1/S2، `/usr/bin/time -v`، instrumentation/compilation time، RSS، generated C و object size.

Historical dynamic campaign: سی تکرار measured برای هر scenario بعد از پنج warmup، wall/user/system/RSS، checksum-equivalence و violation audit.

Headline reductions از reduction of scenario medians محاسبه می‌شوند:

```text
(median(FULL) - median(SELECTIVE)) / median(FULL) * 100
```

- Instrumentation: 6.710000 s → 6.010000 s؛ `10.432191%`.
- Runtime: 5.939651870 s → 4.867204497 s؛ `18.055728%`.

این اعداد median of per-run percentage reductions نیستند. `performance_summary.tsv` علاوه بر mean/median/min/max/stddev، P25/P75/P90/P95 را از raw data محاسبه می‌کند.
