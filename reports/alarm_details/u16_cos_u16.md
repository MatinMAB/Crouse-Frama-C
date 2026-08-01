# u16_cos_u16

## Scope

P0

source: `src_analysis/sources/trig_Ccode.c`  
header: `src_analysis/headers/trig_Ccode.h`  
harness: `harnesses/P0/eva_main_u16_cos_u16.c`  
machdep: `ppc_32`

## Analyzed interface

`u16 u16_cos_u16(u16 phi);`

## Input model

پارامتر `phi` با کل دامنه نوع `u16` مدل شد:

`0..65535`

برای ساخت ورودی abstract از builtin زیر استفاده شد:

`Frama_C_unsigned_short_interval(0, 65535)`

هیچ محدودیت، cast، mask یا normalization روی ورودی اعمال نشد.

## Baseline result

Parse با موفقیت انجام شد.

Kernel برای پایان تابع non-void هشدار زیر را ثبت کرد:

`Body of function u16_cos_u16 falls-through. Adding a return statement`

محل:

`src_analysis/sources/trig_Ccode.c:114`

بدنه اجرایی تابع خالی است و هیچ return expression ندارد.

Eva property مربوط به `missing_return` را با وضعیت `invalid` ثبت کرد و propagation در همان نقطه متوقف شد.

Summary رسمی Eva هیچ alarm تولیدشده توسط تحلیل عددی گزارش نکرد. بااین‌حال property نامعتبر `missing_return` به‌صورت جداگانه در log ثبت شده است.

به‌دلیل توقف propagation، call تابع مقدار بازگشتی کامل‌شده‌ای برای `result` تولید نکرد و مسیر عادی harness پس از call ادامه پیدا نکرد.

## Behavioral note

در implementation فعال فعلی:

- پارامتر `phi` خوانده نمی‌شود.
- محاسبه cosine انجام نمی‌شود.
- عملیات عددی، بیتی، conversion یا دسترسی حافظه‌ای وجود ندارد.
- lookup فعالی از جدول `arctantab` انجام نمی‌شود.
- تابع non-void بدون مقدار بازگشتی به انتهای body می‌رسد.
- این رفتار برای تمام مقادیر `phi` رخ می‌دهد.

این baseline فقط وضعیت فعلی source را ثبت می‌کند. هیچ return، مقدار placeholder یا پیاده‌سازی cosine اضافه نشده است.
