/**
 * @file sub_Ccode.c
 * @brief Saturating subtraction and absolute-difference routines.
 *
 * @details
 * C-only ECMath implementation prepared for formal analysis with Frama-C/EVA. Assembly
 * implementations were removed, while the executable C statements were retained. Function-level
 * documentation was reconstructed from the legacy `ecmath.h` contract and checked against the
 * corresponding implementation.
 *
 * @note Documentation edition: EVA C-only Doxygen v2.
 * @note The documentation pass does not intentionally change executable C statements.
 * @defgroup ecmath_sub Saturating subtraction and absolute-difference routines
 * @{
 */

/*
 * sub_Ccode.c
 *
 *  Created on: Dec 12, 2019
 *      Author: ng104383
 */

#include "sub_Ccode.h"


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract u8 from s8 with underflow s8 = s8 - u8
 *
 * @param[in] x_value First arithmetic operand. Representable range: -128 to 127.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `s8_sub_s8_u8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s8 s8_sub_s8_u8(register s8 x_value, register u8 y_value)
{
	if((x_value - y_value) >= -0x80)
	{
		return (u8)(x_value - y_value);	
	}
	else
	{
		return -0x80;
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract u8 from u8 with underflow and overflow limitation s8 = u8 - u8
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 255.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `s8_sub_u8_u8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s8 s8_sub_u8_u8(register u8 x_value, register u8 y_value)
{
	if((x_value - y_value) <= 0x7F)
	{
		if((x_value - y_value) >= -0x80)
		{
			return  (s8)(x_value - y_value);
		}
		else
		{
			return -0x80;
		}
	}
	else
	{
		return 0x7FU;
	}

}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract s16 from s16 with underflow and overflow limitation s16 = s16 - s16
 *
 * @param[in] x_value First arithmetic operand. Representable range: -32768 to 32767.
 * @param[in] y_value Second arithmetic operand. Representable range: -32768 to 32767.
 * @return Result of `s16_sub_s16_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s16 s16_sub_s16_s16(register s16 x_value, register s16 y_value)
{
	if((x_value - y_value) <= 0x7FFF)
	{
		if((x_value - y_value) >= -0x8000)
		{
			return (x_value - y_value);
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
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract u16 from s16 with underflow s16 = s16 - u16
 *
 * @param[in] x_value First arithmetic operand. Representable range: -32768 to 32767.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `s16_sub_s16_u16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s16 s16_sub_s16_u16(register s16 x_value, register u16 y_value)
{
	if((x_value - y_value) >= -0x8000)
	{
		return (x_value - y_value);
	}
	else
	{
		return -0x8000;
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract s16 from u16 with overflow s16 = u16 - s16
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: -32768 to 32767.
 * @return Result of `s16_sub_u16_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s16 s16_sub_u16_s16(register u16 x_value, register s16 y_value)
{
	if((x_value - y_value) <= 0x7FFF)
	{
		return (x_value - y_value);
	}
	else
	{
		return 0x7FFF;
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract u16 from u16 with underflow and overflow limitation s16 = u16 - u16
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `s16_sub_u16_u16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s16 s16_sub_u16_u16(register u16 x_value, register u16 y_value)
{
	if((x_value - y_value) <= 0x7FFF)
	{
		if((x_value - y_value) >= -0x8000)
		{
			return (x_value - y_value);
		}
		else
		{
			return -0x8000;
		}
	}
	else
	{
		return 0x7FFFU;
	}
}


/**
 * @brief Computes the absolute difference between two integer operands.
 *
 * @details
 * subtract u8 from u8 and build the absolute value u8 = |u8 - u8|
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 255.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u8_abs_sub_u8_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_sub
 */
u8 u8_abs_sub_u8_u8(register u8 x_value, register u8 y_value)
{
	if(x_value <= y_value)
	{
		return (u8)(y_value - x_value);
	}
	else
	{
		return (u8)(x_value - y_value);
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract u8 from u8 with underflow u8 = u8 - u8
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 255.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u8_sub_u8_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_sub
 */
u8 u8_sub_u8_u8(register u8 x_value, register u8 y_value)
{
	if(x_value <= y_value)
	{
		return 0;
	}
	else
	{
		return (u8)(x_value - y_value);
	}
}


/**
 * @brief Computes the absolute difference between two integer operands.
 *
 * @details
 * subtract u16 from u16 and build the absolute value u16 = |u16 - u16|
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `u16_abs_sub_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_sub
 */
u16 u16_abs_sub_u16_u16(register u16 x_value, register u16 y_value)
{
	if(x_value <= y_value)
	{
		return (u16)(y_value - x_value);
	}
	else
	{
		return (u16)(x_value - y_value);
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract u16 from u16 with underflow u16 = u16 - u16
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `u16_sub_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_sub
 */
u16 u16_sub_u16_u16(register u16 x_value, register u16 y_value)
{
	if(x_value <= y_value)
	{
		return 0;
	}
	else
	{
		return (x_value - y_value);
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract u32 from u32 with underflow and overflow limitation u16 = u32 - u32
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 4294967295.
 * @return Result of `u16_sub_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
u16 u16_sub_u32_u32(register u32 x_value, register u32 y_value)
{
	if(y_value < x_value)
	{
		if((x_value - y_value) >= 0xFFFFU)
		{
			return 0xFFFF;
		}
		else
		{
			return (u16)(x_value - y_value);
		}
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Computes the absolute difference between two integer operands.
 *
 * @details
 * subtract s16 from s16 and build the absolute value u16 = |s16 - s16|
 *
 * @param[in] x_value First arithmetic operand. Representable range: -32768 to 32767.
 * @param[in] y_value Second arithmetic operand. Representable range: -32768 to 32767.
 * @return Result of `u16_abs_sub_s16_s16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_sub
 */
u16 u16_abs_sub_s16_s16(register s16 x_value, register s16 y_value)
{
	if(x_value <= y_value)
	{
		return (u16)(y_value - x_value);
	}
	else
	{
		return (u16)(x_value - y_value);
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract u32 from u32 with underflow u32 = u32 - u32
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 4294967295.
 * @return Result of `u32_sub_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_sub
 */
u32 u32_sub_u32_u32(register u32 x_value, register u32 y_value)
{
	if(x_value >= y_value)
	{
		return (x_value - y_value);
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract s16 from u16 with overflow limitation u16 = u16 - s16
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: -32768 to 32767.
 * @return Result of `u16_sub_u16_s16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
u16 u16_sub_u16_s16(register u16 x_value, register s16 y_value)
{
	if((x_value - y_value) < 0xFFFF)
	{
		if((x_value - y_value) > 0)
		{
			return (x_value - y_value) & 0xFFFFU ;
		}
		else
		{
			return 0;
		}
	}
	else
	{
		return 0xFFFFU;
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract s32 from s32 with underflow and overflow limitation signed long = signed long - signed
 * long
 *
 * @param[in] x_value First arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @param[in] y_value Second arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_sub_s32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s32 s32_sub_s32_s32(register s32 x_value, register s32 y_value)
{
	if(x_value < 0)
	{
		if(y_value <= 0)
		{
			return (s32)(x_value - y_value);
		}
		else
		{
			if((x_value - y_value) <= 0)
			{
				return (s32)(x_value - y_value);				
			}
			else
			{
				return 0x80000000;
			}
		}
	}
	else
	{
		if(y_value >= 0)
		{
			return (s32)(x_value - y_value);
		}
		else
		{
			if ((x_value - y_value) >= 0)
			{
				return (s32)(x_value - y_value);
			}
			else
			{
				return 0x7FFFFFFF;
			}
		}

	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract u32 from u32 with underflow and overflow limitation s16 = u32 - u32
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 4294967295.
 * @return Result of `s16_sub_u32_u32` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s16 s16_sub_u32_u32(register u32 x_value, register u32 y_value)
{
	if(x_value <= y_value)
	{
		if((s32)(x_value - y_value) > 0)
		{
			return -0x8000;
		}
		else
		{
			if((s32)(x_value - y_value) >= -0x8000)
			{
				return (s16)(x_value - y_value);
			}
			else
			{
				return -0x8000;
			}
		}
	}
	else
	{
		if((x_value - y_value) <= 0x7FFFU)
		{
			return (s16)(x_value - y_value);
		}
		else
		{
			return 0x7FFF;
		}
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract s32 from u32 with underflow and overflow limitation u32 = u32 - s32
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_sub_u32_s32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
u32 u32_sub_u32_s32(register u32 x_value, register s32 y_value)
{
	if (y_value >= 0)
	{
		if(y_value < x_value)
		{
			return (u32)(x_value - y_value);
		}
		else
		{
			return 0;
		}
	}
	else
	{
		if ((x_value - y_value) >= x_value)
		{
			return (u32)(x_value - y_value);
		}
		else
		{
			return 0xFFFFFFFF;
		}
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract u32 from s32 with underflow limitation u32 = s32 - u32
 *
 * @param[in] x_value First arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 4294967295.
 * @return Result of `u32_sub_s32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
u32 u32_sub_s32_u32(register s32 x_value, register u32 y_value)
{
	if(x_value >= 0)
	{
		if(x_value >= y_value)
		{
			return (x_value - y_value);
		}
		else
		{
			return 0;
		}
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract s32 from s32 with underflow limitation u32 = s32 - s32
 *
 * @param[in] x_value First arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @param[in] y_value Second arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_sub_s32_s32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
u32 u32_sub_s32_s32(register s32 x_value, register s32 y_value)
{
	if(x_value >= y_value)
	{
		return (u32)(x_value - y_value);
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Computes the absolute difference between two integer operands.
 *
 * @details
 * subtract u32 from u32 and build the absolute value u32 = |u32 - u32|
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 4294967295.
 * @return Result of `u32_abs_sub_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_sub
 */
u32 u32_abs_sub_u32_u32(register u32 x_value, register u32 y_value)
{
	if(x_value < y_value)
	{
		return (u32)(y_value - x_value);	
	}
	else
	{
		return (u32)(x_value - y_value);
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract s32 from u32 with overflow s32 = u32 - s32
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_sub_u32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s32 s32_sub_u32_s32(register u32 x_value, register s32 y_value)
{
	if(y_value >= 0)
	{
		if(x_value <= y_value)
		{
			return (x_value - y_value);
		}
		else
		{
			if((x_value - y_value) <= 0x7FFFFFFFU)
			{
				return (x_value - y_value); 
			}
			else
			{
				return 0x7FFFFFFF;
			}
		}
	}
	else
	{
		if ((x_value - y_value) < x_value)
		{
			return 0x7FFFFFFF;
		}
		else
		{
			if((x_value - y_value) <= 0x7FFFFFFF)
			{
				return (x_value - y_value); 
			}
			else
			{
				return 0x7FFFFFFF;
			}
		}
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract u32 from s32 with underflow and overflow limitation s32 = s32 - u32
 *
 * @param[in] x_value First arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 4294967295.
 * @return Result of `s32_sub_s32_u32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s32 s32_sub_s32_u32(register s32 x_value, register u32 y_value)
{
	if(x_value >= 0)
	{
		if(x_value <= y_value)
		{
			if((s32)(x_value - y_value) <= 0)
			{
				return (x_value - y_value);
			}
			else
			{
				return 0x80000000;
			}
		}
		else
		{
			return (x_value - y_value);
		}
	}
	else
	{
		if(y_value <= 0x7FFFFFFF)
		{
			if((s32)(x_value - y_value) <= 0)
			{
				return (x_value - y_value);
			}
			else
			{
				return 0x80000000;
			}
		}
		else
		{
			return 0x80000000;
		}
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract u32 from u32 with underflow and overflow limitation s32 = u32 - u32
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 4294967295.
 * @return Result of `s32_sub_u32_u32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s32 s32_sub_u32_u32(register u32 x_value, register u32 y_value)
{
	if(x_value < y_value)
	{
		if((s32)(x_value - y_value) <= 0)
		{
			return (s32)(x_value - y_value);
		}
		else
		{
			return 0x80000000;
		}
	}
	else
	{
		if((x_value - y_value) <= 0x7FFFFFFFU)
		{
			return (x_value - y_value);
		}
		else
		{
			return 0x7FFFFFFF;
		}
	}
}


/**
 * @brief Computes the absolute difference between two integer operands.
 *
 * @details
 * subtract s32 from s32 and build the absolute value s32 = |s32 - s32|
 *
 * @param[in] x_value First arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @param[in] y_value Second arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_abs_sub_s32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s32 s32_abs_sub_s32_s32(register s32 x_value, register s32 y_value)
{
	s32 s32Temp1, s32Temp2, s32Result;
	s32Temp1 = (x_value - y_value);
	s32Temp2 = (y_value - x_value);
	if(x_value > y_value)
	{
		s32Result = s32Temp1;
	}
	else
	{
		s32Result = s32Temp2;
	}
	if(s32Result <= 0x7FFFFFFFU)
	{
		return s32Result;
	}
	else
	{
		return 0x7FFFFFFF;
	}
}


/**
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract s8 from s8 with underflow and overflow limitation s8 = s8 - s8
 *
 * @param[in] x_value First arithmetic operand. Representable range: -128 to 127.
 * @param[in] y_value Second arithmetic operand. Representable range: -128 to 127.
 * @return Result of `s8_sub_s8_s8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
s8 s8_sub_s8_s8(register s8 x_value, register s8 y_value)
{
	if((x_value - y_value) <= 0x7F)
	{
		if((x_value - y_value) >= -0x80)
		{
			return (x_value - y_value);
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
 * @brief Subtracts integer operands and applies the implemented range limitation.
 *
 * @details
 * subtract s8 from u8 with overflow/underflow limitation u8 = u8 - s8
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 255.
 * @param[in] y_value Second arithmetic operand. Representable range: -128 to 127.
 * @return Result of `u8_sub_u8_s8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_sub
 */
u8 u8_sub_u8_s8(register u8 x_value, register s8 y_value)
{
	if((x_value - y_value) < 0xFF)
	{
		if((x_value - y_value) > 0)
		{
			return (x_value - y_value) & 0xFF;
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

/** @} */ /* end of ecmath_sub */
