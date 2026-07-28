/*
 * hip_Ccode.h
 *
 *  Created on: Jan 21, 2020
 *      Author: ng104383
 */

#ifndef HIP_CCODE_H_
#define HIP_CCODE_H_

#include "Platform_Types.h"

 
s16 s16_hip1_s16_u8_u8_u16_fac1(s16, u8, u8, u16);
s16 s16_hip1_s16_u8_u8_u16_fac1_Asm(s16, u8, u8, u16);

s16 s16_hip1_s16_s8_s8_u16_fac1(s16, s8, s8, u16);
s16 s16_hip1_s16_s8_s8_u16_fac1_Asm(s16, s8, s8, u16);

s32 s32_hip1_s32_u16_u16_u16_fac1(s32, u16, u16 , u16 );
s32 s32_hip1_s32_u16_u16_u16_fac1_Asm(s32, u16, u16 , u16 );

#endif /* HIP_CCODE_H_ */
