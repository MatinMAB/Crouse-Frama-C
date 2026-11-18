# Limitations and Claim Boundaries

- workload thesis-controlled است و نمایندهٔ production coverage ادعا نمی‌شود.
- coverage metric عمومی retained نیست.
- property-observation هر target را با یک boundary profile اجرا کرده است؛ نبود violation قابل تعمیم نیست.
- ۴۲ target به‌علت abort زودتر `NOT_REACHED` و ۴ target `AMBIGUOUS_OUTPUT` هستند.
- runtime host-native x86_64 است؛ static source of properties و instrumentation study از `ppc_32` می‌آیند.
- هفت violation concrete runtime evidence هستند و KLEE symbolic witness محسوب نمی‌شوند.
- historical raw directories کامل retain نشده‌اند؛ normalized raw tables و raw logهای هفت violation retain شده‌اند.
- custom E-ACSL2 checkoutها در این آزمایش استفاده نشده‌اند.
