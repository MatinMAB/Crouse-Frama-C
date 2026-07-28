/**
 * @file avrg_Ccode.c
 * @brief Moving-average and averaging routines.
 *
 * @details
 * C-only ECMath implementation prepared for formal analysis with Frama-C/EVA. Assembly
 * implementations were removed, while the executable C statements were retained. Function-level
 * documentation was reconstructed from the legacy `ecmath.h` contract and checked against the
 * corresponding implementation.
 *
 * @note Documentation edition: EVA C-only Doxygen v2.
 * @note The documentation pass does not intentionally change executable C statements.
 * @defgroup ecmath_average Moving-average and averaging routines
 * @{
 */

/*
 * avrg_Ccode.c
 *
 *  Created on: Dec 12, 2019
 *      Author: ng104383
 */

#include "avrg_Ccode.h"
#include "rotatefunc.h"
#include "MulHword.h"

/****************************************************************************/
/* function:  The floating average is calculated with an unsigned int as    */
/*            old floating average, an unsigned int as actual measured      */
/*            value and an unsigned int as average value of -1 ... 0.99997. */
/*            unsigned int = gmw + ((messwert - gmw) * mitko) >> 15         */
/****************************************************************************/
/**
 * @brief Computes one update of a fixed-point moving mean value.
 *
 * @details
 * The floating average is calculated with an unsigned int as old floating average, an unsigned int
 * as actual measured value and an unsigned int as average value of -1 ... 0.99997. unsigned int =
 * gmw + ((messwert - gmw) * mitko) >> 15
 *
 * @param[in] mmv Previous moving-mean (floating-average) state. Representable range: -32768 to 32767.
 * @param[in] measure Current measured value. Representable range: -32768 to 32767.
 * @param[in] crlc Fixed-point averaging coefficient. Representable range: -32768 to 32767.
 * @return Result of `s16_mmv_s16_s16_s16_fac1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 14, 15).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_average
 */
