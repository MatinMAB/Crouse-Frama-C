# Baseline Methodology

## DIRECT REPOSITORY EVIDENCE

## Function-by-function design

The Baseline does not run the entire library as one monolithic application. Each of the 46 rows in `analysis/high_precision/functions.txt` has a dedicated harness and runner. The runner parses only the source containing the target, any explicitly required helper source, and the target harness. The manifest records the exact list.

This design yields a stable experiment unit:

```text
target function + exact helper closure + one abstract call + one entry point
```

It avoids adding unrelated translation units merely for convenience. For example, `s32_mul_s32_s32` requires `mul_Ccode.c` and `MulHword.c`, while `s16_div_s32_s16` requires only `div_Ccode.c`. The runner preserves that distinction.

## Roles of `src_original` and `src_analysis`

`src_original/` is the preserved source snapshot and is not edited by analysis stages. `src_analysis/` is the source/header tree passed to Frama-C. Baseline commits add harnesses, runners, results, and reports without changing `src_original`; the frozen audit also shows no package-phase change in either source tree.

Where source contains incomplete behavior—such as an active empty non-void body—the Baseline records that structure without inserting a return value or implementation. Kernel diagnostics and Eva alarm markers remain separate evidence classes.

## Harness strategy

Every selected harness:

- includes `__fc_builtin.h` and the project header;
- uses project typedefs rather than replacement primitive declarations;
- declares one variable per target parameter;
- assigns each parameter an abstract interval over its complete modeled type domain;
- declares `result` with the exact return type;
- invokes only the target C symbol;
- uses `(void) result;` to make intentional result retention explicit;
- returns zero from `eva_main`, the analysis entry point.

`(void) result` does not constrain or rewrite the target result. It creates a syntactically explicit use and avoids treating the local as accidentally unused. `eva_main` provides a uniform root independent of application-level callers.

## Representative Harness 1: `s32_mul_s32_u16`

Path: `harnesses/P1/eva_main_s32_mul_s32_u16.c`.

```c
#include "__fc_builtin.h"
#include "mul_Ccode.h"

int eva_main(void)
{
    s32 value;
    u16 factor;
    s32 result;

    value =
        Frama_C_long_interval(
            -2147483647L - 1L,
            2147483647L);

    factor =
        Frama_C_unsigned_short_interval(
            0,
            65535);

    result = s32_mul_s32_u16(value, factor);
    (void) result;
    return 0;
}
```

`s32` maps to signed long and is modeled over `-2147483648..2147483647`; `u16` maps to unsigned short and is modeled over `0..65535`. There is no nonzero assumption on `factor`, which is essential for observing denominator-related control behavior inside the function.

## Representative Harness 2: `s16_div_s32_s16`

Path: `harnesses/P1/eva_main_s16_div_s32_s16.c`.

```c
s32 numerator;
s16 denominator;
s16 result;

numerator = Frama_C_long_interval(
    -2147483647L - 1L,
    2147483647L);

denominator = Frama_C_short_interval(
    -32768,
    32767);

result = s16_div_s32_s16(numerator, denominator);
```

The denominator domain includes zero, `-1`, and the signed minimum because no tracked contract excludes them. Those values are relevant to explicit source branches and signed-division predicates.

## Other representative harnesses

| Function | Parameter model | Evidence-based rationale |
| --- | --- | --- |
| `s32_mul_s32_s32` | two `Frama_C_long_interval(-2147483648,2147483647)` values | both operands are full-domain `s32`; multiplication/helper behavior is not restricted by caller assumptions |
| `root_u32_mul_u32_s16_fac_less1` | `u32` value and count over `0..0xFFFFFFFF`; `s16` factor over `-32768..32767` | preserves extreme values and every shift count, including values relevant to shift predicates |
| `u16_sin_u16` | `Frama_C_unsigned_short_interval(0,65535)` | the complete `u16` phase representation is analyzed in one abstract call |
| `rotateRight` | two `u32` intervals over `0..0xFFFFFFFF` | both word value and rotation input remain unconstrained over their typedef domains |

The exact source text for all 46 harness input assignments is stored in `data/functions.tsv` under `input_model`.

## Input builtin inventory

