/**
 * @file hip_Ccode.c
 * @brief First-order high-pass filter routines.
 *
 * @details
 * C-only ECMath implementation prepared for formal analysis with Frama-C/EVA. Assembly
 * implementations were removed, while the executable C statements were retained. Function-level
 * documentation was reconstructed from the legacy `ecmath.h` contract and checked against the
 * corresponding implementation.
 *
 * @note Documentation edition: EVA C-only Doxygen v2.
 * @note The documentation pass does not intentionally change executable C statements.
 * @defgroup ecmath_highpass First-order high-pass filter routines
 * @{
 */

/*
 * hip_Ccode.c
 *
 *  Created on: Jan 21, 2020
 *      Author: ng104383
 */
#include "hip_Ccode.h"
#include "rotatefunc.h"
#include "MulHword.h"

/**
 * @brief Computes one update of a first-order fixed-point high-pass filter.
 *
 * @details
 * Output of a high-pass filter The formulae used result = yold - (m*yold/65536)+ (u -uold)*128
 * with rouding off and saturation correction in the result
 *
 * @param[in] yold Previous high-pass filter output/state. Representable range: -32768 to 32767.
 * @param[in] u Current filter input. Representable range: 0 to 255.
 * @param[in] uold Previous filter input. Representable range: 0 to 255.
 * @param[in] m Fixed-point high-pass coefficient. Representable range: 0 to 65535.
 * @return Result of `s16_hip1_s16_u8_u8_u16_fac1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 1, 7).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_highpass
 */
