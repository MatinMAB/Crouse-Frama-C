/*
 * shift_Ccode.h
 *
 *  Created on: Jan 4, 2020
 *      Author: ng104383
 */

#ifndef SHIFT_CCODE_H_
#define SHIFT_CCODE_H_

#include "Platform_Types.h"


 u8 u8_max_tab_u16p_u8(const u16 *, u8);
 u8 u8_max_tab_u16p_u8_Asm(const u16 *, u8);
 s8 s8_s16_shr3(s16);
 s8 s8_s16_shr3_Asm(s16);
 s8 s8_s32(s32);
 s8 s8_s32_Asm(s32);
 s16 s16_s16_shl2(s16);
 s16 s16_s16_shl2_Asm(s16);
 s16 s16_s16_shl3(s16);
 s16 s16_s16_shl3_Asm(s16);
 s16 s16_s16_shl4(s16);
 s16 s16_s16_shl4_Asm(s16);
 s16 s16_s32(s32);
 s16 s16_s32_Asm(s32);
 s16 s16_u16(u16);
 s16 s16_u16_Asm(u16);
 u8 u8_s16_shr2(s16);
 u8 u8_s16_shr2_Asm(s16);
 u8 u8_u16(u16);
 u8 u8_u16_Asm(u16);
 u8 u8_u32(u32);
 u8 u8_u32_Asm(u32);
 u8 u8_u16_shr4(u16);
 u8 u8_u16_shr4_Asm(u16);
 u16 u16_s16(s16);
 u16 u16_s16_Asm(s16);
 u16 u16_u32(u32);
 u16 u16_u32_Asm(u32);
 u16 u16_s16_shl2(s16);
 u16 u16_s16_shl2_Asm(s16);
 u16 u16_s16_shl6(s16);
 u16 u16_s16_shl6_Asm(s16);
 s32 s32_exp05_s32_u8(s32, u8);
 s32 s32_exp05_s32_u8_Asm(s32, u8);
 u16 u16_exp05_u32_u8(u32, u8);
 u16 u16_exp05_u32_u8_Asm(u32, u8);
 u32 u32_exp05_u32_u8(u32, u8);
 u32 u32_exp05_u32_u8_asm(u32, u8);
 u32 u32_rotr_u32_u16(u32, u16);
 u32 u32_rotr_u32_u16_Asm(u32, u16);
 u32 u32_rotl_u32_u16(u32, u16);
 u32 u32_rotl_u32_u16_Asm(u32, u16);
 u16 u16_abs_s16(s16);
 u16 u16_abs_s16_Asm(s16);
 s16 s16_abs_s16(s16);
 s16 s16_abs_s16_Asm(s16);
 s8 s8_s16(s16);
 s8 s8_s16_Asm(s16);
 s16 s16_mul_s16_u16_exp05_u8(s16, u16, u8);
 s16 s16_mul_s16_u16_exp05_u8_Asm(s16, u16, u8);
 s16 s16_mul_s16_u16_exp2_u8(s16, u16, u8);
 s16 s16_mul_s16_u16_exp2_u8_Asm(s16, u16, u8);
 u16 u16_mul_u16_u16_exp05_u8(u16, u16, u8);
 u16 u16_mul_u16_u16_exp05_u8_Asm(u16, u16, u8);
 u16 u16_mul_u16_u16_exp2_u8(u16, u16, u8);
 u16 u16_mul_u16_u16_exp2_u8_Asm(u16, u16, u8);
 s16 s16_s16_shl6(s16);
 s16 s16_s16_shl6_Asm(s16);
 u16 u16_s32(s32);
 u16 u16_s32_Asm(s32);
 s16 s16_exp2_s16_u8(s16, u8);
 s16 s16_exp2_s16_u8_Asm(s16,u8);
 u16 u16_exp2_u16_u8(u16,u8);
 u16 u16_exp2_u16_u8_Asm(u16,u8);
 s16 s16_mul_s16_s16_exp05_u8(s16,s16,u8);
 s16 s16_mul_s16_s16_exp05_u8_Asm(s16,s16,u8);
 u8 u8_s8(s8);
 u8 u8_s8_Asm(s8);
 u8 u8_s16(s16);
 u8 u8_s16_Asm(s16);
 u8 u8_abs_s8(s8);
 u8 u8_abs_s8_Asm(s8);
 s8 s8_u8(u8);
 s8 s8_u8_Asm(u8);
 s8 s8_u16(u16);
 s8 s8_u16_Asm(u16);
 s8 s8_abs_s8(s8);
 s8 s8_abs_s8_Asm(s8);
 s16 s16_u32(u32);
 s16 s16_u32_Asm(u32);
 u32 u32_s32(s32);
 u32 u32_s32_Asm(s32);
 u32 u32_abs_s32(s32);
 u32 u32_abs_s32_Asm(s32);
 s32 s32_u32(u32);
 s32 s32_u32_Asm(u32);
 s32 s32_abs_s32(s32);
 s32 s32_abs_s32_Asm(s32);
 s8 s8_exp05_s16_u8(s16,u8);
 s8 s8_exp05_s16_u8_Asm(s16,u8);
 u16 u16_exp2_s16_u8(s16,u8);
 u16 u16_exp2_s16_u8_Asm(s16,u8);
 u8 u8_exp05_s16_u8(s16,u8);
 u8 u8_exp05_s16_u8_Asm(s16,u8);
 u8 u8_exp05_u16_u8(u16, u8);
 u8 u8_exp05_u16_u8_Asm(u16, u8);

#endif /* SHIFT_CCODE_H_ */
