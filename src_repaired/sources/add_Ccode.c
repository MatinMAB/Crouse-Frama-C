/**
 * @file add_Ccode.c
 * @brief Saturating addition routines.
 *
 * @details
 * C-only ECMath implementation prepared for formal analysis with Frama-C/EVA. Assembly
 * implementations were removed, while the executable C statements were retained. Function-level
 * documentation was reconstructed from the legacy `ecmath.h` contract and checked against the
 * corresponding implementation.
 *
 * @note Documentation edition: EVA C-only Doxygen v2.
 * @note The documentation pass does not intentionally change executable C statements.
 * @defgroup ecmath_add Saturating addition routines
 * @{
 */

/*
 * add_Ccode.c
 *
 *  Created on: Dec 12, 2019
 *      Author: ng104383
 */

#include "add_Ccode.h"


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * Adds integer operands and applies the implemented range limitation.
 *
 * @param[in] a First arithmetic operand. Representable range: 0 to 255.
 * @param[in] b Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u8Add` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_add
 */
 u8 u8Add(register u8 a,register u8 b)
 {
 	if(0xFFU > (u16)(a + b))
 	{
 		return (a+b);
 	}
 	else
 	{
 		return (0xFFU);
 	}
 }


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add s8 to s8 with underflow and overflow s8 = s8 + s8
 *
 * @param[in] x_value First arithmetic operand. Representable range: -128 to 127.
 * @param[in] y_value Second arithmetic operand. Representable range: -128 to 127.
 * @return Result of `s8_add_s8_s8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
  s8 s8_add_s8_s8(register s8 x_value ,register s8 y_value )
  {

 	if ((x_value + y_value)>=0x7F)
 	{
 		return 0x7F;

 	}
 	else
 	{
 		if((x_value + y_value)< -0x80)
 		{
 			return -0x80;
 		}
 		else
 		{
 			return (x_value + y_value);
 		}
 	}		
 }


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add s16 to s16 with underflow and overflow s16 = s16 + s16
 *
 * @param[in] x_value First arithmetic operand. Representable range: -32768 to 32767.
 * @param[in] y_value Second arithmetic operand. Representable range: -32768 to 32767.
 * @return Result of `s16_add_s16_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
 s16 s16_add_s16_s16(register s16 x_value ,register s16 y_value )
 {
	 	if ((x_value + y_value)>=0x7FFF)
	 	{
	 		return 0x7FFF;

	 	}
	 	else
	 	{
	 		if((x_value + y_value)< -0x8000)
	 		{
	 			return -0x8000;
	 		}
	 		else
	 		{
	 			return (x_value + y_value);
	 		}
	 	}		 
 }


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add u16 to s16 with overflow limitation s16 = u16 + s16
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: -32768 to 32767.
 * @return Result of `s16_add_u16_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
s16 s16_add_u16_s16(register u16 x_value ,register s16 y_value )
{
	 	if ((x_value + y_value)>=0x7FFF)
	 	{
	 		return 0x7FFF;


	 	}
	 	else
	 	{
	 		return (x_value + y_value);
	 	}

}


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add u8 to s8 with overflow limitation s8 = u8 + s8
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 255.
 * @param[in] y_value Second arithmetic operand. Representable range: -128 to 127.
 * @return Result of `s8_add_u8_s8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
 s8 s8_add_u8_s8(register u8 x_value ,register s8 y_value )
 {
	 	if ((x_value + y_value)>=0x7F)
	 	{
	 		return 0x7F;

	 	}
	 	else
	 	{
	 		return (x_value + y_value);
	 	}	 

 }


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add s32 to s32 with overflow and underflow limitation s32 = s32 + s32
 *
 * @param[in] x_value First arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @param[in] y_value Second arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_add_s32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
 s32 s32_add_s32_s32(register s32 x_value ,register s32 y_value )
 {
	if(x_value <= 0)
	{
		if(y_value < 0)
		{
			if ((x_value+y_value)<0)
			{
				return (x_value+y_value);
			}
			else 
			{
				return 0x80000000;
			}	
		}
		else
		{
			return (x_value+y_value);
		}
	}
	else
	{
		if(y_value <= 0)
		{
			return (x_value+y_value);
		}
		else
		{
			if((x_value+y_value)>0)
			{
				return (x_value+y_value);
			}
			else
			{
				return 0x7FFFFFFF;
			}
		}
	} 
 }


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add u8 to u8 with overflow limitation u8 = u8 + u8
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 255.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u8_add_u8_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
u8 u8_add_u8_u8(register u8 x_value ,register u8 y_value )
{
	if((x_value+y_value) < 0xFFU)
	{
		return (x_value+y_value);
	}
	else
	{
		return 0xFF;
	}
}


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add u8 to s8 with underflow and overflow u8 = u8 + s8
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 255.
 * @param[in] y_value Second arithmetic operand. Representable range: -128 to 127.
 * @return Result of `u8_add_u8_s8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_add
 */
