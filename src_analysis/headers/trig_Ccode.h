/*
 * trig_Ccode.h
 *
 *  Created on: Jan 27, 2020
 *      Author: ng104383
 */

#ifndef TRIG_CCODE_H_
#define TRIG_CCODE_H_

#include "Platform_Types.h"

 
 u16 u16_sin_u16(u16);
 u16 u16_sin_u16_Asm(u16);
 
 s16 s16_sin_u32(u32);
 s16 s16_sin_u32_Asm(u32);
 
 u16 u16_cos_u16(u16);
 u16 u16_cos_u16_Asm(u16);
 
 s16 s16_cos_u32(u32);
 s16 s16_cos_u32_Asm(u32);
 
 u16 u16_tan_u16(u16);
 u16 u16_tan_u16_Asm(u16);
 
 s16 s16_tan_u32(u32);
 s16 s16_tan_u32_Asm(u32);
 
#endif /* TRIG_CCODE_H_ */