s16 s16_hip1_s16_u8_u8_u16_fac1(s16 yold, u8 u, u8 uold, u16 m)
{
	s32 s32Temp1 = 0, s32Temp2 = 0;
	s16 s16u = 0; 
	u16 u16uold = 0;
	u16uold = (u - uold) << 7;
	s32Temp1 = yold * m;
	s32Temp2 = (s32Temp1/0x10000) * 0x10000;
	s32Temp2 = s32Temp1 - s32Temp2;
	s32Temp2 = s32Temp2 << 1;
	s32Temp2 = s32Temp2 / 0x10000;
	s32Temp2 = s32Temp2 + (s32Temp1/0x10000);
	s32Temp2 = yold - s32Temp2;
	s16u = s32Temp2 + u16uold;
	if(yold != s16u)
	{
		if(s16u <= 0x7FFF)
		{
			if(s16u >= -0x8000)
			{
				return s16u;
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
		if(yold <= 0)
		{
			if(yold == 0)
			{
				if(s16u <= 0x7FFF)
				{
					if(s16u >= -0x8000)
					{
						return s16u;
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
				s16u = s16u + 1;
				if(s16u <= 0x7FFF)
				{
					if(s16u >= -0x8000)
					{
						return s16u;
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
		else
		{
			s16u = s16u - 1;
			if(s16u <= 0x7FFF)
			{
				if(s16u >= -0x8000)
				{
					return s16u;
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
}


/**
 * @brief Computes one update of a first-order fixed-point high-pass filter.
 *
 * @details
 * Output of a high-pass filter The formulae used result = yold - (m*yold/65536)+ (u -uold)*128
 * with rouding off and saturation correction in the result
 *
 * @param[in] yold Previous high-pass filter output/state. Representable range: -32768 to 32767.
 * @param[in] u Current filter input. Representable range: -128 to 127.
 * @param[in] uold Previous filter input. Representable range: -128 to 127.
 * @param[in] m Fixed-point high-pass coefficient. Representable range: 0 to 65535.
 * @return Result of `s16_hip1_s16_s8_s8_u16_fac1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (left shift(s): 1, 7).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_highpass
 */
s16 s16_hip1_s16_s8_s8_u16_fac1(s16 yold, s8 u, s8 uold, u16 m)
{
	s32 s32Temp1 = 0, s32Temp2 = 0;
	s32 s16u = 0; 
	s16 s16uold = 0;
	s16uold = (u - uold) << 7;
	s32Temp1 = yold * m;
	s32Temp2 = (s32Temp1/0x10000) * 0x10000;
	s32Temp2 = s32Temp1 - s32Temp2;
	s32Temp2 = s32Temp2 << 1;
	s32Temp2 = s32Temp2 / 0x10000;
	s32Temp2 = s32Temp2 + (s32Temp1/0x10000);
	s32Temp2 = yold - s32Temp2;
	s16u = s32Temp2 + s16uold;
	if(yold != s16u)
	{
		if(s16u <= 0x7FFF)
		{
			if(s16u >= -0x8000)
			{
				return s16u;
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
		if(yold <= 0)
		{
			if(yold == 0)
			{
				if(s16u <= 0x7FFF)
				{
					if(s16u >= -0x8000)
					{
						return s16u;
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
				s16u = s16u + 1;
				if(s16u <= 0x7FFF)
				{
					if(s16u >= -0x8000)
					{
						return s16u;
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
		else
		{
			s16u = s16u - 1;
			if(s16u <= 0x7FFF)
			{
				if(s16u >= -0x8000)
				{
					return s16u;
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
}


/**
 * @brief Computes one update of a first-order fixed-point high-pass filter.
 *
 * @details
 * Output of a high-pass filter The formulae used result = yold - (m*yold/65536)+ (u -uold)*32768
 * with rouding off and saturation correction in the result
 *
 * @param[in] yold Previous high-pass filter output/state. Representable range: -2147483648 to 2147483647.
 * @param[in] u Current filter input. Representable range: 0 to 65535.
 * @param[in] uold Previous filter input. Representable range: 0 to 65535.
 * @param[in] m Fixed-point high-pass coefficient. Representable range: 0 to 65535.
 * @return Result of `s32_hip1_s32_u16_u16_u16_fac1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 16; left shift(s): 15).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_highpass
 */
s32 s32_hip1_s32_u16_u16_u16_fac1(s32 yold, u16 u, u16 uold, u16 m)
{
	s32 s32TempHW = 0, s32TempLW = 0 , s32Temp0 = 0 , s32Temp1 = 0, s32Result = 0;
	m = m & 0xFFFF;
	s32TempHW = MulHighWord(yold,m);
	s32TempLW = yold * m;
	s32Temp1 = (rotateRight(s32TempHW , 16) & 0xFFFF0000) + (s32TempLW >> 16);
	s32Temp0 = (u - uold);
	s32Result = yold - s32Temp1 + (s32Temp0 << 15);
	if(s32Result == yold)
	{
		if(yold > 0)
		{
			return (s32Result + 1);
		}
		else
		{
			return (s32Result - 1);
		}
	}
	else
	{
		return s32Result;
	}	
}


/**
 * @brief Computes one update of a first-order fixed-point high-pass filter.
 *
 * @details
 * Output of a high-pass filter The formulae used result = yold - (m*yold/65536)+ (u -uold)*32768
 * with rouding off and saturation correction in the result
 *
 * @param[in] yold Previous high-pass filter output/state. Representable range: -2147483648 to 2147483647.
 * @param[in] u Current filter input. Representable range: -32768 to 32767.
 * @param[in] uold Previous filter input. Representable range: -32768 to 32767.
 * @param[in] m Fixed-point high-pass coefficient. Representable range: 0 to 65535.
 * @return Result of `s32_hip1_s32_s16_s16_u16_fac1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 16; left shift(s): 15).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_highpass
 */
s32 s32_hip1_s32_s16_s16_u16_fac1(s32 yold, s16 u, s16 uold, u16 m)
{
	s32 s32TempHW = 0, s32TempLW = 0 , s32Temp0 = 0 , s32Temp1 = 0, s32Result = 0;
	m = m & 0xFFFF;
	s32TempHW = MulHighWord(yold,m);
	s32TempLW = yold * m;
	s32Temp1 = (rotateRight(s32TempHW , 16) & 0xFFFF0000) + (s32TempLW >> 16);
	s32Temp0 = (u - uold);
	s32Result = yold - s32Temp1 + (s32Temp0 << 15);
	if(s32Result == yold)
	{
		if(yold > 0)
		{
			return (s32Result + 1);
		}
		else
		{
			return (s32Result - 1);
		}
	}
	else
	{
		return s32Result;
	}	
}

/** @} */ /* end of ecmath_highpass */