s16 s16_mmv_s16_s16_s16_fac1(register s16 mmv, register s16 measure, register s16 crlc)
{
	s32 s16mmv = 0;
	s32 s32mmv = 0, result = 0;
	s16mmv = measure - mmv;
	s32mmv = s16mmv * crlc;
	if(s32mmv <= 0)
	{
		if(s32mmv >= 0)
		{
			result = 0;
			// LOC_44
			s32mmv = mmv + result;
			if(s32mmv < 0x7FFF)
			{
				if(s32mmv > -0x8000)
				{
					return s32mmv;
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
			// LOC_44
		}
		else
		{
			s32mmv = -s32mmv;
			result = s32mmv >> 15;
			crlc = (s32mmv & 0x4000) >> 14;
			result = result + crlc;
			if(result != 0)
			{
				result = -result;
				// LOC_44
				s32mmv = mmv + result;
				if(s32mmv < 0x7FFF)
				{
					if(s32mmv > -0x8000)
					{
						return s32mmv;
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
				// LOC_44
			}
			else
			{
				result = result - 1;
				// LOC_44
				s32mmv = mmv + result;
				if(s32mmv < 0x7FFF)
				{
					if(s32mmv > -0x8000)
					{
						return s32mmv;
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
				// LOC_44
			}

		}
	}
	else
	{
		result = s32mmv >> 15;
		crlc = (s32mmv & 0x4000) >> 14;
		result = result + crlc;
		if(result != 0)
		{
			// LOC_44
			s32mmv = mmv + result;
			if(s32mmv < 0x7FFF)
			{
				if(s32mmv > -0x8000)
				{
					return s32mmv;
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
			// LOC_44
		}
		else
		{
			result = result + 1;
			// LOC_44
			s32mmv = mmv + result;
			if(s32mmv < 0x7FFF)
			{
				if(s32mmv > -0x8000)
				{
					return s32mmv;
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
			// LOC_44
		}
	}
}


/****************************************************************************/
/* function:  The floating average is calculated with an unsigned int as    */
/*            old floating average, an unsigned int as actual measured      */
/*            value and an unsigned int as average value of -1 ... 0.99997. */
/*            unsigned int = gmw + ((messwert - gmw) * mitko) >> 15         */
/****************************************************************************/
/**
 * @brief Computes one update of a fixed-point moving mean value.
 *
 * @details
 * The floating average is calculated with an unsigned int as old floating average, an unsigned int
 * as actual measured value and an unsigned int as average value of -1 ... 0.99997. unsigned int =
 * gmw + ((messwert - gmw) * mitko) >> 15
 *
 * @param[in] mmv Previous moving-mean (floating-average) state. Representable range: 0 to 65535.
 * @param[in] measure Current measured value. Representable range: 0 to 65535.
 * @param[in] crlc Fixed-point averaging coefficient. Representable range: -32768 to 32767.
 * @return Result of `u16_mmv_u16_u16_s16_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (right shift(s): 14, 15).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_average
 */
u16 u16_mmv_u16_u16_s16_fac1(register u16 mmv, register u16 measure, register s16 crlc)
{

	s32 s32mmv;
	u32 u16mmv, result;

	s32mmv = 0;
	result = 0;
	u16mmv = 0;
	result = (measure - mmv);
	s32mmv = (result * crlc);
	if(s32mmv <= 0)
	{
		if(s32mmv >= 0)
		{
//			result = 0;
			// LOC_44
			s32mmv = mmv + result;

			if(s32mmv < 0xFFFF)
			{
				if(s32mmv > 0)
				{
					return (u16)s32mmv;
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
			// LOC_44
		}
		else
		{
			s32mmv = -s32mmv;
			result = s32mmv >> 15;
			crlc = (s32mmv & 0x4000) >> 14;
			result = result + crlc;
			if(result != 0)
			{
				result = -result;
				// LOC_44
				s32mmv = mmv + result;

				if(s32mmv < 0xFFFF)
				{
					if(s32mmv > 0)
					{
						return (u16)s32mmv;
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
				// LOC_44
			}
			else
			{
				result = result - 1;
				// LOC_44
				s32mmv = mmv + result;

				if(s32mmv < 0xFFFF)
				{
					if(s32mmv > 0)
					{
						return (u16)s32mmv;
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
				// LOC_44	
			}
		}
	}
	else
	{
		s32mmv = s32mmv;
		result = s32mmv >> 15;
		crlc = (s32mmv & 0x4000) >> 14;
		result = result + crlc;
		if(result != 0)
		{
			// LOC_44
			s32mmv = mmv + result;

			if(s32mmv < 0xFFFF)
			{
				if(s32mmv > 0)
				{
					return (u16)s32mmv;
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
			// LOC_44	
		}
		else
		{
			result = result + 1;
			// LOC_44
			s32mmv = mmv + result;

			if(s32mmv < 0xFFFF)
			{
				if(s32mmv > 0)
				{
					return (u16)s32mmv;
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
			// LOC_44
		}
	}

}


/****************************************************************************/
/* function:  The floating average is calculated with an unsigned int as    */
/*            old floating average, an unsigned int as actual measured      */
/*            value and an unsigned int as average value of 0 ... 1.99997.  */
/*            unsigned int = gmw + ((messwert - gmw) * mitko) >> 15         */
/****************************************************************************/
/**
 * @brief Computes one update of a fixed-point moving mean value.
 *
 * @details
 * The floating average is calculated with an unsigned int as old floating average, an unsigned int
 * as actual measured value and an unsigned int as average value of 0 ... 1.99997. unsigned int =
 * gmw + ((messwert - gmw) * mitko) >> 15
 *
 * @param[in] mmv Previous moving-mean (floating-average) state. Representable range: 0 to 65535.
 * @param[in] measure Current measured value. Representable range: 0 to 65535.
 * @param[in] crlc Fixed-point averaging coefficient. Representable range: 0 to 65535.
 * @return Result of `u16_mmv_u16_u16_u16_fac2` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (right shift(s): 14, 15).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_average
 */
u16 u16_mmv_u16_u16_u16_fac2(u16 mmv, u16 measure, u16 crlc)
{
	s32 Temp , result;
	s32 measure32 = 0;
	result = mmv;
	if(mmv > measure)
	{
		measure32 = mmv - measure;
		measure32 = measure32 * crlc;
		Temp = (measure32 >> 15);
		crlc = (measure32 & 0x4000) >> 14;
		Temp = Temp + crlc;
		if(Temp != 0)
		{
			result = result - Temp;
			// LOC_4E
			if(result < 0xFFFF)
			{
				if(result > 0)
				{
					return result & 0xFFFF;
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
			// LOC_4E
		}
		else
		{
			if(measure == 0)
			{
				result = result - Temp;
				// LOC_4E
				if(result < 0xFFFF)
				{
					if(result > 0)
					{
						return result & 0xFFFF;
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
				// LOC_4E			
			}
			else
			{
				result = mmv + 0xFFFF;
				// LOC_4E
				if(result < 0xFFFFFFFF)
				{
					if(result > 0)
					{
						return (result & 0xFFFF);
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
				// LOC_4E	
			}
		}
	}
	else
	{
		measure32 = measure - mmv;
		measure32 = measure32 * crlc;
		Temp = (measure32 >> 15);
		crlc = (measure32 & 0x4000) >> 14;
		Temp = Temp + crlc;
		if(Temp != 0)
		{
			result = Temp + result;
			// LOC_4E
			if(result < 0xFFFF)
			{
				if(result > 0)
				{
					return result & 0xFFFF;
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
			// LOC_4E	

		}
		else
		{
			if(measure==0)
			{
				result = Temp + result;
				// LOC_4E
				if(result < 0xFFFF)
				{
					if(result > 0)
					{
						return result & 0xFFFF;
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
				// LOC_4E
			}
			else
			{
				result = mmv +1;
				// LOC_4E
				if(result < 0xFFFF)
				{
					if(result > 0)
					{
						return result & 0xFFFF;
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
				// LOC_4E
			}
		}	
	}
}

/****************************************************************************/
/* function:  The floating average is calculated with an unsigned int as    */
/*            old floating average, an unsigned int as actual measured      */
/*            value and an unsigned int as average value.                   */
/*            unsigned int = gmw + ((messwert - gmw) * mitko) >> 16         */
/****************************************************************************/
/**
 * @brief Computes one update of a fixed-point moving mean value.
 *
 * @details
 * The floating average is calculated with an unsigned int as old floating average, an unsigned int
 * as actual measured value and an unsigned int as average value. unsigned int = gmw + ((messwert -
 * gmw) * mitko) >> 16
 *
 * @param[in] mmv Previous moving-mean (floating-average) state. Representable range: 0 to 4294967295.
 * @param[in] measure Current measured value. Representable range: 0 to 65535.
 * @param[in] crlc Fixed-point averaging coefficient. Representable range: 0 to 65535.
 * @return Result of `u32_mmv_u32_u16_u16_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 16).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_average
 */
u32 u32_mmv_u32_u16_u16_fac1(register u32 mmv,register u16 measure,register u16 crlc)
{
	u32 u32Temp1=0xFFFFFFFF, u32Temp2=0xFFFFFFFF; 
	u32Temp1 = mmv >> 16;
//	u32Temp1 = rotateRight(mmv , 16);
	u32Temp2 =(u32)(measure - u32Temp1);
	if(u32Temp2 != 0)
	{
		if(measure < u32Temp1)
		{
			u32Temp1 = (u32Temp1 - (u32)measure);
			u32Temp1 = u32Temp1 * crlc;
			u32Temp1 = (u32)mmv - u32Temp1;
			return (u32)u32Temp1;
		}
		else
		{
			u32Temp1 = u32Temp2 * (u16)crlc;
			u32Temp1 = u32Temp1 + (u32)mmv;
			return (u32)u32Temp1;
		}

	}
	else
	{
		u32Temp1 = ((u32)mmv & 0xFFFF0000) + 0x8000;
		return (u32)(u32Temp1);

	} 
}


/****************************************************************************/
/* function:  The floating average is calculated with a signed long as old  */
/*            floating average, a signed int as as actual measured value    */
/*            and an unsigned int as average value.                         */
/*            signed long= gmw + ((messwert - gmw >> 16) * mitko)           */
/****************************************************************************/
/**
 * @brief Computes one update of a fixed-point moving mean value.
 *
 * @details
 * The floating average is calculated with a signed long as old floating average, a signed int as
 * actual measured value and an unsigned int as average value. signed long= gmw + ((messwert - gmw
 * >> 16) * mitko)
 *
 * @param[in] mmv Previous moving-mean (floating-average) state. Representable range: -32768 to 32767.
 * @param[in] measure Current measured value. Representable range: -32768 to 32767.
 * @param[in] crlc Fixed-point averaging coefficient. Representable range: 0 to 65535.
 * @return Result of `s16_mmv_s16_s16_u16_fac1` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @note The implementation uses integer bit scaling (right shift(s): 15, 16).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_average
 */
s16 s16_mmv_s16_s16_u16_fac1(s16 mmv,s16 measure,u16 crlc)
{	
	u32 s32measure = 0, s32Temp1 = 0;
	if(measure < mmv)
	{
		s32measure = mmv - measure;
		s32measure = s32measure * crlc;
		s32Temp1 = (s32measure) >> 16;
		crlc = (s32measure & 0x8000) >> 15; //Extraxt sign bit
//		if((s32Temp1 + crlc) != 0)
		if(s32measure > 0x7FFF)
		{
			return (mmv - (s32Temp1 + crlc));
		}
		else
		{
			if(s32measure == 0)
			{
				return (mmv - (s32Temp1 + crlc));
			}
			else
			{
				return (mmv - 1);
			}
		}
	}
	else
	{
		s32measure = measure - mmv;
		s32measure = s32measure * crlc;
		s32Temp1 = (s32measure) >> 16;
		crlc = (s32measure & 0x8000) >> 15; //Extraxt sign bit
		if((s32Temp1 + crlc) != 0)
		{
			return (mmv + (s32Temp1 + crlc));
		}
		else
		{
			if(s32measure == 0)
			{
				return (mmv + (s32Temp1 + crlc));
			}
			else
			{
				return (mmv + 1);
			}
		}
	}
}


/****************************************************************************/
/* function:  The floating average is calculated with an unsigned long as   */
/*            old floating average, an unsigned int as actual measured      */
/*            value and an unsigned int as average value.                   */
/*            unsigned long= gmw + ((messwert - gmw >> 16 ) * mitko)        */
/****************************************************************************/
/**
 * @brief Computes one update of a fixed-point moving mean value.
 *
 * @details
 * The floating average is calculated with an unsigned long as old floating average, an unsigned
 * int as actual measured value and an unsigned int as average value. unsigned long= gmw +
 * ((messwert - gmw >> 16 ) * mitko)
 *
 * @param[in] mmv Previous moving-mean (floating-average) state. Representable range: -2147483648 to 2147483647.
 * @param[in] measure Current measured value. Representable range: -32768 to 32767.
 * @param[in] crlc Fixed-point averaging coefficient. Representable range: 0 to 65535.
 * @return Result of `s32_mmv_s32_s16_u16_fac1` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @note The implementation uses integer bit scaling (right shift(s): 16).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @note Right shift of a negative signed value is implementation-defined in ISO C; EVA should model the target compiler arithmetic-shift behavior.
 * @ingroup ecmath_average
 */
s32 s32_mmv_s32_s16_u16_fac1(register s32 mmv, register s16 measure, register u16 crlc)
{	
	s32 s32Temp1,s32Temp2;
	s32Temp1 = (s32)(mmv>>16);
	if(s32Temp1 != measure)
	{
		if(s32Temp1 >= measure)
		{
			s32Temp2 = s32Temp1 - measure;
			s32Temp2 = s32Temp2 * (u16)crlc;
			return (mmv - s32Temp2);
		}
		else
		{
			s32Temp2 =  measure - s32Temp1;
			s32Temp2 = s32Temp2 * (u16)crlc;
			return (mmv + s32Temp2);	
		}
	}
	else
	{
		s32Temp2 = mmv & 0xFFFF0000;
		return (s32Temp2 | 0x8000);
	}
}


/****************************************************************************/
/* function:  Calculates  the  average  of  two  unsigned  integers         */
/*            unsigned int= (unsigned int+unsigned int)/2  with  round  off */
/****************************************************************************/
/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * Calculates the average of two unsigned integers unsigned int= (unsigned int+unsigned int)/2 with
 * round off
 *
 * @param[in] x_val Input parameter `x_val`. Representable range: 0 to 65535.
 * @param[in] y_val Input parameter `y_val`. Representable range: 0 to 65535.
 * @return Result of `u16_calc_av_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_average
 */
u16 u16_calc_av_u16_u16( u16 x_val, u16 y_val)
{
	u32 u32Temp1 = x_val , u32Temp2 = y_val, u32Temp3;
	u32Temp1 = u32Temp1 + u32Temp2;

	u32Temp2 =( u32Temp1 + 1);
	u32Temp3 = u32Temp1 & 0x0001;
	if(u32Temp3 == 0)
	{
		return (rotateRight(u32Temp1 , 1) & 0xFFFF);
//		return (rotateLeft(u32Temp1 , 31) & 0xFFFF);

	}
	else
	{
		u32Temp1 = u32Temp2;
		return (rotateRight(u32Temp1 , 1) & 0xFFFF);
//		return (rotateLeft(u32Temp1 , 31) & 0xFFFF);
	}
}


/****************************************************************************/
/* function:  The floating average is calculated with a signed int as old   */
/*            floating average, a signed int as as actual measured value    */
/*            and an unsigned int as average value.                         */
/*            signed int = gmw + ((messwert - gmw) * mitko) >> 16)          */
/****************************************************************************/
/**
 * @brief Computes one update of a fixed-point moving mean value.
 *
 * @details
 * The floating average is calculated with a signed int as old floating average, a signed int as
 * actual measured value and an unsigned int as average value. signed int = gmw + ((messwert - gmw)
 * * mitko) >> 16)
 *
 * @param[in] mmv Previous moving-mean (floating-average) state. Representable range: 0 to 65535.
 * @param[in] measure Current measured value. Representable range: 0 to 65535.
 * @param[in] crlc Fixed-point averaging coefficient. Representable range: 0 to 65535.
 * @return Result of `u16_mmv_u16_u16_u16_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (right shift(s): 15, 16).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_average
 */
u16 u16_mmv_u16_u16_u16_fac1(register u16 mmv, register u16 measure, register u16 crlc)
{
	u32 u32Temp1,u32Temp2, u32Temp3;
	if(measure < mmv)
	{
		measure = mmv - measure;
		u32Temp1 = measure * crlc;
		u32Temp2 = (u16)(u32Temp1 >> 16);
		u32Temp3 = (u32Temp1 & 0x8000) >> 15;//u32Temp3 = rotateRight(u32Temp1 , 15) & 0x7FFF;
		u32Temp2 = u32Temp2 + u32Temp3;
		if(u32Temp2 != 0)
		{
			return (mmv - u32Temp2);
		}
		else
		{
			if(u32Temp1 == 0)
			{
				return (mmv - u32Temp2);
			}
			else
			{
				u32Temp2 = u32Temp2 * 0xFFFF;
				return (mmv + u32Temp2); 
			}
		}
	}
	else
	{
		measure = measure - mmv;
		u32Temp1 = measure * crlc;
		u32Temp2 = u32Temp1 >> 16;
		u32Temp3 = (u32Temp1 & 0x8000) >> 15; //u32Temp3 = rotateRight(u32Temp1 , 15) & 0x7FFF;
		u32Temp2 = u32Temp2 + u32Temp3;
		if(u32Temp2 !=0)
		{
			return (mmv + u32Temp2);
		}
		else
		{
			if(u32Temp1 == 0)
			{
				return (mmv + u32Temp2);
			}
			else
			{
				return (mmv+1);
			}
		}

	}
}


/****************************************************************************/
/* function:  The floating average is calculated with an unsigned long as   */
/*            old floating average, an unsigned long as actual measured     */
/*            value and an unsigned long as average value.                  */
/*            unsigned long= gmw + ((messwert - gmw >> 32 ) * mitko)        */
/****************************************************************************/
/**
 * @brief Computes one update of a fixed-point moving mean value.
 *
 * @details
 * The floating average is calculated with an unsigned long as old floating average, an unsigned
 * long as actual measured value and an unsigned long as average value. unsigned long= gmw +
 * ((messwert - gmw >> 32 ) * mitko)
 *
 * @param[in] mmv Previous moving-mean (floating-average) state. Representable range: 0 to 4294967295.
 * @param[in] measure Current measured value. Representable range: 0 to 4294967295.
 * @param[in] crlc Fixed-point averaging coefficient. Representable range: 0 to 4294967295.
 * @return Result of `u32_mmv_u32_u32_u32_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_average
 */
u32 u32_mmv_u32_u32_u32_fac1(register u32 mmv,register u32 measure,register u32 crlc)
{

	u32 u32Temp1, u32Temp2, u32Temp3, u32Result1,u32Result2;
	if(measure < mmv)
	{
		u32Temp1 = mmv - measure;
		u32Temp2 = MulHighWord(u32Temp1,crlc);
		u32Temp3 = MulLowWord(u32Temp1,crlc);
		if(u32Temp3 <= 0x7FFFFFFF)
		{
			u32Result1 = mmv - u32Temp2 ;
		}
		else
		{
			u32Result1 = mmv - (u32Temp2+1) ;
		}
		if(u32Result1 == mmv)
		{
			return (u32Result1);
		}
		else
		{
			return u32Result1;
		}


	}
	else
	{
		u32Temp1 = measure - mmv;
		u32Temp2 = ~(MulHighWord(u32Temp1,crlc))+1;
		u32Temp3 = MulLowWord(u32Temp1,crlc);
		u32Result1 = u32Temp2 - mmv;
		if(u32Temp3 <= 0x7FFFFFFF)
		{
			u32Result1 = (~mmv +1) + (u32Temp2+1) ;
		}
		else
		{
			u32Result1 = -mmv + (u32Temp2-1) ;
		}

		return (~(u32Result1)+1);
	}

}


/****************************************************************************/
/* function:  The floating average is calculated with an unsigned long as   */
/*            old floating average, an unsigned long as actual measured     */
/*            value and an unsigned long as average value.                    */
/*            unsigned long= gmw + ((messwert - gmw >> 16 ) * mitko)        */
/****************************************************************************/
/**
 * @brief Computes one update of a fixed-point moving mean value.
 *
 * @details
 * The floating average is calculated with an unsigned long as old floating average, an unsigned
 * long as actual measured value and an unsigned long as average value. unsigned long= gmw +
 * ((messwert - gmw >> 16 ) * mitko)
 *
 * @param[in] mmv Previous moving-mean (floating-average) state. Representable range: 0 to 4294967295.
 * @param[in] measure Current measured value. Representable range: 0 to 4294967295.
 * @param[in] crlc Fixed-point averaging coefficient. Representable range: 0 to 65535.
 * @return Result of `u32_mmv_u32_u32_u16_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 16; left shift(s): 16).
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_average
 */
u32 u32_mmv_u32_u32_u16_fac1(u32 mmv, u32 measure, u16 crlc)
{
	u32 u32Temp1, u32Temp2, u32Temp3, u32crlc;
	u32 u32Result1;
	u32crlc = (u32)crlc;
	if( mmv >= measure )
	{
		u32Temp1 = (mmv - measure);
		u32Temp2 = MulHighWord(u32Temp1, u32crlc);
		u32Temp3 = MulLowWord(u32Temp1, u32crlc);
		u32Temp2 = (u32Temp2<<16)|((u32Temp3 & 0xFFFF0000)>>16);
//		u32Result1 = mmv - u32Temp2 ;
//		return u32Result1;

			if((u32Temp3 & 0xFFFF) <= 0x7FFF)
			{
				u32Result1 = mmv - u32Temp2 ;
			}
			else
			{
				u32Result1 = mmv - (u32Temp2+1) ;
			}

			if(u32Result1 == mmv)
			{
				return (u32Result1-1);
			}
			else
			{
				return u32Result1;
			}

	}
	else
	{
		u32Temp1 = measure - mmv;
		u32Temp2 = MulHighWord(u32Temp1,crlc);
		u32Temp3 = MulLowWord(u32Temp1,crlc);
		u32Temp2 = ~((u32Temp2<<16)|((u32Temp3 & 0xFFFF0000)>>16))+1;
		u32Result1 = mmv - u32Temp2 +1;
		if(((u32Temp3 & 0xFFFF) <= 0x7FFF) | ((u32Temp2 & 0xFFFF) <= 0x7FFF))
		{
			u32Result1 = mmv  - u32Temp2   ;
		}
		else
		{
			u32Result1 = mmv - u32Temp2 +1 ;
		}

		return (u32Result1);
	}
}


/****************************************************************************/
/* function:  The floating average is calculated with an unsigned long as   */
/*            old floating average, an unsigned long as actual measured     */
/*            value and a signed long as average value.                     */
/*            unsigned long= gmw + ((messwert - gmw >> 31 ) * mitko)        */
/****************************************************************************/
/**
 * @brief Computes one update of a fixed-point moving mean value.
 *
 * @details
 * The floating average is calculated with an unsigned long as old floating average, an unsigned
 * long as actual measured value and a signed long as average value. unsigned long= gmw +
 * ((messwert - gmw >> 31 ) * mitko)
 *
 * @param[in] mmv Previous moving-mean (floating-average) state. Representable range: 0 to 4294967295.
 * @param[in] measure Current measured value. Representable range: 0 to 4294967295.
 * @param[in] crlc Fixed-point averaging coefficient. Representable range: -2147483648 to 2147483647.
 * @return Result of `u32_mmv_u32_u32_s32_fac1` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note This is a fixed-point scaling routine; the encoded coefficient range is determined by the operand type and the implemented shift count.
 * @ingroup ecmath_average
 */
u32 u32_mmv_u32_u32_s32_fac1(u32 mmv, u32 measure, s32 crlc)
{
	u32 u32Temp1, u32Temp2, u32Temp3, u32crlc;
	u32 u32Result1;

}


/****************************************************************************/
/* function:  The floating average is calculated with an unsigned long as   */
/*            old floating average, an unsigned long as actual measured     */
/*            value and a signed long as average value.                     */
/*            unsigned long= gmw + ((messwert - gmw >> 15 ) * mitko)        */
/****************************************************************************/
u32 u32_mmv_u32_u32_s16_fac1(u32 mmv, u32 measure, s16 crlc);

/****************************************************************************/
/* function:  The floating average is calculated with a signed long as      */
/*            old floating average, a signed long as actual measured        */
/*            value and an unsigned long as average value.                  */
/*            unsigned long= gmw + ((messwert - gmw >> 32 ) * mitko)        */
/****************************************************************************/
u32 u32_mmv_s32_s32_u32_fac1(s32 mmv, s32 measure, u32 crlc);

/****************************************************************************/
/* function:  The floating average is calculated with a signed long as      */
/*            old floating average, a signed long as actual measured        */
/*            value and an unsigned long as average value.                  */
/*            unsigned long= gmw + ((messwert - gmw >> 16 ) * mitko)        */
/****************************************************************************/
u32 u32_mmv_s32_s32_u16_fac1(s32 mmv, s32 measure, u16 crlc);

/****************************************************************************/
/* function:  The floating average is calculated with a signed long as      */
/*            old floating average, a signed long as actual measured        */
/*            value and an unsigned long as average value.                  */
/*            unsigned long= gmw + ((messwert - gmw >> 31 ) * mitko)        */
/****************************************************************************/
u32 u32_mmv_s32_s32_s32_fac1(s32 mmv, s32 measure, s32 crlc);

/****************************************************************************/
/* function:  The floating average is calculated with a signed long as      */
/*            old floating average, a signed long as actual measured        */
/*            value and an unsigned long as average value.                  */
/*            unsigned long= gmw + ((messwert - gmw >> 15 ) * mitko)        */
/****************************************************************************/
u32 u32_mmv_s32_s32_s16_fac1(s32 mmv, s32 measure, s16 crlc);

/****************************************************************************/
/* function:  The floating average is calculated with a signed long as      */
/*            old floating average, a signed long as actual measured        */
/*            value and an unsigned long as average value.                  */
/*            unsigned long= gmw + ((messwert - gmw >> 16 ) * mitko)        */
/****************************************************************************/
s32 s32_mmv_s32_s32_u16_fac1(s32 mmv, s32 measure, u16 crlc);

/** @} */ /* end of ecmath_average */