u8 u8_add_u8_s8(register u8 x_value ,register s8 y_value )
{
	if((x_value + y_value) < 0xFF)
	{
		if((x_value + y_value) >0)
		{
			return (u8)(x_value + y_value);
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
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add u16 to u16 with overflow limitation u16 = u16 + u16
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `u16_add_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
u16 u16_add_u16_u16(register u16 x_value ,register u16 y_value )
{
	if((x_value+y_value) < 0xFFFFU)
	{
		return (x_value+y_value);
	}
	else
	{
		return 0xFFFF;
	}
}


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add u16 to s16 with underflow and overflow u16 = u16 + s16
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: -32768 to 32767.
 * @return Result of `u16_add_u16_s16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
u16 u16_add_u16_s16(register u16 x_value ,register s16 y_value )
{
	if((x_value+y_value) < 0xFFFF)
	{
		if((x_value+y_value) > 0)
		{
			return (u16)(x_value+y_value);
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
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add u32 to u32 with overflow limitation u32 = u32 + u32
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 4294967295.
 * @return Result of `u32_add_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
u32 u32_add_u32_u32(register u32 x_value, register u32 y_value )
{
	register u32 a;
	a = x_value + y_value;
	if (a < y_value)
	{
		return 0xFFFFFFFF;
	}
	else
	{
		return (x_value+y_value);
	}

}


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add three u16 values with overflow limitation u16 = u16 + u16 + u16
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @param[in] z_value Third arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `u16_add_u16_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
u16 u16_add_u16_u16_u16(register u16 x_value, register u16 y_value, register u16 z_value)
{

	if((x_value + y_value + z_value) < 0xFFFFU)
	{
		return (x_value + y_value + z_value);
	}
	else
	{
		return 0xFFFF;
	}

}


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add three s16 values with overflow limitation and underflow limitation s16 = s16 + s16 + s16
 *
 * @param[in] x_value First arithmetic operand. Representable range: -32768 to 32767.
 * @param[in] y_value Second arithmetic operand. Representable range: -32768 to 32767.
 * @param[in] z_value Third arithmetic operand. Representable range: -32768 to 32767.
 * @return Result of `s16_add_s16_s16_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
s16 s16_add_s16_s16_s16(register s16 x_value, register s16 y_value, register s16 z_value)
{
	if((x_value+y_value+z_value) < 0x7FFF)
	{
		if((x_value+y_value+z_value) > -0x8000)
		{
			return (x_value+y_value+z_value);
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
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add u32 to s32 with underflow and overflow u32 = u32 + s32
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_add_u32_s32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
u32 u32_add_u32_s32(register u32 x_value, register s32 y_value )
{
	register u32 a;
	a = x_value + y_value;

	if(y_value < 0)
	{
		if(-(y_value)<x_value)
		{
			return a;
		}
		else
		{
			return 0;
		}
	}
	else
	{
		if(a>=y_value)
		{
			return a;
		}
		else
		{
			return 0xFFFFFFFF;
		}	
	}

}


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add s32 to s32 with underflow and overflow u32 = s32 + s32
 *
 * @param[in] x_value First arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @param[in] y_value Second arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_add_s32_s32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_add
 */
u32 u32_add_s32_s32(register s32 x_value ,register s32 y_value )
{
	if(x_value < 0)
	{
		if(y_value < 0)
		{
			return 0;
		}
		else
		{
			if((x_value+y_value) >= 0)
			{
				return (x_value+y_value);
			}
			else
			{
				return 0;
			}
		}
	}
	else
	{
		if(y_value < 0)
		{
			if((x_value+y_value) >= 0)
			{
				return (x_value+y_value);
			}
			else
			{
				return 0;
			}
		}
		else
		{
			return (x_value+y_value);
		}
	}
}


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add u32 to s32 with underflow and overflow s32 = u32 + s32
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_add_u32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
s32 s32_add_u32_s32(register u32 x_value ,register s32 y_value )
{
	register s32 a;
	a = x_value + y_value;

	if(y_value<0)
	{
		if((-y_value) <= x_value)
		{
			if((x_value + y_value) > 0x7FFFFFFF)
			{
				return 0x7FFFFFFF;
			}
			else
			{
				return a;
			}
		}
		else
		{
				return a;
		}
	}
	else
	{
		if(a < y_value)
		{
			return 0x7FFFFFFF;
		}
		else
		{
			return a;
		}

	}
}


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add three u32 with overflow limitation u32 = u32 + u32 + u32
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] z_value Third arithmetic operand. Representable range: 0 to 4294967295.
 * @return Result of `u32_add_u32_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
u32 u32_add_u32_u32_u32(register u32 x_value, register u32 y_value, register u32 z_value)
{
	if((y_value+z_value)<y_value)
	{
		return 0xFFFFFFFF;
	}
	else
	{
		if((y_value+z_value) <= (x_value+y_value+z_value))
		{
			return (x_value+y_value+z_value); 
		}
		else
		{
			return 0xFFFFFFFF;
		}
	}
}


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add four u16 values with overflow limitation u16 = u16 + u16 + u16 + u16
 *
 * @param[in] w_value Fourth arithmetic operand. Representable range: 0 to 65535.
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @param[in] z_value Third arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `u16_add_u16_u16_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_add
 */
u16 u16_add_u16_u16_u16_u16(register u16 w_value, register u16 x_value, register u16 y_value, register u16 z_value)
{
	if ((w_value + x_value + y_value + z_value) < 0xFFFF)
	{
		return (w_value + x_value + y_value + z_value);
	}
	else
	{
		return 0xFFFFU;
	}
}


/**
 * @brief Adds integer operands and applies the implemented range limitation.
 *
 * @details
 * add three s32 with overflow and underflow s32 = s32 + s32 + s32
 *
 * @param[in] x_value First arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @param[in] y_value Second arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @param[in] z_value Third arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_add_s32_s32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 31).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_add
 */
s32 s32_add_s32_s32_s32(register s32 x_value, register s32 y_value, register s32 z_value)
{
	s32 s32Temp1, s32Temp2,s32Temp3,s32Carry;

	s32Temp3 = (x_value + y_value);

	if 	((x_value >= 0) && (y_value >= 0) ) s32Carry=0;
	else if ((x_value >= 0) && (y_value <  0) && (s32Temp3 <  0)) s32Carry=0;
	else if ((x_value <  0) && (y_value >= 0) && (s32Temp3 <  0)) s32Carry=0;
	else s32Carry=1U;


	s32Temp2 = (x_value>>31) + (y_value>>31) + s32Carry;

	s32Temp1 = (s32Temp3 + z_value);

	if 	((s32Temp3 >= 0) && (z_value >= 0) ) s32Carry=0;
	else if ((s32Temp3 >= 0) && (z_value <  0) && (s32Temp1 <  0)) s32Carry=0;
	else if ((s32Temp3 <  0) && (z_value >= 0) && (s32Temp1 <  0)) s32Carry=0;
	else s32Carry=1U;

	s32Temp2 += (z_value>>31) + s32Carry;

	if(s32Temp2 != 0)
	{
		if (s32Temp2 < 0)
		{
			if(s32Temp2 != -1)
			{
				return -0x80000000; 
			}
			else
			{
				if(s32Temp1 > -0x80000000)
				{
					return (x_value + y_value + z_value);
				}
				else
				{
					return -0x80000000;
				}

			}
		}
		else
		{
			return 0x7FFFFFFF;
		}
	}
	else
	{
		if((u32)s32Temp1 < 0x7FFFFFFFU)
		{
				return (x_value + y_value + z_value);
		}
		else
		{
			return 0x7FFFFFFF;
		}
	}
}

/** @} */ /* end of ecmath_add */
