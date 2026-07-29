# u32_mmv_u32_u32_s32_fac1

## Scope

P0

source: `src_analysis/sources/avrg_Ccode.c`  
header: `src_analysis/headers/avrg_Ccode.h`  
harness: `harnesses/P0/eva_main_u32_mmv_u32_u32_s32_fac1.c`  
machdep: `ppc_32`

## Input model

برای ورودی‌ها کل بازه نوع داده در نظر گرفته شد:

`mmv`: `u32`، از 0 تا 4294967295  
`measure`: `u32`، از 0 تا 4294967295  
`crlc`: `s32`، از -2147483648 تا 2147483647

Eva این بازه‌ها را abstract تحلیل می‌کند؛ یعنی تست دانه‌دانه همه مقدارها نیست.

## Baseline result

با این optionها اجرا شد:

`-eva -eva-slevel 1000 -eva-ilevel 256`

پیام اصلی در خط 1000 فایل `avrg_Ccode.c` مربوط به `missing_return` بود.

تابع خروجی `u32` دارد، ولی بدنه آن بدون `return` تمام می‌شود. Eva propagation را در همین نقطه متوقف کرد.

در final state، هم تابع اصلی و هم `eva_main` به‌صورت `NON TERMINATING FUNCTION` نمایش داده شدند.

## Note

صفر بودن alarmهای تولیدشده در این اجرا، به‌تنهایی نتیجه سالم بودن تابع نیست؛ چون تحلیل به return عادی نرسیده است.

فعلاً patch انجام نشده و پیاده‌سازی تابع باید بررسی شود.
