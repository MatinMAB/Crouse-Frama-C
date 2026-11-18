# Result Taxonomy

- `RUNTIME_VIOLATION`: label هدف در diagnostic failure مشاهده شد.
- `NO_VIOLATION_OBSERVED`: process موفق بود و target violation مشاهده نشد؛ proof نیست.
- `NOT_REACHED`: check دیگری پیش از target process را abort کرد؛ inconclusive.
- `AMBIGUOUS_OUTPUT`: خروجی برای attribution هدف کافی نبود؛ inconclusive.
- `INSTRUMENTATION_FAILED`, `BUILD_FAILED`, `EXECUTION_FAILED`, `TIMEOUT`: failure taxonomy برای rerunهای جدید.

Historical 101 cases: ۷ violation، ۴۸ no-violation-observed، ۴۲ not-reached و ۴ ambiguous. هفت violation همگی prior KLEE timeout بودند و هیچ‌کدام WP-proved نبودند.
