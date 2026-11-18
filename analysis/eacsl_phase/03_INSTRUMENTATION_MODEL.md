# Instrumentation Model

Tool: stock `frama-c -e-acsl` 33.0 with `-e-acsl-valid`.

Static experiment:

```text
-machdep ppc_32
six target-bearing translation units
deterministic generated source view
native GCC relocatable-object compilation proxy
```

Runtime experiment:

```text
-machdep x86_64
same six source units + thesis_runtime_harness.c
e-acsl-gcc -C ...
```

E-ACSL runtime translation روی `ppc_32` executable انجام نشد، چون PPC compiler/emulator نصب نبود و E-ACSL pointer-size mismatch را رد می‌کرد. Predicate set از مطالعهٔ PPC32 می‌آید ولی runtime observation host-native است.

## Integer-type boundary

`src_repaired/headers/Platform_Types.h` این mapping را دارد:

```text
s8/u8   = signed/unsigned char
s16/u16 = signed/unsigned short
s32/u32 = signed/unsigned long
```

روی PPC32، `long` برابر ۳۲ بیت است؛ روی host تاریخی x86_64 LP64 برابر ۶۴ بیت بود. campaign از `-m32`، `stdint.h` compatibility layer یا `_Static_assert` برای تحمیل width استفاده نکرد. پس 8/16-bit aliases با width مورد انتظار سازگارند، اما `s32/u32` در runtime بومی 64-bit شده‌اند. این مسئله می‌تواند semantics overflow، cast، promotion و predicateهای width-sensitive را تغییر دهد و یک limitation علمی صریح است.

Reaction policy stock runtime در assertion failure: diagnostic همراه label/value، سپس abort؛ هفت evidence واقعی exit status `134` دارند.
