/**
 * @file shift_Ccode.c
 * @brief Shift, rotation, conversion, and absolute-value routines.
 *
 * @details
 * C-only ECMath implementation prepared for formal analysis with Frama-C/EVA. Assembly
 * implementations were removed, while the executable C statements were retained. Function-level
 * documentation was reconstructed from the legacy `ecmath.h` contract and checked against the
 * corresponding implementation.
 *
 * @note Documentation edition: EVA C-only Doxygen v2.
 * @note The documentation pass does not intentionally change executable C statements.
 * @defgroup ecmath_shift Shift, rotation, conversion, and absolute-value routines
 * @{
 */

/*
 * shift_Ccode.c
 *
 *  Created on: Jan 4, 2020
 *      Author: ng104383
 */

#include "shift_Ccode.h"
#include "rotatefunc.h"

/**
 * @brief Returns the larger of two values.
 *
 * @details
 * Determination of the maximum in a table of u16; the result is the location of the maximum u8 =
 * location of the maximum of the table
 *
 * @param[in] tab Pointer to the input table.
 * @param[in] tablen Number of valid elements in the input table. Representable range: 0 to 255.
 * @return Result of `u8_max_tab_u16p_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @warning The table pointer must reference at least `tablen` readable elements.
 * @warning A zero table length may violate the implementation precondition; verify before calling.
 * @ingroup ecmath_shift
 */
u8 u8_max_tab_u16p_u8(const u16 *tab, u8 tablen)
{
	const u16 *u16Temp1 = 0, *u16Temp2 = 0;
	int ind = 9 , Maxind = 0;
	u16 u16Value2 = 0,u16Value1 = 0;
	u16Temp1 = tab;
	u16Temp2 = tab + tablen-1;

	while (u16Temp2 >= u16Temp1)
	{
		u16Value2 = *u16Temp2;
		if(u16Value2 <= u16Value1)
		{
			u16Temp2 = u16Temp2-1;
			ind = ind-1;
		}
		else
		{
			u16Value1 = u16Value2;
			Maxind = ind;
			ind = ind-1;
			u16Temp2 = u16Temp2-1;

		}
	}
	return Maxind;
}


/**
 * @brief Scales an integer value by a right shift and applies the implemented output limitation.
 *
 * @details
 * Conversion of s16 to s8, adapting the range of result to -1024 ... 1016 (shift 3 bits to the
 * right) with overflow and underflow limitation s8 = s16 >> 3
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `s8_s16_shr3` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s8 s8_s16_shr3(s16 value)
{
	s16 s16Temp1 = 0;
	u8 u8Temp1 = 0;
	if(value < 0)
	{
		s16Temp1 = rotateRight(value, 3) + 1;
		if(s16Temp1 > -0x80)
		{
			return (s8)s16Temp1;
		}
		else
		{
			return -0x80;
		}

	}
	else
	{
		u8Temp1 = rotateRight(value, 3);
		if(u8Temp1 < 0x7F)
		{
			return u8Temp1;
		}
		else
		{
			return 0x7F;
		}
	}


}


/**
 * @brief Scales an integer value by a left shift and applies the implemented output limitation.
 *
 * @details
 * Adapting the range of result of s16 to -8192 ... 8191.75 (shift 2 bits to the left) with
 * overflow and underflow limitation s16 = s16 << 2
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `s16_s16_shl2` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 2).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s16 s16_s16_shl2(s16 value)
{
	if((value << 2) < 0x7FFF)
	{
		if((value << 2) > -0x8000)
		{
			return (value << 2);
		}
		else
		{
			return -0x8000;
		}
	}
	else
	{
		return 0x7FFF;
	}
}


/**
 * @brief Scales an integer value by a left shift and applies the implemented output limitation.
 *
 * @details
 * Adapting the range of result of s16 to -4096 ... 4095.87 (shift 3 bits to the left) with
 * overflow and underflow limitation s16 = s16 << 3
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `s16_s16_shl3` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 3).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s16 s16_s16_shl3(s16 value)
{
	if((value << 3) < 0x7FFF)
	{
		if((value << 3) > -0x8000)
		{
			return (value << 3);
		}
		else
		{
			return -0x8000;
		}
	}
	else
	{
		return 0x7FFF;
	}	
}


/**
 * @brief Scales an integer value by a left shift and applies the implemented output limitation.
 *
 * @details
 * Adapting the range of result of s16 to -2048 ... 2047.9375 (shift 4 bits to the left) with
 * overflow and underflow limitation s16 = s16 << 4
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `s16_s16_shl4` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 4).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s16 s16_s16_shl4(s16 value)
{
	if((value << 4) < 0x7FFF)
	{
		if((value << 4) > -0x8000)
		{
			return (value << 4);
		}
		else
		{
			return -0x8000;
		}
	}
	else
	{
		return 0x7FFF;
	}	
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of s32 to s16 with overflow and underflow limitation s32 --> s16
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @return Result of `s16_s32` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s16 s16_s32(s32 value)
{
	if(value < 0x7FFF)
	{
		if(value > -0x8000)
		{
			return (s16)value;
		}
		else
		{
			return -0x8000;
		}
	}
	else
	{
		return 0x7FFF;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of u16 to s16 with overflow u16 --> s16
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @return Result of `s16_u16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s16 s16_u16(u16 value)
{
	if(value < 0x7FFF)
	{
		return (s16)value;
	}
	else
	{
		return 0x7FFF;
	}
}


/**
 * @brief Scales an integer value by a right shift and applies the implemented output limitation.
 *
 * @details
 * Conversion of s16 to u8, adapting the range of result to 0 ... 1020 (shift 2 bits to the right)
 * with overflow and underflow limitation u8 = s16 >> 2
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `u8_s16_shr2` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note The implementation uses integer bit scaling (right shift(s): 2).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_shift
 */
