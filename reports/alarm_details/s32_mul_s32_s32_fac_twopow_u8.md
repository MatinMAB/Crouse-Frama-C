# s32_mul_s32_s32_fac_twopow_u8

## Scope

P0

source: `src_analysis/sources/mul_Ccode.c`  
helper source: `src_analysis/sources/MulHword.c`  
header: `src_analysis/headers/mul_Ccode.h`  
helper header: `src_analysis/headers/MulHword.h`  
harness: `harnesses/P0/eva_main_s32_mul_s32_s32_fac_twopow_u8.c`  
machdep: `ppc_32`

## Input model

برای هر سه ورودی کل بازه نوع داده در نظر گرفته شد:

- `value`: بازه کامل `s32`، از `-2147483648` تا `2147483647`
- `factor`: بازه کامل `s32`، از `-2147483648` تا `2147483647`
- `power`: بازه کامل `u8`، از `0` تا `255`

Eva این ورودی‌ها را به‌صورت abstract تحلیل می‌کند و همه ترکیب‌ها را دانه‌دانه اجرا نمی‌کند.

## Baseline result

Eva با optionهای زیر اجرا شد:

`-eva -eva-slevel 1000 -eva-ilevel 256`

سه integer overflow گزارش شد.

### تابع هدف

محل اول:

`src_analysis/sources/mul_Ccode.c:2454`

عبارت:

`u32Temp1 = -value;`

محل دوم:

`src_analysis/sources/mul_Ccode.c:2463`

عبارت:

`u32Temp2 = -factor;`

### Helper

محل سوم:

`src_analysis/sources/MulHword.c:47`

عبارت:

`MulTemp1 = arg1_LW * arg2_LW;`

تابع `MulHighWord` با implementation واقعی همراه تابع هدف وارد تحلیل شد.

برای shiftهای تابع هدف alarm مربوط به invalid shift گزارش نشد.

تابع `MulHighWord`، تابع هدف و `eva_main` به final state رسیدند.

## Note

فعلاً فقط baseline گرفته شده و هیچ patchی انجام نشده است.

موارد گزارش‌شده برای بررسی بعدی نگه داشته شدند.
