/**
 * @file mul_Ccode.c
 * @brief Fixed-point multiplication routines.
 *
 * @details
 * C-only ECMath implementation prepared for formal analysis with Frama-C/EVA. Assembly
 * implementations were removed, while the executable C statements were retained. Function-level
 * documentation was reconstructed from the legacy `ecmath.h` contract and checked against the
 * corresponding implementation.
 *
 * @note Documentation edition: EVA C-only Doxygen v2.
 * @note The documentation pass does not intentionally change executable C statements.
 * @defgroup ecmath_mul Fixed-point multiplication routines
 * @{
 */

/*
 * mul_Ccode.c
 *
 *  Created on: Dec 16, 2019
 *      Author: ng104383
 */

#include "mul_Ccode.h"
#include "rotatefunc.h"
#include "MulHword.h"


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `root_s8_mul_s8_u8_fac_less1` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (right shift(s): 16).
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s8 root_s8_mul_s8_u8_fac_less1(s8 value, u16 factor)
{
	s32 s32MulTemp1 = 0 , s32MulTemp2 = 0;
	s32MulTemp1 = value * factor;

	s32MulTemp2 = s32MulTemp1 >> 16;

	if((s32MulTemp1<0) &&((s32MulTemp1 & 0xFFFF)!=0))
	{
		s32MulTemp2 = s32MulTemp2 + 1;
		return (s8)s32MulTemp2;
	}
	else
	{
		return (s8)s32MulTemp2;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `root_s8_mul_s8_u8_fac_greater1` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (right shift(s): 8).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s8 root_s8_mul_s8_u8_fac_greater1(s8 value, u16 factor)
{
	s32 s32MulTemp1 = 0 , s32MulTemp2 = 0;
	s32MulTemp1 = value * factor;
	s32MulTemp2 = s32MulTemp1 >> 8;
	if((s32MulTemp1<0) &&((s32MulTemp1 & 0xFF)!=0))
	{
		s32MulTemp2 = s32MulTemp2 + 1;
	}
	else
	{
		//Do nothing
	}

	if(s32MulTemp2 < 0x7F)
	{
		if(s32MulTemp2 > -0x80)
		{
			return (s8)s32MulTemp2;
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
 * multiply s8 by a factor of 0 ... 0.996 (shift 8 bits to the right) s8 = (s8 * u8) >> 8
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s8_mul_s8_u8_fac1` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (right shift(s): 8).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s8 s8_mul_s8_u8_fac1(s8 value, u8 factor)
{
	s32 s32MulTemp1 = 0 , s32MulTemp2 = 0;
	s32MulTemp1 = value * factor;
	s32MulTemp2 = s32MulTemp1 >> 8;
	if((s32MulTemp1<0) &&((s32MulTemp1 & 0xFF)!=0))
	{
		s32MulTemp2 = s32MulTemp2 + 1;
		return (s8)s32MulTemp2;
	}
	else
	{
		return (s8)s32MulTemp2;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s8 by a factor of 0..1.992 (shift 7 bits to the right) s8 = (s8 * u8) >> 7
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s8_mul_s8_u8_fac2` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (right shift(s): 7).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s8 s8_mul_s8_u8_fac2(s8 value, u8 factor)
{
	s32 s32MulTemp1 = 0 , s32MulTemp2 = 0;
	s32MulTemp1 = value * factor;
	s32MulTemp2 = s32MulTemp1 >> 7;
	if((s32MulTemp1<0) &&((s32MulTemp1 & 0x7F)!=0))
	{
		s32MulTemp2 = s32MulTemp2 + 1;
	}
	else
	{
		//Do nothing
	}

	if(s32MulTemp2 < 0x7F)
	{
		if(s32MulTemp2 > -0x80)
		{
			return (s8)s32MulTemp2;
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
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: -2147483648 to 2147483647.
 * @return Result of `root_s16_mul_s16_s16_fac_less1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 root_s16_mul_s16_s16_fac_less1(s16 value, s16 factor, s32 count)
{
	s32 s32MulTemp = 0;
	s32MulTemp = value * factor;
	s32MulTemp = s32MulTemp/count;
	return s32MulTemp;	
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: -2147483648 to 2147483647.
 * @return Result of `root_s16_mul_s16_s16_fac_greater1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
s16 root_s16_mul_s16_s16_fac_greater1(s16 value, s16 factor, s32 count)
{
	s32 s32MulTemp = 0;
	s32MulTemp = value * factor;
	s32MulTemp = s32MulTemp/count;
	if(s32MulTemp < 0x7FFF)
	{
		if(s32MulTemp > -0x8000)
		{
			return (s16)s32MulTemp;
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
 * multiply s16 by a factor of -1 ... 0.999985 (shift 15 bits to the right) with overflow and
 * underflow limitation s16 = (s16 * s16) >> 15
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 15).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_s16_fac1(s16 value, s16 factor)
{	
	s32 s32MulTemp1 = 0 , s32MulTemp2 = 0;
	s32MulTemp1 = value * factor;
	s32MulTemp2 = s32MulTemp1 >> 15;
	if((s32MulTemp1<0) &&((s32MulTemp1 & 0x7FFF)!=0))
	{
		s32MulTemp2 = s32MulTemp2 + 1;

	}
	else
	{
		//Do nothing
	}

	if(s32MulTemp2 < 0x7FFF)
	{
		return (s16)s32MulTemp2;
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
 * multiply s16 by a factor of -2 ... 1.99997 (shift 14 bits to the right) with overflow and
 * underflow limitation s16 = (s16 * s16) >> 14
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac2` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 14).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_s16_fac2(s16 value, s16 factor)
{
	s32 s32MulTemp1 = 0 , s32MulTemp2 = 0;
	s32MulTemp1 = value * factor;
	s32MulTemp2 = s32MulTemp1 >> 14;
	if((s32MulTemp1<0) &&((s32MulTemp1 & 0x3FFF)!=0))
	{
		s32MulTemp2 = s32MulTemp2 + 1;
	}
	else
	{
		//Do nothing
	}

	if( s32MulTemp2 < 0x7FFF)
	{
		if(s32MulTemp2 > -0x8000)
		{
			return (s16)s32MulTemp2;
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
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `root_s16_mul_s16_u8_fac_less1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 16, 31).
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s16 root_s16_mul_s16_u8_fac_less1(s16 value, u16 factor)
{
	s32 s32MulTemp1 = 0 , s32MulTemp2 = 0;
	s32MulTemp1 = value * factor;
	s32MulTemp2 = s32MulTemp1 >> 16;
	if((s32MulTemp1<0) &&((s32MulTemp1 & 0x7FFF)!=0))
//	s32 s32MulTemp = 0;
//	s32MulTemp = value * factor;
//	s32MulTemp = rotateRight(s32MulTemp, 16);
//	if(((s32MulTemp & 0x80000000U)>>31) == 1)
	{
		s32MulTemp2 = s32MulTemp2 + 1;
		return (s16)s32MulTemp2;
	}
	else
	{
		return (s16)s32MulTemp2;
	}	
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `root_s16_mul_s16_u8_fac_greater1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 8, 31).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s16 root_s16_mul_s16_u8_fac_greater1(s16 value, u16 factor)
{
	s32 s32MulTemp1 = 0 , s32MulTemp2 = 0;
	s32MulTemp1 = value * factor;
	s32MulTemp2 = s32MulTemp1 >> 8;
	if((s32MulTemp1<0) &&((s32MulTemp1 & 0xFF)!=0))

//	s32 s32MulTemp = 0;
//	s32MulTemp = value * factor;
//	s32MulTemp = s32MulTemp >> 8;
//	if(((s32MulTemp & 0x80000000U)>>31) == 1)
	{
		s32MulTemp2 = s32MulTemp2 + 1;
	}
	else
	{
		//Do Nothing
	}	
	if(s32MulTemp2 < 0x7FFF)
	{
		if(s32MulTemp2 > -0x8000)
		{
			return (s16)s32MulTemp2;
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
 * multiply signed int by a factor of 0 ... 0.99
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u8_fac1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 8, 31).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u8_fac1(s16 value, u8 factor)
{
	s32 s32MulTemp1 = 0 , s32MulTemp2 = 0;
	s32MulTemp1 = value * factor;
	s32MulTemp2 = s32MulTemp1 >> 8;
	if((s32MulTemp1<0) &&((s32MulTemp1 & 0xFF)!=0))

//	s32 s32MulTemp = 0;
//	s32MulTemp = value * factor;
//	s32MulTemp = s32MulTemp >> 8;
//	if(((s32MulTemp & 0x800000U)>>31) == 1)
	{
		s32MulTemp2 = s32MulTemp2 + 1;
		return s32MulTemp2;
	}
	else
	{
		return s32MulTemp2;
	}	
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply signed int by a factor of 0..1.992
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u8_fac2` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 7, 31).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u8_fac2(s16 value, u8 factor)
{
	s32 s32MulTemp1 = 0 , s32MulTemp2 = 0;
	s32MulTemp1 = value * factor;
	s32MulTemp2 = s32MulTemp1 >> 7;
	if((s32MulTemp1<0) &&((s32MulTemp1 & 0x7F)!=0))
//	s32 s32MulTemp = 0;
//	s32MulTemp = value * factor;
//	s32MulTemp = s32MulTemp >> 7;
//	if(((s32MulTemp & 0x80000000U)>>31) == 1)
	{
		s32MulTemp2 = s32MulTemp2 + 1;
	}
	else
	{
		//Do nothing
	}

	if( s32MulTemp2 < 0x7FFF)
	{
		if(s32MulTemp2 > -0x8000)
		{
			return (s16)s32MulTemp2;
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
 * multiply s16 by u16 with underflow and overflow limitation s16 = s16 - u16
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16(s16 value, u16 factor)
{
	s32 s32MulTemp = 0;
	s32MulTemp = value * factor;
	if(s32MulTemp < 0x7FFF)
	{
		if(s32MulTemp > -0x8000)
		{
			return (s16)s32MulTemp;
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
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: -2147483648 to 2147483647.
 * @return Result of `root_s16_mul_s16_u16_fac_less1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 root_s16_mul_s16_u16_fac_less1(s16 value,u16 factor,s32 count)
{
	s32 s32MulTemp = 0;
	s32MulTemp = value * factor;
	s32MulTemp = s32MulTemp/count; 
	return (s16)s32MulTemp;

}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 65535.
 * @return Result of `root_s16_mul_s16_u16_fac_greater1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
s16 root_s16_mul_s16_u16_fac_greater1(s16 value,u16 factor,u16 count)
{
	s32 s32MulTemp = 0;
	s32MulTemp = value * factor;
	s32MulTemp = s32MulTemp/count;
	if(s32MulTemp < 0x7FFF)
	{
		if(s32MulTemp > -0x8000)
		{
			return (s16)s32MulTemp;
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
 * multiply s16 by a factor of 0 ... 0.999985 (shift 16 bits to the right) s16 = (s16 * u16) >> 16
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 16, 31).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac1( s16 value, u16 factor)
{
	s32 s32MulTemp1 = 0 , s32MulTemp2 = 0;
	s32MulTemp1 = value * factor;
	s32MulTemp2 = s32MulTemp1 >> 16;
	if((s32MulTemp1<0) &&((s32MulTemp1 & 0xFFFF)!=0))

//	s32 s32MulTemp = 0;
//	s32MulTemp = value * factor;
//	s32MulTemp = s32MulTemp >> 16;
//	if(((s32MulTemp & 0x80000000U)>>31) == 1)
	{
		s32MulTemp2 = s32MulTemp2 + 1;
		return (s16)s32MulTemp2;
	}
	else
	{
		return (s16)s32MulTemp2;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s16 by a factor of 0 ... 1.992 (shift 15 bits to the right) s16 = (s16 * u16) >> 15
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac2` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 0, 15, 31).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac2( s16 value, u16 factor)
{
	s32 s32MulTemp1 = 0 , s32MulTemp2 = 0;
	s32MulTemp1 = value * factor;
	s32MulTemp2 = s32MulTemp1 >> 15;
	if((s32MulTemp1<0) &&((s32MulTemp1 & 0x7FFF)!=0))
//	s32 s32MulTemp = 0;
//	s32MulTemp = value * factor;
//	s32MulTemp = s32MulTemp >> 0xF;
//	if(((s32MulTemp & 0x80000000U)>>31) == 1)
	{
		s32MulTemp2 = s32MulTemp2 + 1;
	}
	else
	{
		//Do nothing
	}

	if( s32MulTemp2 < 0x7FFF)
	{
		if(s32MulTemp2 > -0x8000)
		{
			return (s16)s32MulTemp2;
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
 * multiply u16 by a factor of 0 ... 255.9960938 (shift 8 bits to the right) s16 = (u16 * u16) >> 8
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_u16_u16_fac256` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 8).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_u16_u16_fac256( u16 value, u16 factor)
{
	u32 u32MulTemp = 0;
	u32MulTemp = value * factor;
	u32MulTemp = u32MulTemp >> 8;	
	if(u32MulTemp < 0x7FFF)
	{
		return (s16)u32MulTemp;
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
 * multiply s16 by u16 with underflow and overflow limitation s32 = s16 * u16
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s32_mul_s16_u16` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s16_u16(s16 value, u16 factor)
{
	s32 s32MulTemp = 0;
	s32MulTemp = value * factor;	
	return s32MulTemp;
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s32 by u16 with underflow and overflow limitation s32 = s32 * u16
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s32_mul_s32_u16` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_u16(s32 value, u16 factor)
{
	s32 s32Temp1 = 0, s32Temp2 = -2147483648, s32Factor=0;
	s32Factor = factor;
	if(factor != 0)
	{
		if(value < 0)
		{
			s32Temp1 = s32Temp2 / s32Factor;
			if(s32Temp1 >= value)
			{
				return 0x80000000;
			}
			else
			{
				return (value*factor);
			}
		}
		else
		{
			if((0x7FFFFFFFU/factor) <= value)
			{
				return 0x7FFFFFFF;
			}
			else
			{
				return (value*factor);
			}
		}
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 65535.
 * @return Result of `root_u8_mul_u8_u8_fac_less1` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_mul
 */
u8 root_u8_mul_u8_u8_fac_less1(u8 value,u8 factor,u16 count)
{
	u16 u16MulTemp = 0;
	u16MulTemp = value * factor;
	u16MulTemp = u16MulTemp/count;
	return (u8)u16MulTemp;		
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 255.
 * @return Result of `root_u8_mul_u8_u8_fac_greater1` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_mul
 */
u8 root_u8_mul_u8_u8_fac_greater1(u8 value,u8 factor,u8 count)
{
	u16 u16MulTemp = 0;
	u16MulTemp = value * factor;
	u16MulTemp = u16MulTemp/count;
	if(u16MulTemp <= 0xFF)
	{
		return u16MulTemp & 0xFF;
	}
	else
	{
		return 0xFFU;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u8 by a factor of 0 ... 0.996 (shift 8 bits to the right) u8 = high s8 of the 16 bit
 * value (u8 - u8)
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 255.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u8_mul_u8_u8_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note The implementation uses integer bit scaling (right shift(s): 8).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u8 u8_mul_u8_u8_fac1(u8 x_value,u8 y_value)
{
	u16 u16MulTemp = 0;
	u16MulTemp = x_value * y_value;
	u16MulTemp = u16MulTemp >> 8;
	return (u8)u16MulTemp;
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u8 by a factor of 0 ... 1.992 (shift 7 bits to the right) with overflow limitation u8 =
 * (u8 * u8) >> 7
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u8_mul_u8_u8_fac2` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note The implementation uses integer bit scaling (right shift(s): 7).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u8 u8_mul_u8_u8_fac2( u8 value, u8 factor)
{
	u16 u16MulTemp = 0;
	u16MulTemp = value * factor;
	u16MulTemp = u16MulTemp >> 7;	
	if(u16MulTemp < 0xFF)
	{
		return (u8)u16MulTemp;
	}
	else
	{
		return 0xFF;
	}	
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `root_u16_mul_u16_u8_fac_less1` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (right shift(s): 16).
 * @ingroup ecmath_mul
 */
u16 root_u16_mul_u16_u8_fac_less1(u16 value,u16 factor)
{
	u32 u32MulTemp = 0;
	u32MulTemp = value * factor;
	u32MulTemp = u32MulTemp >> 16;
	return (u16)u32MulTemp;

}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `root_u16_mul_u16_u8_fac_greater_1` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (right shift(s): 8).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
u16 root_u16_mul_u16_u8_fac_greater_1(u16 value,u16 factor)
{
	u32 u32MulTemp = 0;
	u32MulTemp = value * factor;	
	u32MulTemp = u32MulTemp >> 8;
	if(u32MulTemp < 0xFFFFU)
	{
		return (u32MulTemp & 0xFFFF);
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
 * multiply unsigned int by a factor of 0 ... 0.1245 u16_mul_u16_u8_fac025 function: multiply
 * unsigned int by a factor of 0 ... 0.24 u16_mul_u16_u8_fac05 function: multiply unsigned int by a
 * factor of 0 ... 0.49 DIRECT FUNCTIONS function: multiply unsigned int by a factor of 0 ... 0.99
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u16_mul_u16_u8_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (right shift(s): 8).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u8_fac1(u16 x_value, u8 y_value)
{
	u32 u32MulTemp = 0;
	u32MulTemp = x_value * y_value;
	u32MulTemp = (u32MulTemp >> 8) & 0xFFFF;//u32MulTemp = (rotateRight(u32MulTemp, 8) & 0xFFFF);
	return u32MulTemp;

}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply unsigned int by a factor of 0 ... 1.99
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u16_mul_u16_u8_fac2` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (right shift(s): 7).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u8_fac2(u16 x_value, u8 y_value)
{
	u32 u32MulTemp = 0;
	u32MulTemp = x_value * y_value;	
	u32MulTemp = u32MulTemp >> 7;
	if(u32MulTemp < 0xFFFFU)
	{
		return (u32MulTemp & 0xFFFF);
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
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 4294967295.
 * @return Result of `root_u16_mul_u16_u16_fac_less1` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_mul
 */
u16 root_u16_mul_u16_u16_fac_less1(u16 value,u16 factor,u32 count)
{
	u32 u32MulTemp = 0;
	u32MulTemp = value * factor;	
	u32MulTemp = u32MulTemp/count ; 
	return (u32MulTemp & 0xFFFF);
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 65535.
 * @return Result of `root_u16_mul_u16_u16_fac_greater1` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
u16 root_u16_mul_u16_u16_fac_greater1(u16 value,u16 factor,u16 count)
{
	u32 u32MulTemp = 0;
	u32MulTemp = value * factor;	
	u32MulTemp = u32MulTemp/count ;
	if(u32MulTemp <= 0xFFFFU)
	{
		return (u32MulTemp & 0xFFFF);
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
 * multiply u16 by a factor of 0 ... 0.999985 (shift 16 bits to the right) u16 = (u16 * u16) >> 16
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (right shift(s): 16).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac1(u16 x_value,u16 y_value)
{
	u32 u32MulTemp = 0;
	u32MulTemp = x_value * y_value;	
	u32MulTemp = u32MulTemp >> 16;
	return (0xFFFF & u32MulTemp);
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u16 by a factor of 0 ... 1.99997 (shift 15 bits to the right) with overflow limitation
 * u16 = (u16 * u16) >> 15
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac2` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (right shift(s): 15).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac2(u16 x_value,u16 y_value)
{
	u32 u32MulTemp = 0;
	u32MulTemp = x_value * y_value;	
	u32MulTemp = u32MulTemp >> 15;
	if(u32MulTemp <= 0xFFFFU)
	{
		return (u32MulTemp & 0xFFFF);
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
 * multiply u32 by u16 with underflow and overflow limitation u32 = u32 * u16
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `u32_mul_u32_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
 u32 u32_mul_u32_u16(u32 x_value, u16 y_value)
 {

	u32 u32Temp1 = 0;
	if(y_value > 0)
	{
		u32Temp1 = 0xFFFFFFFFU/y_value;
		if(u32Temp1 < x_value)
		{
			return 0xFFFFFFFFU;
		}
		else
		{
			return (x_value * y_value);
		}
	}
	else
	{
		return 0;
	}

 }

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 4294967295.
 * @return Result of `root_u32_mul_u32_u16_fac_less1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_mul
 */
u32 root_u32_mul_u32_u16_fac_less1(u32 value,u16 factor, u32 count)
{	
	u32 u32Temp1 = 0, u32Temp2 = 0;
	u32Temp1 = value * factor; 		/* Low word multiplication */
	u32Temp2 = MulHighWord(value, factor);  /* High word multiplication */
	u32Temp1 = u32Temp1 >> count;
	u32Temp1 |= u32Temp2 << (32-count);
	if((u32Temp2>>count) == 0)
	{
		return u32Temp1;
	}
	else
	{
		return 0xFFFFFFFFU;
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * u8 = (( u8 val1 - u8 val2) s8 factor) + u8 val2 with underflow and overflow limitation
 *
 * @param[in] val1 First operand. Representable range: 0 to 255.
 * @param[in] val2 Second operand. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -128 to 127.
 * @return Result of `u8_cal1_u8_u8_s8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
u8 u8_cal1_u8_u8_s8( u8 val1, u8 val2, s8 factor)
{
	s16 s16Temp1 = 0;
	s16Temp1 = ((val1 - val2)*factor)/32+val2;
	if(s16Temp1 < 0xFF)
	{
		if(s16Temp1 > 0)
		{
			return (u8)s16Temp1;
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
 * u16 = (( u16 val1 - u16 val2) s8 factor) + u16 val2 with underflow and overflow limitation
 *
 * @param[in] val1 First operand. Representable range: 0 to 65535.
 * @param[in] val2 Second operand. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -128 to 127.
 * @return Result of `u16_cal1_u16_u16_s8` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
u16 u16_cal1_u16_u16_s8( u16 val1, u16 val2, s8 factor)
{
	s32 s32Temp1 = 0;
	s32Temp1 = ((val1 - val2)*factor)/32+val2;
	if(s32Temp1 < 0xFFFF)
	{
		if(s32Temp1 > 0)
		{
			return (u16)s32Temp1;
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
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * u16 = (u16 val1 * u16 val2) with overflow limitation
 *
 * @param[in] val1 First operand. Representable range: 0 to 65535.
 * @param[in] val2 Second operand. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16( u16 val1, u16 val2)
{
	u32 u32Temp1 = 0;
	u32Temp1 = val1 * val2;
	if(u32Temp1 <= 0xFFFF)
	{
		return (u32Temp1 & 0xFFFF);
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
 * u32 = (u16 val1 * u16 val2)
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `u32_mul_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u16_u16(u16 x_value, u16 y_value)
{
	u32 u32Temp1 = 0;
	u32Temp1 = x_value * y_value;
	return u32Temp1;

}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * s32 = (s16 val1 * s16 val2) function: multiply s32 by u16 with underflow and overflow limitation
 * s32 = s32 * u16
 *
 * @param[in] x_value First arithmetic operand. Representable range: -32768 to 32767.
 * @param[in] y_value Second arithmetic operand. Representable range: -32768 to 32767.
 * @return Result of `s32_mul_s16_s16` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s16_s16(s16 x_value, s16 y_value)
{
	s32 s32Temp1 = 0;
	s32Temp1 = x_value * y_value;
	return s32Temp1;

}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * u32 = (u32 val1 * s32 val2) with underflow and overflow limitation
 *
 * @param[in] val1 First operand. Representable range: 0 to 4294967295.
 * @param[in] val2 Second operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_mul_u32_s32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_s32(u32 val1, s32 val2)
{
	s32 s32Temp1 = 0;
	if(val2 > 0)
	{
		s32Temp1 = 0xFFFFFFFF/val2;
		if(s32Temp1 < val1)
		{
			return 0xFFFFFFFF;
		}
		else
		{
			return (val1 * val2);
		}
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * u32 = (s32 val1 * s32 val2) with underflow and overflow limitation
 *
 * @param[in] val1 First operand. Representable range: -2147483648 to 2147483647.
 * @param[in] val2 Second operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_mul_s32_s32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
u32 u32_mul_s32_s32(s32 val1, s32 val2)
{
	u32 u32Temp1 , u32Temp2, u32Temp3;
	u8 u8SignBit;

	if(val1<0)
		u32Temp1 = -val1;
	else
		u32Temp1 = val1;

	if(val2<0)
		u32Temp2 = -val2;
	else
		u32Temp2 = val2;

	if((val1<0 && val2>0) || (val1>0 && val2<0))
		u8SignBit=1;
	else
		u8SignBit=0;
	u32Temp3 = u32_mul_u32_u32(u32Temp1,u32Temp2);

	if(u8SignBit==1)
	{
		return 0;
	}
	else
	{
		return u32Temp3;
	}
/*	s32 s32Temp1 = 0 , s32Temp2 = 0;
	u32 u32Temp1 = 0;
	s32Temp1 = val1 * val2;
	s32Temp2 = MulHighWord(val1, val2);
	if(s32Temp2 != 0)
	{
		if(s32Temp2 > 0)
		{
			if(s32Temp1 > 0)
			{
				if(s32Temp1 < 0xFFFFFFFF)
				{
					return (u32)s32Temp1;
				}
				else
				{
					return 0xFFFFFFFF;
				}
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
	else
	{
		if(s32Temp1 > 0)
		{
			if(s32Temp1 < 0xFFFFFFFFU)
			{
				return (u32)s32Temp1;
			}
			else
			{
				return 0xFFFFFFFF;
			}
		}
		else
		{
			return 0;
		}
	}
*/	

}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * u32 = (u32 val1 * u32 val2) with overflow limitation
 *
 * @param[in] val1 First operand. Representable range: 0 to 4294967295.
 * @param[in] val2 Second operand. Representable range: 0 to 4294967295.
 * @return Result of `u32_mul_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_u32(u32 val1, u32 val2)
{
	u32 u32Temp1 = 0;
	if(val2 != 0)
	{
		u32Temp1 = (0xFFFFFFFF/val2);
		if(u32Temp1 < val1)
		{
			return 0xFFFFFFFF;
		}
		else
		{
			return (val1 * val2);
		}
	}
	else
	{
		return 0;
	}
}


//u32 root_u32_mul_u32_u16_fac_less1(u32 value,u16 factor, u32 count)
//{
//	
//}
//
//asm u32 root_u32_mul_u32_u16_fac_less1_Asm(u32 value,u16 factor, u32 count)
//{
//	
//}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u32 by a factor of 0 ... 0.999985 (shift 16 bits to the right) u32 = (u32 * u16) >> 16
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u32_mul_u32_u16_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 16; left shift(s): 16).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_u16_fac1(u32 value, u16 factor)
{
	u32 u32Temp1 = 0, u32Temp2 = 0;
	u32Temp1 = value * factor; 		/* Low word multiplication */
	u32Temp2 = MulHighWord(value, factor);	/* High word multiplication */
	u32Temp1 =  u32Temp1 >> 16;
	u32Temp1 |= u32Temp2 << 16;
	return u32Temp1;
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u32 by a factor of 0 ... 1.99997 (shift 15 bits to the right) with overflow limitation
 * u32 = (u32 * u16) >> 15
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u32_mul_u32_u16_fac2` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 15; left shift(s): 17).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_u16_fac2(u32 value, u16 factor)
{
	u32 u32Temp1 = 0, u32Temp2 = 0;
	u32Temp1 = value * factor; 		/* Low word multiplication */
	u32Temp2 = MulHighWord(value, factor);  /* High word multiplication */
	u32Temp1 = u32Temp1 >> 15;
	u32Temp1 |= u32Temp2 << 17;
	if((u32Temp2>>15) == 0)
	{
		return u32Temp1;
	}
	else
	{
		return 0xFFFFFFFFU;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u32 by a factor of -1 ... 0 ... 0.99997 (shift 15 bits to the right) u32 = (u32 * s16)
 * >> 15
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `u32_mul_u32_s16_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 15; left shift(s): 17).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_s16_fac1(u32 value, s16 factor)
{	
	u32 u32Temp1 = 0, u32Temp2 = 0;
	if(factor > 0)
	{

		u32Temp1 = value * factor; 		/* Low word multiplication */
		u32Temp2 = MulHighWord(value, factor);	/* High word multiplication */
		u32Temp1 = u32Temp1 >> 15;
		u32Temp1 |= u32Temp2 << 17;
		return u32Temp1;
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u32 by a factor of -2 ... 0 ... 1.99993 (shift 14 bits to the right) with overflow
 * limitation u32 = (u32 * s16) >> 14
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `u32_mul_u32_s16_fac2` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 14; left shift(s): 18).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_s16_fac2( u32 value, s16 factor)
{
	u32 u32Temp1 = 0, u32Temp2 = 0;
	if(factor <= 0)
	{
		return 0;
	}
	else
	{
		u32Temp1 = value * factor; 		/* Low word multiplication */
		u32Temp2 = MulHighWord(value, factor);	/* High word multiplication */
		u32Temp1 = u32Temp1 >> 14;
		u32Temp1 |= u32Temp2 << 18;
		if((u32Temp2 >> 14) == 0)
		{
			return u32Temp1;
		}
		else
		{
			return 0xFFFFFFFF;
		}
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u32 by a factor of 0 ... 0.999985 (shift 32 bits to the right) u32 = (u32 * u32) >> 32
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 4294967295.
 * @return Result of `u32_mul_u32_u32_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_u32_fac1(u32 value,u32 factor)
{
	return MulHighWord(value, factor);
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u32 by a factor of 0 ... 1.99997 (shift 31 bits to the right) with overflow limitation
 * u32 = (u32 * u32) >> 31
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 4294967295.
 * @return Result of `u32_mul_u32_u32_fac2` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 31; left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_u32_fac2(u32 value,u32 factor)
{
	u32 u32Temp1 = 0, u32Temp2 = 0;
	u32Temp1 = value * factor; 		/* Low word multiplication */
	u32Temp2 = MulHighWord(value, factor);	/* High word multiplication */
	u32Temp1 = u32Temp1 >> 31;
	u32Temp1 |= u32Temp2 << 1;
	if((u32Temp2>>31) == 0)
	{
		return u32Temp1;
	}
	else
	{
		return 0xFFFFFFFFU;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u32 by a factor of -1 .... 0 ... 0.99999 (shift 31 bits to the right) u32 = (u32 * s32)
 * >> 31
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_mul_u32_s32_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 31; left shift(s): 1).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_s32_fac1(u32 value,s32 factor)
{
	u32 u32Temp1 = 0, u32Temp2 = 0;
	if(factor > 0)
	{
		u32Temp1 = value * factor; 		/* Low word multiplication */
		u32Temp2 = MulHighWord(value, factor);	/* High word multiplication */
		u32Temp1 = u32Temp1 >> 31;
		u32Temp1 |= u32Temp2 << 1;
		return u32Temp1;
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u32 by a factor of -2 .... 0 ... 1.99997 (shift 30 bits to the right) with overflow
 * limitation u32 = (u32 * s32) >> 30
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_mul_u32_s32_fac2` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 30; left shift(s): 2).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_s32_fac2(u32 value,s32 factor)
{
	u32 u32Temp1 = 0, u32Temp2 = 0;
	if(factor <= 0)
	{
		return 0;
	}
	else
	{
		u32Temp1 = value * factor; 		/* Low word multiplication */
		u32Temp2 = MulHighWord(value, factor);	/* High word multiplication */
		u32Temp1 = u32Temp1 >> 30;
		u32Temp1 |= u32Temp2 << 2;
		if((u32Temp2>>30) == 0)
		{
			return u32Temp1;
		}
		else
		{
			return 0xFFFFFFFFU;
		}
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * s32 = (u32 val1 * s32 val2) with underflow and overflow limitation
 *
 * @param[in] val1 First operand. Representable range: 0 to 4294967295.
 * @param[in] val2 Second operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_mul_u32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
s32 s32_mul_u32_s32(u32 val1, s32 val2)
{
	s32 s32Val2prime = 0;
	if(val2 < 0)
	{
		s32Val2prime = -val2;
	}
	if(val2 != 0)
	{
		if(val2 <= 0)
		{
			if((0x80000000 / s32Val2prime) > val1)
			{
				return (val1 * val2);
			}
			else
			{
				return 0x80000000;
			}
		}
		else
		{
			if((0x7FFFFFFF / val2) < val1)
			{
				return 0x7FFFFFFF;
			}
			else
			{
				return (val1 * val2);
			}
		}
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s32 by a factor of 0 ... 0.999985 (shift 16 bits to the right) s32 = (s32 * u16) >> 16
 *
 * @param[in] val1 First operand. Representable range: -2147483648 to 2147483647.
 * @param[in] val2 Second operand. Representable range: 0 to 65535.
 * @return Result of `s32_mul_s32_u16_fac1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 16; left shift(s): 16).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_u16_fac1(s32 val1,u16 val2)
{
	u32 u32Temp1 , u32Temp2,u32Temp3;
	u8 u8SignBit;

	if(val1<0)
	{
		u32Temp1 = -val1;
		u8SignBit = 1;
	}
	else
	{
		u32Temp1 = val1;
		u8SignBit = 0;
	}

	u32Temp2 = u32Temp1 * val2; 		/* Low word multiplication */
	u32Temp3 = MulHighWord(u32Temp1, val2);	/* High word multiplication */
	u32Temp2 = u32Temp2 >> 16;
	u32Temp2 |= u32Temp3 << 16;
	if(u8SignBit == 0)
	{
		return u32Temp2;
	}
	else
	{
		return -u32Temp2;
	}		
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s32 by a factor of 0 ... 1.99997 (shift 15 bits to the right) with overflow limitation
 * s32 = (s32 * u16) >> 15
 *
 * @param[in] val1 First operand. Representable range: -2147483648 to 2147483647.
 * @param[in] val2 Second operand. Representable range: 0 to 65535.
 * @return Result of `s32_mul_s32_u16_fac2` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 15; left shift(s): 17).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_u16_fac2(s32 val1,u16 val2)
{
	u32 u32Temp1 , u32Temp2,u32Temp3;
	u8 u8SignBit;

	if(val1<0)
	{
		u32Temp1 = -val1;
		u8SignBit = 1;
	}
	else
	{
		u32Temp1 = val1;
		u8SignBit = 0;
	}

	u32Temp2 = u32Temp1 * val2; 		/* Low word multiplication */
	u32Temp3 = MulHighWord(u32Temp1, val2);	/* High word multiplication */
	u32Temp2 = u32Temp2 >> 15;
	u32Temp2 |= u32Temp3 << 17;
	if(u8SignBit == 0)
	{
		if(u32Temp2<=0x7FFFFFFF)
			return u32Temp2;
		else
			return 0x7FFFFFFF;
	}
	else
	{
		if(u32Temp2<=0x80000000)
			return -u32Temp2;
		else
			return 0x80000000;
	}		
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply unsigned long by a factor of -0.5 ... 0 ...0.49998 (shift 16 bits to the right) signed
 * long = (signed long * signed int) >> 16 DIRECT FUNCTIONS function: multiply s32 by a factor of
 * -1 .... 0 ... 0.99997 (shift 15 bits to the right) s32 = (s32 * s16) >> 15
 *
 * @param[in] val1 First operand. Representable range: -2147483648 to 2147483647.
 * @param[in] val2 Second operand. Representable range: -32768 to 32767.
 * @return Result of `s32_mul_s32_s16_fac1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 15; left shift(s): 17).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_s16_fac1(s32 val1,s16 val2)
{
	u32 u32Temp1 , u32Temp2,u32Temp3,u32Temp4;
	u8 u8SignBit;

	if(((val1<0) && (val2>0)) || ((val1>0) && (val2<0)))
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}

	if(val1<0)
	{
		u32Temp1 = -val1;
	}
	else
	{
		u32Temp1 = val1;
	}

	if(val2<0)
	{
		u32Temp2 = -val2;
	}
	else
	{
		u32Temp2 = val2;
	}

	u32Temp3 = u32Temp1 * u32Temp2; 		/* Low word multiplication */
	u32Temp4 = MulHighWord(u32Temp1, u32Temp2);	/* High word multiplication */
	u32Temp3 = u32Temp3 >> 15;
	u32Temp3 |= u32Temp4 << 17;
	if(u8SignBit == 0)
	{
		if(u32Temp3<=0x7FFFFFFF)
			return u32Temp3;
		else
			return 0x7FFFFFFF;
	}
	else
	{
		return -u32Temp3;
	}		
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s32 by a factor of -2 ... 0 ... 1.99994 (shift 14 bits to the right) with overflow
 * limitation s32 = (s32 * u16) >> 14
 *
 * @param[in] val1 First operand. Representable range: -2147483648 to 2147483647.
 * @param[in] val2 Second operand. Representable range: -32768 to 32767.
 * @return Result of `s32_mul_s32_s16_fac2` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 14; left shift(s): 18).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_s16_fac2(s32 val1,s16 val2)
{
	u32 u32Temp1 , u32Temp2,u32Temp3,u32Temp4;
	u8 u8SignBit;

	if(((val1<0) && (val2>0)) || ((val1>0) && (val2<0)))
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}

	if(val1<0)
	{
		u32Temp1 = -val1;
	}
	else
	{
		u32Temp1 = val1;
	}

	if(val2<0)
	{
		u32Temp2 = -val2;
	}
	else
	{
		u32Temp2 = val2;
	}

	u32Temp3 = u32Temp1 * u32Temp2; 		/* Low word multiplication */
	u32Temp4 = MulHighWord(u32Temp1, u32Temp2);	/* High word multiplication */
	u32Temp3 = u32Temp3 >> 14;
	u32Temp3 |= u32Temp4 << 18;
	if((u32Temp4>>14)==0)
	{
		if(u8SignBit == 0)
		{
			if(u32Temp3<=0x7FFFFFFF)
				return u32Temp3;
			else
				return 0x7FFFFFFF;
		}
		else
		{
			if(u32Temp3<=0x80000000)
				return -u32Temp3;
			else
				return 0x80000000;
		}		
	}
	else
	{
		return 0x7FFFFFFF;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s32 by a factor of 0 ... 0.999999 (shift 32 bits to the right) s32 = (s32 * u32) >> 32
 *
 * @param[in] val1 First operand. Representable range: -2147483648 to 2147483647.
 * @param[in] val2 Second operand. Representable range: 0 to 4294967295.
 * @return Result of `s32_mul_s32_u32_fac1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_u32_fac1(s32 val1,u32 val2)
{
	u32 u32Temp1 , u32Temp2;
	u8 u8SignBit;

	if(val1<0)
	{
		u32Temp1 = -val1;
		u8SignBit = 1;
	}
	else
	{
		u32Temp1 = val1;
		u8SignBit = 0;
	}

	u32Temp2 = MulHighWord(u32Temp1, val2);	/* High word multiplication */
	if(u8SignBit == 0)
		return u32Temp2;
	else
		return -u32Temp2;
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s32 by a factor of 0 ... 1.99999 (shift 31 bits to the right) with overflow limitation
 * s32 = (s32 * u32) >> 31
 *
 * @param[in] val1 First operand. Representable range: -2147483648 to 2147483647.
 * @param[in] val2 Second operand. Representable range: 0 to 4294967295.
 * @return Result of `s32_mul_s32_u32_fac2` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 31; left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_u32_fac2(s32 val1,u32 val2)
{
	u32 u32Temp1 , u32Temp2,u32Temp3;
	u8 u8SignBit;

	if(val1<0)
	{
		u32Temp1 = -val1;
		u8SignBit = 1;
	}
	else
	{
		u32Temp1 = val1;
		u8SignBit = 0;
	}

	u32Temp2 = u32Temp1 * val2; 		/* Low word multiplication */
	u32Temp3 = MulHighWord(u32Temp1, val2);	/* High word multiplication */
	u32Temp2 = u32Temp2 >> 31;
	u32Temp2 |= u32Temp3 << 1;
	if(u8SignBit == 0)
	{
		if(u32Temp2<=0x7FFFFFFF)
			return u32Temp2;
		else
			return 0x7FFFFFFF;
	}
	else
	{
		if(u32Temp2<=0x80000000)
			return -u32Temp2;
		else
			return 0x80000000;
	}		
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s32 by a factor of 0 ... 0.99999 (shift 31 bits to the right) s32 = (s32 * s32) >> 31
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_mul_s32_s32_fac1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 31; left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_s32_fac1(s32 value, s32 factor)
{
	u32 u32Temp1 , u32Temp2,u32Temp3,u32Temp4;
	u8 u8SignBit;

	if(((value<0) && (factor>0)) || ((value>0) && (factor<0)))
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}

	if(value<0)
	{
		u32Temp1 = -value;
	}
	else
	{
		u32Temp1 = value;
	}

	if(factor<0)
	{
		u32Temp2 = -factor;
	}
	else
	{
		u32Temp2 = factor;
	}

	u32Temp3 = u32Temp1 * u32Temp2; 		/* Low word multiplication */
	u32Temp4 = MulHighWord(u32Temp1, u32Temp2);	/* High word multiplication */
	u32Temp3 = u32Temp3 >> 31;
	u32Temp3 |= u32Temp4 << 1;
	if(u8SignBit == 0)
	{
		if(u32Temp3<=0x7FFFFFFF)
			return u32Temp3;
		else
			return 0x7FFFFFFF;
	}
	else
	{
		return -u32Temp3;
	}		
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s32 by a factor of 0 ... 1.99999 (shift 30 bits to the right) with overflow limitation
 * s32 = (s32 * s32) >> 30
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_mul_s32_s32_fac2` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 30; left shift(s): 2).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_s32_fac2(s32 value, s32 factor)
{
	u32 u32Temp1 , u32Temp2,u32Temp3,u32Temp4;
	u8 u8SignBit;

	if(((value<0) && (factor>0)) || ((value>0) && (factor<0)))
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}

	if(value<0)
	{
		u32Temp1 = -value;
	}
	else
	{
		u32Temp1 = value;
	}

	if(factor<0)
	{
		u32Temp2 = -factor;
	}
	else
	{
		u32Temp2 = factor;
	}

	u32Temp3 = u32Temp1 * u32Temp2; 		/* Low word multiplication */
	u32Temp4 = MulHighWord(u32Temp1, u32Temp2);	/* High word multiplication */
	u32Temp3 = u32Temp3 >> 30;
	u32Temp3 |= u32Temp4 << 2;
	if((u32Temp4>>30)==0)
	{
		if(u8SignBit == 0)
		{
			if(u32Temp3<=0x7FFFFFFF)
				return u32Temp3;
			else
				return 0x7FFFFFFF;
		}
		else
		{
			if(u32Temp3<=0x80000000)
				return -u32Temp3;
			else
				return 0x80000000;
		}		
	}
	else
	{
			return 0x7FFFFFFF;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s32 by a factor of 0 ... 0.996 (shift 8 bits to the right) signed long = (signed long *
 * unsigned char) / 256
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s32_mul_s32_u8_fac1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 8; left shift(s): 24).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_u8_fac1(s32 value, u8 factor)
{
	u32 u32Temp1 , u32Temp2,u32Temp3;
	u8 u8SignBit;

	if(value<0)
	{
		u32Temp1 = -value;
		u8SignBit = 1;
	}
	else
	{
		u32Temp1 = value;
		u8SignBit = 0;
	}

	u32Temp2 = u32Temp1 * factor; 		/* Low word multiplication */
	u32Temp3 = MulHighWord(u32Temp1, factor);	/* High word multiplication */
	u32Temp2 = u32Temp2 >> 8;
	u32Temp2 |= u32Temp3 << 24;
	if(u8SignBit == 0)
	{
		return u32Temp2;
	}
	else
	{
		return -u32Temp2;
	}		
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s32 by a factor of 0 ... 1.9922 (shift 7 bits to the right) with overflow and underflow
 * limitation signed long = (signed long * unsigned char) / 128
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s32_mul_s32_u8_fac2` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 7; left shift(s): 25).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_u8_fac2(s32 value, u8 factor)
{
	u32 u32Temp1 , u32Temp2,u32Temp3;
	u8 u8SignBit;

	if(value<0)
	{
		u32Temp1 = -value;
		u8SignBit = 1;
	}
	else
	{
		u32Temp1 = value;
		u8SignBit = 0;
	}

	u32Temp2 = u32Temp1 * factor; 		/* Low word multiplication */
	u32Temp3 = MulHighWord(u32Temp1, factor);	/* High word multiplication */
	u32Temp2 = u32Temp2 >> 7;
	u32Temp2 |= u32Temp3 << 25;
	if(u8SignBit == 0)
	{
		if(u32Temp2<=0x7FFFFFFF)
			return u32Temp2;
		else
			return 0x7FFFFFFF;
	}
	else
	{
		if(u32Temp2<=0x80000000)
			return -u32Temp2;
		else
			return 0x80000000;
	}		
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * u32 = ((u32 value * u32 factor) >> (32 - power) with overflow limitation
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 4294967295.
 * @param[in] power Input parameter `power`. Representable range: 0 to 255.
 * @return Result of `u32_mul_u32_u32_fac_twopow_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_u32_fac_twopow_u8(u32 value,u32 factor, u8 power)
{
	u32 u32Temp1 = 0, u32Temp2 = 0;
	if(power>=32)
	{	
		power = 31;
	}
	else if(power<1)
	{
		power = 1;
	}
	else
	{
		/* Do nothing */
	}
	u32Temp1 = value * factor; 		/* Low word multiplication */
	u32Temp2 = MulHighWord(value, factor);  /* High word multiplication */
	u32Temp1 = u32Temp1 >> (32-power);
	u32Temp1 |= u32Temp2 << power;
	if((u32Temp2>>(32-power)) == 0)
	{
		return u32Temp1;
	}
	else
	{
		return 0xFFFFFFFFU;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * s32 = ((s32 value * s32 factor) >> (32 - power) with underflow and overflow limitation
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -2147483648 to 2147483647.
 * @param[in] power Input parameter `power`. Representable range: 0 to 255.
 * @return Result of `s32_mul_s32_s32_fac_twopow_u8` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_s32_fac_twopow_u8(s32 value, s32 factor, u8 power)
{
	u32 u32Temp1 , u32Temp2,u32Temp3,u32Temp4;
	u8 u8SignBit;

	if(power>=32)
	{	
		power = 31;
	}
	else if(power<1)
	{
		power = 1;
	}
	else
	{
		/* Do nothing */
	}

	if(((value<0) && (factor>0)) || ((value>0) && (factor<0)))
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}

	if(value<0)
	{
		u32Temp1 = -value;
	}
	else
	{
		u32Temp1 = value;
	}

	if(factor<0)
	{
		u32Temp2 = -factor;
	}
	else
	{
		u32Temp2 = factor;
	}

	u32Temp3 = u32Temp1 * u32Temp2; 		/* Low word multiplication */
	u32Temp4 = MulHighWord(u32Temp1, u32Temp2);	/* High word multiplication */
	u32Temp3 = u32Temp3 >> (32-power);
	u32Temp3 |= u32Temp4 << power;
	if((u32Temp4>>(32-power))==0)
	{
		if(u8SignBit == 0)
		{
			if(u32Temp3<=0x7FFFFFFF)
				return u32Temp3;
			else
				return 0x7FFFFFFF;
		}
		else
		{
			return -u32Temp3;
		}		
	}
	else
	{
		if(u8SignBit == 0)
		{
			return 0x7FFFFFFF;
		}
		else
		{
			return 0x80000000;
		}
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s32 by a factor of -1 .. 0 .. 0.9922 (shift 7 bits to the right) signed long = (signed
 * long * signed char) / 128
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -128 to 127.
 * @return Result of `s32_mul_s32_s8_fac1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 7; left shift(s): 25).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_s8_fac1(s32 value, s8 factor)
{
	u32 u32Temp1 , u32Temp2,u32Temp3,u32Temp4;
	u8 u8SignBit;

	if(((value<0) && (factor>0)) || ((value>0) && (factor<0)))
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}

	if(value<0)
	{
		u32Temp1 = -value;
	}
	else
	{
		u32Temp1 = value;
	}

	if(factor<0)
	{
		u32Temp2 = -factor;
	}
	else
	{
		u32Temp2 = factor;
	}

	u32Temp3 = u32Temp1 * u32Temp2; 		/* Low word multiplication */
	u32Temp4 = MulHighWord(u32Temp1, u32Temp2);	/* High word multiplication */
	u32Temp3 = u32Temp3 >> 7;
	u32Temp3 |= u32Temp4 << 25;
	if(u8SignBit == 0)
	{
		if(u32Temp3<=0x7FFFFFFF)
			return u32Temp3;
		else
			return 0x7FFFFFFF;
	}
	else
	{
		return -u32Temp3;
	}		
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s32 by a factor of -2 .. 0 .. 1.9844 (shift 6 bits to the right) with overflow and
 * underflow limitation signed long = (signed long * signed char) / 64
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -128 to 127.
 * @return Result of `s32_mul_s32_s8_fac2` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 6; left shift(s): 26).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_s8_fac2(s32 value, s8 factor)
{
	u32 u32Temp1 , u32Temp2,u32Temp3,u32Temp4;
	u8 u8SignBit;

	if(((value<0) && (factor>0)) || ((value>0) && (factor<0)))
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}

	if(value<0)
	{
		u32Temp1 = -value;
	}
	else
	{
		u32Temp1 = value;
	}

	if(factor<0)
	{
		u32Temp2 = -factor;
	}
	else
	{
		u32Temp2 = factor;
	}

	u32Temp3 = u32Temp1 * u32Temp2; 		/* Low word multiplication */
	u32Temp4 = MulHighWord(u32Temp1, u32Temp2);	/* High word multiplication */
	u32Temp3 = u32Temp3 >> 6;
	u32Temp3 |= u32Temp4 << 26;
	if((u32Temp4>>6)==0)
	{
		if(u8SignBit == 0)
		{
			if(u32Temp3<=0x7FFFFFFF)
				return u32Temp3;
			else
				return 0x7FFFFFFF;
		}
		else
		{
			if(u32Temp3<=0x80000000)
				return -u32Temp3;
			else
				return 0x80000000;
		}		
	}
	else
	{
		return 0x7FFFFFFF;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * s32 = (s32 val1 * s32 val2) with underflow and overflow limitation
 *
 * @param[in] val1 First operand. Representable range: -2147483648 to 2147483647.
 * @param[in] val2 Second operand. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_mul_s32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_s32(s32 val1, s32 val2)
{
	u32 u32Temp1 , u32Temp2,u32Temp3,u32Temp4;
	u8 u8SignBit;

	if(((val1<0) && (val2>0)) || ((val1>0) && (val2<0)))
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}

	if(val1<0)
	{
		u32Temp1 = -val1;
	}
	else
	{
		u32Temp1 = val1;
	}

	if(val2<0)
	{
		u32Temp2 = -val2;
	}
	else
	{
		u32Temp2 = val2;
	}

	u32Temp3 = u32Temp1 * u32Temp2; 		/* Low word multiplication */
	u32Temp4 = MulHighWord(u32Temp1, u32Temp2);	/* High word multiplication */
	if(u32Temp4==0)
	{
		if(u8SignBit == 0)
		{
			if(u32Temp3<=0x7FFFFFFF)
				return u32Temp3;
			else
				return 0x7FFFFFFF;
		}
		else
		{
			if(u32Temp3<=0x80000000)
				return -u32Temp3;
			else
				return 0x80000000;
		}		
	}
	else
	{
		if(u8SignBit == 0)
		{
			return 0x7FFFFFFF;
		}
		else
		{
			return 0x80000000;
		}		
	}

}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply signed long by a factor of 0 ...0.499999 (shift 33 bits to the right) signed long =
 * (signed long * unsigned long) >> 33
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 4294967295.
 * @return Result of `s32_mul_s32_u32_fac05` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 1).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_u32_fac05(s32 value, u32 factor)
{
	u32 u32Temp1 , u32Temp2;
	u8 u8SignBit;

	if(value<0)
	{
		u32Temp1 = -value;
		u8SignBit = 1;
	}
	else
	{
		u32Temp1 = value;
		u8SignBit = 0;
	}

	u32Temp2 = MulHighWord(u32Temp1, factor);	/* High word multiplication */
	u32Temp2 = u32Temp2 >> 1;
	if(u8SignBit == 0)
	{
		return u32Temp2;
	}
	else
	{
		return -u32Temp2;
	}		
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply signed long by a factor of -0.5.. 0.499 signed long = (signed long * signed long) /
 * 4294967296
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_mul_s32_s32_fac05` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_s32_fac05(s32 value, s32 factor)
{
	u32 u32Temp1 , u32Temp2,u32Temp3;
	u8 u8SignBit;

	if(((value<0) && (factor>0)) || ((value>0) && (factor<0)))
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}

	if(value<0)
	{
		u32Temp1 = -value;
	}
	else
	{
		u32Temp1 = value;
	}

	if(factor<0)
	{
		u32Temp2 = -factor;
	}
	else
	{
		u32Temp2 = factor;
	}

	u32Temp3 = MulHighWord(u32Temp1, u32Temp2);	/* High word multiplication */
	if(u8SignBit == 0)
	{
		return u32Temp3;
	}
	else
	{
		return -u32Temp3;
	}		
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u32 by a factor of 0 ... 0.996 (shift 8 bits to the right) unsigned long = (unsigned
 * long * unsigned char) >> 8
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u32_mul_u32_u8_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 8; left shift(s): 24).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_u8_fac1(u32 value, u8 factor)
{
	u32 u32Temp1 = 0, u32Temp2 = 0;
	u32Temp1 = value * factor; 		/* Low word multiplication */
	u32Temp2 = MulHighWord(value, factor);	/* High word multiplication */
	u32Temp1 =  u32Temp1 >> 8;
	u32Temp1 |= u32Temp2 << 24;
	return u32Temp1;
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u32 by a factor of 0 ... 1.9922 (shift 7 bits to the right) with overflow limitation
 * unsigned long = (unsigned long * unsigned char) >> 7
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u32_mul_u32_u8_fac2` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 7; left shift(s): 25).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_u8_fac2(u32 value, u8 factor)
{
	u32 u32Temp1 = 0, u32Temp2 = 0;
	u32Temp1 = value * factor; 		/* Low word multiplication */
	u32Temp2 = MulHighWord(value, factor);	/* High word multiplication */
	u32Temp1 =  u32Temp1 >> 7;
	u32Temp1 |= u32Temp2 << 25;
	if((u32Temp2>>7) == 0)
	{
		return u32Temp1;
	}
	else
	{
		return 0xFFFFFFFFU;
	}

}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u32 by a factor of -1 .. 0 .. 0.9922 (shift 7 bits to the right) with underflow
 * limitation unsigned long = (unsigned long * signed char) >> 8
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -128 to 127.
 * @return Result of `u32_mul_u32_s8_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 7; left shift(s): 25).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_s8_fac1(u32 value, s8 factor)
{
	u32 u32Temp1 = 0, u32Temp2 = 0;
	if(factor > 0)
	{

		u32Temp1 = value * factor; 		/* Low word multiplication */
		u32Temp2 = MulHighWord(value, factor);	/* High word multiplication */
		u32Temp1 = u32Temp1 >> 7;
		u32Temp1 |= u32Temp2 << 25;
		return u32Temp1;
	}
	else
	{
		return 0;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u32 by a factor of -2 .. 0 ... 1.9844 (shift 7 bits to the right) with overflow and
 * underflow limitation unsigned long = (unsigned long * signed char) >> 6
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -128 to 127.
 * @return Result of `u32_mul_u32_s8_fac2` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 6; left shift(s): 26).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_s8_fac2(u32 value, s8 factor)
{
	u32 u32Temp1 = 0, u32Temp2 = 0;
	if(factor <= 0)
	{
		return 0;
	}
	else
	{
		u32Temp1 = value * factor; 		/* Low word multiplication */
		u32Temp2 = MulHighWord(value, factor);	/* High word multiplication */
		u32Temp1 = u32Temp1 >> 6;
		u32Temp1 |= u32Temp2 << 26;
		if((u32Temp2 >> 6) == 0)
		{
			return u32Temp1;
		}
		else
		{
			return 0xFFFFFFFF;
		}
	}
}


/****************************************************************************/
/* function:  multiply signed int by a factor of -0.125..0.124996           */
/*            (shift 18 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 18                  */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac0125` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_s16_fac0125(s16 value, s16 factor)
{
	return root_s16_mul_s16_s16_fac_less1(value,factor,262144);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -0.25..0.24999             */
/*            (shift 17 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 17                  */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac025` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16  s16_mul_s16_s16_fac025(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_less1(value,factor,131072);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -0.5 ... 0.4999923         */
/*            (shift 16 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 16                  */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac05` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16  s16_mul_s16_s16_fac05(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_less1(value,factor,65536);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -1024 .. 1023.875          */
/*            (shift 5 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 5                   */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac1024` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16  s16_mul_s16_s16_fac1024(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_greater1(value,factor,32);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -128 .. 127.999            */
/*            (shift 8 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 8                   */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac128` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16  s16_mul_s16_s16_fac128(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_greater1(value,factor,256);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -16 .. 15.999              */
/*            (shift 11 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 11                  */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_s16_fac16(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_greater1(value,factor,2048);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -2048 .. 2047.875          */
/*            (shift 4 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 4                   */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac2048` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_s16_fac2048(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_greater1(value,factor,16);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -256 .. 255.999            */
/*            (shift 7 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 7                   */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac256` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_s16_fac256(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_greater1(value,factor,128);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -32 .. 31.999              */
/*            (shift 10 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 10                  */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac32` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_s16_fac32(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_greater1(value,factor,1024);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -4 ... 3.99997             */
/*            (shift 13 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 13                  */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac4` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_s16_fac4(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_greater1(value,factor,8192);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -4096 .. 4095.875          */
/*            (shift 3 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 3                   */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac4096` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_s16_fac4096(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_greater1(value,factor,8);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -512 ... 511.992           */
/*            (shift 6 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 6                   */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac512` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_s16_fac512(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_greater1(value,factor,64);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -64 .. 63.999              */
/*            (shift 9 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 9                   */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac64` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_s16_fac64(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_greater1(value,factor,512);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of -8 ... 7.99988             */
/*            (shift 12 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 12                  */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_fac8` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_s16_fac8(s16 value, s16 factor)
{
	 return root_s16_mul_s16_s16_fac_greater1(value,factor,4096);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ..0.1245                 */
/*            (shift 19 bits to the right)                                  */
/*            signed int = (signed int * unsigned int) >> 19                */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac0125` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac0125(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_less1(value,factor,524288);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 0.24                 */
/*            (shift 18 bits to the right)                                  */
/*            signed int = (signed int * unsigned int) >> 18                */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac025` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac025(s16 value, u16 factor) 
{
	root_s16_mul_s16_u16_fac_less1(value,factor,262144);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 0.49                 */
/*            (shift 17 bits to the right)                                  */
/*            signed int = (signed int * unsigned int) >> 17                */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac05` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac05(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_less1(value,factor,131072);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 1023.999023          */
/*            (shift 6 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 6                 */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac1024` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac1024(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_greater1(value,factor,64);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 127.999023           */
/*            (shift 9 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 9                 */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac128` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac128(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_greater1(value,factor,512);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 15.999756            */
/*            (shift 12 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 12                */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac16(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_greater1(value,factor,4096);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 2047.999023          */
/*            (shift 5 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 5                 */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac2048` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac2048(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_greater1(value,factor,32);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 255.999023           */
/*            (shift 8 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 8                 */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac256` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac256(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_greater1(value,factor,256);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 31.999756            */
/*            (shift 11 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 11                */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac32` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac32(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_greater1(value,factor,2048);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 3.999939             */
/*            (shift 14 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 14                */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac4` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac4(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_greater1(value,factor,16384);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 4095.999023          */
/*            (shift 4  bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 4                 */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac4096` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac4096(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_greater1(value,factor,16);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 511.999023           */
/*            (shift 7 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 7                 */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac512` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac512(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_greater1(value,factor,128);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 63.999023            */
/*            (shift 10 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 10                */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac64` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac64(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_greater1(value,factor,1024);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 7.999939             */
/*            (shift 13 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 13                */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_u16_fac8` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u16_fac8(s16 value, u16 factor)
{
	 return root_s16_mul_s16_u16_fac_greater1(value,factor,8192);
}

/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 0.1245             */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u8_fac0125` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 5).
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u8_fac0125(s16 value, u8 factor)
{
	 return root_s16_mul_s16_u8_fac_less1(value,(u16)((u16)(factor) << 5));
}

/****************************************************************************/
/* function:  multiply   signed int by a factor of 0 ... 0.24               */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u8_fac025` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 6).
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u8_fac025(s16 value, u8 factor)
{
	 return root_s16_mul_s16_u8_fac_less1(value,(u16)((u16)(factor) << 6));
}

/****************************************************************************/
/* function:  multiply   signed int by a factor of 0 ... 0.49               */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u8_fac05` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 7).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u8_fac05(s16 value, u8 factor)
{
	 return root_s16_mul_s16_u8_fac_less1(value,(u16)((u16)(factor) << 7));
}

/****************************************************************************/
/* function:  multiply   s16 by a factor of 0 ... 127.50                    */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u8_fac128` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 7).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u8_fac128(s16 value, u8 factor)
        {
	 return root_s16_mul_s16_u8_fac_greater1(value,(u16)((u16)(factor) <<7));
}

/****************************************************************************/
/* function:  multiply   s16 by a factor of 0 ... 15.9375                   */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u8_fac16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 4).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u8_fac16(s16 value, u8 factor)
        {
	 return root_s16_mul_s16_u8_fac_greater1(value,(u16)((u16)(factor) <<4));
}

/****************************************************************************/
/* function:  multiply   s16 by a factor of 0 ... 31.875                    */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u8_fac32` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 5).
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u8_fac32(s16 value, u8 factor)
        {
	 return root_s16_mul_s16_u8_fac_greater1(value,(u16)((u16)(factor) <<5));
}

/****************************************************************************/
/* function:  multiply   s16 by a factor of 0..3.984                        */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u8_fac4` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 2).
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u8_fac4(s16 value, u8 factor)
        {
	 return root_s16_mul_s16_u8_fac_greater1(value,(u16)((u16)(factor) <<2));
}

/****************************************************************************/
/* function:  multiply   s16 by a factor of 0 ... 63.750                    */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u8_fac64` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 6).
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u8_fac64(s16 value, u8 factor)
        {
	 return root_s16_mul_s16_u8_fac_greater1(value,(u16)((u16)(factor) <<6));
}

/****************************************************************************/
/* function:  multiply   s16 by a factor of 0 ... 7.969                     */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s16_mul_s16_u8_fac8` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 3).
 * @ingroup ecmath_mul
 */
s16 s16_mul_s16_u8_fac8(s16 value, u8 factor)
        {
	 return root_s16_mul_s16_u8_fac_greater1(value,(u16)((u16)(factor) <<3));
}

/****************************************************************************/
/* function:  multiply unsigned long by a factor of -0.5 ... 0 ...0.49998   */
/*            (shift 16 bits to the right)                                  */
/*            signed long = (signed long * signed int) >> 16                */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `s32_mul_s32_s16_fac05` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_s16_fac05(s32 value, s16 factor)
{
	 return root_s32_mul_s32_s16_fac_less1(value,factor,16);//root_s32_mul_s32_s16_fac_less1(value,factor,65536);
}

/****************************************************************************/
/* function:  multiply signed long by a factor of -1.5 .. 0 .. 0.4960       */
/*            (shift 8 bits to the right)                                   */
/*            signed long = (signed long * signed char) / 256               */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -128 to 127.
 * @return Result of `s32_mul_s32_s8_fac05` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_s8_fac05(s32 value, s8 factor)
{
	 return root_s32_mul_s32_s8_fac_less1(value,factor,8);//root_s32_mul_s32_s8_fac_less1(value,factor,256);
}

/****************************************************************************/
/* function:  multiply signed long by a factor of 0 ...0.49999              */
/*            (shift 17 bits to the right)                                  */
/*            signed long = (signed long * unsigned int) >> 19              */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `s32_mul_s32_u16_fac05` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_u16_fac05(s32 value, u16 factor)
{
	 return root_s32_mul_s32_u16_fac_less1(value,factor,17);//root_s32_mul_s32_u16_fac_less1(value,factor,131072);
}

/****************************************************************************/
/* function:  multiply signed long by a factor of 0 ...0.4980               */
/*            (shift 9 bits to the right)                                   */
/*            signed long = (signed long * unsigned char) / 512             */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s32_mul_s32_u8_fac05` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s32 s32_mul_s32_u8_fac05(s32 value, u8 factor)
{
	 return root_s32_mul_s32_u8_fac_less1(value,factor,9);//root_s32_mul_s32_u8_fac_less1(value,factor,512);
}

/****************************************************************************/
/* function:  multiply s8 by a factor of 0..0.1245                          */
/*            (shift 11 bits to the right)                                  */
/*            s8 = (s8 * u8) >> 11                                          */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s8_mul_s8_u8_fac0125` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (left shift(s): 5).
 * @ingroup ecmath_mul
 */
s8 s8_mul_s8_u8_fac0125(s8 value, u8 factor)
{
	 return root_s8_mul_s8_u8_fac_less1(value,(u16)((u16)(factor) <<5));
}

/****************************************************************************/
/* function:  multiply s8 by a factor of 0..0.249                           */
/*            (shift 10 bits to the right)                                  */
/*            s8 = (s8 * u8) >> 10                                          */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s8_mul_s8_u8_fac025` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (left shift(s): 6).
 * @ingroup ecmath_mul
 */
s8 s8_mul_s8_u8_fac025(s8 value, u8 factor)
        {
	 return root_s8_mul_s8_u8_fac_less1(value,(u16)((u16)(factor) <<6));
}

/****************************************************************************/
/* function:  multiply s8 by a factor of 0..0.498                           */
/*            (shift 9  bits to the right)                                  */
/*            s8 = (s8 * u8) >> 9                                           */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s8_mul_s8_u8_fac05` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (left shift(s): 7).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s8 s8_mul_s8_u8_fac05(s8 value, u8 factor)
        {
	 return root_s8_mul_s8_u8_fac_less1(value,(u16)((u16)(factor) <<7));
}

/****************************************************************************/
/* function:  multiply s8 by a factor of 0..127.50                          */
/*            (shift 1 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 1                                           */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s8_mul_s8_u8_fac128` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (left shift(s): 7).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s8 s8_mul_s8_u8_fac128(s8 value, u8 factor)
        {
	 return root_s8_mul_s8_u8_fac_greater1(value,(u16)((u16)(factor) <<7));
}

/****************************************************************************/
/* function:  multiply s8 by a factor of 0..15.9375                         */
/*            (shift 4 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 4                                           */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s8_mul_s8_u8_fac16` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (left shift(s): 4).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
s8 s8_mul_s8_u8_fac16(s8 value, u8 factor)
        {
	 return root_s8_mul_s8_u8_fac_greater1(value,(u16)((u16)(factor) <<4));
}

/****************************************************************************/
/* function:  multiply s8 by a factor of 0..31.875                          */
/*            (shift 3 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 3                                           */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s8_mul_s8_u8_fac32` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (left shift(s): 5).
 * @ingroup ecmath_mul
 */
s8 s8_mul_s8_u8_fac32(s8 value, u8 factor)
        {
	 return root_s8_mul_s8_u8_fac_greater1(value,(u16)((u16)(factor) <<5));
}

/****************************************************************************/
/* function:  multiply s8 by a factor of 0..3.984                           */
/*            (shift 6 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 6                                           */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s8_mul_s8_u8_fac4` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (left shift(s): 2).
 * @ingroup ecmath_mul
 */
s8 s8_mul_s8_u8_fac4(s8 value, u8 factor)
        {
	 return root_s8_mul_s8_u8_fac_greater1(value,(u16)((u16)(factor) <<2));
}

/****************************************************************************/
/* function:  multiply s8 by a factor of 0..63.750                          */
/*            (shift 2 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 2                                           */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s8_mul_s8_u8_fac64` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (left shift(s): 6).
 * @ingroup ecmath_mul
 */
s8 s8_mul_s8_u8_fac64(s8 value, u8 factor)
        {
	 return root_s8_mul_s8_u8_fac_greater1(value,(u16)((u16)(factor) <<6));
}

/****************************************************************************/
/* function:  multiply s8 by a factor of 0..7.969                           */
/*            (shift 5 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 5                                           */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `s8_mul_s8_u8_fac8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @note The implementation uses integer bit scaling (left shift(s): 3).
 * @ingroup ecmath_mul
 */
s8 s8_mul_s8_u8_fac8(s8 value, u8 factor)
        {
	 return root_s8_mul_s8_u8_fac_greater1(value,(u16)((u16)(factor) <<3));
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ...524288              */
/*            (shift 19 bits to the right)                                  */
/*            unsigned int = (unsigned int * unsigned int) >> 19            */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac0125` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac0125(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_less1(value,factor,524288);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ...262144              */
/*            (shift 18 bits to the right)                                  */
/*            unsigned int = (unsigned int * unsigned int) >> 18            */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac025` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac025(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_less1(value,factor,262144);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ...131072             */
/*            (shift 17 bits to the right)                                  */
/*            unsigned int = (unsigned int * unsigned int) >> 17            */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac05` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac05(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_less1(value,factor,131072);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 1023.9960938       */
/*            (division by  40 H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) /  40 H          */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac1024` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac1024( u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_greater1(value,factor,64);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0..127.50                */
/*            (division by 100 H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) / 100 H          */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac128` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac128(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_greater1(value,factor,512);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 15.99975586        */
/*            (division by 1000H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) / 1000 H         */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac16(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_greater1(value,factor,4096);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 1023.9960938       */
/*            (division by  20 H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) /  20 H          */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac2048` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac2048(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_greater1(value,factor,32);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 255.9960938        */
/*            (division by 100 H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) / 100 H          */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac256` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac256(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_greater1(value,factor,256);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 31.99975586        */
/*            (division by  800H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) /  800 H         */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac32` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac32(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_greater1(value,factor,2048);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 3.999938965        */
/*            (shift 14 bits to the right) with overflow limitation         */
/*            unsigned int = (unsigned int * unsigned int) >> 14            */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac4` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac4(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_greater1(value,factor,16384);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 4095.9375          */
/*            (shift 4 bits to the right) with overflow limitation          */
/*            unsigned int = (unsigned int * unsigned int) >> 4             */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac4096` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac4096(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_greater1(value,factor,16);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 511.9960938        */
/*            (division by  80 H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) /  80 H          */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac512` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac512(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_greater1(value,factor,128);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 63.999023          */
/*            (shift 10 bits to the right) with overflow limitation         */
/*            unsigned int = (unsigned int * unsigned int) >> 10            */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac64` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac64(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_greater1(value,factor,1024);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 7.99987793         */
/*            (division by 2000H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) / 2000 H         */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_fac8` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u16_fac8(u16 value, u16 factor)
{
	 return root_u16_mul_u16_u16_fac_greater1(value,factor,8192);
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 0.1245             */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u16_mul_u16_u8_fac0125` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 5).
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u8_fac0125(u16 x_value, u8 y_value)
       {
	 return root_u16_mul_u16_u8_fac_less1(x_value,(u16)((u16)(y_value) << 5));
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 0.24               */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u16_mul_u16_u8_fac025` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 6).
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u8_fac025(u16 x_value, u8 y_value)
       {
	 return root_u16_mul_u16_u8_fac_less1(x_value,(u16)((u16)(y_value) << 6));
}

/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 0.49               */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u16_mul_u16_u8_fac05` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 7).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u8_fac05(u16 x_value, u8 y_value)
       {
	 return root_u16_mul_u16_u8_fac_less1(x_value,(u16)((u16)(y_value) << 7));
}

/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ... 127.98046                   */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u16_mul_u16_u8_fac128` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 7).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u8_fac128(u16 x_value, u8 y_value)
        {
	 return root_u16_mul_u16_u8_fac_greater_1(x_value,(u16)((u16)(y_value) << 7));
}

/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ... 15.9375                     */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u16_mul_u16_u8_fac16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 4).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u8_fac16(u16 x_value, u8 y_value)
        {
	 return root_u16_mul_u16_u8_fac_greater_1(x_value,(u16)((u16)(y_value) << 4));
}

/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ...31.99975586                  */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u16_mul_u16_u8_fac32` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 5).
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u8_fac32(u16 x_value, u8 y_value)
        {
	 return root_u16_mul_u16_u8_fac_greater_1(x_value,(u16)((u16)(y_value) << 5));
}

/****************************************************************************/
/* function:  multiply u16 by a factor of 0..3.998                          */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u16_mul_u16_u8_fac4` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 2).
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u8_fac4(u16 x_value, u8 y_value)
        {
	 return root_u16_mul_u16_u8_fac_greater_1(x_value,(u16)((u16)(y_value) << 2));
}

/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ... 63.999023                   */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 65535.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 255.
 * @return Result of `u16_mul_u16_u8_fac64` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 6).
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u8_fac64(u16 x_value, u8 y_value)
        {
	 return root_u16_mul_u16_u8_fac_greater_1(x_value,(u16)((u16)(y_value) << 6));
}

/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ... 7.968                       */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] x_value First arithmetic operand.
 * @param[in] y_value Second arithmetic operand.
 * @return Result of `u16_mul_u16_u8_fac8` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 3).
 * @ingroup ecmath_mul
 */
u16 u16_mul_u16_u8_fac8(u16 x_value, u8 y_value)
        {
	 return root_u16_mul_u16_u8_fac_greater_1(x_value,(u16)((u16)(y_value) << 3));
}

/****************************************************************************/
/* function:  multiply unsigned long by a factor of -0.5... 0 ... 0.4999923 */
/*            (shift 16 bits to the right)                                  */
/*            unsigned long = (unsigned long * unsigned int >> 16           */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @return Result of `u32_mul_u32_s16_fac05` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_s16_fac05(u32 value, s16 factor)
{
	 return root_u32_mul_u32_s16_fac_less1(value,factor,15);
}

/******************************************************************************/
/* function:  multiply unsigned long by a factor of -0.5... 0 ... 0.49999     */
/*            (shift 32 bits to the right)                                    */
/*            unsigned long = (unsigned long * signed long) >> 32             */
/******************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_mul_u32_s32_fac05` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_s32_fac05(u32 value, s32 factor)
{
	 return root_u32_mul_u32_s32_fac_less1(value,factor,32);
}

/****************************************************************************/
/* function:  multiply unsigned long by a factor of -0.5 .. 0 ...0.4960     */
/*            (shift 8 bits to the right) with underflow limitation         */
/*            unsigned long = (unsigned long * signed char) >> 8            */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -128 to 127.
 * @return Result of `u32_mul_u32_s8_fac05` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_s8_fac05(u32 value, s8 factor)
{
	 return root_u32_mul_u32_s8_fac_less1(value,factor,8);
}

/****************************************************************************/
/* function:  multiply unsigned long by a factor of 0 ...0.49999            */
/*            (shift 17 bits to the right)                                  */
/*            unsigned long = (unsigned long * unsigned int) >> 17          */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @return Result of `u32_mul_u32_u16_fac05` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_u16_fac05(u32 value, u16 factor)
{
	 return root_u32_mul_u32_u16_fac_less1(value,factor,17);
}

/****************************************************************************/
/* function:  multiply unsigned long by a factor of 0 ...0.49999            */
/*            (shift 33 bits to the right)                                  */
/*            unsigned long = (unsigned long * unsigned long) >> 33         */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 4294967295.
 * @return Result of `u32_mul_u32_u32_fac05` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_u32_fac05(u32 value, u32 factor)
{
	 return root_u32_mul_u32_u32_fac_less1(value,factor,33);
}

/****************************************************************************/
/* function:  multiply unsigned long by a factor of 0 ...0.4980             */
/*            (shift 9 bits to the right)                                   */
/*            unsigned long = (unsigned long * unsigned char) >> 9          */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u32_mul_u32_u8_fac05` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u32 u32_mul_u32_u8_fac05(u32 value, u8 factor)
{
	 return root_u32_mul_u32_u8_fac_less1(value,factor,9);
}

/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..0.1245               */
/*            (shift 11 bits to the right)                                  */
/*            unsigned char = high char of the 11 bit value (u8 - u8)       */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u8_mul_u8_u8_fac0125` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_mul
 */
u8 u8_mul_u8_u8_fac0125(u8 value, u8 factor)
{
	 return root_u8_mul_u8_u8_fac_less1(value,factor,2048);
}

/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..0.249                */
/*            (shift 10 bits to the right)                                  */
/*            unsigned char = high char of the 10 bit value (u8 - u8)       */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u8_mul_u8_u8_fac025` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_mul
 */
u8 u8_mul_u8_u8_fac025(u8  value, u8 factor)
{
	 return root_u8_mul_u8_u8_fac_less1(value,factor,1024);
}

/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..0.498                */
/*            (shift 9 bits to the right)                                   */
/*            unsigned char = high char of the 9 bit value (u8 - u8)        */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u8_mul_u8_u8_fac05` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u8 u8_mul_u8_u8_fac05(u8 value, u8 factor)
{
	 return root_u8_mul_u8_u8_fac_less1(value,factor,512);
}

/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..127.488              */
/*            (shift 1 bits to the right) with overflow limitation          */
/*            unsigned char = (unsigned char * unsigned char) >>  1         */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u8_mul_u8_u8_fac128` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u8 u8_mul_u8_u8_fac128(u8  value, u8 factor)
{
	 return root_u8_mul_u8_u8_fac_greater1(value,factor,2);
}

/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..15.936               */
/*            (shift 4 bits to the right) with overflow limitation          */
/*            unsigned char = (unsigned char * unsigned char) >>  4         */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u8_mul_u8_u8_fac16` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_mul
 */
u8 u8_mul_u8_u8_fac16(u8 value, u8 factor)
{
	 return root_u8_mul_u8_u8_fac_greater1(value,factor,16);
}

/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..31.872               */
/*            (shift 3 bits to the right) with overflow limitation          */
/*            unsigned char = (unsigned char * unsigned char) >>  3         */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u8_mul_u8_u8_fac32` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_mul
 */
u8 u8_mul_u8_u8_fac32(u8 value, u8 factor)
{
	 return root_u8_mul_u8_u8_fac_greater1(value,factor,8);
}

/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..3.984                */
/*            (shift 6 bits to the right) with overflow limitation          */
/*            unsigned char = (unsigned char * unsigned char) >>  6         */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u8_mul_u8_u8_fac4` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_mul
 */
u8 u8_mul_u8_u8_fac4(u8 value, u8 factor)
{
	 return root_u8_mul_u8_u8_fac_greater1(value,factor,64);
}

/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..63.744               */
/*            (shift 2 bits to the right) with overflow limitation          */
/*            unsigned char = (unsigned char * unsigned char) >>  2         */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u8_mul_u8_u8_fac64` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_mul
 */
u8 u8_mul_u8_u8_fac64(u8 value,u8 factor)
{
	 return root_u8_mul_u8_u8_fac_greater1(value,factor,4);
}

/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..7.968                */
/*            (shift 5 bits to the right) with overflow limitation          */
/*            unsigned char = (unsigned char * unsigned char) >>  5         */
/****************************************************************************/

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @return Result of `u8_mul_u8_u8_fac8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_mul
 */
u8 u8_mul_u8_u8_fac8(u8 value, u8 factor)
{
	 return root_u8_mul_u8_u8_fac_greater1(value,factor,32);
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 4294967295.
 * @return Result of `root_s32_mul_s32_s16_fac_less1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_mul
 */
s32 root_s32_mul_s32_s16_fac_less1(s32 value, s16 factor, u32 count)
{
	u32 u32Temp1 , u32Temp2,u32Temp3,u32Temp4;
	u8 u8SignBit;

	if(((value<0) && (factor>0)) || ((value>0) && (factor<0)))
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}

	if(value<0)
	{
		u32Temp1 = -value;
	}
	else
	{
		u32Temp1 = value;
	}

	if(factor<0)
	{
		u32Temp2 = -factor;
	}
	else
	{
		u32Temp2 = factor;
	}

	u32Temp3 = u32Temp1 * u32Temp2; 		/* Low word multiplication */
	u32Temp4 = MulHighWord(u32Temp1, u32Temp2);	/* High word multiplication */
	u32Temp3 = u32Temp3 >> count;
	u32Temp3 |= u32Temp4 << (32-count);
	if((u32Temp4>>count)==0)
	{
		if(u8SignBit == 0)
		{
			if(u32Temp3<=0x7FFFFFFF)
				return u32Temp3;
			else
				return 0x7FFFFFFF;
		}
		else
		{
			if(u32Temp3<=0x80000000)
				return -u32Temp3;
			else
				return 0x80000000;
		}		
	}
	else
	{
		return 0x7FFFFFFF;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 65535.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 4294967295.
 * @return Result of `root_s32_mul_s32_u16_fac_less1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_mul
 */
s32 root_s32_mul_s32_u16_fac_less1(s32 value,u16 factor, u32 count)
{
	u32 u32Temp1 , u32Temp2,u32Temp3,u32Temp4;
	u8 u8SignBit;

	if(((value<0) && (factor>0)) || ((value>0) && (factor<0)))
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}

	if(value<0)
	{
		u32Temp1 = -value;
	}
	else
	{
		u32Temp1 = value;
	}

	if(factor<0)
	{
		u32Temp2 = -factor;
	}
	else
	{
		u32Temp2 = factor;
	}

	u32Temp3 = u32Temp1 * u32Temp2; 		/* Low word multiplication */
	u32Temp4 = MulHighWord(u32Temp1, u32Temp2);	/* High word multiplication */
	u32Temp3 = u32Temp3 >> count;
	u32Temp3 |= u32Temp4 << (32-count);
	if((u32Temp4>>count)==0)
	{
		if(u8SignBit == 0)
		{
			if(u32Temp3<=0x7FFFFFFF)
				return u32Temp3;
			else
				return 0x7FFFFFFF;
		}
		else
		{
			if(u32Temp3<=0x80000000)
				return -u32Temp3;
			else
				return 0x80000000;
		}		
	}
	else
	{
		return 0x7FFFFFFF;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -128 to 127.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 4294967295.
 * @return Result of `root_s32_mul_s32_s8_fac_less1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_mul
 */
s32 root_s32_mul_s32_s8_fac_less1(s32 value, s8 factor, u32 count)
{
	u32 u32Temp1 , u32Temp2,u32Temp3,u32Temp4;
	u8 u8SignBit;

	if(((value<0) && (factor>0)) || ((value>0) && (factor<0)))
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}

	if(value<0)
	{
		u32Temp1 = -value;
	}
	else
	{
		u32Temp1 = value;
	}

	if(factor<0)
	{
		u32Temp2 = -factor;
	}
	else
	{
		u32Temp2 = factor;
	}

	u32Temp3 = u32Temp1 * u32Temp2; 		/* Low word multiplication */
	u32Temp4 = MulHighWord(u32Temp1, u32Temp2);	/* High word multiplication */
	u32Temp3 = u32Temp3 >> count;
	u32Temp3 |= u32Temp4 << (32-count);
	if((u32Temp4>>count)==0)
	{
		if(u8SignBit == 0)
		{
			if(u32Temp3<=0x7FFFFFFF)
				return u32Temp3;
			else
				return 0x7FFFFFFF;
		}
		else
		{
			if(u32Temp3<=0x80000000)
				return -u32Temp3;
			else
				return 0x80000000;
		}		
	}
	else
	{
		return 0x7FFFFFFF;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -32768 to 32767.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 4294967295.
 * @return Result of `root_u32_mul_u32_s16_fac_less1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_mul
 */
u32 root_u32_mul_u32_s16_fac_less1(u32 value,s16 factor, u32 count)
{
	u32 u32Temp1 , u32Temp2,u32Temp3;
	u8 u8SignBit;

	if(factor<0)
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}


	if(factor<0)
	{
		u32Temp1 = -factor;
	}
	else
	{
		u32Temp1 = factor;
	}

	u32Temp2 = value * u32Temp1; 		/* Low word multiplication */
	u32Temp3 = MulHighWord(value, u32Temp1);	/* High word multiplication */
	u32Temp2 = u32Temp2 >> count;
	u32Temp2 |= u32Temp3 << (32-count);
	if((u32Temp3>>count)==0)
	{
		if(u8SignBit == 0)
		{
			if(u32Temp3<=0x7FFFFFFF)
				return u32Temp2;
			else
				return 0x7FFFFFFF;
		}
		else
		{
			return 0;
		}		
	}
	else
	{
		return 0x7FFFFFFF;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -2147483648 to 2147483647.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 4294967295.
 * @return Result of `root_u32_mul_u32_s32_fac_less1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_mul
 */
u32 root_u32_mul_u32_s32_fac_less1(u32 value, s32 factor, u32 count)
{
	u32 u32Temp1 , u32Temp2;
	u8 u8SignBit;

	if(factor<0)
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}


	if(factor<0)
	{
		u32Temp1 = -factor;
	}
	else
	{
		u32Temp1 = factor;
	}

	u32Temp2 = MulHighWord(value, u32Temp1);	/* High word multiplication */
	u32Temp2 = u32Temp2 >> (count-32);
	if(u8SignBit == 0)
	{
		return u32Temp2;
	}
	else
	{
		return 0;
	}		
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 4294967295.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 4294967295.
 * @return Result of `root_u32_mul_u32_u32_fac_less1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_mul
 */
u32 root_u32_mul_u32_u32_fac_less1(u32 value,u32 factor, u32 count)
{
	u32 u32Temp1 , u32Temp2,u32Temp3,u32Temp4;
	u8 u8SignBit;

	u32Temp1 = MulHighWord(value, factor);	/* High word multiplication */
	u32Temp1 = u32Temp1 >> (count-32);
	return u32Temp1;
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: -128 to 127.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 4294967295.
 * @return Result of `root_u32_mul_u32_s8_fac_less1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_mul
 */
u32 root_u32_mul_u32_s8_fac_less1(u32 value, s8 factor, u32 count)
{
	u32 u32Temp1 , u32Temp2,u32Temp3;
	u8 u8SignBit;

	if(factor<0)
	{
		u8SignBit = 1;
	}	
	else
	{
		u8SignBit = 0;
	}


	if(factor<0)
	{
		u32Temp1 = -factor;
	}
	else
	{
		u32Temp1 = factor;
	}

	u32Temp2 = value * u32Temp1; 		/* Low word multiplication */
	u32Temp3 = MulHighWord(value, u32Temp1);	/* High word multiplication */
	u32Temp2 = u32Temp2 >> count;
	u32Temp2 |= u32Temp3 << (32-count);
	if((u32Temp3>>count)==0)
	{
		if(u8SignBit == 0)
		{
			if(u32Temp3<=0x7FFFFFFF)
				return u32Temp2;
			else
				return 0x7FFFFFFF;
		}
		else
		{
			return 0;
		}		
	}
	else
	{
		return 0x7FFFFFFF;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 4294967295.
 * @return Result of `root_u32_mul_u32_u8_fac_less1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_mul
 */
u32 root_u32_mul_u32_u8_fac_less1(u32 value, u8 factor, u32 count)
{
	u32 u32Temp1 , u32Temp2;

	u32Temp1 = value * factor; 		/* Low word multiplication */
	u32Temp2 = MulHighWord(value, factor);	/* High word multiplication */
	u32Temp1 = u32Temp1 >> count;
	u32Temp1 |= u32Temp2 << (32-count);
	if((u32Temp2>>count)==0)
	{
		if(u32Temp2<=0x7FFFFFFF)
			return u32Temp1;
		else
			return 0x7FFFFFFF;
	}
	else
	{
		return 0x7FFFFFFF;
	}
}

/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * Multiplies integer operands using the function-specific fixed-point scaling and limitation
 * rules.
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] factor Fixed-point multiplication factor. Representable range: 0 to 255.
 * @param[in] count Shift, exponent, or iteration count used by the operation. Representable range: 0 to 4294967295.
 * @return Result of `root_s32_mul_s32_u8_fac_less1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_mul
 */
s32 root_s32_mul_s32_u8_fac_less1(s32 value, u8 factor, u32 count)
{
	u32 u32Temp1 , u32Temp2,u32Temp3;
	u8 u8SignBit;

	if(value<0)
	{
		u8SignBit = 1;
		u32Temp1 = -value;
	}	
	else
	{
		u8SignBit = 0;
		u32Temp1 = value;
	}

	u32Temp2 = u32Temp1 * factor;		/* Low word multiplication */
	u32Temp3 = MulHighWord(u32Temp1,factor);	/* High word multiplication */
	u32Temp2 = u32Temp2 >> count;
	u32Temp2 |= u32Temp3 << (32-count);
	if((u32Temp3>>count)==0)
	{
		if(u8SignBit == 0)
		{
			if(u32Temp3<=0x7FFFFFFF)
				return u32Temp2;
			else
				return 0x7FFFFFFF;
		}
		else
		{
			if(u32Temp3<=0x80000000)
			{
				return -u32Temp2;
			}
			else
			{
				return 0x80000000;
			}
		}		
	}
	else
	{
		if(u8SignBit == 0)
		{
			return 0x7FFFFFFF;
		}
		else
		{
			return 0x80000000;
		}		
	}
}

/** @} */ /* end of ecmath_mul */
