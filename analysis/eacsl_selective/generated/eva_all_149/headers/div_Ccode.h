/*
 * ASM_FUNCs.h
 *
 *  Created on: Dec 12, 2019
 *      Author: ng104383
 */

#ifndef ASM_FUNCS_H_
#define ASM_FUNCS_H_

#include "Platform_Types.h"

 
 
 u8 u8_div_u32_u16(u32, u16);
 u8 u8_div_u32_u16_Asm(u32, u16);
 s16 s16_fac05_div_s16_s16(s16, s16 );
 s16 s16_fac05_div_s16_s16_Asm(s16, s16 );
 s16 s16_div_s32_s16(s32, s16);
 s16 s16_div_s32_s16_Asm(s32, s16);
 s16 s16_fac05_div_s16_u16(s16, u16);
 s16 s16_fac05_div_s16_u16_Asm(s16, u16);
 s16 s16_div_s16_u16_shl0(s16, u16);
 s16 s16_div_s16_u16_shl0_Asm(s16, u16);
 u8 u8_fac1_div_u16_u16(u16, u16);
 u8 u8_fac1_div_u16_u16_Asm(u16, u16);
 u16 u16_div_s32_u16(s32, u16);
 u16 u16_div_s32_u16_Asm(s32, u16);
 u16  u16_fac1_div_u16_u16(u16, u16);
 u16  u16_fac1_div_u16_u16_Asm(u16, u16);
 u16 u16_div_u32_u16(u32, u16);
 u16 u16_div_u32_u16_Asm(u32, u16);
 s16 s16_mul_s16_u16_div_s16(s16, u16, s16);
 s16 s16_mul_s16_u16_div_s16_Asm(s16, u16, s16);
 s16 s16_mul_u16_s16_div_u16(u16, s16, u16);
 s16 s16_mul_u16_s16_div_u16_Asm(u16, s16, u16);
 u16 u16_mul_s16_u16_div_s16(s16, u16, s16);
 u16 u16_mul_s16_u16_div_s16_Asm(s16, u16, s16);
 u16 u16_mul_s16_u16_div_u16(s16, u16, u16);
 u16 u16_mul_s16_u16_div_u16_Asm(s16, u16, u16);
 u16 u16_mul_u16_u16_div_u16(u16, u16, u16);
 u16 u16_mul_u16_u16_div_u16_Asm(u16, u16, u16);
 u16 u16_mul_u16_u16_div_u32(u16, u16, u32);
 u16 u16_mul_u16_u16_div_u32_Asm(u16, u16, u32);
 u32 u32_div_u32_u16(u32, u16);
 u32 u32_div_u32_u16_Asm(u32, u16);
 s16 s16_mul_s16_s16_div_s16(s16, s16, s16);
 s16 s16_mul_s16_s16_div_s16_Asm(s16, s16, s16);
 s16 s16_mul_s16_s16_div_u16(s16, s16, u16);
 s16 s16_mul_s16_s16_div_u16_Asm(s16, s16, u16);
 u32 u32_div_u32_s32(u32, s32);
 u32 u32_div_u32_s32_Asm(u32, s32);
 u32 u32_div_s32_u32(s32, u32);
 u32 u32_div_s32_u32_Asm(s32, u32);
 u32 u32_div_s32_s32(s32, s32);
 u32 u32_div_s32_s32_Asm(s32, s32);
 u32 u32_div_u32_u32(u32, u32); 
 u32 u32_div_u32_u32_Asm(u32, u32); 
 s32 s32_div_u32_s32(u32, s32);
 s32 s32_div_u32_s32_Asm(u32, s32);
 s32 s32_div_s32_u32(s32, u32);
 s32 s32_div_s32_u32_Asm(s32, u32);
 s32 s32_div_s32_s32(s32, s32);
 s32 s32_div_s32_s32_Asm(s32, s32);
 s16 s16_div_s32_u32(s32, u32);
 s16 s16_div_s32_u32_Asm(s32, u32);
 u32 u32_mul_u32_u32_div_u32(u32, u32, u32);
 u32 u32_mul_u32_u32_div_u32_Asm(u32, u32, u32);
 u32 u32_mul_u32_u32_div_s32(u32, u32, s32);
 u32 u32_mul_u32_u32_div_s32_Asm(u32, u32, s32);
 u32 u32_mul_u32_s32_div_u32(u32, s32, u32);
 u32 u32_mul_u32_s32_div_u32_Asm(u32, s32, u32);
 u32 u32_mul_u32_s32_div_s32(u32, s32, s32);
 u32 u32_mul_u32_s32_div_s32_Asm(u32, s32, s32);
 s32 s32_mul_s32_s32_div_s32(s32, s32, s32);
 s32 s32_mul_s32_s32_div_s32_Asm(s32, s32, s32);
 s32 s32_mul_s32_s32_div_u32(s32, s32, u32);
 s32 s32_mul_s32_s32_div_u32_Asm(s32, s32, u32);
 s32 s32_mul_u32_s32_div_s32(u32, s32, s32);
 s32 s32_mul_u32_s32_div_s32_Asm(u32, s32, s32);
 s32 s32_mul_u32_s32_div_u32(u32, s32, u32);
 s32 s32_mul_u32_s32_div_u32_Asm(u32, s32, u32);
 
 u16 u16_mul_u16_u16_div_u32(u16, u16 , u32);
 
 
 //u64 div64(u64 a,u64 b1, u64 c, u64 d);
 u64 div64_Asm(u32 a,u32 b, u32 c, u32 d);
 s8 Test(s8 , u8);
 int div_main(void);
 u32 div64_main(u64, u32, u32, u32);
 u32 leading_zero_naive(s32);
 
#endif /* ASM_FUNCS_H_ */
