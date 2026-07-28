# u16_mmv_u16_u16_s16_fac1

## Scope

P0

source: `src_analysis/sources/avrg_Ccode.c`  
header: `src_analysis/headers/avrg_Ccode.h`  
harness: `harnesses/P0/eva_main_u16_mmv_u16_u16_s16_fac1.c`  
machdep: `ppc_32`

## Input model

برای ورودی‌ها کل بازه نوع داده در نظر گرفته شد:

`mmv`: `u16`، از 0 تا 65535  
`measure`: `u16`، از 0 تا 65535  
`crlc`: `s16`، از -32768 تا 32767

Eva این بازه‌ها را abstract تحلیل می‌کند؛ یعنی تست دانه‌دانه همه مقدارها نیست.

## Baseline result

با این optionها اجرا شد:

`-eva -eva-slevel 1000 -eva-ilevel 256`

Eva یک integer overflow در خط 249 فایل `avrg_Ccode.c` گزارش کرد.

کد مربوط به alarm:

```c
s32mmv = -s32mmv;
```

## Note

فعلاً فقط baseline گرفته شده و هیچ patchی انجام نشده است.
