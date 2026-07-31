# root_s32_mul_s32_u8_fac_less1

## Scope

P0

source: `src_analysis/sources/mul_Ccode.c`  
helper source: `src_analysis/sources/MulHword.c`  
header: `src_analysis/headers/mul_Ccode.h`  
helper header: `src_analysis/headers/MulHword.h`  
harness: `harnesses/P0/eva_main_root_s32_mul_s32_u8_fac_less1.c`  
machdep: `ppc_32`

## Input model

برای هر سه ورودی کل بازه نوع داده در نظر گرفته شد:

- `value`: بازه کامل `s32`، از `-2147483648` تا `2147483647`
- `factor`: بازه کامل `u8`، از `0` تا `255`
- `count`: بازه کامل `u32`، از `0` تا `4294967295`

برای `factor` از `Frama_C_unsigned_char_interval` استفاده شد.

هیچ محدودیتی روی `value`، `factor` یا `count` اعمال نشد.

مقدارهای ثابت caller یعنی `9` و `512` برای محدودکردن harness استفاده نشدند.

Eva ورودی‌ها را به‌صورت abstract تحلیل می‌کند و تمام ترکیب‌ها را دانه‌دانه اجرا نمی‌کند.

## Baseline result

Eva با optionهای زیر اجرا شد:

`-eva -eva-slevel 1000 -eva-ilevel 256`

سه مورد گزارش شد.

### Integer overflow

محل:

`src_analysis/sources/mul_Ccode.c:5534`

عبارت:

`u32Temp1 = -value;`

### Invalid shift

محل اول:

`src_analysis/sources/mul_Ccode.c:5544`

عبارت:

`u32Temp2 = u32Temp2 >> count;`

محل دوم:

`src_analysis/sources/mul_Ccode.c:5545`

عبارت:

`u32Temp2 |= u32Temp3 << (32-count);`

تابع `MulHighWord` با implementation واقعی همراه تابع هدف وارد تحلیل شد و alarm جداگانه‌ای در آن گزارش نشد.

تابع `MulHighWord`، تابع هدف و `eva_main` به final state رسیدند.

## Note

فعلاً فقط baseline گرفته شده و هیچ patchی انجام نشده است.

موارد گزارش‌شده برای بررسی بعدی نگه داشته شدند.
