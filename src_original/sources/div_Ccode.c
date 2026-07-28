/**
 * @file div_Ccode.c
 * @brief Integer and fixed-point division routines.
 *
 * @details
 * C-only ECMath implementation prepared for formal analysis with Frama-C/EVA. Assembly
 * implementations were removed, while the executable C statements were retained. Function-level
 * documentation was reconstructed from the legacy `ecmath.h` contract and checked against the
 * corresponding implementation.
 *
 * @note Documentation edition: EVA C-only Doxygen v2.
 * @note The documentation pass does not intentionally change executable C statements.
 * @defgroup ecmath_div Integer and fixed-point division routines
 * @{
 */

/*
 * ASM_FUNCs.c
 *  Created on: Dec 12, 2019
 *      Author: ng104383
 */
#include "div_Ccode.h"
#include "MulHword.h"


//u64 div64(u64 a_lo, u64 a_hi, u64 b, u64 &r)
//u64 div64(u64 a,u64 b1, u64 c, u64 d)
//
//{
//	u64 p_lo, a_lo,a_hi, b, r;
//	u64 p_hi;
//	u64 q = 0;
//	a_lo = a;
//	a_hi = b1;
//	b = c;
//	r = d;
//    auto r_hi = a;
//    auto r_lo = b1;
//    
//    int s = 0;
//    if(0 == (b >> 63)){
//
//        // Normalize so quotient estimates are
//        // no more than 2 in error.
//
//        // Note: If any bits get shifted out of
//        // r_hi at this point, the result would
//        // overflow.
//
//        s = 63 - bsr(b);
//        const auto t = 64 - s;
//
//        b <<= s;
//        r_hi = (r_hi << s)|(r_lo >> t);
//        r_lo <<= s;
//    }
//
//    const auto b_hi = b >> 32;
//
//    /*
//    The first full-by-half division places b
//    across r_hi and r_lo, making the reduction
//    step a little complicated.
//
//    To make this easier, u_hi and u_lo will hold
//    a shifted image of the remainder.
//
//    [u_hi||    ][u_lo||    ]
//          [r_hi||    ][r_lo||    ]
//                [ b  ||    ]
//    [p_hi||    ][p_lo||    ]
//                  |
//                  V
//                [q_hi||    ]
//    */
//
//    auto q_hat = r_hi / b_hi;
//
//    p_lo = mul(b, q_hat, p_hi);
//
//    const auto u_hi = r_hi >> 32;
//    const auto u_lo = (r_hi << 32)|(r_lo >> 32);
//
//    // r -= b*q_hat
//    //
//    // At most 2 iterations of this...
//    while(
//        (p_hi > u_hi) ||
//        ((p_hi == u_hi) && (p_lo > u_lo))
//        )
//    {
//        if(p_lo < b){
//            --p_hi;
//        }
//        p_lo -= b;
//        --q_hat;
//    }
//
//    auto w_lo = (p_lo << 32);
//    auto w_hi = (p_hi << 32)|(p_lo >> 32);
//
//    if(w_lo > r_lo){
//        ++w_hi;
//    }
//
//    r_lo -= w_lo;
//    r_hi -= w_hi;
//
//    q = q_hat << 32;
//
//    /*
//    The lower half of the quotient is easier,
//    as b is now aligned with r_lo.
//
//          |r_hi][r_lo||    ]
//                [ b  ||    ]
//    [p_hi||    ][p_lo||    ]
//                        |
//                        V
//                [q_hi||q_lo]
//    */
//
//    q_hat = ((r_hi << 32)|(r_lo >> 32)) / b_hi;
//
//    p_lo = mul(b, q_hat, p_hi);
//
//    // r -= b*q_hat
//    //
//    // ...and at most 2 iterations of this.
//    while(
//        (p_hi > r_hi) ||
//        ((p_hi == r_hi) && (p_lo > r_lo))
//        )
//    {
//        if(p_lo < b){
//            --p_hi;
//        }
//        p_lo -= b;
//        --q_hat;
//    }
//
//    r_lo -= p_lo;
//
//    q |= q_hat;
//
//    r = r_lo >> s;
//
//    return q;
//}


