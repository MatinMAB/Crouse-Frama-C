# s16_tan_u32

## Scope

P0

source: `src_analysis/sources/trig_Ccode.c`  
header: `src_analysis/headers/trig_Ccode.h`  
harness: `harnesses/P0/eva_main_s16_tan_u32.c`  
machdep: `ppc_32`

## Analyzed interface

`s16 s16_tan_u32(u32 phi);`

## Input model

پارامتر `phi` با کل دامنه نوع `u32` مدل شد:

`0..4294967295`

برای ساخت ورودی abstract از builtin زیر استفاده شد:

`Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`

هیچ محدودیت، cast، mask یا normalization روی ورودی اعمال نشد.

## Baseline result

Parse با موفقیت انجام شد.

Kernel برای پایان تابع non-void هشدار زیر را ثبت کرد:

`Body of function s16_tan_u32 falls-through. Adding a return statement`

محل:

`src_analysis/sources/trig_Ccode.c:175`

تمام expressionهای موجود در body کامنت هستند. در نتیجه body اجرایی خالی است و هیچ return expression ندارد.

Eva property مربوط به `missing_return` را با وضعیت `invalid` ثبت کرد و propagation در همان نقطه متوقف شد.

Summary رسمی Eva هیچ alarm تولیدشده توسط تحلیل عددی گزارش نکرد. بااین‌حال property نامعتبر `missing_return` به‌صورت جداگانه در log ثبت شده است.

به‌دلیل توقف propagation، call تابع مقدار بازگشتی کامل‌شده‌ای برای `result` تولید نکرد و مسیر عادی harness پس از call ادامه پیدا نکرد.

## Behavioral note

در implementation فعال فعلی:

- پارامتر `phi` خوانده نمی‌شود.
- fragment داخل تابع کامنت و غیرفعال است.
- محاسبه tangent انجام نمی‌شود.
- عملیات عددی، بیتی، conversion یا دسترسی حافظه‌ای وجود ندارد.
- تابع non-void بدون مقدار بازگشتی به انتهای body می‌رسد.
- این رفتار برای تمام مقادیر `phi` رخ می‌دهد.

این baseline فقط وضعیت فعلی source را ثبت می‌کند. fragment فعال نشده و هیچ return، مقدار placeholder یا پیاده‌سازی tangent اضافه نشده است.