u8 u8_s16_shr2(s16 value)
{
	if((value >> 2) < 0xFF)
	{
		if((value >> 2) > 0)
		{
			return (value >> 2) & 0xFF;
		}
		else
		{
			return 0;
		}
	}
	else
	{
		return 0xFFU;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of u16 to u8 with overflow u16 --> u8
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @return Result of `u8_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_shift
 */
u8 u8_u16(u16 value)
{
	if(value < 0xFFU)
	{
		return (u8)value;
	}
	else
	{
		return 0xFFU;
	}
}


/**
 * @brief Scales an integer value by a right shift and applies the implemented output limitation.
 *
 * @details
 * Conversion of u16 to u8, adapting the range of result 0 ... 4080 (shift 4 bits to the right)
 * with overflow limitation u8 = u16 >> 4
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @return Result of `u8_u16_shr4` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
u8 u8_u16_shr4(u16 value)
{
	u16 u16Temp1 = 0;
	u16Temp1 = rotateRight(value,4) ;//& 0xF800;
	if(u16Temp1 < 0xFF)
	{
		return (u16Temp1 & 0xFF);
	}
	else
	{
		return 0xFFU;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of s16 to u16 with underflow s16 --> u16
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `u16_s16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_shift
 */
u16 u16_s16(s16 value)
{
	if(value > 0)
	{
		return value;
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of u32 to u16 with overflow u32 --> u16
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @return Result of `u16_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
u16 u16_u32(u32 value)
{
	if(value < 0xFFFF)
	{
		return (u16)value;
	}
	else
	{
		return 0xFFFF;
	}
}


/**
 * @brief Scales an integer value by a left shift and applies the implemented output limitation.
 *
 * @details
 * Conversion of s16 to u16, adapting the range of result to 0 ... 16383.75 (shift 2 bits to the
 * left) with overflow and underflow limitation u16 = s16 << 2
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `u16_s16_shl2` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
u16 u16_s16_shl2(s16 value)
{
	u16 u16Temp1 = 0;
	if(value >= 0)
	{
		if(value <= 0x3FFF)
		{
			u16Temp1 = rotateLeft(value , 2) & 0xFFFC;
			return u16Temp1;
		}
		else
		{
			return 0xFFFF;
		}
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Scales an integer value by a left shift and applies the implemented output limitation.
 *
 * @details
 * Conversion of s16 to u16, adapting the range of result to 0 ... 1023.9844 (shift 6 bits to the
 * left) with overflow and underflow limitation u16 = s16 << 6
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `u16_s16_shl6` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
u16 u16_s16_shl6(s16 value)
{
	u16 u16Temp1 = 0;
	if(value >= 0)
	{
		if(value <= 0x3FF)
		{
			u16Temp1 = rotateLeft(value , 6) & 0xFFC0;
			return u16Temp1;
		}
		else
		{
			return 0xFFFF;
		}
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Scales an integer value by a right shift and applies the implemented output limitation.
 *
 * @details
 * Shifts a value 0 ..15 digits to the right and puts the result in an s32 value s32 = s32 >> u8
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `s32_exp05_s32_u8` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
s32 s32_exp05_s32_u8(s32 value, u8 count)
{

	count = count & 0x000F;
	value = value >> count;
	return value;
}


/**
 * @brief Scales an integer value by a right shift and applies the implemented output limitation.
 *
 * @details
 * Shifts a value 0 ..15 digits to the right and puts the result in an u16 value with overflow
 * limitation u16 = u32 >> u8
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `u16_exp05_u32_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
u16 u16_exp05_u32_u8(u32 value, u8 count)
{
	u32 u32Temp1 = 0;
	u16 u16Temp1 = 0;
	count = count & 0x000F;
	u32Temp1 = value >> count;
	if(u32Temp1 < 0xFFFF)
	{
		u16Temp1 = u32Temp1 & 0xFFFF;
		return u16Temp1;
	}
	else
	{
		return 0xFFFF;
	}

}


/**
 * @brief Scales an integer value by a right shift and applies the implemented output limitation.
 *
 * @details
 * Shifts a value 0 ..15 digits to the right and puts the result in an u32 value u32 = u32 >> u8
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `u32_exp05_u32_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
u32 u32_exp05_u32_u8(u32 value, u8 count)
{
	count = count & 0x000F;
	value = value >> count;
	return value;
}


/**
 * @brief Rotates a 32-bit value to the right.
 *
 * @details
 * Rotates a value a given number of bits (max. 31) to the right result in an u32 value u32 = u32
 * rotated right by a u16 value
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 65535.
 * @return Result of `u32_rotr_u32_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 5).
 * @note Rotation counts should be interpreted modulo the 32-bit word width only where the implementation explicitly performs that reduction.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
u32 u32_rotr_u32_u16(u32 value, u16 count)
{
	u32 u32Temp1 = 0;
	if(count <= 0x20)
	{
		if(count != 0)
		{
			u32Temp1 = (value >> count) + (value << (0x20 - count));
			return u32Temp1;

		}
		else
		{
			return value;
		}
	}
	else
	{
		count = count - (count>>5) * 0x20;
		if(count != 0)
		{
			u32Temp1 = (value >> count) + (value << (0x20 - count));
			return u32Temp1;

		}
		else
		{
			return value;
		}

	}
}


/**
 * @brief Rotates a 32-bit value to the left.
 *
 * @details
 * Rotates a value a given number of bits (max. 31) to the left result in an u32 value u32 = u32
 * rotated left by a u16 value
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 65535.
 * @return Result of `u32_rotl_u32_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 5).
 * @note Rotation counts should be interpreted modulo the 32-bit word width only where the implementation explicitly performs that reduction.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
u32 u32_rotl_u32_u16(u32 value, u16 count)
{
	u32 u32Temp1 = 0;
	if(count <= 0x20)
	{
		if(count != 0)
		{
			u32Temp1 = (value << count) + (value >> (0x20 - count));
			return u32Temp1;

		}
		else
		{
			return value;
		}
	}
	else
	{
		count = count - (count>>5) * 0x20;
		if(count != 0)
		{
			u32Temp1 = (value << count) + (value >> (0x20 - count));
			return u32Temp1;

		}
		else
		{
			return value;
		}

	}
}


/**
 * @brief Computes an absolute value with the implemented range limitation.
 *
 * @details
 * res = |value|
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `u16_abs_s16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_shift
 */
u16 u16_abs_s16(s16 value)
{
	if(value < 0)
	{
		value = -value;
	}
	return (u16)value;
}


/**
 * @brief Computes an absolute value with the implemented range limitation.
 *
 * @details
 * res = |value| overflow : limit to 7FFFH
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `s16_abs_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s16 s16_abs_s16(s16 value)
{
	if(value != -0x8000)
	{
		if(value < 0)
		{
			return -value;
		}
		else
		{
			return value;
		}
	}
	else
	{
		return 0x7FFF;
	}

}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of s16 to s8, with overflow and underflow limitation s8 = s16
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `s8_s16` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s8 s8_s16(s16 value)
{
	if(value < 0x7F)
	{
		if(value > -0x80)
		{
			return (s8)value;
		}
		else
		{
			return -0x80;
		}
	}
	else
	{
		return 0x7F;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * res = (val1 * val2)>> count overflow : limit to 7FFFH underflow : limit to 8000H
 *
 * @param[in] val1 First operand. Representable range: -32768 to 32767.
 * @param[in] val2 Second operand. Representable range: 0 to 65535.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u16_exp05_u8` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
s16 s16_mul_s16_u16_exp05_u8(s16 val1, u16 val2, u8 count)
{

	u16 u16Count1 = 1, u16Count = 0;
	s32 s32Temp1 = 0, s32Temp2 = 0;
	count = count & 0xF;
	s32Temp1 = val1 * val2;

	u16Count = u16Count1 << count;
	s32Temp2 = s32Temp1 / u16Count;
	if(s32Temp2 < 0x7FFF)
	{
		if(s32Temp2 > -0x8000)
		{
			return (s16)s32Temp2;
		}
		else
		{
			return -0x8000;
		}
	}
	else
	{
		return 0x7FFF;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * res = (val1 * val2)<< count overflow : limit to 7FFFH underflow : limit to 8000H
 *
 * @param[in] val1 First operand. Representable range: -32768 to 32767.
 * @param[in] val2 Second operand. Representable range: 0 to 65535.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u16_exp2_u8` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
s16 s16_mul_s16_u16_exp2_u8(s16 val1, u16 val2, u8 count)
{
	s32 s32Temp1 = 0, s32Temp2 = 0;
	count = count & 0xF;
	s32Temp1 = val1 * val2;
	if(s32Temp1 < 0x7FFF)
	{
		if(s32Temp1 > -0x8000)
		{
			s32Temp2 = s32Temp1 << count;
			if(s32Temp2 < 0x7FFF)
			{
				if(s32Temp2 > -0x8000)
				{
					return s32Temp2;
				}
				else
				{
					return -0x8000;
				}
			}
			else
			{
				return 0x7FFF;
			}
		}
		else
		{
			return -0x8000;
		}
	}
	else
	{
		return 0x7FFF;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * res = (val1 * val2)>> count overflow : limit to FFFFH
 *
 * @param[in] val1 First operand. Representable range: 0 to 65535.
 * @param[in] val2 Second operand. Representable range: 0 to 65535.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `u16_mul_u16_u16_exp05_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
u16 u16_mul_u16_u16_exp05_u8(u16 val1, u16 val2, u8 count)
{
	u32 u32Temp1 = 0;
	u32Temp1 = val1 * val2;
	count = count & 0xF;
	u32Temp1 = u32Temp1 >> count;
	if(u32Temp1 < 0xFFFF)
	{
		return (u16)u32Temp1;
	}
	else
	{
		return 0xFFFF;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * res = (val1 * val2)<< count overflow : limit to FFFFH
 *
 * @param[in] val1 First operand. Representable range: 0 to 65535.
 * @param[in] val2 Second operand. Representable range: 0 to 65535.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `u16_mul_u16_u16_exp2_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
u16 u16_mul_u16_u16_exp2_u8(u16 val1, u16 val2, u8 count)
{
	u32 u32Temp1 = 0;
	count = count & 0xF;
	u32Temp1 = val1 * val2;
	if(u32Temp1 <= 0xFFFF)
	{
		u32Temp1 = u32Temp1 << count;
		if(u32Temp1 < 0xFFFF)
		{
			return (u16)u32Temp1;
		}
		else
		{
			return 0xFFFF;
		}
	}
	else
	{
		return 0xFFFFU;
	}	
}


/**
 * @brief Scales an integer value by a left shift and applies the implemented output limitation.
 *
 * @details
 * res = val << 6 overflow : limit to 7FFFH underflow : limit to 8000H
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `s16_s16_shl6` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 6).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s16 s16_s16_shl6(s16 value)
{
	s32 s32Value = 0;
	s32Value = value << 6;
	if(s32Value < 0x7FFF)
	{
		if(s32Value > -0x8000)
		{
			return (s16)s32Value;
		}
		else
		{
			return -0x8000;
		}
	}
	else
	{
		return 0x7FFF;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * res = val overflow : limit to FFFFH underflow : limit to 0000H
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @return Result of `u16_s32` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
u16 u16_s32(s32 value)
{
	if(value < 0xFFFF)
	{
		if(value > 0)
		{
			return (u16)value;
		}
		else
		{
			return 0;
		}
	}
	else
	{
		return 0xFFFF;
	}
}


/**
 * @brief Scales an integer value by a left shift and applies the implemented output limitation.
 *
 * @details
 * res=data << bits limit overflow to : 7FFF ( 32767) limit underflow to: 8000 (-32768) range of
 * result : 8000..7FFF
 *
 * @param[in] data Input data value. Representable range: -32768 to 32767.
 * @param[in] bits Number of bit positions used for scaling. Representable range: 0 to 255.
 * @return Result of `s16_exp2_s16_u8` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
s16 s16_exp2_s16_u8(s16 data,u8 bits)
{
	s32 s32Temp1 = 0;
	bits = bits & 0xF;
	s32Temp1 = data << bits;
	if(s32Temp1 <= 0x7FFF)
	{
		if(s32Temp1 >= -0x8000)
		{
			return (s16)s32Temp1;
		}
		else
		{
			return -0x8000;
		}
	}
	else
	{
		return 0x7FFF;
	}
}


/**
 * @brief Scales an integer value by a left shift and applies the implemented output limitation.
 *
 * @details
 * res=data << bits limit overflow to : 7FFF ( 32767) limit underflow to: 8000 (-32768) range of
 * result : 8000..7FFF
 *
 * @param[in] data Input data value. Representable range: 0 to 65535.
 * @param[in] bits Number of bit positions used for scaling. Representable range: 0 to 255.
 * @return Result of `u16_exp2_u16_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
u16 u16_exp2_u16_u8(u16 data,u8 bits)
{
	u32 u32data = 0;
	if(bits <= 0xF)
	{
		u32data = data << bits;
		if(u32data <= 0xFFFF)
		{
			return (u16)u32data;
		}
		else
		{
			return 0xFFFF;
		}
	}
	else
	{
		if(data == 0)
		{
			return 0;
		}
		else
		{
			return 0xFFFF;
		}
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * res=(data1*data2) >> count limit overflow to : 7FFF ( 32767) limit underflow to: 8000 (-32768)
 * range of result : 8000..7FFF
 *
 * @param[in] data1 First data operand. Representable range: -32768 to 32767.
 * @param[in] data2 Second data operand. Representable range: -32768 to 32767.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_s16_exp05_u8` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 4).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
s16 s16_mul_s16_s16_exp05_u8(s16 data1,s16 data2,u8 count)
{
	s32 s32Temp1 = 0;
	count = count & 0xFF;
	if(count > 0xF)
	{
		count = count - ((count >> 4) * 0x10);

	}
	s32Temp1 = data1 * data2;
	s32Temp1 = s32Temp1 >> count;
	if(s32Temp1 <= 0x7FFF)
	{
		if(s32Temp1 >= -0x8000)
		{
			return (s16)s32Temp1;
		}
		else
		{
			return -0x8000;
		}
	}
	else
	{
		return 0x7FFF;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of s8 to u8, with underflow limitation u8 = s8
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @return Result of `u8_s8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
u8 u8_s8(s8 value)
{
	if(value > 0)
	{
		return value;
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of s16 to u8, with overflow and underflow limitation u8 = s16
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @return Result of `u8_s16` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
u8 u8_s16(s16 value)
{
	if(value < 0xFF)
	{
		if(value > 0)
		{
			return (u8)value;
		}
		else
		{
			return 0;
		}
	}
	else
	{
		return 0xFF;
	}
}


/**
 * @brief Computes an absolute value with the implemented range limitation.
 *
 * @details
 * res = |value|
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @return Result of `u8_abs_s8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_shift
 */
u8 u8_abs_s8(s8 value)
{
	if(value < 0)
	{
		value = -value;
		return value;
	}
	else
	{
		return value;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of u8 to s8, with overflow limitation s8 = u8
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @return Result of `s8_u8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s8 s8_u8(u8 value)
{
	if(value < 0x7F)
	{
		return value;
	}
	else
	{
		return 0x7F;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of u16 to s8, with overflow limitation s8 = u16
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @return Result of `s8_u16` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s8 s8_u16(u16 value)
{
	if(value < 0x7F)
	{
		return (s8)value;
	}
	else
	{
		return 0x7F;
	}
}


/**
 * @brief Computes an absolute value with the implemented range limitation.
 *
 * @details
 * res = |value| overflow : limit to 7FH
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @return Result of `s8_abs_s8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s8 s8_abs_s8(s8 value)
{
	if(value != -0x80)
	{
		if(value < 0)
		{
			return -value;
		}
		else
		{
			return value;
		}
	}
	else
	{
		return 0x7F;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of u32 to s16, with overflow limitation s16 = u32
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @return Result of `s16_u32` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s16 s16_u32(u32 value)
{
	if(value < 0x7FFF)
	{
		return (s16)value;
	}
	else
	{
		return 0x7FFF;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of s32 to u32, with underflow and underflow limitation u32 = s32
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_s32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
u32 u32_s32(s32 value)
{
	if(value >= 0)
	{
		return value;
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Computes an absolute value with the implemented range limitation.
 *
 * @details
 * res = |value|
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_abs_s32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_shift
 */
u32 u32_abs_s32(s32 value)
{
	if(value < 0)
	{
		return -value;
	}
	else
	{
		return value;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of u32 to s32, with overflow limitation s32 = u32
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @return Result of `s32_u32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s32 s32_u32(u32 value)
{
	if(value < 0x7FFFFFFF)
	{
		return value;
	}
	else
	{
		return 0x7FFFFFFF;
	}
}


/**
 * @brief Computes an absolute value with the implemented range limitation.
 *
 * @details
 * res = |value| overflow : limit to 7FFFFFFFH
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_abs_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s32 s32_abs_s32(s32 value)
{
	if(value != 0x80000000)
	{
		if(value < 0)
		{
			return -value;
		}
		else
		{
			return value;
		}
	}
	else
	{
		return 0x7FFFFFFF;
	}
}


/**
 * @brief Scales an integer value by a right shift and applies the implemented output limitation.
 *
 * @details
 * Shifts right the s16 value by the number of bits specified in u8 count and returns s8 output
 * with results limited if it falls outside s8 range
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `s8_exp05_s16_u8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
s8 s8_exp05_s16_u8(s16 value,u8 count)
{
	u16 u16Count = 0;
	s16 s16Temp1 = 0;
	count = count & 0xF;
	u16Count = 1 << count;
	s16Temp1 = value / u16Count;
	if(s16Temp1 < 0x7F)
	{
		if(s16Temp1 > -0x80)
		{
			return (s8)s16Temp1;
		}
		else
		{
			return -0x80;
		}
	}
	else
	{
		return 0x7F;
	}
}


/**
 * @brief Scales an integer value by a left shift and applies the implemented output limitation.
 *
 * @details
 * Shifts left the s16 value by the number of bits specified in u8 count and returns u16 output
 * with results limited if it falls outside u16 range
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `u16_exp2_s16_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
u16 u16_exp2_s16_u8(s16 value,u8 count)
{
	s32 s32Temp1 = 0;

		if(value >= 0)
		{
			count = count & 0xF;
			s32Temp1 = value << count;
			if(s32Temp1 <= 0xFFFF)
			{
				return (u16)s32Temp1;
			}
			else
			{
				return 0xFFFFU;
			}
		}
		else
		{
			return 0;
		}

}


/**
 * @brief Scales an integer value by a right shift and applies the implemented output limitation.
 *
 * @details
 * Shifts right the s16 value by the number of bits specified in u8 count and returns u8 output
 * with results limited if it falls outside u8 range
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `u8_exp05_s16_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
u8 u8_exp05_s16_u8(s16 value,u8 count)
{	
	s32 s32Temp1 = 0;
	count = count & 0xF;
	s32Temp1 = value >> count;
	if(s32Temp1 < 0xFF)
	{
		if(s32Temp1 > 0)
		{
			return (u8)s32Temp1;
		}
		else
		{
			return 0;
		}
	}
	else
	{
		return 0xFFU;
	}

}


/**
 * @brief Scales an integer value by a right shift and applies the implemented output limitation.
 *
 * @details
 * Shifts right the u16 value by the number of bits specified in u8 count and returns u8 output
 * with results limited if it falls outside u8 range
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `u8_exp05_u16_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_shift
 */
u8 u8_exp05_u16_u8(u16 value, u8 count)
{
	u16 u16Value = 0;
	count = count & 0xF;
	u16Value = value >> count;
	if(u16Value < 0xFF)
	{
		return (u8)u16Value;
	}
	else
	{
		return 0xFF;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of u32 to u8 with overflow u32 --> u8
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @return Result of `u8_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_shift
 */
u8 u8_u32(u32 value)
{
	if(value < 0xFF)
	{
		return (u8)value;
	}
	else
	{
		return 0xFF;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Conversion of s32 to s8 with overflow and underflow limitation s32 --> s8
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @return Result of `s8_s32` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_shift
 */
s8 s8_s32(s32 value)
{
	if(value < 0x7F)
	{	
		if(value > -0x80)
		{
			return (s8)value;

		}
		else
		{
			return -0x80;
		}
	}
	else
	{
		return 0x7F;
	}
}

/** @} */ /* end of ecmath_shift */
