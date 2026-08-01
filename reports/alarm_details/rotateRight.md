# rotateRight

## Scope

P0

source: `src_analysis/sources/rotatefunc.c`
header: `src_analysis/headers/rotatefunc.h`
harness: `harnesses/P0/eva_main_rotateRight.c`
machdep: `ppc_32`

## Analyzed interface

`u32 rotateRight(u32 num, u32 rotation);`

## Input model

برای هر دو پارامتر کل دامنه نوع `u32` در نظر گرفته شد:

- `num`: از `0` تا `4294967295`
- `rotation`: از `0` تا `4294967295`

برای هر دو ورودی از builtin زیر استفاده شد:

`Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`

هیچ محدودیت یا رابطه‌ای میان ورودی‌ها اعمال نشد.

Eva ورودی‌ها را به‌صورت abstract تحلیل می‌کند.

## Baseline result

Eva با optionهای زیر اجرا شد:

`-eva -eva-slevel 1000 -eva-ilevel 256`

یک integer-overflow alarm در تابع هدف ثبت شد.

### Signed left-shift overflow

محل:

`src_analysis/sources/rotatefunc.c:119`

Expression:

`1 << INT_BITS`

در این نقطه `INT_BITS` برابر `31` است و literal یک از نوع signed `int` است. نتیجه ریاضی shift برابر `2147483648` می‌شود که در signed 32-bit `int` قابل نمایش نیست.

این expression در مسیرهایی ارزیابی می‌شود که loop حداقل یک بار اجرا شود. بنابراین مسیرهای دارای effective rotation در بازه `1..30` به این نقطه می‌رسند.

مسیرهایی که effective rotation آن‌ها صفر است وارد loop نمی‌شوند و به return تابع می‌رسند.

statement بعدی loop در مسیرهای متأثر از این عملیات، state ادامه‌یافته دریافت نکرد.

## Behavioral note

در implementation فعلی:

`INT_BITS = sizeof(num) * 8 - 1`

روی `ppc_32` مقدار `INT_BITS` برابر `31` است و count با عبارت زیر نرمال می‌شود:

`rotation %= INT_BITS;`

بنابراین count براساس modulo `31` محاسبه می‌شود، نه modulo `32`.

برای نمونه:

- `rotation = 31` به صفر تبدیل می‌شود.
- `rotation = 32` به یک تبدیل می‌شود.

این مسئله رفتاری مستقل از overflow موجود در `1 << INT_BITS` است.

این baseline فقط وضعیت فعلی source را ثبت می‌کند و هیچ patchی روی shift یا normalization انجام نشده است.
