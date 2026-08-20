/**
 * @file trig_Ccode.c
 * @brief Fixed-point trigonometric routines.
 *
 * @details
 * C-only ECMath implementation prepared for formal analysis with Frama-C/EVA. Assembly
 * implementations were removed, while the executable C statements were retained. Function-level
 * documentation was reconstructed from the legacy `ecmath.h` contract and checked against the
 * corresponding implementation.
 *
 * @note Documentation edition: EVA C-only Doxygen v2.
 * @note The documentation pass does not intentionally change executable C statements.
 * @defgroup ecmath_trig Fixed-point trigonometric routines
 * @{
 */

/*
 * trig_Ccode.c
 *
 *  Created on: Jan 27, 2020
 *      Author: ng104383
 */

#include "trig_Ccode.h"
short arctantab[] = {0xB470, 0x8000, 0x4B90, 0x27ED, 0x1444, 0xA2C, 0x517, 0x28C, 0x146, 0xA3, 0x51, 0x29, 0x14, 0xA, 5, 3, 1};

/**
 * @brief Computes a fixed-point sine value.
 *
 * @details
 * Sine Function: Returns an u16 value which is the sine of the u16 input parameter
 *
 * @param[in] Phi Fixed-point phase/angle input. Representable range: 0 to 65535.
 * @return Result of `u16_sin_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (right shift(s): 14; left shift(s): 1).
 * @ingroup ecmath_trig
 */
u16 u16_sin_u16(u16 Phi)
{
	u32 u32R30 = 0x11616E8E, u32R31 = 0x22C2DD1C; 
	u16 u16Tabmem = 0, u16Ind = 0;
	s32 s32Tabmem = 0, Phi1 = 0;
	Phi = Phi & 0xFFFF;
	if(Phi != 0)
	{
		u16Tabmem = arctantab[0];
		s32Tabmem = Phi - u16Tabmem;
		while(u16Ind < 0x10)
		{
			if(s32Tabmem >= 0)
			{
				Phi = u32R31 >> u16Ind;
				Phi1 = u32R30 >> u16Ind;
				u32R30 = u32R30 - Phi;
//				u16Ind = u16Ind << 1;
				Phi = arctantab[u16Ind + 1];
				Phi1 = Phi1 + u32R31;
				s32Tabmem = s32Tabmem - Phi;


			}
			else
			{
				Phi = u32R31 >> u16Ind;
			    Phi1 = u32R30 >> u16Ind;
			    u32R30 = u32R30 + Phi;
//			    u16Ind = u16Ind << 1;
				Phi = arctantab[u16Ind + 1];
				Phi1 = u32R31 - Phi1;
				s32Tabmem = s32Tabmem + Phi;
			}
			u16Ind = u16Ind + 1;
			u32R31 = Phi1;
		}
		return ((Phi1 >> 14) & 0xFFFF);

	}
	else
	{
		return 0;
	}
}


/**
 * @brief Computes a fixed-point sine value.
 *
 * @details
 * Sine Function: Returns an s16 value which is the sine of the u32 input parameter
 *
 * @param[in] phi Fixed-point phase/angle input. Representable range: 0 to 4294967295.
 * @return Result of `s16_sin_u32` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_trig
 */
s16 s16_sin_u32(u32 phi)
{

}


/**
 * @brief Computes a fixed-point cosine value.
 *
 * @details
 * Cos Function: Returns an u16 value which is the cosine of the u16 input parameter
 *
 * @param[in] phi Fixed-point phase/angle input. Representable range: 0 to 65535.
 * @return Result of `u16_cos_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_trig
 */
u16 u16_cos_u16(u16 phi)
{

}


/**
 * @brief Computes a fixed-point cosine value.
 *
 * @details
 * Cos Function: Returns an s16 value which is the cosine of the u32 input parameter
 *
 * @param[in] phi Fixed-point phase/angle input. Representable range: 0 to 4294967295.
 * @return Result of `s16_cos_u32` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_trig
 */
s16 s16_cos_u32(u32 phi)
{

}


/**
 * @brief Computes a fixed-point tangent value.
 *
 * @details
 * Tan Function: Returns an u16 value which is the tangent of the u16 input parameter
 *
 * @param[in] phi Fixed-point phase/angle input. Representable range: 0 to 65535.
 * @return Result of `u16_tan_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_trig
 */
u16 u16_tan_u16(u16 phi)
{

}


/**
 * @brief Computes a fixed-point tangent value.
 *
 * @details
 * Tan Function: Returns an s16 value which is the tangent of the u32 input parameter
 *
 * @param[in] phi Fixed-point phase/angle input. Representable range: 0 to 4294967295.
 * @return Result of `s16_tan_u32` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_trig
 */
s16 s16_tan_u32(u32 phi)
{
//	phi = phi & 0x3FFFF;
//	u32 u32R6 = 0x2FFFF,  u32R4 = 1, u32R30 = 0x11616E8E, u32R31 = 0x22C2DD1C, u32R7 = 0;
//	if(phi <= u32R6)
//	{
//		u32R7 = 0x3FFFF;
//		if(phi <= u32R7)
//		{
//			if( phi <= 0xFFFF)
//			{
//				phi = u32R7 - phi;
//				u32R4 = 0xFFFFFFFF;
//			}
//		}
//	}
}

/** @} */ /* end of ecmath_trig */
