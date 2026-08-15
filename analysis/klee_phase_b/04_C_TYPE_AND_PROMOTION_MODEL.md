# C Type and Promotion Model

## Direct repository evidence

The project typedefs are `s8=signed char`, `u8=unsigned char`, `s16=signed short`, `u16=unsigned short`, `s32=signed long`, and `u32=unsigned long`. The frozen Eva machine is ppc_32: 16-bit short, 32-bit int/long/pointer, big-endian, unsigned plain char.

## Derived semantic mapping

Each operand records both the declared source-object type and the effective operation type. Under ppc_32, every `s8/u8/s16/u16` value promotes to signed 32-bit `int`, because signed `int` represents their full ranges. `s32/u32` remain 32-bit signed/unsigned long. Shift result type follows the promoted left operand; the right operand is promoted independently. All 149 mapped operations are effectively 32-bit, but 8/16-bit declared inputs materially affect the promotion evidence.

The future adapter must encode these widths and conversions explicitly; compiling unmodified `signed long` on host LP64 would not preserve this model.

Observed consequences are concrete in the mapping: `u16` half words in `MulHighWord` become signed `int` operands before multiplication; `u8/s8/u16/s16` subtraction and left-shift operands become signed `int`; mixed `s32` and promoted narrow operands operate as 32-bit signed `long` where that type represents the promoted value; the 13 variable-count shift obligations have unsigned `u32` left operands, while the 20 invalid-left-operand obligations concern signed promoted operands. The resulting target signedness is 136 signed operations and 13 unsigned operations.
