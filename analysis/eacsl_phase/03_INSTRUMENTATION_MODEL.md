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

Reaction policy stock runtime در assertion failure: diagnostic همراه label/value، سپس abort؛ هفت evidence واقعی exit status `134` دارند.
