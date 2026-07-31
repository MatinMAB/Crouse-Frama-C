# root_s32_mul_s32_s8_fac_less1

## Scope

P0

source: `src_analysis/sources/mul_Ccode.c`  
helper source: `src_analysis/sources/MulHword.c`  
header: `src_analysis/headers/mul_Ccode.h`  
helper header: `src_analysis/headers/MulHword.h`  
harness: `harnesses/P0/eva_main_root_s32_mul_s32_s8_fac_less1.c`  
machdep: `ppc_32`

## Input model

برای هر سه ورودی کل بازه نوع داده در نظر گرفته شد:

- `value`: بازه کامل `s32`، از `-2147483648` تا `2147483647`
- `factor`: بازه کامل `s8`، از `-128` تا `127`
- `count`: بازه کامل `u32`، از `0` تا `4294967295`

برای مدل‌سازی `factor`، بازه signed ابتدا با `Frama_C_int_interval` ساخته و سپس به `s8` تبدیل شد.

هیچ محدودیتی برای حذف مقدارهای مرزی `count` اعمال نشد.

Eva ورودی‌ها را به‌صورت abstract تحلیل می‌کند و تمام ترکیب‌ها را دانه‌دانه اجرا نمی‌کند.

## Baseline result

Eva با optionهای زیر اجرا شد:

`-eva -eva-slevel 1000 -eva-ilevel 256`

سه مورد گزارش شد.

### Integer overflow

محل:

`src_analysis/sources/mul_Ccode.c:5223`

عبارت:

`u32Temp1 = -value;`

### Invalid shift

محل اول:

`src_analysis/sources/mul_Ccode.c:5241`

عبارت:

`u32Temp3 = u32Temp3 >> count;`

محل دوم:

`src_analysis/sources/mul_Ccode.c:5242`

عبارت:

`u32Temp3 |= u32Temp4 << (32-count);`

تابع `MulHighWord` با implementation واقعی همراه تابع هدف وارد تحلیل شد و alarm جداگانه‌ای در آن گزارش نشد.

تابع `MulHighWord`، تابع هدف و `eva_main` به final state رسیدند.

## Note

فعلاً فقط baseline گرفته شده و هیچ patchی انجام نشده است.

موارد گزارش‌شده برای بررسی بعدی نگه داشته شدند.
