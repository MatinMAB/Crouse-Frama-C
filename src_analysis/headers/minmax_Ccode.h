/*
 * minmax_Ccode.h
 *
 *  Created on: Jan 11, 2020
 *      Author: ng104383
 */

#ifndef MINMAX_CCODE_H_
#define MINMAX_CCODE_H_

#include "Platform_Types.h"

 
 s8 s8_min_max_s8_s8( s8, s8);
 s8 s8_min_max_s8_s8_Asm( s8, s8);
 s8 s8_min_max_s8_s8_s8(s8, s8, s8);
 s8 s8_min_max_s8_s8_s8_Asm(s8, s8, s8);
 s16 s16_min_max_s16_s16( s16, s16);
 s16 s16_min_max_s16_s16_Asm( s16, s16);
 s16 s16_min_max_s16_s16_s16(s16, s16, s16);
 s16 s16_min_max_s16_s16_s16_Asm(s16, s16, s16);
 u8 u8_min_max_u8_u8_u8( u8, u8, u8);
 u8 u8_min_max_u8_u8_u8_Asm( u8, u8, u8);
 u16 u16_min_max_u16_u16_u16( u16, u16, u16);
 u16 u16_min_max_u16_u16_u16_Asm( u16, u16, u16);
 s16 s16_grdlmt20_s16_u16(s16, u16);
 s16 s16_grdlmt20_s16_u16_Asm(s16, u16);
 u16 u16_norm_u16_u16_u16(u16, u16, u16 );
 u16 u16_norm_u16_u16_u16_Asm(u16, u16, u16 ); 
 s16 s16_lim_hys_s16_u16(s16, u16);
 s16 s16_lim_hys_s16_u16_Asm(s16, u16);
 u16 u16_limitnew_up_u16_u16_u16(u16, u16, u16);
 u16 u16_limitnew_up_u16_u16_u16_Asm(u16, u16, u16);
 u16 u16_limitnew_down_u16_u16_u16(u16 ,u16 ,u16);
 u16 u16_limitnew_down_u16_u16_u16_Asm(u16 ,u16 ,u16);
 u16 u16_limitnew_u16_u16_u16(u16, u16, u16);
 u16 u16_limitnew_u16_u16_u16_Asm(u16, u16, u16);
 s16 s16_limitnew_up_s16_s16_u16(s16, s16, u16);
 s16 s16_limitnew_up_s16_s16_u16_Asm(s16, s16, u16);
 s16 s16_limitnew_down_s16_s16_u16(s16, s16, u16);
 s16 s16_limitnew_down_s16_s16_u16_Asm(s16, s16, u16); 
 s16 s16_limitnew_s16_s16_u16(s16, s16, u16);
 s16 s16_limitnew_s16_s16_u16_Asm(s16, s16, u16);
 u16 u16_min_u16_u16(u16 ,u16);
 u16 u16_min_u16_u16_Asm(u16 ,u16); 
 s16 s16_min_s16_s16(s16 ,s16 );
 s16 s16_min_s16_s16_Asm(s16 ,s16 );
 u16 u16_max_u16_u16(u16, u16);
 u16 u16_max_u16_u16_Asm(u16, u16);
 s16 s16_max_s16_s16(s16, s16);
 s16 s16_max_s16_s16_Asm(s16, s16);
 u32 u32_min_max_u32_u32_u32( u32, u32, u32);
 u32 u32_min_max_u32_u32_u32_Asm( u32, u32, u32);
 s32 s32_min_max_s32_s32(s32, s32);
 s32 s32_min_max_s32_s32_Asm(s32, s32);
 u32 u32_limitnew_u32_u32_u32(u32, u32, u32);
 u32 u32_limitnew_u32_u32_u32_Asm(u32, u32, u32);
 u32 u32_limitnew_up_u32_u32_u32(u32 ,u32 ,u32 );
 u32 u32_limitnew_up_u32_u32_u32_Asm(u32 ,u32 ,u32 );
 u32 u32_limitnew_down_u32_u32_u32(u32, u32, u32);
 u32 u32_limitnew_down_u32_u32_u32_Asm(u32, u32, u32);
 u32 u32_limitnew_u32_u32_u16(u32 ,u32 ,u16 );
 u32 u32_limitnew_u32_u32_u16_Asm(u32 ,u32 ,u16 );
 u32 u32_limitnew_up_u32_u32_u16(u32 ,u32 ,u16);
 u32 u32_limitnew_up_u32_u32_u16_Asm(u32 ,u32 ,u16);
 u32 u32_limitnew_down_u32_u32_u16(u32 ,u32 ,u16);
 u32 u32_limitnew_down_u32_u32_u16_Asm(u32 ,u32 ,u16);
 s32 s32_limitnew_s32_s32_u32(s32 ,s32 ,u32 );
 s32 s32_limitnew_s32_s32_u32_Asm(s32 ,s32 ,u32 );
 s32 s32_limitnew_up_s32_s32_u32(s32 ,s32 ,u32);
 s32 s32_limitnew_up_s32_s32_u32_Asm(s32 ,s32 ,u32);
 s32 s32_limitnew_down_s32_s32_u32(s32 ,s32 ,u32);
 s32 s32_limitnew_down_s32_s32_u32_Asm(s32 ,s32 ,u32);
 s32 s32_limitnew_s32_s32_u16(s32 ,s32 ,u16 );
 s32 s32_limitnew_s32_s32_u16_Asm(s32 ,s32 ,u16 ); 
 s32 s32_limitnew_up_s32_s32_u16(s32 ,s32 ,u16);
 s32 s32_limitnew_up_s32_s32_u16_Asm(s32 ,s32 ,u16);
 s32 s32_limitnew_down_s32_s32_u16(s32 ,s32 ,u16);
 s32 s32_limitnew_down_s32_s32_u16_Asm(s32 ,s32 ,u16);
 s32 s32_min_max_s32_s32_s32(s32, s32, s32);
 s32 s32_min_max_s32_s32_s32_Asm(s32, s32, s32);
 s8 s8_limitnew_up_s8_s8_u8(s8 ,s8 ,u8 );
 s8 s8_limitnew_up_s8_s8_u8_Asm(s8 ,s8 ,u8 );
 s8 s8_limitnew_down_s8_s8_u8(s8 ,s8 ,u8 );
 s8 s8_limitnew_down_s8_s8_u8_Asm(s8 ,s8 ,u8 );
 s8 s8_limitnew_s8_s8_u8(s8 ,s8 ,u8 );
 s8 s8_limitnew_s8_s8_u8_Asm(s8 ,s8 ,u8 );
 u8 u8_limitnew_up_u8_u8_u8(u8,u8,u8);
 u8 u8_limitnew_up_u8_u8_u8_Asm(u8,u8,u8); 
 u8 u8_limitnew_down_u8_u8_u8(u8 ,u8 ,u8 );
 u8 u8_limitnew_down_u8_u8_u8_Asm(u8 ,u8 ,u8 );
 u8 u8_limitnew_u8_u8_u8(u8 ,u8 ,u8 );
 u8 u8_limitnew_u8_u8_u8_Asm(u8 ,u8 ,u8 );
 u8 u8_min_u8_u8(u8 ,u8);
 u8 u8_min_u8_u8_Asm(u8 ,u8);
 u32 u32_min_u32_u32(u32 ,u32);
 u32 u32_min_u32_u32_Asm(u32 ,u32);
 u8 u8_max_u8_u8(u8 ,u8);
 u8 u8_max_u8_u8_Asm(u8 ,u8); 
 u32 u32_max_u32_u32(u32 ,u32);
 u32 u32_max_u32_u32_Asm(u32 ,u32);
 s8 s8_min_s8_s8(s8 ,s8);
 s8 s8_min_s8_s8_Asm(s8 ,s8); 
 s32 s32_min_s32_s32(s32 ,s32);
 s32 s32_min_s32_s32_Asm(s32 ,s32);
 s8 s8_max_s8_s8(s8 ,s8);
 s8 s8_max_s8_s8_Asm(s8 ,s8);
 s32 s32_max_s32_s32(s32 ,s32);
 s32 s32_max_s32_s32_Asm(s32 ,s32);
#endif /* MINMAX_CCODE_H_ */