| Builtin | C/project type represented | Concrete interval used | Selected-function usage |
| --- | --- | --- | --- |
| `Frama_C_int_interval` followed by `(s8)` | `s8` / signed char | `-128..127` | four functions; five parameter assignments because one HIP harness has two `s8` inputs |
| `Frama_C_long_interval` | `s32` / signed long | `-2147483648..2147483647` | 22 functions; 27 parameter assignments |
| `Frama_C_short_interval` | `s16` / signed short | `-32768..32767` | 17 functions; 25 parameter assignments |
| `Frama_C_unsigned_char_interval` | `u8` / unsigned char | `0..255` | four functions; five parameter assignments |
| `Frama_C_unsigned_long_interval` | `u32` / unsigned long | `0..4294967295` | 19 functions; 25 parameter assignments |
| `Frama_C_unsigned_short_interval` | `u16` / unsigned short | `0..65535` | 17 functions; 20 parameter assignments |

The counts above are computed from the 46 manifest-selected harnesses; a function can use more than one builtin or use the same builtin for several parameters.

## Abstract intervals versus exhaustive concrete testing

An interval builtin asks Eva to begin with an abstract set representing every concrete value in the stated range. Eva then transfers and joins abstract states according to its domains and precision controls. The harness does not loop through all values and does not create one concrete execution per input tuple. This distinction is material: the number of concrete tuples can be enormous, while abstract interpretation summarizes them and may lose correlations at joins or nonlinear operations.

## Baseline runner structure

Representative path: `scripts/run_s32_mul_s32_u16_baseline.sh`.

```bash
#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

FUNC="s32_mul_s32_u16"
DIR="results/baseline/$FUNC"

mkdir -p "$DIR"
```

- The shebang selects Bash.
- `set -euo pipefail` stops on command failure, unset variables, or failed pipeline components.
- The relative `cd` makes paths independent of a particular user home directory.
- `FUNC` centralizes artifact naming.
- `DIR` confines output to one function.
- `mkdir -p` creates the result directory only when the runner is executed.

The parse stage is:

```bash
frama-c \
  -machdep ppc_32 \
  -cpp-extra-args="-Isrc_analysis/headers" \
  src_analysis/sources/mul_Ccode.c \
  harnesses/P1/eva_main_s32_mul_s32_u16.c \
  -main eva_main \
  -save "$DIR/${FUNC}_parse.sav" \
  > "$DIR/${FUNC}_parse.log" 2>&1
```

It fixes the machine data model, supplies the project header include path, parses the exact target source and harness, chooses `eva_main`, saves the normalized program, and records all parser/kernel output.

The Eva stage is:

```bash
frama-c \
  -load "$DIR/${FUNC}_parse.sav" \
  -eva \
  -eva-slevel 1000 \
  -eva-ilevel 256 \
  -save "$DIR/${FUNC}_eva.sav" \
  > "$DIR/${FUNC}_eva.log" 2>&1
```

Loading the parse save avoids reconstructing the program between stages. `-eva` activates analysis; `slevel=1000` supplies a substantial semantic-unrolling/state budget; `ilevel=256` retains finite integer sets up to the selected threshold. The saved Eva state and complete log support later inspection without recomputation.

## Why `ppc_32`

The runner explicitly selects `ppc_32`, matching the project typedef assumptions: `long` and pointers follow the 32-bit target model used to interpret `s32` and `u32`. This control is essential because integer widths, promotions, literal types, shift widths, and overflow predicates depend on the machine model.

## Why separate parse and Eva

The two-stage design preserves parser/kernel diagnostics independently from value-analysis results. It also allows the comparison to verify that Baseline and High Precision received the same normalized program. In the frozen study, all 46 parse-log pairs are byte-identical.

## Why `.sav`, logs, per-function directories, and commits

- `.sav` files preserve normalized parse and analyzed Eva states.
- `.log` files preserve the textual evidence used by the comparator.
- function directories prevent artifact mixing.
- independent commits make it possible to identify exactly when one function's harness, runner, results, and report entered history.

## TECHNICAL INTERPRETATION

Function-specific full-domain analysis emphasizes sound coverage over undocumented environmental narrowing. It is stronger than sampling because one abstract run covers all modeled values, but it is not equivalent to enumerating every tuple. Precision losses can occur when intervals forget correlations such as a copied divisor equaling a guarded parameter, or when quotient/product/remainder expressions are evaluated compositionally. Those limitations motivate the controlled High Precision profile.
