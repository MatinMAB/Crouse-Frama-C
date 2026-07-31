# root_s32_mul_s32_u16_fac_less1

## Scope

P0

source: `src_analysis/sources/mul_Ccode.c`  
helper source: `src_analysis/sources/MulHword.c`  
header: `src_analysis/headers/mul_Ccode.h`  
helper header: `src_analysis/headers/MulHword.h`  
harness: `harnesses/P0/eva_main_root_s32_mul_s32_u16_fac_less1.c`  
machdep: `ppc_32`

## Input model

برای هر سه ورودی کل بازه نوع داده در نظر گرفته شد:

- `value`: بازه کامل `s32`، از `-2147483648` تا `2147483647`
- `factor`: بازه کامل `u16`، از `0` تا `65535`
- `count`: بازه کامل `u32`، از `0` تا `4294967295`

هیچ محدودیتی روی `value`، `factor` یا `count` اعمال نشد.

مقدارهای ثابت caller مانند `17` و `131072` برای محدودکردن harness استفاده نشدند.

Eva ورودی‌ها را به‌صورت abstract تحلیل می‌کند و تمام ترکیب‌ها را دانه‌دانه اجرا نمی‌کند.

## Baseline result

Eva با optionهای زیر اجرا شد:

`-eva -eva-slevel 1000 -eva-ilevel 256`

چهار مورد گزارش شد.

### Integer overflow

محل اول:

`src_analysis/sources/mul_Ccode.c:5147`

عبارت:

`u32Temp1 = -value;`

محل دوم:

`src_analysis/sources/MulHword.c:47`

عبارت:

`MulTemp1 = arg1_LW * arg2_LW;`

### Invalid shift

محل اول:

`src_analysis/sources/mul_Ccode.c:5165`

عبارت:

`u32Temp3 = u32Temp3 >> count;`

محل دوم:

`src_analysis/sources/mul_Ccode.c:5166`

عبارت:

`u32Temp3 |= u32Temp4 << (32-count);`

تابع `MulHighWord` با implementation واقعی همراه تابع هدف وارد تحلیل شد.

یک مورد integer overflow داخل `MulHighWord` گزارش شد.

تابع `MulHighWord`، تابع هدف و `eva_main` به final state رسیدند.

## Note

فعلاً فقط baseline گرفته شده و هیچ patchی انجام نشده است.

موارد گزارش‌شده برای بررسی بعدی نگه داشته شدند.