{

}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide s16 by s16 with overflow limitation s16 = (s16 << 16) / s16
 *
 * @param[in] numerator Dividend (numerator). Representable range: -32768 to 32767.
 * @param[in] denominator Divisor (denominator). Representable range: -32768 to 32767.
 * @return Result of `s16_fac05_div_s16_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 1, 16).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
s16 s16_fac05_div_s16_s16(s16 numerator, s16  denominator)
{
	s32 s32Temp1,s32Temp2;
	s32Temp1 = numerator<<16;

	if (denominator ==0)
	{
		if (numerator < 0)
		{
			return -0x8000;
		}
		else
		{
			return 0x7FFF;
		}
	}
	else
	{
		if (s32Temp1 != 0x80000000)
		{	
			s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;
			s32Temp1 = s32Temp2/denominator;
			s32Temp1 = s32Temp1 +((numerator<<16)/denominator);
			if(s32Temp1 < 0x7FFF)
			{
				if(s32Temp1 > -0x8000)
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
		else
		{
			if(denominator != -1)
			{
				s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;
				s32Temp1 = s32Temp2/denominator;
				s32Temp1 = s32Temp1 +((numerator<<16)/denominator);
				if(s32Temp1 < 0x7FFF)
				{
					if(s32Temp1 > -0x8000)
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
			else
			{
				return 0x7FFF;
			}
		}
	}
}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide s32 by s16 with overflow and underflow limitation s16 = s32 / s16
 *
 * @param[in] numerator Dividend (numerator). Representable range: -2147483648 to 2147483647.
 * @param[in] denominator Divisor (denominator). Representable range: -32768 to 32767.
 * @return Result of `s16_div_s32_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
