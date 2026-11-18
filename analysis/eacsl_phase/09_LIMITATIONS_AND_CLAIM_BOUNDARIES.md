# Limitations and Claim Boundaries

- workload thesis-controlled است و نمایندهٔ production coverage ادعا نمی‌شود.
- coverage metric عمومی retained نیست.
- property-observation هر target را با یک boundary profile اجرا کرده است؛ نبود violation قابل تعمیم نیست.
- ۴۲ target به‌علت abort زودتر `NOT_REACHED` و ۴ target `AMBIGUOUS_OUTPUT` هستند.
- runtime host-native x86_64 است؛ static source of properties و instrumentation study از `ppc_32` می‌آیند. `s32/u32` بر پایهٔ `long` هستند و در host LP64 به ۶۴ بیت تبدیل شدند؛ fixed-width compatibility layer یا `-m32` وجود نداشت. بنابراین runtime نتیجهٔ اجرای PPC32 نیست و propertyهای width-sensitive ممکن است semantics متفاوت داشته باشند.
- هفت violation concrete runtime evidence هستند و KLEE symbolic witness محسوب نمی‌شوند.
- raw directory کامل ۱۰۱ observation داخل tree فعلی کپی نشده است: برای همهٔ ۱۰۱ مورد normalized rows موجود است و فقط ۷ violation دارای raw stdout/stderr/exit در tree فعلی‌اند. با این حال مجموعهٔ ۱۰۱×۳ raw file از commit غیرمرتبط `1adf3521...` در Git history قابل بازیابی است.
- custom E-ACSL2 checkoutها در این آزمایش استفاده نشده‌اند.
