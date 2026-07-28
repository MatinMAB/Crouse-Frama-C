/*
 * add_Ccode.h
 *
 *  Created on: Dec 12, 2019
 *      Author: ng104383
 */

#ifndef ADD_CCODE_H_
#define ADD_CCODE_H_

#include "Platform_Types.h"

 u8 u8Add(u8, u8); 
 u8 u8Add_Asm(u8, u8); 
 s8 s8_add_s8_s8(s8, s8);
 s8 s8_add_s8_s8_Asm(s8, s8);
 s8 s8_add_u8_s8(u8, s8);
 s8 s8_add_u8_s8_Asm(u8, s8);
 s16 s16_add_s16_s16(s16, s16);
 s16 s16_add_s16_s16_Asm(s16, s16);
 s16 s16_add_u16_s16(u16, s16);
 s16 s16_add_u16_s16_Asm(u16, s16);
 s32 s32_add_s32_s32(s32, s32);
 s32 s32_add_s32_s32_Asm(s32, s32);
 u8 u8_add_u8_u8(u8, u8);
 u8 u8_add_u8_u8_Asm(u8, u8);
 u8 u8_add_u8_s8(u8, s8);
 u8 u8_add_u8_s8_Asm(u8, s8);
 u16 u16_add_u16_u16(u16, u16);
 u16 u16_add_u16_u16_Asm(u16, u16);
 u16 u16_add_u16_s16(u16, s16);
 u16 u16_add_u16_s16_Asm(u16, s16);
 u32 u32_add_u32_u32(u32, u32);
 u32 u32_add_u32_u32_Asm(u32, u32);
 u16 u16_add_u16_u16_u16(u16, u16, u16);
 u16 u16_add_u16_u16_u16_Asm(u16, u16, u16);
 s16 s16_add_s16_s16_s16(s16 , s16 , s16);
 s16 s16_add_s16_s16_s16_Asm(s16 , s16 , s16);
 u32 u32_add_u32_s32(u32, s32);
 u32 u32_add_u32_s32_Asm(u32, s32);
 u32 u32_add_s32_s32(s32, s32);
 u32 u32_add_s32_s32_Asm(s32, s32);
 u32 u32_add_u32_u32_u32( u32, u32, u32);
 u32 u32_add_u32_u32_u32_Asm( u32, u32, u32);
 s32 s32_add_s32_s32_s32(s32, s32, s32);
 s32 s32_add_s32_s32_s32_Asm(s32, s32, s32);

#endif /* ADD_CCODE_H_ */
