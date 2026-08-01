# u16_mul_u16_u8_fac8

## Scope

P0

source: `src_analysis/sources/mul_Ccode.c`  
header: `src_analysis/headers/mul_Ccode.h`  
harness: `harnesses/P0/eva_main_u16_mul_u16_u8_fac8.c`  
machdep: `ppc_32`

## Analyzed interface

`u16 u16_mul_u16_u8_fac8(u16, u8);`

## Input model

- `x_value`: کل دامنه `u16`، از `0` تا `65535`
- `y_value`: کل دامنه `u8`، از `0` تا `255`

هیچ محدودیت یا رابطه‌ای میان ورودی‌ها اعمال نشد.

Eva ورودی‌ها را به‌صورت abstract تحلیل می‌کند.

## Baseline result

Eva با optionهای زیر اجرا شد:

`-eva -eva-slevel 1000 -eva-ilevel 256`

Eva در این baseline هیچ alarmی گزارش نکرد.

تابع هدف، helper و `eva_main` به final state رسیدند.

هیچ patch دیگری بعد از تعیین interface `u16, u8` انجام نشده است.

## Note

این baseline براساس interface `u16, u8` اجرا شده است.