s16 s16_div_s32_s16(s32 numerator, s16  denominator)
{
	s32 s32Temp1=0,s32Temp2=0;
	s32Temp1 = numerator;
	if(denominator == 0)
	{
		if (numerator < 0)
		{
			return -0x8000;
		}
		else
		{
			return 0x7FFF;
		}
	}
	else
	{
		if(numerator != 0x80000000)
		{
			s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;
			s32Temp1 = s32Temp2/denominator;
			s32Temp1 = s32Temp1 +((numerator)/denominator);
			if(s32Temp1 < 0x7FFF)
			{
				if(s32Temp1 > -0x8000)
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
		else
		{
			if(denominator != -1)
			{
				s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;
				s32Temp1 = s32Temp2/denominator;
				s32Temp1 = s32Temp1 +((numerator)/denominator);
				if(s32Temp1 < 0x7FFF)
				{
					if(s32Temp1 > -0x8000)
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
			else
			{
				return 0x7FFF;
			}

		}
	}

}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide s16 by u16 with overflow limitation s16 = (s16 << 16) / u16
 *
 * @param[in] numerator Dividend (numerator). Representable range: -32768 to 32767.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 65535.
 * @return Result of `s16_fac05_div_s16_u16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 1, 16).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @warning `denominator` must be nonzero before a native C division or remainder operation is reached.
 * @ingroup ecmath_div
 */
s16 s16_fac05_div_s16_u16(s16 numerator, u16  denominator)
{
	u16 u16Temp1;
	s32 s32Temp1,s32Temp2;
	u16Temp1 = denominator & 0xFFFF;
	s32Temp1 = numerator<<16;
	if(u16Temp1 == 0)
	{
		if (numerator < 0)
		{
			return -0x8000;
		}
		else
		{
			return 0x7FFF;
		}
	}
	else
	{
		s32Temp1 = (numerator<<16)-((numerator<<16)/u16Temp1)*u16Temp1;
		s32Temp2 = s32Temp1<<1;
		s32Temp1 = s32Temp2/u16Temp1;
		s32Temp1 = ((numerator<<16)/u16Temp1) + s32Temp1;
		if(s32Temp1 < 0x7FFF)
		{
			if(s32Temp1 > -0x8000)
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
}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide s16 by u16 (without shifting!) with overflow and underflow limitation s16 = s16 / u16
 *
 * @param[in] numerator Dividend (numerator). Representable range: -32768 to 32767.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 65535.
 * @return Result of `s16_div_s16_u16_shl0` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @warning `denominator` must be nonzero before a native C division or remainder operation is reached.
 * @ingroup ecmath_div
 */
s16 s16_div_s16_u16_shl0(s16 numerator, u16 denominator)
{
	u16 u16Temp1;
	s32 s32Temp1;
	u16Temp1 = denominator & 0xFFFF;
	if(u16Temp1==0)
	{
		if(numerator>=0)
		{
			return 0x7FFF;
		}
		else
		{
			return -0x8000;
		}

	}
	else
	{
		s32Temp1 = (numerator -(numerator/u16Temp1) * u16Temp1) << 1;
		s32Temp1 = (s32Temp1/u16Temp1) + (numerator/u16Temp1);
		return s32Temp1;
	}
}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide u16 by u16 with overflow limitation u8 = ((u16 << 16) / u16) >> 8
 *
 * @param[in] numerator Dividend (numerator). Representable range: 0 to 65535.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 65535.
 * @return Result of `u8_fac1_div_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @note The implementation uses integer bit scaling (right shift(s): 8; left shift(s): 16).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
u8 u8_fac1_div_u16_u16(u16 numerator, u16 denominator)
{
	u32 u32Temp1 = 0 ,u32Temp2 = 0,u32Temp3 = 0;
	if(denominator==0)
	{
		return 0xFF;
	}
	else
	{
		u32Temp1 = (numerator<<16);
		u32Temp2 = u32Temp1 / denominator;
		u32Temp3 = (u32Temp2 + 0x80) >> 8;
		if(u32Temp3 < 0xFF)
		{
			return (u8)u32Temp3 ;
		}
		else
		{
			return 0xFF;
		}
	}
}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide s32 by u16 with overflow and underflow limitation u16 = s32 / u16
 *
 * @param[in] x_value First arithmetic operand. Representable range: -2147483648 to 2147483647.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `u16_div_s32_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @warning `y_value` must be nonzero before a native C division or remainder operation is reached.
 * @ingroup ecmath_div
 */
u16 u16_div_s32_u16(s32 x_value, u16 y_value)
{
	s32 s32Temp1 = 0;
	y_value = y_value & 0xFFFF;
	if((y_value & 0xFFFF) == 0)
	{
		if(x_value >= 0)
		{
			return 0xFFFF;
		}
		else
		{
			return 0;
		}
	}
	else
	{
		s32Temp1 = (x_value - ((x_value/y_value) * y_value)) << 1;
		s32Temp1 = (s32Temp1/y_value) + (x_value/y_value);
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
}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide u16 by u16 u16 = (u16 << 16) / u16
 *
 * @param[in] numerator Dividend (numerator). Representable range: 0 to 65535.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 65535.
 * @return Result of `u16_fac1_div_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (right shift(s): 1; left shift(s): 16).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
u16  u16_fac1_div_u16_u16(u16 numerator, u16 denominator)
{
	u32 u32Temp = 0;
	if(denominator == 0)
	{
		return 0xFFFF;
	}
	else
	{
		u32Temp = (numerator<<16) + (denominator >>1);
		u32Temp = u32Temp/denominator;
		if(u32Temp < 0xFFFF)
		{
			return u32Temp & 0xFFFF;
		}
		else
		{
			return 0xFFFF;
		}
	}

}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide u32 by u16 with overflow limitation u16 = u32 / u16
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `u16_div_u32_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `y_value` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
u16 u16_div_u32_u16(u32 x_value, u16 y_value)
{	
	u32 u32Temp1=0,u32Temp2=0;
	y_value = y_value & 0xFFFF;
	if(y_value == 0)
	{
		return 0xFFFF;
	}
	else
	{
		u32Temp1 = x_value/y_value;
		u32Temp1 = x_value - (u32Temp1 * y_value) << 1;
		u32Temp2 = (u32Temp1/y_value) + (x_value/y_value);
		if(u32Temp2 < 0xFFFF)
		{
			return u32Temp2 & 0xFFFF;
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
 * multiply s16 by u16 and divide the result by s16 with overflow and underflow limitation s16 =
 * (s16 * u16) / s16
 *
 * @param[in] factor1 First multiplication factor. Representable range: -32768 to 32767.
 * @param[in] factor2 Second multiplication factor. Representable range: 0 to 65535.
 * @param[in] denominator Divisor (denominator). Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_u16_div_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
s16 s16_mul_s16_u16_div_s16(s16 factor1, u16 factor2, s16 denominator)
{
	s32 s32Result = 0, s32Temp1 = 0;
	s32Result = factor1 * factor2;
	if(denominator == 0)
	{
		if(s32Result < 0)
		{
			return -0x8000;
		}
		else
		{
			return 0x7FFF;
		}		
	}
	else
	{
		s32Temp1 = s32Result -((s32Result/denominator)*denominator);
		s32Temp1 = s32Temp1 << 1;
		s32Result = (s32Temp1/denominator) + (s32Result/denominator);
		if(s32Result < 0x7FFF)
		{
			if(s32Result > -0x8000)
			{
				return (s16)s32Result;

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
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u16 by s16 and divide the result by u16 s16 = (u16 * s16) / u16
 *
 * @param[in] factor1 First multiplication factor. Representable range: 0 to 65535.
 * @param[in] factor2 Second multiplication factor. Representable range: -32768 to 32767.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 65535.
 * @return Result of `s16_mul_u16_s16_div_u16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
s16 s16_mul_u16_s16_div_u16(u16 factor1, s16 factor2, u16 denominator)
{
	s32 s32Result = 0, s32Temp1 = 0;
	s32Result = factor1 * factor2;
	if(denominator==0)
	{
		if(s32Result < 0)
		{
			return -0x8000;
		}
		else
		{
			return 0x7FFF;
		}	
	}
	else
	{
		s32Temp1 = s32Result - ((s32Result/denominator) * denominator) << 1;
		s32Result = (s32Temp1/denominator) + (s32Result/denominator);
		if(s32Result < 0x7FFF)
		{
			if(s32Result > -0x8000)
			{
				return (s16)s32Result;
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
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s16 by u16 and divide the result by s16 with overflow and underflow limitation u16 =
 * (s16 * u16) / s16
 *
 * @param[in] factor1 First multiplication factor. Representable range: -32768 to 32767.
 * @param[in] factor2 Second multiplication factor. Representable range: 0 to 65535.
 * @param[in] denominator Divisor (denominator). Representable range: -32768 to 32767.
 * @return Result of `u16_mul_s16_u16_div_s16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
u16 u16_mul_s16_u16_div_s16(s16 factor1, u16 factor2, s16 denominator)
{
	u32 u32Result = 0, u32Temp1 = 0;
	s32 s32Result = 0, s32Temp1 = 0;
	s32Result = factor1 * factor2;

	if(denominator == 0)
	{
		if(s32Result >= 0)
		{
			return 0xFFFFU;
		}
		else
		{
			return 0;
		}
	}
	else
	{
		s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;
		s32Result = (s32Temp1/denominator) + (s32Result/denominator);
		if(s32Result < 0x0000FFFF)
		{
			if(s32Result > 0)
			{
				return (u16)s32Result;
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
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s16 by u16 and divide the result by u16 with overflow and underflow limitation u16 =
 * (s16 * u16) / u16
 *
 * @param[in] factor1 First multiplication factor. Representable range: -32768 to 32767.
 * @param[in] factor2 Second multiplication factor. Representable range: 0 to 65535.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 65535.
 * @return Result of `u16_mul_s16_u16_div_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
u16 u16_mul_s16_u16_div_u16(s16 factor1, u16 factor2, u16 denominator)
{
	s32 s32Result = 0, s32Temp1 = 0;
	s32Result = factor1 * factor2;

	if(denominator == 0)
	{
		if(s32Result >= 0)
		{
			return 0xFFFFU;
		}
		else
		{
			return 0;
		}
	}
	else
	{
		s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;
		s32Result = (s32Temp1/denominator) + (s32Result/denominator);
		if(s32Result < 0x0000FFFF)
		{
			if(s32Result > 0)
			{
				return (u16)s32Result;
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

}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply u16 by u16 and divide the result by u16 u16 = (u16 * u16) / u16
 *
 * @param[in] factor1 First multiplication factor. Representable range: 0 to 65535.
 * @param[in] factor2 Second multiplication factor. Representable range: 0 to 65535.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 65535.
 * @return Result of `u16_mul_u16_u16_div_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (right shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
u16 u16_mul_u16_u16_div_u16(u16 factor1, u16 factor2, u16 denominator)
{
	u32 u32Temp1 = 0 ;
	u16 u16TempDenom = 0;

	if(denominator == 0)
	{
		return 0xFFFF;
	}
	else
	{
		u32Temp1 = factor1 * factor2;
		u16TempDenom = denominator >> 1;
		u32Temp1 = u32Temp1 + u16TempDenom;
		u32Temp1 = u32Temp1 / denominator;
		if(u32Temp1 < 0xFFFF)
		{
			return (u32Temp1 & 0xFFFF);

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
 * multiply u16 by u16 and divide the result by u32 u16 = (u16 * u16) / u32
 *
 * @param[in] factor1 First multiplication factor. Representable range: 0 to 65535.
 * @param[in] factor2 Second multiplication factor. Representable range: 0 to 65535.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 4294967295.
 * @return Result of `u16_mul_u16_u16_div_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
u16 u16_mul_u16_u16_div_u32(u16 factor1, u16 factor2, u32 denominator)
{
	u32 u32Temp1 = 0;
	if(denominator == 0)
	{
		return 0xFFFFU;
	}
	else
	{
		u32Temp1 = (factor1 * factor2) / denominator;
		if(((factor1 * factor2)-(denominator*u32Temp1))>=(denominator/2) )
		{
			u32Temp1++;
		}
		if(u32Temp1 < 0xFFFF)
		{
			return (u32Temp1 & 0xFFFF);
		}
		else
		{
			return 0xFFFF;
		}
	}
}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide u32 by u16 u32 = u32 / u16
 *
 * @param[in] x_value First arithmetic operand. Representable range: 0 to 4294967295.
 * @param[in] y_value Second arithmetic operand. Representable range: 0 to 65535.
 * @return Result of `u32_div_u32_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `y_value` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
u32 u32_div_u32_u16(u32 x_value, u16 y_value)
{
	u32 u32Temp1 = 0;
	if(y_value == 0)
	{
		return 0xFFFFFFFFU;
	}
	else
	{
		u32Temp1 = (x_value - (x_value/y_value) * y_value) << 1;
		u32Temp1 = (x_value/y_value) + (u32Temp1/y_value);
		return u32Temp1;
	}
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s16 by s16 and divide the result by s16 s16 = (s16 * s16) / s16
 *
 * @param[in] fak1 First multiplication factor. Representable range: -32768 to 32767.
 * @param[in] fak2 Second multiplication factor. Representable range: -32768 to 32767.
 * @param[in] div Divisor. Representable range: -32768 to 32767.
 * @return Result of `s16_mul_s16_s16_div_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `div` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
s16 s16_mul_s16_s16_div_s16(s16 fak1, s16 fak2, s16 div)
{
	s32 s32Temp1 = 0, s32Temp2 = 0, s32Temp3 = 0;
	s32Temp1 = fak1 * fak2 ; 
	if(div == 0)
	{
		if(s32Temp1 < 0)
		{
			return -0x8000;
		}
		else
		{
			return 0x7FFF;
		}
	}
	else
	{
		s32Temp2 = (s32Temp1 - ((s32Temp1 / div) * div)) << 1;
		s32Temp3 = (s32Temp2/div) + (s32Temp1/div);
		if(s32Temp3 < 0x7FFF)
		{
			if(s32Temp3 > -0x8000)
			{
				return (s16)s32Temp3;
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
}


/**
 * @brief Multiplies integer operands using the function-specific fixed-point scaling and limitation rules.
 *
 * @details
 * multiply s16 by s16 and divide the result by u16 s16 = (s16 * s16) / u16
 *
 * @param[in] data1 First data operand. Representable range: -32768 to 32767.
 * @param[in] data2 Second data operand. Representable range: -32768 to 32767.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 65535.
 * @return Result of `s16_mul_s16_s16_div_u16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
s16 s16_mul_s16_s16_div_u16(s16 data1,s16 data2,u16 denominator)
{
	s32 s32Result = 0, s32Temp1 = 0;
	s32Result = data1 * data2;

	if(denominator == 0)
	{
		if(s32Result > 0)
		{
			return 0x7FFFU;
		}
		else if(s32Result == 0)
		{
			return 0x0000U;
		}
		else
		{
			return -0x8000;
		}
	}
	else
	{
		s32Temp1 = (s32Result - (s32Result/denominator)*denominator) << 1;
		s32Result = (s32Temp1/denominator) + (s32Result/denominator);
		if(s32Result < 0x7FFF)
		{
			if(s32Result > -0x8000)
			{
				return (s16)s32Result ;
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

}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide u32 by s32 u32 = u32 / s32
 *
 * @param[in] numerator Dividend (numerator). Representable range: 0 to 4294967295.
 * @param[in] denominator Divisor (denominator). Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_div_u32_s32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
u32 u32_div_u32_s32(u32 numerator, s32 denominator)
{
	u32 u32Temp1;
	if(denominator == 0)
	{
		return 0xFFFFFFFFU;
	}
	else
	{
		if(denominator <= 0)
		{
			return 0;
		}
		else
		{
			u32Temp1 = (numerator - ((numerator/denominator) * denominator))<<1;
			u32Temp1 = (u32Temp1/denominator) + (numerator/denominator); 
			return u32Temp1;
		}
	}
}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide s32 by u32 u32 = s32 / u32
 *
 * @param[in] numerator Dividend (numerator). Representable range: -2147483648 to 2147483647.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 4294967295.
 * @return Result of `u32_div_s32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
u32 u32_div_s32_u32(s32 numerator, u32 denominator)
{
	s32 s32Temp1 = 0;
	if(denominator == 0)
	{
		if(numerator >= 0)
		{
			return 0xFFFFFFFFU;
		}
		else
		{
			return 0;
		}
	}
	else
	{
		if(numerator >= 0)
		{
			s32Temp1 = ((numerator - ((numerator/denominator) * denominator))<<1);
			return ((numerator/denominator) + (s32Temp1/denominator));
		}
		else
		{
			return 0;
		}
	}
}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide s32 by s32 u32 = s32 / s32
 *
 * @param[in] numerator Dividend (numerator). Representable range: -2147483648 to 2147483647.
 * @param[in] denominator Divisor (denominator). Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_div_s32_s32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
u32 u32_div_s32_s32(s32 numerator, s32 denominator)
{
	u32 u32Temp1 = 0, u32Temp2 = 0;
	if(denominator == 0)
	{
		if(numerator < 0)
		{
			return 0;
		}
		else
		{
			return 0xFFFFFFFFU;
		}
	}
	else
	{
		if(numerator >= 0)
		{
			if(numerator == 0)
			{
				return 0;
			}
			else
			{
				if(denominator <= 0)
				{
					return 0;
				}
				else
				{
					u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;
					u32Temp2 = (u32Temp1 / denominator) + (numerator / denominator);
					return u32Temp2;
				}
			}
		}
		else
		{
			if(denominator > 0)
			{
				return 0;
			}
			else
			{
				numerator = -numerator;
				denominator = -denominator;
				u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;
				u32Temp2 = (u32Temp1 / denominator) + (numerator / denominator);
				return u32Temp2;
			}

		}
	}
}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide u32 by u32 u32 = u32 / u32
 *
 * @param[in] numerator Dividend (numerator). Representable range: 0 to 4294967295.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 4294967295.
 * @return Result of `u32_div_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
u32 u32_div_u32_u32(u32 numerator, u32 denominator)
{

	u32 u32Temp1 = 0, u32Temp2 = 0, u32Temp3 = 0, numerator_old = 0;
	if(denominator==0)
	{
		return 0xFFFFFFFFU;
	}
	else
	{
		u32Temp1 = numerator - denominator * (numerator/denominator);
		if((u32Temp1 & 0x1U) == 0)
		{
			u32Temp2 = (denominator>>1);
		}
		else
		{
			u32Temp2 = (denominator>>1) + 1;
		}

		if(u32Temp2 > u32Temp1)
		{
			return (numerator/denominator);
		}
		else
		{
			return ((numerator/denominator) + 1);
		}

	}

}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide u32 by s32 s32 = u32 / s32
 *
 * @param[in] numerator Dividend (numerator). Representable range: 0 to 4294967295.
 * @param[in] denominator Divisor (denominator). Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_div_u32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
s32 s32_div_u32_s32(u32 numerator, s32 denominator)
{
	u32 u32Temp1 = 0, u32Temp2 = 0 ;
	if(denominator <= 0)
	{
		if(denominator >= 0)
		{
			return 0x7FFFFFFF;
		}
		else
		{
			denominator = -denominator;
			u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;
			u32Temp2 = (u32Temp1/denominator) + (numerator/denominator);
			if(u32Temp2 <= 0x7FFFFFFF)
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
		u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;
		u32Temp2 = (u32Temp1/denominator) + (numerator/denominator);
		if(u32Temp2 <= 0x7FFFFFFF)
		{
			return u32Temp2;
		}
		else
		{
			return 0x7FFFFFFF;
		}	
	}
}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide s32 by u32 s32 = s32 / u32
 *
 * @param[in] numerator Dividend (numerator). Representable range: -2147483648 to 2147483647.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 4294967295.
 * @return Result of `s32_div_s32_u32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 1; left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_div
 */
s32 s32_div_s32_u32(s32 numerator, u32 denominator)
{
	s32 s32Temp1 = 0, s32Temp2 = 0;
	u32 u32Temp0 = 0, u32Temp1 = 0, u32Temp2 = 0;
	if(denominator == 0)
	{
		if(numerator < 0)
		{
			return 0x80000000;
		}
		else
		{
			return 0x7FFFFFFF;
		}
	}
	else
	{
		if(numerator <= 0)
		{
			u32Temp1 = -numerator;
			u32Temp0 = (u32Temp1/denominator);
			u32Temp2 = u32Temp1 - ((u32Temp1/denominator) * denominator);

			if((denominator & 0x1) == 0)
			{
				denominator = (denominator >> 1);
			}
			else
			{
				denominator = (denominator >> 1) + 1;
			}


			if(u32Temp2 < denominator)
			{
				return (~u32Temp0 + 1);
			}
			else
			{
				return ~(u32Temp0 + 1)+1;
			}


		}
		else
		{
			s32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;
			s32Temp2 = (numerator/denominator) + (s32Temp1/denominator);
			return s32Temp2;
		}
	}
}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide s32 by s32 s32 = s32 / s32
 *
 * @param[in] numerator Dividend (numerator). Representable range: -2147483648 to 2147483647.
 * @param[in] denominator Divisor (denominator). Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_div_s32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @ingroup ecmath_div
 */
s32 s32_div_s32_s32(s32 numerator, s32 denominator)
{
	s32 s32Temp1 = 0, s32Temp2 = 0;
	u32 denominator_prime = 0, u32Temp1 = 0, u32Temp2 = 0;
	u32 u32numerator = 0,u32denominator = 0;
	if(numerator < 0)
	{
		if(denominator <= 0)
		{
			if(denominator >= 0)
			{
				return 0x80000000;
			}
			else
			{
				u32numerator = -numerator;
				u32denominator = -denominator;
				u32Temp1 =(u32numerator - ((u32numerator/u32denominator) * u32denominator)) << 1;
				u32Temp2 = (u32numerator/u32denominator) + (u32Temp1/u32denominator);
				if(u32Temp2 <= 0x7FFFFFFF)
				{
					return u32Temp2;
				}
				else
				{
					return 0x7FFFFFFF;
				}
			}
		}
		else
		{
			u32numerator = ~numerator+1;
			s32Temp1 = (u32numerator - ((u32numerator/denominator) * denominator)) << 1;
			s32Temp2 = (u32numerator/denominator) + (s32Temp1/denominator);
			return (~s32Temp2 + 1);
		}
	}
	else
	{
		if(denominator <= 0)
		{
			if(denominator >= 0)
			{
				return 0x7FFFFFFF;
			}
			else
			{
				u32denominator = ~denominator + 1;
				s32Temp1 = (numerator - ((numerator/u32denominator) * u32denominator)) << 1;
				s32Temp2 = (numerator/u32denominator) + (s32Temp1/u32denominator);
				return (~s32Temp2 + 1);	
			}
		}
		else
		{
			u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;
			s32Temp2 = (numerator/denominator) + (u32Temp1/denominator);
			return s32Temp2;	
		}
	}	
}


/**
 * @brief Performs integer or fixed-point division using the function-specific limitation rules.
 *
 * @details
 * divide s32 by u32 s16 = s32 / u32
 *
 * @param[in] numerator Dividend (numerator). Representable range: -2147483648 to 2147483647.
 * @param[in] denominator Divisor (denominator). Representable range: 0 to 4294967295.
 * @return Result of `s16_div_s32_u32` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 1; left shift(s): 1).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note Zero-divisor handling for `denominator` is implemented explicitly; preserve that behavior during refactoring.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_div
 */
s16 s16_div_s32_u32(s32 numerator, u32 denominator)
{

	u32 numerator_prime = 0, u32Temp1 = 0, u32Temp2 = 0, u32Temp3 = 0;
	s32 s32Temp1 = 0, s32Temp2 = 0, s32Temp3 = 0;
	if(denominator == 0)
	{
		if(numerator<0)
		{
			return -0x8000;
		}
		else
		{
			return 0x7FFF;
		}
	}
	else
	{
		if(numerator < 0)
		{
			numerator_prime = -numerator;
			u32Temp1 = (numerator_prime/denominator);	
			u32Temp2 = numerator_prime - (u32Temp1 * denominator);

			if((denominator & 0x1) == 0)
			{
				denominator = denominator >> 1;
			}
			else
			{
				denominator = (denominator >> 1) + 1;
			}

			if(u32Temp2 < denominator)
			{
				s32Temp3 = ~(u32Temp1) + 1;
			}
			else
			{
				s32Temp3 = ~(u32Temp1+1) + 1;
			}
			if((s32Temp3) >= -0x8000)
			{
				return (s16)(s32Temp3);
			}
			else
			{
				return -0x8000;
			}
		}
		else
		{
			s32Temp1 = (numerator/denominator) * denominator;	
			s32Temp2 = (numerator - ((numerator/denominator) * denominator))<<1;
			s32Temp3 = (s32Temp2/denominator) + (numerator/denominator);
			if(s32Temp3 <= 0x7FFF)
			{
				return (s16)s32Temp3;
			}
			else
			{
				return 0x7FFF;
			}
		}
	}
}


/** @} */ /* end of ecmath_div */
