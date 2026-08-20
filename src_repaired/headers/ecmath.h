/*~-*/
/*~XSF_LANGUAGE: C/C++*/
/*~A*/
/*~+:Module Header*/
/*~T*/
/****************************************************************************
 * COPYRIGHT (C) SIEMENS VDO AUTOMOTIVE AG 2002
 * ALL RIGHTS RESERVED.
 * 
 * The reproduction, transmission or use of this document or its
 * contents is not permitted without express written authority.
 * Offenders will be liable for damages. All rights, including rights
 * created by patent grant or registration of a utility model or design,
 * are reserved.
 *---------------------------------------------------------------------------
 * Purpose:    First Release for ESYS Target; Code ported from MATH_034_PPC  
 * 
 * Processor:  ESYS
 * Tool chain: DiabData
 * Filename:   $Workfile:   ecmath.h  $
 * Revision:   $Revision: 1.3 $
 * Author:     $Author: uidu0618 $
 * Date:       $Date: 2008/09/09 16:32:00CEST $
 * Changes:    $Log: ecmath.h  $
 * Changes:    Revision 1.3 2008/09/09 16:32:00CEST uidu0618 
 * Changes:    PVCS: 0LC SWCN 40: MATH_MPC55XX: Implement spec baseline SP_MATH_038
 * Changes:    PVCS: 0LC SIF 141: MATH_MPC55XX: Remove 'register' storage class from the function u8_max_tab_u16p_u8
 * Changes:    PVCS: 0LC SWCN 85: MATH_MPC55XX: Migrate library to GMEM_2_2_2
 * Changes:    PVCS: (checked-in for uidm3528)
 * Changes:    {
 * Changes:       "file_name" : "ecmath.h",
 * Changes:       "member_import_id" : "561",
 * Changes:       "member_id" : "28294",
 * Changes:       "pvcs_rev" : "1.3",
 * Changes:       "library" : "0_GEN-STD-COMMON32"
 * Changes:    }
 * 
 *    Rev 1.3   Sep 09 2008 16:59:06   uide5432
 * 0LC SWCN 40: MATH_MPC55XX: Implement spec baseline SP_MATH_038
 * 0LC SIF 141: MATH_MPC55XX: Remove 'register' storage class from the function u8_max_tab_u16p_u8
 * 0LC SWCN 85: MATH_MPC55XX: Migrate library to GMEM_2_2_2
 * (checked-in for uidm3528)
 * 
 *    Rev 1.2   Sep 09 2008 13:02:44   uide5432
 * 0LC SWCN 40: MATH_MPC55XX: Implement spec baseline SP_MATH_038
 * 0LC SIF 141: MATH_MPC55XX: Remove 'register' storage class from the function u8_max_tab_u16p_u8
 * 0LC SWCN 85: MATH_MPC55XX: Migrate library to GMEM_2_2_2
 * (checked-in for uidm3528)
 * 
 *    Rev 1.1   Sep 09 2008 10:04:16   uide5432
 * 0LC SWCN 40: MATH_MPC55XX: Implement spec baseline SP_MATH_038
 * 0LC SIF 141: MATH_MPC55XX: Remove 'register' storage class from the function u8_max_tab_u16p_u8
 * 0LC SWCN 85: MATH_MPC55XX: Migrate library to GMEM_2_2_2
 * (checked-in for uidm3528)
 * 
 *    Rev 1.0   May 22 2007 10:51:56   uide5432
 * 0LC SIF 115 (403) Remove release note from ARL but add specs and reports
 * 0LC SIF 117 (405) Mask PC-Lint warning 704 since it makes no sense
 * 0LC SIF 120 (408) ro files display results as ASCII charaters - change ptu files
 * 0LC SIF 135 (466) Avoid PC-Lint info 734 with external cast and Mask info 702 since it makes no sense
 * 0LC SIF 136 (467) Avoid PC-Lint warning 553
 * 0LC SIF 137 (468) Avoid PC-Lint info 750
 * 0LC SIF 138 (469) Remove build warning
 * 0LC SIF 139 (470) Correct the value after division by zero for the function s32_div_u32_s32
 * OLC SAR 22  (426) Function "\'"s32_mul_s32_s8_fac2"\'" not available in inline mode
 * 
 *    Rev 1.2   Dec 01 2006 15:13:36   uide5455
 * 0LC DCN 7(346)   compress the user document
 * 0LC SIF 104(342) inclusion of ecmath.h
 * 0LC SIF 105(343) missing explicit typecast in Mul.h and Avrg.h
 * 0LC SIF 106(345) wrong comment in ecmath.h
 * 0LC SWCN 17(341) Trigonometric functions
 * 0LC SWCN 18(344) new mul and mmv functions for 32bit data types
 * 
 *    Rev 1.1   Jan 31 2006 13:55:04   uide5368
 * OLC-SCN-113(292)-Release of new Mathematical Library V036 for ESYS Target
 * 
 *    Rev 1.0   Oct 20 2004 14:55:32   uide5368
 * Initial revision.
 * 
 ****************************************************************************/

/*~E*/
/*~I*/
#ifndef ECMATH_H 
/*~T*/
#define ECMATH_H 
/*~A*/
/*~+:Import*/
/*~T*/
/* Import                                                                      */

/*~T*/

/*~T*/

/*~E*/
/*~A*/
/*~+:Data-type Limits*/
/*~T*/

/*~E*/
/*~A*/
/*~+:Public Macro Definitions*/
/*~T*/
/* Public Macro Definitions                                                    */

/*~A*/
/*~+:Initialization of inlining mechanism*/
/*~T*/
/* Set default, if INLINE_LIBS != 1 or 2: no inlining */
#ifndef INLINE_LIBS
   #define INLINE_LIBS 0
#else
   #if !( (INLINE_LIBS==1) || (INLINE_LIBS==2) )
      #undef INLINE_LIBS
      #define INLINE_LIBS 0
   #endif
#endif

/*~I*/
/* Define INLINE macro according to choice */
#if (INLINE_LIBS==0) 
/*~T*/
/* Define INLINE macro as empty */
#undef INLINE
#define INLINE
/*~O*/
/*~-*/
#else
/*~T*/
/* Define INLINE macro with inline keyword */
#undef INLINE
#define INLINE inline
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:Manage inlining criterium for each function*/
/*~I*/
#if !(INLINE_LIBS==0)
/*~A*/
/*~+:Functions, which are recommended for inlining (INLINE_LIBS=1)*/
/*~T*/
/* add functions */
#define INLINE_S8_ADD_S8_S8
#define INLINE_S8_ADD_U8_S8
#define INLINE_S16_ADD_S16_S16
#define INLINE_S16_ADD_U16_S16
#define INLINE_S32_ADD_S32_S32
#define INLINE_U8_ADD_U8_S8
#define INLINE_U8_ADD_U8_U8
#define INLINE_U16_ADD_U16_U16
#define INLINE_U16_ADD_U16_S16
#define INLINE_U32_ADD_U32_U32
#define INLINE_U16_ADD_U16_U16_U16
#define INLINE_U16_ADD_U16_U16_U16_U16
#define INLINE_S16_ADD_S16_S16_S16
#define INLINE_U32_ADD_U32_S32
#define INLINE_U32_ADD_S32_S32
#define INLINE_S32_ADD_U32_S32
#define INLINE_U32_ADD_U32_U32_U32
#define INLINE_S32_ADD_S32_S32_S32

/*~T*/
/* sub functions */
#define INLINE_S8_SUB_S8_U8
#define INLINE_S8_SUB_U8_U8
#define INLINE_S16_SUB_S16_S16
#define INLINE_S16_SUB_S16_U16
#define INLINE_S16_SUB_U16_S16
#define INLINE_S16_SUB_U16_U16
#define INLINE_U8_ABS_SUB_U8_U8
#define INLINE_U8_SUB_U8_U8
#define INLINE_U16_ABS_SUB_U16_U16
#define INLINE_U16_SUB_U16_U16
#define INLINE_U16_SUB_U32_U32
#define INLINE_U16_ABS_SUB_S16_S16
#define INLINE_U32_SUB_U32_U32
#define INLINE_U16_SUB_U16_S16
#define INLINE_S32_SUB_S32_S32
#define INLINE_S16_SUB_U32_U32
#define INLINE_U32_SUB_U32_S32
#define INLINE_U32_SUB_S32_U32
#define INLINE_U32_SUB_S32_S32
#define INLINE_U32_ABS_SUB_U32_U32
#define INLINE_S32_SUB_U32_S32
#define INLINE_S32_SUB_S32_U32
#define INLINE_S32_SUB_U32_U32
#define INLINE_S32_ABS_SUB_S32_S32
#define INLINE_S8_SUB_S8_S8
#define INLINE_U8_SUB_U8_S8

/*~T*/
/* mul functions */
#define INLINE_ROOT_S8_MUL_S8_U8_FAC_LESS1
#define INLINE_ROOT_S8_MUL_S8_U8_FAC_GREATER1
#define INLINE_S8_MUL_S8_U8_FAC1
#define INLINE_S8_MUL_S8_U8_FAC2
#define INLINE_ROOT_LESS1_S16_MUL_S16_S16_FAC
#define INLINE_ROOT_GREATER1_S16_MUL_S16_S16_FAC
#define INLINE_S16_MUL_S16_S16_FAC1
#define INLINE_S16_MUL_S16_S16_FAC2
#define INLINE_ROOT_S16_MUL_S16_U8_FAC_LESS1
#define INLINE_ROOT_GRTR1_S16_MUL_S16_U8_FAC
#define INLINE_S16_MUL_S16_U8_FAC1
#define INLINE_S16_MUL_S16_U8_FAC2
#define INLINE_S16_MUL_S16_U16
#define INLINE_ROOT_S16_MUL_S16_U16_FAC_LESS1
#define INLINE_ROOT_GRT1_S16_MUL_S16_U16_FAC
#define INLINE_S16_MUL_S16_U16_FAC1
#define INLINE_S16_MUL_S16_U16_FAC2
#define INLINE_S16_MUL_U16_U16_FAC256
#define INLINE_S32_MUL_S16_U16
#define INLINE_S32_MUL_S32_U16
#define INLINE_ROOT_U8_MUL_U8_U8_FAC_LESS1
#define INLINE_ROOT_U8_MUL_U8_U8_FAC_GREATER1
#define INLINE_U8_MUL_U8_U8_FAC1
#define INLINE_U8_MUL_U8_U8_FAC2
#define INLINE_ROOT_U16_MUL_U16_U8_FAC_LESS1
#define INLINE_ROOT_GREATER_1_U16_MUL_U16_U8_FAC
#define INLINE_U16_MUL_U16_U8_FAC1
#define INLINE_U16_MUL_U16_U8_FAC2
#define INLINE_ROOT_U16_MUL_U16_U16_FAC_LESS1
#define INLINE_ROOT_GREATER1_U16_MUL_U16_U16_FAC
#define INLINE_U16_MUL_U16_U16_FAC1
#define INLINE_U16_MUL_U16_U16_FAC2
#define INLINE_U32_MUL_U32_U16
#define INLINE_U8_CAL1_U8_U8_S8
#define INLINE_U16_CAL1_U16_U16_S8
#define INLINE_U16_MUL_U16_U16
#define INLINE_U32_MUL_U16_U16
#define INLINE_S32_MUL_S16_S16
#define INLINE_U32_MUL_U32_S32
#define INLINE_U32_MUL_S32_S32
#define INLINE_U32_MUL_U32_U32
#define INLINE_ROOT_U32_MUL_U32_U16_FAC_LESS1
#define INLINE_U32_MUL_U32_U16_FAC1
#define INLINE_U32_MUL_U32_U16_FAC2
#define INLINE_ROOT_U32_MUL_U32_S16_FAC_LESS1
#define INLINE_U32_MUL_U32_S16_FAC1
#define INLINE_U32_MUL_U32_S16_FAC2
#define INLINE_ROOT_U32_MUL_U32_U32_FAC_LESS1
#define INLINE_U32_MUL_U32_U32_FAC1
#define INLINE_U32_MUL_U32_U32_FAC2
#define INLINE_ROOT_U32_MUL_U32_S32_FAC_LESS1
#define INLINE_U32_MUL_U32_S32_FAC1
#define INLINE_U32_MUL_U32_S32_FAC2
#define INLINE_S32_MUL_U32_S32
#define INLINE_S32_MUL_S32_S32
#define INLINE_ROOT_S32_MUL_S32_U16_FAC_LESS1
#define INLINE_S32_MUL_S32_U16_FAC1
#define INLINE_S32_MUL_S32_U16_FAC2
#define INLINE_ROOT_S32_MUL_S32_S16_FAC_LESS1
#define INLINE_S32_MUL_S32_S16_FAC1
#define INLINE_S32_MUL_S32_S16_FAC2
#define INLINE_S32_MUL_S32_U32_FAC05
#define INLINE_S32_MUL_S32_U32_FAC1
#define INLINE_S32_MUL_S32_U32_FAC2
#define INLINE_S32_MUL_S32_S32_FAC05
#define INLINE_S32_MUL_S32_S32_FAC1
#define INLINE_S32_MUL_S32_S32_FAC2
#define INLINE_ROOT_U32_MUL_U32_U8_FAC_LESS1
#define INLINE_U32_MUL_U32_U8_FAC1
#define INLINE_U32_MUL_U32_U8_FAC2
#define INLINE_ROOT_U32_MUL_U32_S8_FAC_LESS1
#define INLINE_U32_MUL_U32_S8_FAC1
#define INLINE_U32_MUL_U32_S8_FAC2
#define INLINE_ROOT_S32_MUL_S32_U8_FAC_LESS1
#define INLINE_S32_MUL_S32_U8_FAC1
#define INLINE_S32_MUL_S32_U8_FAC2
#define INLINE_ROOT_S32_MUL_S32_S8_FAC_LESS1
#define INLINE_S32_MUL_S32_S8_FAC1
#define INLINE_S32_MUL_S32_S8_FAC2
#define INLINE_U32_MUL_U32_U32_FAC_TWOPOW_U8
#define INLINE_S32_MUL_S32_S32_FAC_TWOPOW_U8

/*~T*/
/* shift functions */
#define INLINE_S8_S16_SHR3
#define INLINE_S16_S16_SHL2
#define INLINE_S16_S16_SHL3
#define INLINE_S16_S16_SHL4
#define INLINE_S16_S32
#define INLINE_S8_S32
#define INLINE_S16_U16
#define INLINE_U8_S16_SHR2
#define INLINE_U8_U16
#define INLINE_U8_U32
#define INLINE_U8_U16_SHR4
#define INLINE_U16_S16
#define INLINE_U16_U32
#define INLINE_U16_S16_SHL2
#define INLINE_U16_S16_SHL6
#define INLINE_S32_EXP05_S32_U8
#define INLINE_U16_EXP05_U32_U8
#define INLINE_U32_EXP05_U32_U8
#define INLINE_U32_ROTR_U32_U16
#define INLINE_U32_ROTL_U32_U16
#define INLINE_U16_ABS_S16
#define INLINE_S16_ABS_S16
#define INLINE_S8_S16
#define INLINE_S16_MUL_S16_U16_EXP05_U8
#define INLINE_S16_MUL_S16_U16_EXP2_U8
#define INLINE_U16_MUL_U16_U16_EXP05_U8
#define INLINE_U16_MUL_U16_U16_EXP2_U8
#define INLINE_S16_S16_SHL6
#define INLINE_U16_S32
#define INLINE_S16_EXP2_S16_U8
#define INLINE_U16_EXP2_U16_U8
#define INLINE_S16_MUL_S16_S16_EXP05_U8
#define INLINE_U8_S8
#define INLINE_U8_S16
#define INLINE_U8_ABS_S8
#define INLINE_S8_U8
#define INLINE_S8_U16
#define INLINE_S8_ABS_S8
#define INLINE_S16_U32
#define INLINE_U32_S32
#define INLINE_U32_ABS_S32
#define INLINE_S32_U32
#define INLINE_S32_ABS_S32
#define INLINE_U8_MAX_TAB_U16P_U8
#define INLINE_S8_EXP05_S16_U8
#define INLINE_U16_EXP2_S16_U8
#define INLINE_U8_EXP05_S16_U8
#define INLINE_U8_EXP05_U16_U8

/*~T*/
/* minmax functions */
#define INLINE_S8_MIN_MAX_S8_S8
#define INLINE_S8_MIN_MAX_S8_S8_S8
#define INLINE_S16_MIN_MAX_S16_S16
#define INLINE_S16_MIN_MAX_S16_S16_S16
#define INLINE_U8_MIN_MAX_U8_U8_U8
#define INLINE_U16_MIN_MAX_U16_U16_U16
#define INLINE_S16_GRDLMT20_S16_U16
#define INLINE_U16_NORM_U16_U16_U16
#define INLINE_S16_LIM_HYS_S16_U16
#define INLINE_U16_LIMITNEW_UP_U16_U16_U16
#define INLINE_U16_LIMITNEW_DOWN_U16_U16_U16
#define INLINE_U16_LIMITNEW_U16_U16_U16
#define INLINE_S16_LIMITNEW_UP_S16_S16_U16
#define INLINE_S16_LIMITNEW_DOWN_S16_S16_U16
#define INLINE_S16_LIMITNEW_S16_S16_U16
#define INLINE_U16_MIN_U16_U16
#define INLINE_S16_MIN_S16_S16
#define INLINE_U16_MAX_U16_U16
#define INLINE_S16_MAX_S16_S16
#define INLINE_U32_MIN_MAX_U32_U32_U32
#define INLINE_S32_MIN_MAX_S32_S32
#define INLINE_U32_LIMITNEW_U32_U32_U32
#define INLINE_U32_LMTNEW_DOWN_U32_U32_U32
#define INLINE_U32_LMTNEW_UP_U32_U32_U32
#define INLINE_U32_LIMITNEW_U32_U32_U16
#define INLINE_U32_LTNW_DOWN_U32_U32_U16
#define INLINE_U32_LMTNEW_UP_U32_U32_U16
#define INLINE_S32_LIMITNEW_S32_S32_U32
#define INLINE_S32_LIMITNEW_UP_S32_S32_U32
#define INLINE_S32_LMTNEW_DOWN_S32_S32_U32
#define INLINE_S32_LIMITNEW_S32_S32_U16
#define INLINE_S32_LMTNEW_UP_S32_S32_U16
#define INLINE_S32_LTNEW_DOWN_S32_S32_U16
#define INLINE_S32_MIN_MAX_S32_S32_S32
#define INLINE_S8_LIMITNEW_UP_S8_S8_U8
#define INLINE_S8_LIMITNEW_DOWN_S8_S8_U8
#define INLINE_S8_LIMITNEW_S8_S8_U8
#define INLINE_U8_LIMITNEW_UP_U8_U8_U8
#define INLINE_U8_LIMITNEW_DOWN_U8_U8_U8
#define INLINE_U8_LIMITNEW_U8_U8_U8
#define INLINE_U8_MIN_U8_U8
#define INLINE_U32_MIN_U32_U32
#define INLINE_U8_MAX_U8_U8
#define INLINE_U32_MAX_U32_U32
#define INLINE_S8_MIN_S8_S8
#define INLINE_S32_MIN_S32_S32
#define INLINE_S8_MAX_S8_S8
#define INLINE_S32_MAX_S32_S32

/*~E*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~A*/
/*~+:Functions, which are only inlined for speed tuning (INLINE_LIBS=2)*/
/*~T*/
/* div functions */
#define INLINE_S16_FAC05_DIV_S16_S16
#define INLINE_S16_DIV_S32_S16
#define INLINE_S16_FAC05_DIV_S16_U16
#define INLINE_S16_DIV_S16_U16_SHL0
#define INLINE_U8_FAC1_DIV_U16_U16
#define INLINE_U16_DIV_S32_U16
#define INLINE_U16_FAC1_DIV_U16_U16
#define INLINE_U16_DIV_U32_U16
#define INLINE_S16_MUL_S16_U16_DIV_S16
#define INLINE_S16_MUL_U16_S16_DIV_U16
#define INLINE_U16_MUL_S16_U16_DIV_S16
#define INLINE_U16_MUL_S16_U16_DIV_U16
#define INLINE_U16_MUL_U16_U16_DIV_U16
#define INLINE_U16_MUL_U16_U16_DIV_U32
#define INLINE_U32_DIV_U32_U16
#define INLINE_S16_MUL_S16_S16_DIV_S16
#define INLINE_S16_MUL_S16_S16_DIV_U16
#define INLINE_U32_DIV_U32_S32
#define INLINE_U32_DIV_S32_U32
#define INLINE_U32_DIV_S32_S32
#define INLINE_U32_DIV_U32_U32
#define INLINE_S32_DIV_U32_S32
#define INLINE_S32_DIV_S32_U32
#define INLINE_S32_DIV_S32_S32
#define INLINE_S16_DIV_S32_U32
#define INLINE_U32_MUL_U32_U32_DIV_U32
#define INLINE_U32_MUL_U32_U32_DIV_S32
#define INLINE_U32_MUL_U32_S32_DIV_U32
#define INLINE_U32_MUL_U32_S32_DIV_S32
#define INLINE_S32_MUL_S32_S32_DIV_S32
#define INLINE_S32_MUL_S32_S32_DIV_U32
#define INLINE_S32_MUL_U32_S32_DIV_S32
#define INLINE_S32_MUL_U32_S32_DIV_U32

/*~T*/
/* avrg functions */
#define INLINE_S16_MMV_S16_S16_S16_FAC1
#define INLINE_U16_MMV_U16_U16_S16_FAC1
#define INLINE_U16_MMV_U16_U16_U16_FAC2
#define INLINE_U32_MMV_U32_U16_U16_FAC1
#define INLINE_S16_MMV_S16_S16_U16_FAC1
#define INLINE_S32_MMV_S32_S16_U16_FAC1
#define INLINE_U16_CALC_AV_U16_U16
#define INLINE_U16_MMV_U16_U16_U16_FAC1
#define INLINE_U32_MMV_U32_U32_U32_FAC1
#define INLINE_U32_MMV_U32_U32_U16_FAC1
#define INLINE_U32_MMV_U32_U32_S32_FAC1
#define INLINE_U32_MMV_U32_U32_S16_FAC1
#define INLINE_U32_MMV_S32_S32_U32_FAC1
#define INLINE_U32_MMV_S32_S32_U16_FAC1
#define INLINE_U32_MMV_S32_S32_S32_FAC1
#define INLINE_U32_MMV_S32_S32_S16_FAC1
#define INLINE_S32_MMV_S32_S32_U16_FAC1

/*~T*/
/* high pass functions */
#define INLINE_S16_HIP1_S16_U8_U8_U16_FAC1
#define INLINE_S16_HIP1_S16_S8_S8_U16_FAC1
#define INLINE_S32_HIP1_S32_U16_U16_U16_FAC1
#define INLINE_S32_HIP1_S32_S16_S16_U16_FAC1

/*~T*/
/* Square Root Functions */
#define INLINE_U16_SQRT_U32

/*~T*/
/* Trigonometric Functions */
#define INLINE_U16_SIN_U16
#define INLINE_S16_SIN_U32
#define INLINE_U16_COS_U16
#define INLINE_S16_COS_U32
#define INLINE_U16_TAN_U16
#define INLINE_S16_TAN_U32

/*~E*/
/*~T*/

/*~-*/
#endif
/*~E*/
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:Asm Function*/
/*~A*/
/*~+:asm u8 u8_cntlz_u32_math*/
/*~+:*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:FUNCTION: u8_cntlz_u32_math                                                    */
/*~+:                                                                          */
/*~+:         Parameter     type      Hex Range             Physical Range     */
/*~+:                                                                          */
/*~+:Input:                                                                    */
/*~+:         val            u32       00000000..FFFFFFFFH  0..4294967295      */
/*~+:                                                                          */
/*~+:Output:                                                                   */
/*~+:         result         u8        00H..20H             0..32              */
/*~+:                                                                          */
/*~+:Functionality:                                                            */
/*~+:          Returns an u8 value which is the number of                      */
/*~+:          leading zeros of the u32 value given as the input.             */
/*~+:*/
/*~T*/

/*~E*/
/*~F*/
asm u8 u8_cntlz_u32_math(u32 val)
/*~-*/
{
/*~T*/
%reg val
!"r3"
        cntlzw          r3,val

/*~-*/
}
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:Public Function Declarations*/
/*~T*/
/* Public Macro Definitions   */
#define MEM_CODE MEM_CODE_IOLIB
#include <gmem.h>

/*~A*/
/*~+:ADD ROUTINES*/
/*~A*/
/*~+:Functions*/
/*~A*/
/*~+:s8 s8_add_s8_s8(s8 x_value, s8 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add s8 to s8 with underflow and overflow                      */
/*            limitation                                                    */
/*            s8 = s8 + s8                                                  */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_ADD_S8_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_add_s8_s8(s8 x_value, s8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_add_u8_s8(u8 x_value, s8 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add u8 to s8 with overflow limitation                         */
/*            s8 = u8 + s8                                                  */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_ADD_U8_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_add_u8_s8(u8 x_value, s8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_add_s16_s16(s16 x_value, s16 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add s16 to s16 with underflow and overflow                    */
/*            limitation                                                    */
/*            s16 = s16 + s16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_ADD_S16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_add_s16_s16(s16 x_value, s16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_add_u16_s16(u16 x_value, s16 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add u16 to s16 with overflow limitation                       */
/*            s16 = u16 + s16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_ADD_U16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_add_u16_s16(u16 x_value, s16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_add_s32_s32(s32 x_value, s32 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add s32 to s32  with overflow and underflow limitation        */
/*            s32 = s32 + s32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_ADD_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_add_s32_s32(s32 x_value, s32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_add_u8_s8( u8 x_value, s8 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add u8 to s8 with underflow and overflow                      */
/*            limitation                                                    */
/*            u8 = u8 + s8                                                  */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_ADD_U8_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_add_u8_s8( u8 x_value, s8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_add_u8_u8( u8 x_value, u8 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add u8 to u8 with overflow limitation                         */
/*            u8 = u8 + u8                                                  */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_ADD_U8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_add_u8_u8( u8 x_value, u8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_add_u16_u16( u16 x_value, u16 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add u16 to u16 with overflow limitation                       */
/*            u16 = u16 + u16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_ADD_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_add_u16_u16( u16 x_value, u16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_add_u16_s16( u16 x_value, s16 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add u16 to s16 with underflow and overflow                    */
/*            limitation                                                    */
/*            u16 = u16 + s16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_ADD_U16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_add_u16_s16( u16 x_value, s16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_add_u32_u32 (u32 x_value, u32 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add u32 to u32 with overflow limitation                       */
/*            u32 = u32 + u32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_ADD_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_add_u32_u32(u32 x_value, u32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_add_u16_u16_u16( u16 x_value, u16 y_value, u16 z_value)*/
/*~T*/
/****************************************************************************/
/* function:  add three u16 values with overflow limitation                 */
/*            u16 = u16 + u16 + u16                                         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_ADD_U16_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_add_u16_u16_u16( u16 x_value, u16 y_value, u16 z_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_add_u16_u16_u16_u16( u16 w_value, u16 x_value, u16 y_value, u16 z_value)*/
/*~T*/
/****************************************************************************/
/* function:  add four u16 values with overflow limitation                  */
/*            u16 = u16 + u16 + u16  + u16                                  */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_ADD_U16_U16_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_add_u16_u16_u16_u16( u16 w_value, u16 x_value, u16 y_value, u16 z_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_add_s16_s16_s16( s16 x_value, s16 y_value, s16 z_value)*/
/*~T*/
/****************************************************************************/
/* function:  add three s16 values with overflow limitation  and            */
/*            underflow limitation                                          */
/*            s16 = s16 + s16 + s16                                         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_ADD_S16_S16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_add_s16_s16_s16( s16 x_value, s16 y_value, s16 z_value);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_add_u32_s32( u32 x_value, s32 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add u32 to s32 with underflow and overflow                    */
/*            limitation                                                    */
/*            u32 = u32 + s32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_ADD_U32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_add_u32_s32( u32 x_value, s32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_add_s32_s32( s32 x_value, s32 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add s32 to s32 with underflow and overflow                    */
/*            limitation                                                    */
/*            u32 = s32 + s32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_ADD_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_add_s32_s32( s32 x_value, s32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_add_u32_s32( u32 x_value, s32 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  add u32 to s32 with underflow and overflow                    */
/*            limitation                                                    */
/*            s32 = u32 + s32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_ADD_U32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_add_u32_s32( u32 x_value, s32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_add_u32_u32_u32 (u32 x_value, u32 y_value, u32 z_value)*/
/*~T*/
/****************************************************************************/
/* function:  add three u32 with overflow limitation                        */
/*            u32 = u32 + u32 + u32                                         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_ADD_U32_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_add_u32_u32_u32 (u32 x_value, u32 y_value, u32 z_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_add_s32_s32_s32 (s32 x_value, s32 y_value, s32 z_value)*/
/*~T*/
/****************************************************************************/
/* function:  add three s32 with overflow and underflow                     */
/*            limitation                                                    */
/*            s32 = s32 + s32 + s32                                         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_ADD_S32_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_add_s32_s32_s32 (s32 x_value, s32 y_value, s32 z_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:Macros*/
/*~T*/
/* No Currently Existing Macros Among Addition Routines */
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:SUB ROUTINES*/
/*~A*/
/*~+:FUNCTIONS*/
/*~A*/
/*~+:s8 s8_sub_s8_u8(s8 x_value, u8 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u8 from s8 with underflow                            */
/*            limitation                                                    */
/*            s8 = s8 - u8                                                  */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_SUB_S8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_sub_s8_u8(s8 x_value, u8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_sub_u8_u8(u8 x_value, u8 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u8 from u8 with underflow and                        */
/*            overflow limitation                                           */
/*            s8 = u8 - u8                                                  */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_SUB_U8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_sub_u8_u8(u8 x_value, u8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_sub_s16_s16(s16 x_value, s16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract s16 from s16 with underflow                          */
/*            and overflow limitation                                       */
/*            s16 =  s16 - s16                                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_SUB_S16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_sub_s16_s16(s16 x_value, s16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_sub_s16_u16(s16 x_value, u16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u16 from s16 with underflow                          */
/*            limitation                                                    */
/*            s16 = s16 - u16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_SUB_S16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_sub_s16_u16(s16 x_value, u16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_sub_u16_s16(u16 x_value, s16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract s16 from u16 with  overflow                          */
/*            limitation                                                    */
/*            s16 =  u16 - s16                                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_SUB_U16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_sub_u16_s16(u16 x_value, s16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_sub_u16_u16(u16 x_value, u16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u16 from u16 with underflow and                      */
/*            overflow limitation                                           */
/*            s16 = u16 - u16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_SUB_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_sub_u16_u16(u16 x_value, u16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_abs_sub_u8_u8(u8 x_value, u8 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u8 from u8 and build the                             */
/*            absolute value                                                */
/*            u8 = |u8 - u8|                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_ABS_SUB_U8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_abs_sub_u8_u8(u8 x_value, u8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_sub_u8_u8(u8 x_value, u8 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u8 from u8 with underflow                            */
/*            limitation                                                    */
/*            u8 =  u8 - u8                                                 */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_SUB_U8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_sub_u8_u8(u8 x_value, u8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_abs_sub_u16_u16(u16 x_value, u16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u16  from u16 and build the                          */
/*            absolute value                                                */
/*            u16 = |u16 - u16|                                             */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_ABS_SUB_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_abs_sub_u16_u16(u16 x_value, u16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_sub_u16_u16(u16 x_value, u16 y_value)*/
/*~T*/
/****************************************************************************/
/* function:  subtract u16  from u16 with underflow                         */
/*            limitation                                                    */
/*            u16 =  u16 - u16                                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_SUB_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_sub_u16_u16(u16 x_value, u16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_sub_u32_u32(u32 x_value, u32 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u32 from u32 with underflow                          */
/*            and overflow limitation                                       */
/*            u16 =  u32 - u32                                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_SUB_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_sub_u32_u32(u32 x_value, u32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_abs_sub_s16_s16(s16 x_value, s16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract s16  from s16 and build the                          */
/*            absolute value                                                */
/*            u16 = |s16 - s16|                                             */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_ABS_SUB_S16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_abs_sub_s16_s16(s16 x_value, s16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_sub_u32_u32(u32 x_value, u32 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u32 from u32 with underlow                           */
/*            limitation                                                    */
/*            u32 =  u32 - u32                                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_SUB_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_sub_u32_u32(u32 x_value, u32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_sub_u16_s16(u16 x_value, s16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract s16 from u16 with overflow limitation                */
/*            u16 = u16 - s16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_SUB_U16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_sub_u16_s16(u16 x_value, s16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_sub_s32_s32(s32 x_value, s32 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract s32 from s32  with underflow                         */
/*            and overflow limitation                                       */
/*            signed long =  signed long - signed long                      */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_SUB_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_sub_s32_s32(s32 x_value, s32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_sub_u32_u32(u32 x_value, u32 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u32 from u32 with underflow                          */
/*            and overflow limitation                                       */
/*            s16 =  u32 - u32                                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_SUB_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_sub_u32_u32(u32 x_value, u32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_sub_u32_s32(u32 x_value, s32 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract s32 from u32 with underflow                          */
/*            and overflow limitation                                       */
/*            u32 =  u32 - s32                                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_SUB_U32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_sub_u32_s32(u32 x_value, s32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_sub_s32_u32(s32 x_value, u32 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u32 from s32 with underflow limitation               */
/*            u32 =  s32 - u32                                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_SUB_S32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_sub_s32_u32(s32 x_value, u32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_sub_s32_s32(s32 x_value, s32 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract s32 from s32 with underflow limitation               */
/*            u32 =  s32 - s32                                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_SUB_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_sub_s32_s32(s32 x_value, s32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_abs_sub_u32_u32(u32 x_value, u32 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u32  from u32 and build the                          */
/*            absolute value                                                */
/*            u32 = |u32 - u32|                                             */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_ABS_SUB_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_abs_sub_u32_u32(u32 x_value, u32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_sub_u32_s32(u32 x_value, s32 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract s32 from u32 with overflow                           */
/*            limitation                                                    */
/*            s32 =  u32 - s32                                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_SUB_U32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_sub_u32_s32(u32 x_value, s32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_sub_s32_u32(s32 x_value, u32 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u32 from s32 with underflow                          */
/*            and overflow limitation                                       */
/*            s32 =  s32 - u32                                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_SUB_S32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_sub_s32_u32(s32 x_value, u32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_sub_u32_u32(u32 x_value, u32 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract u32 from u32 with underflow                          */
/*            and overflow limitation                                       */
/*            s32 =  u32 - u32                                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_SUB_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_sub_u32_u32(u32 x_value, u32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_abs_sub_s32_s32(s32 x_value, s32 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract s32  from s32 and build the                          */
/*            absolute value                                                */
/*            s32 = |s32 - s32|                                             */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_ABS_SUB_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_abs_sub_s32_s32(s32 x_value, s32 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_sub_s8_s8(s8 x_value, s8 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract s8 from s8 with underflow                            */
/*            and overflow limitation                                       */
/*            s8 =  s8 - s8                                                 */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_SUB_S8_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_sub_s8_s8(s8 x_value, s8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_sub_u8_s8(u8 x_value, s8 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  subtract s8 from u8 with overflow/undeflow limitation         */
/*            u8 = u8 - s8                                                  */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_SUB_U8_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_sub_u8_s8(u8 x_value, s8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~E*/
/*~A*/
/*~+:MACROS*/
/*~T*/
/* No Currently Existing Macros Among Subtraction Routines */
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:SHIFT ROUTINES*/
/*~A*/
/*~+:FUNCTIONS*/
/*~A*/
/*~+:s8 s8_s16_shr3(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of s16 to s8, adapting the                         */
/*            range of result to -1024 ... 1016 (shift 3 bits to the right) */
/*            with overflow and underflow limitation                        */
/*            s8 = s16 >> 3                                                 */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_S16_SHR3) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_s16_shr3(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_s32(s32 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of s32  to s8 with overflow                       */
/*            and underflow limitation                                      */
/*            s32  --> s8                                                  */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_s32(s32 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_s16_shl2(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Adapting the range of result of s16                           */
/*            to -8192 ... 8191.75 (shift 2 bits to the left)               */
/*            with overflow and underflow limitation                        */
/*            s16 = s16 << 2                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_S16_SHL2) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_s16_shl2(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_s16_shl3(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Adapting the range of result of s16                           */
/*            to -4096 ... 4095.87 (shift 3 bits to the left)               */
/*            with overflow and underflow limitation                        */
/*            s16 = s16 << 3                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_S16_SHL3) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_s16_shl3(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_s16_shl4(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Adapting the range of result of s16                           */
/*            to -2048 ... 2047.9375 (shift 4 bits to the left)             */
/*            with overflow and underflow limitation                        */
/*            s16 = s16 << 4                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_S16_SHL4) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_s16_shl4(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_s32(s32 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of s32  to s16 with overflow                       */
/*            and underflow limitation                                      */
/*            s32  --> s16                                                  */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_s32(s32 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_u16(u16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of u16 to s16 with overflow                        */
/*            limitation                                                    */
/*            u16 --> s16                                                   */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_u16(u16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_s16_shr2(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of s16 to u8, adapting the                         */
/*            range of result to 0 ... 1020 (shift 2 bits to the right)     */
/*            with overflow and underflow limitation                        */
/*            u8 = s16 >> 2                                                 */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_S16_SHR2) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_s16_shr2(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_u16(u16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of u16 to u8 with overflow                         */
/*            limitation                                                    */
/*            u16 --> u8                                                    */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_u16(u16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_u32(u32 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of u32 to u8 with overflow                         */
/*            limitation                                                    */
/*            u32 --> u8                                                    */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_u32(u32 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_u16_shr4(u16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of u16 to u8, adapting the                         */
/*            range of result 0 ... 4080 (shift 4 bits to the right)        */
/*            with overflow limitation                                      */
/*            u8 = u16 >> 4                                                 */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_U16_SHR4) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_u16_shr4(u16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_s16(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of s16 to u16 with underflow                       */
/*            limitation                                                    */
/*            s16 --> u16                                                   */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_s16(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_u32(u32 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of u32 to u16 with overflow                        */
/*            limitation                                                    */
/*            u32  --> u16                                                  */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_u32(u32 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_s16_shl2(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of s16 to u16, adapting the                        */
/*            range of result to 0 ... 16383.75  (shift 2 bits to the left) */
/*            with overflow and underflow limitation                        */
/*            u16 = s16 << 2                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_S16_SHL2) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_s16_shl2(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_s16_shl6(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of s16 to u16, adapting the                        */
/*            range of result to 0 ... 1023.9844 (shift 6 bits to the left) */
/*            with overflow and underflow limitation                        */
/*            u16 = s16 << 6                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_S16_SHL6) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_s16_shl6(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_exp05_s32_u8(s32 value, u8 count)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Shifts a value 0 ..15 digits to the right and puts the        */
/*            result in an s32 value                                        */
/*            s32 = s32 >> u8                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_EXP05_S32_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_exp05_s32_u8(s32 value, u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_exp05_u32_u8(u32 value, u8 count)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Shifts a value 0 ..15 digits to the right and puts the        */
/*            result in an u16 value with overlow limitation                */
/*            u16 = u32 >> u8                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_EXP05_U32_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_exp05_u32_u8(u32 value, u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_exp05_u32_u8(u32 value, u8 count)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Shifts a value 0 ..15 digits to the right and puts the        */
/*            result in an u32 value                                        */
/*            u32 = u32 >> u8                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_EXP05_U32_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_exp05_u32_u8(u32 value, u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_rotr_u32_u16(u32 value, u16 count*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Rotates a value a given number of bits (max. 31) to the right */
/*            result in an u32 value                                        */
/*            u32 = u32 rotated right by a u16 value                        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_ROTR_U32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_rotr_u32_u16(u32 value, u16 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_rotl_u32_u16(u32 value, u16 count)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Rotates a value a given number of bits (max. 31) to the left  */
/*            result in an u32 value                                        */
/*            u32 = u32 rotated left by a u16 value                         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_ROTL_U32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_rotl_u32_u16(u32 value, u16 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_abs_s16(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:         res = |value|                                          */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_ABS_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_abs_s16(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_abs_s16(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:         res = |value|                                          */
/*                   overflow : limit to 7FFFH                              */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_ABS_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_abs_s16(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_s16(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Convertion of s16 to s8,                                      */
/*            with overflow and underflow limitation                        */
/*            s8 = s16                                                      */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_s16(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_mul_s16_u16_exp05_u8(s16 val1, u16 val2, u8 count)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:         res = (val1 * val2)>> count                            */
/*        overflow :  limit to 7FFFH                                        */
/*        underflow : limit to 8000H                                        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_U16_EXP05_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_u16_exp05_u8(s16 val1, u16 val2, u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_mul_s16_u16_exp2_u8(s16 val1, u16 val2, u8 count)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:         res = (val1 * val2)<< count                            */
/*        overflow :  limit to 7FFFH                                        */
/*        underflow : limit to 8000H                                        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_U16_EXP2_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_u16_exp2_u8(s16 val1, u16 val2, u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_mul_u16_u16_exp05_u8(u16 val1, u16 val2, u8 count)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:         res = (val1 * val2)>> count                            */
/*        overflow : limit to FFFFH                                         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MUL_U16_U16_EXP05_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mul_u16_u16_exp05_u8(u16 val1, u16 val2, u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_mul_u16_u16_exp2_u8(u16 val1, u16 val2, u8 count)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:         res = (val1 * val2)<< count                            */
/*        overflow : limit to FFFFH                                         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MUL_U16_U16_EXP2_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mul_u16_u16_exp2_u8(u16 val1, u16 val2, u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_s16_shl6(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:         res = val << 6                                         */
/*        overflow  : limit to 7FFFH                                        */
/*        underflow : limit to 8000H                                        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_S16_SHL6) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_s16_shl6(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_s32(s32 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:         res = val                                              */
/*        overflow  : limit to FFFFH                                        */
/*        underflow : limit to 0000H                                        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_s32(s32 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_exp2_s16_u8(s16 data,u8 bits)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function: res=data << bits                                               */
/*           limit overflow to : 7FFF   ( 32767)                                 */
/*           limit underflow to: 8000   (-32768)                                 */
/*           range of result   : 8000..7FFF                                      */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_EXP2_S16_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_exp2_s16_u8(s16 data,u8 bits);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_exp2_u16_u8(u16 data,u8 bits)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function: res=data << bits                                               */
/*           limit overflow to : 7FFF   ( 32767)                                 */
/*           limit underflow to: 8000   (-32768)                                 */
/*           range of result   : 8000..7FFF                                      */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_EXP2_U16_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_exp2_u16_u8(u16 data,u8 bits);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_mul_s16_s16_exp05_u8(s16 data1,s16 data2,u8 count)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function: res=(data1*data2) >> count                                     */
/*          limit overflow to : 7FFF   ( 32767)                                 */
/*          limit underflow to: 8000   (-32768)                                 */
/*          range of result   : 8000..7FFF                                      */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_S16_EXP05_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_s16_exp05_u8(s16 data1,s16 data2,u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_s8(s8 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Conversion of s8 to u8,                                       */
/*            with underflow limitation                                     */
/*            u8 = s8                                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_s8(s8 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_s16(s16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Conversion of s16 to u8,                                      */
/*            with overflow and underflow limitation                        */
/*            u8 = s16                                                      */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_s16(s16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_abs_s8(s8 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:         res = |value|                                          */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_ABS_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_abs_s8(s8 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_u8(u8 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Conversion of u8 to s8,                                       */
/*            with overflow limitation                                      */
/*            s8 = u8                                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_u8(u8 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_u16(u16 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Conversion of u16 to s8,                                      */
/*            with overflow limitation                                      */
/*            s8 = u16                                                      */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_u16(u16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_abs_s8( s8 value )*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:         res = |value|                                          */
/*        overflow : limit to 7FH                                         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_ABS_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_abs_s8(s8 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_u32(u32 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Conversion of u32 to s16,                                     */
/*            with overflow limitation                                      */
/*            s16 = u32                                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_u32(u32 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_s32(s32 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Conversion of s32 to u32,                                     */
/*            with underflow and underflow limitation                       */
/*            u32 = s32                                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_s32(s32 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_abs_s32(s32 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:         res = |value|                                          */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_ABS_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_abs_s32(s32 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_u32(u32 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Conversion of u32 to s32,                                     */
/*            with overflow limitation                                      */
/*            s32 = u32                                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_u32(u32 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_abs_s32(s32 value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:         res = |value|                                          */
/*        overflow : limit to 7FFFFFFFH                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_ABS_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_abs_s32(s32 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_exp05_s16_u8(s16 value, u8 count)*/
/*~+:*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Shifts right the s16 value by the number of bits specified in u8 count */
/*~+:and returns s8 output with results limited if it falls outside s8 range*/
/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_EXP05_S16_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_exp05_s16_u8(s16 value,u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_exp2_s16_u8(s16 value,u8 count)*/
/*~+:*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Shifts left the s16 value by the number of bits specified in    */
/*~+:u8 count and returns u16 output with results limited if it falls*/
/*~+:outside u16 range*/
/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_EXP2_S16_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_exp2_s16_u8(s16 value,u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_exp05_s16_u8(s16 value,u8 count)*/
/*~+:*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Shifts right the s16 value by the number of bits specified in  */
/*~+:u8 count and returns u8 output with results limited if it falls*/
/*~+:outside u8 range*/
/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_EXP05_S16_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_exp05_s16_u8(s16 value,u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_exp05_u16_u8(u16 value, u8 count)*/
/*~+:*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Shifts right the u16 value by the number of bits specified in  */
/*~+:u8 count and returns u8 output with results limited if it falls*/
/*~+:outside u8 range*/
/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_EXP05_U16_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_exp05_u16_u8(u16 value, u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~E*/
/*~A*/
/*~+:MACROS*/
/*~T*/
/* No Currently Existing Macros Among Shift Routines */
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:LIMITING ROUTINES*/
/*~A*/
/*~+:FUNCTIONS*/
/*~A*/
/*~+:s8 s8_min_max_s8_s8( s8 value, s8 minmaxwert)*/
/*~T*/
/****************************************************************************/
/* function:  limit s8 to a limit in dependence on the sign of the          */
/*            limit (minmaxwert). If the limit is positive overflow is      */
/*            limited, if it is negative underflow is limited.              */
/*            s8 = minmaxwert  (if value < minmaxwert) AND (minmaxwert < 0) */
/*            s8 = minmaxwert  (if value > minmaxwert) AND (minmaxwert > 0) */
/*            s8 = value       If the above condition are not satisfied.    */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_MIN_MAX_S8_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_min_max_s8_s8( s8 value, s8 minmaxwert);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_min_max_s8_s8_s8(s8 value, s8 minimum, s8 maximum)*/
/*~T*/
/****************************************************************************/
/* function:  limit s8 to minimum or maximum                                */
/*            s8 = minimum (if value < minimum)                             */
/*            s8 = maximum (if value > maximum)                             */
/*            s8 = value   (if minimum <= value <= maximum)                 */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_MIN_MAX_S8_S8_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_min_max_s8_s8_s8(s8 value, s8 minimum, s8 maximum);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_min_max_s16_s16( s16 value, s16 minmaxwert)*/
/*~T*/
/****************************************************************************/
/* function:  limit s16 to a limit in dependence on the sign of the         */
/*            limit (minmaxwert). If the limit is positive overflow is      */
/*            limited, if it is negative underflow is limited.              */
/*            s16 = minmaxwert  (if value < minmaxwert) AND (minmaxwert < 0)*/
/*            s16 = minmaxwert  (if value > minmaxwert) AND (minmaxwert > 0)*/
/*            s16 = value       If the above condition are not satisfied.   */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MIN_MAX_S16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_min_max_s16_s16( s16 value, s16 minmaxwert);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_min_max_s16_s16_s16(s16 value, s16 minimum, s16 maximum)*/
/*~T*/
/****************************************************************************/
/* function:  limit s16  to minimum or maximum                              */
/*            s16  = minimum (if value < minimum)                           */
/*            s16  = maximum (if value > maximum)                           */
/*            s16  = value   (if minimum <= value <= maximum)               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MIN_MAX_S16_S16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_min_max_s16_s16_s16(s16 value, s16 minimum, s16 maximum);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_min_max_u8_u8_u8( u8 value, u8 minimum,u8 maximum)*/
/*~T*/
/****************************************************************************/
/* function:  limit u8 to minimum or maximum                                */
/*            u8 = minimum (if value < minimum)                             */
/*            u8 = maximum (if value > maximum)                             */
/*            u8 = value   (if minimum <= value <= maximum)                 */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_MIN_MAX_U8_U8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_min_max_u8_u8_u8( u8 value, u8 minimum,u8 maximum);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_min_max_u16_u16_u16( u16 value, u16 minimum,u16 maximum)*/
/*~T*/
/****************************************************************************/
/* function:  limit u16  to minimum or maximum                              */
/*            u16  = minimum (if value < minimum)                           */
/*            u16  = maximum (if value > maximum)                           */
/*            u16  = value   (if minimum <= value <= maximum)               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MIN_MAX_U16_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_min_max_u16_u16_u16( u16 value, u16 minimum,u16 maximum);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_grdlmt20_s16_u16 (s16 grdlmt, u16 value)*/
/*~T*/
/****************************************************************************/
/* function:  gradient limitation and limitation to zero with a s16         */
/*              s16  = value                                                */
/*            u16  = gradient                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_GRDLMT20_S16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_grdlmt20_s16_u16 (s16 grdlmt, u16 value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_norm_u16_u16_u16(u16 bottom_lim, u16 top_lim, u16 value )*/
/*~T*/
/****************************************************************************/
/* function:     Normalizing function of a value between a bottom and       */
/*   a top-limit to a percentage [0..100%] [0..FFFF]  (fak1-resolution)     */
/*              (value-bottom_lim)                                          */
/*fak1-result = --------------------*(total range)                          */
/*              (top_lim-bottom_lim)                                        */
/*                                                                          */
/*limitation of result to                                                   */
/*       FFFFH   if  value >= top_lim                                       */
/*       0H      if  value <= bottom_lim                                    */
/*       FFFFH   if  top_lim <= bottom_lim                                  */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_NORM_U16_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_norm_u16_u16_u16(u16 bottom_lim, u16 top_lim, u16 value );

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_lim_hys_s16_u16 (s16 input_val, u16 hysteresis)*/
/*~T*/
/****************************************************************************/
/* function:  limits  a  s16 to  an  upper  or  lower  value  based         */
/*            on  the  value  of  an  u16. A  bit  set  in  case            */
/*            of  limitation                                                */
/*                                                                          */
/*              If (val >= hys) then val = hys;                             */
/*              If (val <= -hys) then val = -hys;                           */
/*              return val.                                                 */
/*              In case of limitation:  lv_lim_act = 1                      */
/*              normal case (unlimited): lv_lim_act = 0                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_LIM_HYS_S16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_lim_hys_s16_u16 (s16 input_val, u16 hysteresis);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_limitnew_up_u16_u16_u16 (u16 newval,u16 oldval,u16 maxdif)*/
/*~T*/
/****************************************************************************/
/* function:          if (newval > oldval)                                  */
/*                      if (newval-oldval) > maxdif                         */
/*                          value = old+maxdif                              */
/*                      else                                                */
/*                          value = newval                                  */
/*                    else                                                  */
/*                       value = newval                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_LIMITNEW_UP_U16_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_limitnew_up_u16_u16_u16 (u16 newval,u16 oldval,u16 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_limitnew_down_u16_u16_u16 (u16 newval,u16 oldval,u16 maxdif)*/
/*~T*/
/****************************************************************************/
/* function: if (oldval > newval)                                           */
/*              if (oldval-newval) > maxdif                                 */
/*                  value = old-maxdif                                      */
/*              else                                                        */
/*             value = newval                                               */
/*           else                                                           */
/*            value = newval                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_LIMITNEW_DOWN_U16_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_limitnew_down_u16_u16_u16 (u16 newval,u16 oldval,u16 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_limitnew_u16_u16_u16 (u16 newval,u16 oldval,u16 maxdif)*/
/*~T*/
/****************************************************************************/
/* function:  if ( newval > oldval )                                        */
/*            then                                                          */
/*               if  ( newval - oldval ) > maxdif                           */
/*               then                                                       */
/*                    result = oldval + maxdif                              */
/*               else                                                       */
/*                    result = newval                                       */
/*            else                                                          */
/*               if  ( oldval - newval ) > maxdif                           */
/*               then                                                       */
/*                    result = oldval - maxdif                              */
/*               else                                                       */
/*                    result = newval                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_LIMITNEW_U16_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_limitnew_u16_u16_u16 (u16 newval,u16 oldval,u16 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_limitnew_up_s16_s16_u16 (s16 newval,s16 oldval,u16 maxdif)*/
/*~T*/
/****************************************************************************/
/* function:          if (newval > oldval)                                  */
/*                      if (newval-oldval) > maxdif                         */
/*                          value = old+maxdif                              */
/*                      else                                                */
/*                          value = newval                                  */
/*                    else                                                  */
/*                       value = newval                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_LIMITNEW_UP_S16_S16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_limitnew_up_s16_s16_u16 (s16 newval,s16 oldval,u16 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_limitnew_down_s16_s16_u16 (s16 newval,s16 oldval,u16 maxdif)*/
/*~T*/
/****************************************************************************/
/* function: if (oldval > newval)                                           */
/*                if (oldval-newval) > maxdif                               */
/*                value = old-maxdif                                        */
/*                else                                                      */
/*                value = newval                                            */
/*           else                                                           */
/*           value = newval                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_LIMITNEW_DOWN_S16_S16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_limitnew_down_s16_s16_u16 (s16 newval,s16 oldval,u16 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_limitnew_s16_s16_u16(s16 newval,s16 oldval,u16 maxdif)*/
/*~T*/
/********************************************************************************/
/* function:  if (newval > oldval)                                              */
/*                 if (newval-oldval) > maxdif                                  */
/*                   value = oldval+maxdif                                      */
/*                 else                                                         */
/*                     value = newval                                           */
/*            else                                                              */
/*                 if (oldval-newval) > maxdif                                  */
/*                     value = oldval-maxdif                                    */
/*                 else                                                         */
/*                     value = newval                                           */
/********************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_LIMITNEW_S16_S16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_limitnew_s16_s16_u16(s16 newval,s16 oldval,u16 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_min_u16_u16(u16 value1 ,u16 value2)*/
/*~T*/
/****************************************************************************/
/* function:  compare value1 with value2 and return minimum value           */
/*            u16  = value1 (if value1 < value2)                            */
/*            u16  = value2 (if value2 < value1)                            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MIN_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_min_u16_u16(u16 value1 ,u16 value2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_min_s16_s16 (s16 value1,s16 value2)*/
/*~T*/
/****************************************************************************/
/* function:  compare value1 with value2 and return minimum value           */
/*            s16  = value1 (if value1 < value2)                            */
/*            s16  = value2 (if value2 < value1)                            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MIN_S16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_min_s16_s16 (s16 value1,s16 value2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_max_u16_u16(u16 value1,u16 value2)*/
/*~T*/
/****************************************************************************/
/* function:  compare value1 with value2 and return maximum value           */
/*            u16  = value1 (if value1 > value2)                            */
/*            u16  = value2 (if value2 > value1)                            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MAX_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_max_u16_u16(u16 value1,u16 value2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_max_s16_s16 (s16 value1,s16 value2)*/
/*~T*/
/****************************************************************************/
/* function:  compare value1 with value2 and return maximum value           */
/*            s16  = value1 (if value1 > value2)                            */
/*            s16  = value2 (if value2 > value1)                            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MAX_S16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_max_s16_s16 (s16 value1,s16 value2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_min_max_u32_u32_u32( u32 value, u32 minimum,u32 maximum)*/
/*~T*/
/****************************************************************************/
/* function:  limit u32  to minimum or maximum                              */
/*            u32  = minimum (if value < minimum)                           */
/*            u32  = maximum (if value > maximum)                           */
/*            u32  = value   (if minimum <= value <= maximum)               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MIN_MAX_U32_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_min_max_u32_u32_u32( u32 value, u32 minimum,u32 maximum);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_min_max_s32_s32( s32 value, s32 minmaxwert)*/
/*~T*/
/****************************************************************************/
/* function:  limit s32 to a limit in dependence on the sign of the         */
/*            limit (minmaxwert). If the limit is positive overflow is      */
/*            limited, if it is negative underflow is limited.              */
/*            s32 = minmaxwert  (if value < minmaxwert) AND (minmaxwert < 0)*/
/*            s32 = minmaxwert  (if value > minmaxwert) AND (minmaxwert > 0)*/
/*            s32 = value       If the above condition are not satisfied.   */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MIN_MAX_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_min_max_s32_s32( s32 value, s32 minmaxwert);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_limitnew_u32_u32_u32 (u32 newval,u32 oldval,u32 maxdif)*/
/*~T*/
/*****************************************************************************/
/* function:  if (newval > oldval)                                           */
/*                 if (newval-oldval) > maxdif                               */
/*                   value = oldval+maxdif                                   */
/*                 else                                                      */
/*                   value = newval                                          */
/*             else                                                          */
/*                 if (oldval-newval) > maxdif                               */
/*                   value = oldval-maxdif                                   */
/*                 else                                                      */
/*                   value = newval                                          */
/*****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_LIMITNEW_U32_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_limitnew_u32_u32_u32 (u32 newval,u32 oldval,u32 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_limitnew_up_u32_u32_u32 (u32 newval,u32 oldval,u32 maxdif)*/
/*~T*/
/****************************************************************************/
/* function:          if (newval > oldval)                                  */
/*                      if (newval-oldval) > maxdif                         */
/*                          value = old+maxdif                              */
/*                      else                                                */
/*                          value = newval                                  */
/*                    else                                                  */
/*                       value = newval                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_LMTNEW_UP_U32_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_limitnew_up_u32_u32_u32 (u32 newval,u32 oldval,u32 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_limitnew_down_u32_u32_u32 (u32 newval,u32 oldval,u32 maxdif)*/
/*~T*/
/****************************************************************************/
/* function: if (oldval > newval)                                           */
/*              if (oldval-newval) > maxdif                                 */
/*                  value = old-maxdif                                      */
/*              else                                                        */
/*             value = newval                                               */
/*           else                                                           */
/*            value = newval                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_LMTNEW_DOWN_U32_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_limitnew_down_u32_u32_u32 (u32 newval,u32 oldval,u32 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_limitnew_u32_u32_u16 (u32 newval,u32 oldval,u16 maxdif)*/
/*~T*/
/*****************************************************************************/
/* function:  if (newval > oldval)                                           */
/*                 if (newval-oldval) > maxdif                               */
/*                    value = oldval+maxdif                                  */
/*                 else                                                      */
/*                     value = newval                                        */
/*            else                                                           */
/*                 if (oldval-newval) > maxdif                               */
/*                   value = oldval-maxdif                                   */
/*                 else                                                      */
/*                    value = newval                                         */
/*****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_LIMITNEW_U32_U32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_limitnew_u32_u32_u16 (u32 newval,u32 oldval,u16 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_limitnew_up_u32_u32_u16 (u32 newval,u32 oldval,u16 maxdif)*/
/*~T*/
/****************************************************************************/
/* function:          if (newval > oldval)                                  */
/*                      if (newval-oldval) > maxdif                         */
/*                          value = old+maxdif                              */
/*                      else                                                */
/*                          value = newval                                  */
/*                    else                                                  */
/*                       value = newval                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_LMTNEW_UP_U32_U32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_limitnew_up_u32_u32_u16 (u32 newval,u32 oldval,u16 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_limitnew_down_u32_u32_u16 (u32 newval,u32 oldval,u16 maxdif)*/
/*~T*/
/****************************************************************************/
/* function: if (oldval > newval)                                           */
/*              if (oldval-newval) > maxdif                                 */
/*                  value = old-maxdif                                      */
/*              else                                                        */
/*             value = newval                                               */
/*           else                                                           */
/*            value = newval                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_LTNW_DOWN_U32_U32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_limitnew_down_u32_u32_u16 (u32 newval,u32 oldval,u16 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_limitnew_s32_s32_u32(s32 newval,s32 oldval,u32 maxdif)*/
/*~T*/
/*****************************************************************************/
/* function:  if (newval > oldval)                                           */
/*                 if (newval-oldval) > maxdif                               */
/*                    value = oldval+maxdif                                  */
/*                 else                                                      */
/*                     value = newval                                        */
/*            else                                                           */
/*                 if (oldval-newval) > maxdif                               */
/*                   value = oldval-maxdif                                   */
/*                 else                                                      */
/*                    value = newval                                         */
/*****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_LIMITNEW_S32_S32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_limitnew_s32_s32_u32(s32 newval,s32 oldval,u32 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_limitnew_up_s32_s32_u32 (s32 newval,s32 oldval,u32 maxdif)*/
/*~T*/
/****************************************************************************/
/* function:          if (newval > oldval)                                  */
/*                      if (newval-oldval) > maxdif                         */
/*                          value = old+maxdif                              */
/*                      else                                                */
/*                          value = newval                                  */
/*                    else                                                  */
/*                       value = newval                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_LIMITNEW_UP_S32_S32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_limitnew_up_s32_s32_u32 (s32 newval,s32 oldval,u32 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_limitnew_down_s32_s32_u32 (s32 newval,s32 oldval,u32 maxdif)*/
/*~T*/
/****************************************************************************/
/* function: if (oldval > newval)                                           */
/*                if (oldval-newval) > maxdif                               */
/*                value = old-maxdif                                        */
/*                else                                                      */
/*                value = newval                                            */
/*           else                                                           */
/*           value = newval                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_LMTNEW_DOWN_S32_S32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_limitnew_down_s32_s32_u32 (s32 newval,s32 oldval,u32 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_limitnew_s32_s32_u16(s32 newval,s32 oldval,u16 maxdif)*/
/*~T*/
/*****************************************************************************/
/* function:  if (newval > oldval)                                           */
/*                 if (newval-oldval) > maxdif                               */
/*                    value = oldval+maxdif                                  */
/*                 else                                                      */
/*                     value = newval                                        */
/*            else                                                           */
/*                 if (oldval-newval) > maxdif                               */
/*                   value = oldval-maxdif                                   */
/*                 else                                                      */
/*                    value = newval                                         */
/*****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_LIMITNEW_S32_S32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_limitnew_s32_s32_u16(s32 newval,s32 oldval,u16 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_limitnew_up_s32_s32_u16 (s32 newval,s32 oldval,u16 maxdif)*/
/*~T*/
/****************************************************************************/
/* function:          if (newval > oldval)                                  */
/*                      if (newval-oldval) > maxdif                         */
/*                          value = old+maxdif                              */
/*                      else                                                */
/*                          value = newval                                  */
/*                    else                                                  */
/*                       value = newval                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_LMTNEW_UP_S32_S32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_limitnew_up_s32_s32_u16 (s32 newval,s32 oldval,u16 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_limitnew_down_s32_s32_u16 (s32 newval,s32 oldval,u16 maxdif)*/
/*~T*/
/****************************************************************************/
/* function: if (oldval > newval)                                           */
/*                if (oldval-newval) > maxdif                               */
/*                value = old-maxdif                                        */
/*                else                                                      */
/*                value = newval                                            */
/*           else                                                           */
/*           value = newval                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_LTNEW_DOWN_S32_S32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_limitnew_down_s32_s32_u16 (s32 newval,s32 oldval,u16 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_min_max_s32_s32_s32(s32 value, s32 minimum, s32 maximum)*/
/*~T*/
/****************************************************************************/
/* function:  limit s16  to minimum or maximum                              */
/*            s16  = minimum (if value < minimum)                           */
/*            s16  = maximum (if value > maximum)                           */
/*            s16  = value   (if minimum <= value <= maximum)               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MIN_MAX_S32_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_min_max_s32_s32_s32(s32 value, s32 minimum, s32 maximum);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_limitnew_up_s8_s8_u8 (s8 newval,s8 oldval,u8 maxdif)*/
/*~T*/
/****************************************************************************/
/* function:          if (newval > oldval)                                  */
/*                      if (newval-oldval) > maxdif                         */
/*                          value = old+maxdif                              */
/*                      else                                                */
/*                          value = newval                                  */
/*                    else                                                  */
/*                       value = newval                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_LIMITNEW_UP_S8_S8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_limitnew_up_s8_s8_u8 (s8 newval,s8 oldval,u8 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_limitnew_down_s8_s8_u8 (s8 newval,s8 oldval,u8 maxdif)*/
/*~T*/
/****************************************************************************/
/* function: if (oldval > newval)                                           */
/*                if (oldval-newval) > maxdif                               */
/*                value = old-maxdif                                        */
/*                else                                                      */
/*                value = newval                                            */
/*           else                                                           */
/*           value = newval                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_LIMITNEW_DOWN_S8_S8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_limitnew_down_s8_s8_u8 (s8 newval,s8 oldval,u8 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_limitnew_s8_s8_u8(s8 newval,s8 oldval,u8 maxdif)*/
/*~T*/
/*****************************************************************************/
/* function:  if (newval > oldval)                                           */
/*                 if (newval-oldval) > maxdif                               */
/*                    value = oldval+maxdif                                  */
/*                 else                                                      */
/*                     value = newval                                        */
/*            else                                                           */
/*                 if (oldval-newval) > maxdif                               */
/*                   value = oldval-maxdif                                   */
/*                 else                                                      */
/*                    value = newval                                         */
/*****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_LIMITNEW_S8_S8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_limitnew_s8_s8_u8(s8 newval,s8 oldval,u8 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_limitnew_up_u8_u8_u8 (u8 newval,u8 oldval,u8 maxdif)*/
/*~T*/
/****************************************************************************/
/* function:          if (newval > oldval)                                  */
/*                      if (newval-oldval) > maxdif                         */
/*                          value = old+maxdif                              */
/*                      else                                                */
/*                          value = newval                                  */
/*                    else                                                  */
/*                       value = newval                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_LIMITNEW_UP_U8_U8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_limitnew_up_u8_u8_u8 (u8 newval,u8 oldval,u8 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_limitnew_down_u8_u8_u8 (u8 newval,u8 oldval,u8 maxdif)*/
/*~T*/
/****************************************************************************/
/* function: if (oldval > newval)                                           */
/*              if (oldval-newval) > maxdif                                 */
/*                  value = old-maxdif                                      */
/*              else                                                        */
/*             value = newval                                               */
/*           else                                                           */
/*            value = newval                                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_LIMITNEW_DOWN_U8_U8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_limitnew_down_u8_u8_u8 (u8 newval,u8 oldval,u8 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_limitnew_u8_u8_u8 (u8 newval,u8 oldval,u8 maxdif)*/
/*~T*/
/*****************************************************************************/
/* function:  if (newval > oldval)                                           */
/*                 if (newval-oldval) > maxdif                               */
/*                    value = oldval+maxdif                                  */
/*                 else                                                      */
/*                     value = newval                                        */
/*            else                                                           */
/*                 if (oldval-newval) > maxdif                               */
/*                   value = oldval-maxdif                                   */
/*                 else                                                      */
/*                    value = newval                                         */
/*****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_LIMITNEW_U8_U8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_limitnew_u8_u8_u8 (u8 newval,u8 oldval,u8 maxdif);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_min_u8_u8(u8 value1 ,u8 value2)*/
/*~T*/
/****************************************************************************/
/* function:  compare value1 with value2 and return minimum value           */
/*            u8  = value1 (if value1 < value2)                            */
/*            u8  = value2 (if value2 < value1)                            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_MIN_U8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_min_u8_u8(u8 value1 ,u8 value2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_min_u32_u32(u32 value1 ,u32 value2)*/
/*~T*/
/****************************************************************************/
/* function:  compare value1 with value2 and return minimum value           */
/*            u32  = value1 (if value1 < value2)                            */
/*            u32  = value2 (if value2 < value1)                            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MIN_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_min_u32_u32(u32 value1 ,u32 value2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_max_u8_u8(u8 value1,u8 value2)*/
/*~T*/
/****************************************************************************/
/* function:  compare value1 with value2 and return maximum value           */
/*            u8  = value1 (if value1 > value2)                            */
/*            u8  = value2 (if value2 > value1)                            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_MAX_U8_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_max_u8_u8(u8 value1,u8 value2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_max_u32_u32(u32 value1,u32 value2)*/
/*~T*/
/****************************************************************************/
/* function:  compare value1 with value2 and return maximum value           */
/*            u32  = value1 (if value1 > value2)                            */
/*            u32  = value2 (if value2 > value1)                            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MAX_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_max_u32_u32(u32 value1,u32 value2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_min_s8_s8 (s8 value1,s8 value2)*/
/*~T*/
/****************************************************************************/
/* function:  compare value1 with value2 and return minimum value           */
/*            s8  = value1 (if value1 < value2)                            */
/*            s8  = value2 (if value2 < value1)                            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_MIN_S8_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_min_s8_s8 (s8 value1,s8 value2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_min_s32_s32 (s32 value1,s32 value2)*/
/*~T*/
/****************************************************************************/
/* function:  compare value1 with value2 and return minimum value           */
/*            s32  = value1 (if value1 < value2)                            */
/*            s32  = value2 (if value2 < value1)                            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MIN_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_min_s32_s32 (s32 value1,s32 value2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_max_s8_s8 (s8 value1,s8 value2)*/
/*~T*/
/****************************************************************************/
/* function:  compare value1 with value2 and return maximum value           */
/*            s8  = value1 (if value1 > value2)                            */
/*            s8  = value2 (if value2 > value1)                            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_MAX_S8_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_max_s8_s8 (s8 value1,s8 value2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_max_s32_s32 (s32 value1,s32 value2)*/
/*~T*/
/****************************************************************************/
/* function:  compare value1 with value2 and return maximum value           */
/*            s32  = value1 (if value1 > value2)                            */
/*            s32  = value2 (if value2 > value1)                            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MAX_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_max_s32_s32 (s32 value1,s32 value2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~E*/
/*~A*/
/*~+:MACROS*/
/*~A*/
/*~+:SET ROUTINES*/
/*~T*/
#define SET_MIN(x_value, y_value)      if (x_value > (y_value))  {x_value =(y_value);}

/*~T*/
#define SET_MAX(x_value, y_value)      if (x_value < (y_value))  {x_value =(y_value);}

/*~T*/

/*~E*/
/*~A*/
/*~+:MIN/MAX ROUTINES*/
/*~T*/
#define MIN(a,b)   (((a)<(b))?(a):(b))

/*~T*/
#define MAX(a,b)   (((a)>(b))?(a):(b))

/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:MAXIMUM ROUTINES*/
/*~A*/
/*~+:FUNCTIONS*/
/*~A*/
/*~+:u8 u8_max_tab_u16p_u8(u16 *tab, u8 tablen)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  Determination of the maximum in a table of u16;               */
/*            the result is the location of the maximum                     */
/*            u8 = location of the maximum of the table                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_MAX_TAB_U16P_U8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_max_tab_u16p_u8(const u16 *tab, u8 tablen);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:MACROS*/
/*~T*/
/* No Currently Existing Macros Among Maximum Routines */
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:MMV ROUTINES*/
/*~A*/
/*~+:FUNCTIONS*/
/*~A*/
/*~+:s16 s16_mmv_s16_s16_s16_fac1(s16 mmv,s16 measure,s16 crlc) */
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with an unsigned int as    */
/*            old floating average, an unsigned int as actual measured      */
/*            value and an unsigned int as average value of -1 ... 0.99997. */
/*            unsigned int = gmw + ((messwert - gmw) * mitko) >> 15         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MMV_S16_S16_S16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mmv_s16_s16_s16_fac1(s16 mmv, s16 measure, s16 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_mmv_u16_u16_s16_fac1(u16 mmv,u16 measure,s16 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with an unsigned int as    */
/*            old floating average, an unsigned int as actual measured      */
/*            value and an unsigned int as average value of -1 ... 0.99997. */
/*            unsigned int = gmw + ((messwert - gmw) * mitko) >> 15         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MMV_U16_U16_S16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mmv_u16_u16_s16_fac1(u16 mmv, u16 measure, s16 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_mmv_u16_u16_u16_fac2(u16 mmv,u16 measure,u16 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with an unsigned int as    */
/*            old floating average, an unsigned int as actual measured      */
/*            value and an unsigned int as average value of 0 ... 1.99997.  */
/*            unsigned int = gmw + ((messwert - gmw) * mitko) >> 15         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MMV_U16_U16_U16_FAC2) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mmv_u16_u16_u16_fac2(u16 mmv, u16 measure, u16 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mmv_u32_u16_u16_fac1(u32 mmv, u16 measure, u16 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with an unsigned int as    */
/*            old floating average, an unsigned int as actual measured      */
/*            value and an unsigned int as average value.                   */
/*            unsigned int = gmw + ((messwert - gmw) * mitko) >> 16         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MMV_U32_U16_U16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mmv_u32_u16_u16_fac1(u32 mmv, u16 measure, u16 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_mmv_s16_s16_u16_fac1(s16 mmv, s16 measure, u16 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with a signed long as old  */
/*            floating average, a signed int as as actual measured value    */
/*            and an unsigned int as average value.                         */
/*            signed long= gmw + ((messwert - gmw >> 16) * mitko)           */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MMV_S16_S16_U16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mmv_s16_s16_u16_fac1(s16 mmv, s16 measure, u16 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mmv_s32_s16_u16_fac1(s32 mmv, s16 measure, u16 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with an unsigned long as   */
/*            old floating average, an unsigned int as actual measured      */
/*            value and an unsigned int as average value.                   */
/*            unsigned long= gmw + ((messwert - gmw >> 16 ) * mitko)        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MMV_S32_S16_U16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mmv_s32_s16_u16_fac1(s32 mmv, s16 measure, u16 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_calc_av_u16_u16(u16 x_val, u16 y_val)*/
/*~T*/
/****************************************************************************/
/* function:  Calculates  the  average  of  two  unsigned  integers         */
/*            unsigned int= (unsigned int+unsigned int)/2  with  round  off */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_CALC_AV_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_calc_av_u16_u16(u16 x_val, u16 y_val);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_mmv_u16_u16_u16_fac1(u16 mmv, u16 measure, u16 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with a signed int as old   */
/*            floating average, a signed int as as actual measured value    */
/*            and an unsigned int as average value.                         */
/*            signed int = gmw + ((messwert - gmw) * mitko) >> 16)          */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MMV_U16_U16_U16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mmv_u16_u16_u16_fac1(u16 mmv, u16 measure, u16 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mmv_u32_u32_u32_fac1(u32 mmv, u32 measure, u32 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with an unsigned long as   */
/*            old floating average, an unsigned long as actual measured     */
/*            value and an unsigned long as average value.                  */
/*            unsigned long= gmw + ((messwert - gmw >> 32 ) * mitko)        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MMV_U32_U32_U32_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mmv_u32_u32_u32_fac1(u32 mmv, u32 measure, u32 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mmv_u32_u32_u16_fac1(u32 mmv, u32 measure, u16 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with an unsigned long as   */
/*            old floating average, an unsigned long as actual measured     */
/*            value and an unsigned long as average value.                    */
/*            unsigned long= gmw + ((messwert - gmw >> 16 ) * mitko)        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MMV_U32_U32_U16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mmv_u32_u32_u16_fac1(u32 mmv, u32 measure, u16 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mmv_u32_u32_s32_fac1(u32 mmv, u32 measure, s32 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with an unsigned long as   */
/*            old floating average, an unsigned long as actual measured     */
/*            value and a signed long as average value.                     */
/*            unsigned long= gmw + ((messwert - gmw >> 31 ) * mitko)        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MMV_U32_U32_S32_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mmv_u32_u32_s32_fac1(u32 mmv, u32 measure, s32 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mmv_u32_u32_s16_fac1(u32 mmv, u32 measure, s16 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with an unsigned long as   */
/*            old floating average, an unsigned long as actual measured     */
/*            value and a signed long as average value.                     */
/*            unsigned long= gmw + ((messwert - gmw >> 15 ) * mitko)        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MMV_U32_U32_S16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mmv_u32_u32_s16_fac1(u32 mmv, u32 measure, s16 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mmv_s32_s32_u32_fac1(s32 mmv, s32 measure, u32 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with a signed long as      */
/*            old floating average, a signed long as actual measured        */
/*            value and an unsigned long as average value.                  */
/*            unsigned long= gmw + ((messwert - gmw >> 32 ) * mitko)        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MMV_S32_S32_U32_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mmv_s32_s32_u32_fac1(s32 mmv, s32 measure, u32 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mmv_s32_s32_u16_fac1(s32 mmv, s32 measure, u16 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with a signed long as      */
/*            old floating average, a signed long as actual measured        */
/*            value and an unsigned long as average value.                  */
/*            unsigned long= gmw + ((messwert - gmw >> 16 ) * mitko)        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MMV_S32_S32_U16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mmv_s32_s32_u16_fac1(s32 mmv, s32 measure, u16 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mmv_s32_s32_s32_fac1(s32 mmv, s32 measure, s32 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with a signed long as      */
/*            old floating average, a signed long as actual measured        */
/*            value and an unsigned long as average value.                  */
/*            unsigned long= gmw + ((messwert - gmw >> 31 ) * mitko)        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MMV_S32_S32_S32_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mmv_s32_s32_s32_fac1(s32 mmv, s32 measure, s32 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mmv_s32_s32_s16_fac1(s32 mmv, s32 measure, s16 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with a signed long as      */
/*            old floating average, a signed long as actual measured        */
/*            value and an unsigned long as average value.                  */
/*            unsigned long= gmw + ((messwert - gmw >> 15 ) * mitko)        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MMV_S32_S32_S16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mmv_s32_s32_s16_fac1(s32 mmv, s32 measure, s16 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mmv_s32_s32_u16_fac1(s32 mmv, s32 measure, u16 crlc)*/
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with a signed long as      */
/*            old floating average, a signed long as actual measured        */
/*            value and an unsigned long as average value.                  */
/*            unsigned long= gmw + ((messwert - gmw >> 16 ) * mitko)        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MMV_S32_S32_U16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
/** Calculates new floating average.
 *  @param   mmv      old floating average  (phy. -2147483648 to +214748364)
 *  @param   measure  actual measured value (phy. -2147483648 to +214748364)
 *  @param   crlc     average value         (phy. 0....+0.99998)
 *  @return  result   new floating average  (phy. -2147483648 to +214748364)
 */
extern s32 s32_mmv_s32_s32_u16_fac1(s32 mmv, s32 measure, u16 crlc);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:MACROS*/
/*~A*/
/*~+:u8_mmv_u8_u8_u8_fac1(mmv,measure,crlc) */
/*~T*/
/****************************************************************************/
/* function:  The floating average is calculated with a unsigned char as old*/
/*            floating average, a unsigned char as as actual measured value */
/*            and an unsigned car as average value.                         */
/*            unsigned char = gmw + ((messwert - gmw) * mitko) >> 8)        */
/****************************************************************************/

/*~T*/
#define u8_mmv_u8_u8_u8_fac1(gmw,messwert,mitko) (u8)(u16_mmv_u16_u16_u16_fac1(gmw,messwert,(u16)((u16)mitko<<8)))

/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIV ROUTINES*/
/*~A*/
/*~+:Functions*/
/*~A*/
/*~+:s16 s16_fac05_div_s16_s16(s16 numerator, s16  denominator)*/
/*~T*/
/****************************************************************************/
/* function:  divide s16 by s16 with overflow limitation                    */
/*                                                                          */
/*            s16 = (s16 << 16) / s16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_FAC05_DIV_S16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_fac05_div_s16_s16(s16 numerator, s16  denominator);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_div_s32_s16(s32 x_value, s16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide s32 by s16 with overflow and                           */
/*            underflow limitation                                          */
/*            s16 = s32 / s16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_DIV_S32_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_div_s32_s16(s32 x_value, s16 y_value);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_fac05_div_s16_u16(s16 numerator, u16  denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide s16 by u16 with overflow limitation                    */
/*                                                                          */
/*            s16 = (s16 << 16) / u16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_FAC05_DIV_S16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_fac05_div_s16_u16(s16 numerator, u16  denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_div_s16_u16_shl0(s16 numerator, u16  denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide s16 by u16 (without shifting!)                         */
/*            with overflow and underflow limitation                        */
/*            s16 = s16 / u16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_DIV_S16_U16_SHL0) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_div_s16_u16_shl0(s16 numerator, u16 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_fac1_div_u16_u16(u16 numerator, u16 denominator) */
/*~T*/
/****************************************************************************/
/* function:  divide u16 by u16 with overflow limitation                    */
/*                                                                          */
/*            u8 = ((u16 << 16) / u16) >> 8                                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_FAC1_DIV_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_fac1_div_u16_u16(u16 numerator, u16 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_div_s32_u16(s32 x_value, u16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide s32 by u16 with overflow and                           */
/*            underflow limitation                                          */
/*            u16 = s32 / u16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_DIV_S32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_div_s32_u16(s32 x_value, u16 y_value);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_fac1_div_u16_u16(u16 numerator, u16 denominator)*/
/*~T*/
/****************************************************************************/
/* function:  divide u16 by u16                                             */
/*                                                                          */
/*            u16 = (u16 << 16) / u16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_FAC1_DIV_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16  u16_fac1_div_u16_u16(u16 numerator, u16 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_div_u32_u16(u32 x_value, u16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide u32 by u16 with overflow limitation                    */
/*                                                                          */
/*            u16 = u32 / u16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_DIV_U32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_div_u32_u16(u32 x_value, u16 y_value);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_mul_s16_u16_div_s16(s16 factor1, u16 factor2, s16 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s16 by u16 and divide the result                     */
/*            by s16 with overflow and underflow limitation                 */
/*            s16 = (s16 * u16) / s16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_U16_DIV_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_u16_div_s16(s16 factor1, u16 factor2, s16 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_mul_u16_s16_div_u16(u16 factor1, s16 factor2, u16 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u16 by   s16 and divide the result                   */
/*            by u16                                                        */
/*              s16 = (u16 *   s16) / u16                                   */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_U16_S16_DIV_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_u16_s16_div_u16(u16 factor1, s16 factor2, u16 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_mul_s16_u16_div_s16(s16 factor1, u16 factor2, s16 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s16 by u16 and divide the result                     */
/*            by s16 with overflow and underflow limitation                 */
/*            u16 = (s16 * u16) / s16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MUL_S16_U16_DIV_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mul_s16_u16_div_s16(s16 factor1, u16 factor2, s16 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_mul_s16_u16_div_u16(s16 factor1, u16 factor2, u16 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s16 by u16 and divide the result                     */
/*            by u16 with overflow and underflow limitation                 */
/*            u16 = (s16 * u16) / u16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MUL_S16_U16_DIV_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mul_s16_u16_div_u16(s16 factor1, u16 factor2, u16 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_mul_u16_u16_div_u16(u16 factor1, u16 factor2, u16 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u16 by u16 and divide the result                     */
/*            by u16                                                        */
/*            u16 = (u16 * u16) / u16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MUL_U16_U16_DIV_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mul_u16_u16_div_u16(u16 factor1, u16 factor2, u16 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_mul_u16_u16_div_u32(u16 factor1, u16 factor2, u32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u16 by u16 and divide the result                     */
/*            by u32                                                        */
/*            u16 = (u16 * u16) / u32                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MUL_U16_U16_DIV_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mul_u16_u16_div_u32(u16 factor1, u16 factor2, u32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_div_u32_u16(u32 x_value, u16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide u32 by u16                                             */
/*            u32 = u32 / u16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_DIV_U32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_div_u32_u16(u32 x_value, u16 y_value);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_mul_s16_s16_div_s16(s16 fak1, s16 fak2, s16 div)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s16 by s16 and divide the result                     */
/*            by s16                                                        */
/*            s16 = (s16 * s16) / s16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_S16_DIV_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_s16_div_s16(s16 fak1, s16 fak2, s16 div);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_mul_s16_s16_div_u16(s16 data1,s16 data2,u16 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s16 by s16 and divide the result                     */
/*            by u16                                                        */
/*            s16 = (s16 * s16) / u16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_S16_DIV_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_s16_div_u16(s16 data1,s16 data2,u16 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_div_u32_s32(u32 numerator, s32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide u32 by s32                                             */
/*            u32 = u32 / s32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_DIV_U32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_div_u32_s32(u32 numerator, s32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_div_s32_u32(s32 numerator, u32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide s32 by u32                                             */
/*            u32 = s32 / u32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_DIV_S32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_div_s32_u32(s32 numerator, u32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_div_s32_s32(s32 numerator, s32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide s32 by s32                                             */
/*            u32 = s32 / s32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_DIV_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_div_s32_s32(s32 numerator, s32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_div_u32_u32(u32 numerator, u32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide u32 by u32                                             */
/*            u32 = u32 / u32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_DIV_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_div_u32_u32(u32 numerator, u32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_div_u32_s32(u32 numerator, s32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide u32 by s32                                             */
/*            s32 = u32 / s32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_DIV_U32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_div_u32_s32(u32 numerator, s32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_div_s32_u32(s32 numerator, u32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide s32 by u32                                             */
/*            s32 = s32 / u32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_DIV_S32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_div_s32_u32(s32 numerator, u32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_div_s32_s32(s32 numerator, s32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide s32 by s32                                             */
/*            s32 = s32 / s32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_DIV_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_div_s32_s32(s32 numerator, s32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_div_s32_u32(s32 numerator, u32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  divide s32 by u32                                             */
/*            s16 = s32 / u32                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_DIV_S32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_div_s32_u32(s32 numerator, u32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_u32_div_u32(u32 factor1, u32 factor2, u32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by u32 and divide the result                     */
/*            by u32 with overflow limitation                               */
/*            u32 = (u32 * u32) / u32                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_U32_DIV_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_u32_div_u32(u32 factor1, u32 factor2, u32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_u32_div_s32(u32 factor1, u32 factor2, s32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by u32 and divide the result                     */
/*            by s32 with overflow and underflow limitation                 */
/*            u32 = (u32 * u32) / s32                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_U32_DIV_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_u32_div_s32(u32 factor1, u32 factor2, s32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_s32_div_u32(u32 factor1, s32 factor2, u32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by s32 and divide the result                     */
/*            by u32 with overflow and underflow limitation                 */
/*            u32 = (u32 * s32) / u32                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_S32_DIV_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_s32_div_u32(u32 factor1, s32 factor2, u32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_s32_div_s32(u32 factor1, s32 factor2, s32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by s32 and divide the result                     */
/*            by s32 with overflow and underflow limitation                 */
/*            u32 = (u32 * s32) / s32                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_S32_DIV_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_s32_div_s32(u32 factor1, s32 factor2, s32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s32_s32_div_s32(s32 factor1, s32 factor2, s32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by s32 and divide the result                     */
/*            by s32 with overflow and underflow limitation                 */
/*            s32 = (s32 * s32) / s32                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_S32_DIV_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_s32_div_s32(s32 factor1, s32 factor2, s32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s32_s32_div_u32(s32 factor1, s32 factor2, u32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by s32 and divide the result                     */
/*            by u32 with overflow and underflow limitation                 */
/*            s32 = (s32 * s32) / u32                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_S32_DIV_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_s32_div_u32(s32 factor1, s32 factor2, u32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_u32_s32_div_s32(u32 factor1, s32 factor2, s32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by s32 and divide the result                     */
/*            by s32 with overflow and underflow limitation                 */
/*            s32 = (u32 * s32) / s32                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_U32_S32_DIV_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_u32_s32_div_s32(u32 factor1, s32 factor2, s32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_u32_s32_div_u32(u32 factor1, s32 factor2, u32 denominator)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by s32 and divide the result                     */
/*            by u32 with overflow and underflow limitation                 */
/*            s32 = (u32 * s32) / u32                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_U32_S32_DIV_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_u32_s32_div_u32(u32 factor1, s32 factor2, u32 denominator);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:Macros*/
/*~T*/
/* No Currently Existing Macros Among Division Routines */
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:MUL ROUTINES*/
/*~A*/
/*~+:S8_MUL_S8_U8 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:s8 root_s8_mul_s8_u8_fac_greater1(s8 value,u16 factor)*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_S8_MUL_S8_U8_FAC_GREATER1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 root_s8_mul_s8_u8_fac_greater1(s8 value,u16 factor);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 root_s8_mul_s8_u8_fac_less1(s8 value,u16 factor)*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_S8_MUL_S8_U8_FAC_LESS1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 root_s8_mul_s8_u8_fac_less1(s8 value,u16 factor);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC N<1*/
/*~A*/
/*~+:s8_mul_s8_u8_fac0125*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s8 by a factor of 0..0.1245                          */
/*            (shift 11 bits to the right)                                  */
/*            s8 = (s8 * u8) >> 11                                          */
/****************************************************************************/

/*~T*/
#define s8_mul_s8_u8_fac0125(value, factor) \
        root_s8_mul_s8_u8_fac_less1(value,(u16)((u16)(factor) <<5))

/*~E*/
/*~A*/
/*~+:s8_mul_s8_u8_fac025*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s8 by a factor of 0..0.249                           */
/*            (shift 10 bits to the right)                                  */
/*            s8 = (s8 * u8) >> 10                                          */
/****************************************************************************/

/*~T*/
#define s8_mul_s8_u8_fac025(value, factor) \
        root_s8_mul_s8_u8_fac_less1(value,(u16)((u16)(factor) <<6))

/*~E*/
/*~A*/
/*~+:s8_mul_s8_u8_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s8 by a factor of 0..0.498                           */
/*            (shift 9  bits to the right)                                  */
/*            s8 = (s8 * u8) >> 9                                           */
/****************************************************************************/

/*~T*/
#define s8_mul_s8_u8_fac05(value, factor) \
        root_s8_mul_s8_u8_fac_less1(value,(u16)((u16)(factor) <<7))
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:s8 s8_mul_s8_u8_fac1(s8 value, u8 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s8 by a factor of 0 ... 0.996                        */
/*            (shift 8 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 8                                           */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_MUL_S8_U8_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_mul_s8_u8_fac1(s8 value, u8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s8 s8_mul_s8_u8_fac2(s8 value, u8 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s8 by a factor of 0..1.992                           */
/*            (shift 7 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 7                                           */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S8_MUL_S8_U8_FAC2) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s8 s8_mul_s8_u8_fac2(s8 value, u8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC N>1*/
/*~A*/
/*~+:s8_mul_s8_u8_fac4*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s8 by a factor of 0..3.984                           */
/*            (shift 6 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 6                                           */
/****************************************************************************/

/*~T*/
#define s8_mul_s8_u8_fac4(value, factor) \
        root_s8_mul_s8_u8_fac_greater1(value,(u16)((u16)(factor) <<2))

/*~E*/
/*~A*/
/*~+:s8_mul_s8_u8_fac8*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s8 by a factor of 0..7.969                           */
/*            (shift 5 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 5                                           */
/****************************************************************************/

/*~T*/
#define s8_mul_s8_u8_fac8(value, factor) \
        root_s8_mul_s8_u8_fac_greater1(value,(u16)((u16)(factor) <<3))

/*~E*/
/*~A*/
/*~+:s8_mul_s8_u8_fac16*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s8 by a factor of 0..15.9375                         */
/*            (shift 4 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 4                                           */
/****************************************************************************/

/*~T*/
#define s8_mul_s8_u8_fac16(value, factor) \
        root_s8_mul_s8_u8_fac_greater1(value,(u16)((u16)(factor) <<4))

/*~E*/
/*~A*/
/*~+:s8_mul_s8_u8_fac32*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s8 by a factor of 0..31.875                          */
/*            (shift 3 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 3                                           */
/****************************************************************************/

/*~T*/
#define s8_mul_s8_u8_fac32(value, factor) \
        root_s8_mul_s8_u8_fac_greater1(value,(u16)((u16)(factor) <<5))

/*~E*/
/*~A*/
/*~+:s8_mul_s8_u8_fac64*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s8 by a factor of 0..63.750                          */
/*            (shift 2 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 2                                           */
/****************************************************************************/

/*~T*/
#define s8_mul_s8_u8_fac64(value, factor) \
        root_s8_mul_s8_u8_fac_greater1(value,(u16)((u16)(factor) <<6))

/*~E*/
/*~A*/
/*~+:s8_mul_s8_u8_fac128*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s8 by a factor of 0..127.50                          */
/*            (shift 1 bits to the right)                                   */
/*            s8 = (s8 * u8) >> 1                                           */
/****************************************************************************/

/*~T*/
#define s8_mul_s8_u8_fac128(value, factor) \
        root_s8_mul_s8_u8_fac_greater1(value,(u16)((u16)(factor) <<7))
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:S16_MUL_S16_S16 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:s16 root_s16_mul_s16_s16_fac_less1(s16 value, s16 factor, s32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_LESS1_S16_MUL_S16_S16_FAC) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 root_s16_mul_s16_s16_fac_less1(s16 value, s16 factor, s32 count);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 root_s16_mul_s16_s16_fac_greater1( s16 value, s16 factor, s16 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_GREATER1_S16_MUL_S16_S16_FAC) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 root_s16_mul_s16_s16_fac_greater1( s16 value, s16 factor, s16 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC < 1*/
/*~A*/
/*~+:s16_mul_s16_s16_fac0125*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -0.125..0.124996           */
/*            (shift 18 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 18                  */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac0125(value, factor) \
root_s16_mul_s16_s16_fac_less1(value,factor,262144)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_s16_fac025*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -0.25..0.24999             */
/*            (shift 17 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 17                  */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac025(value, factor) \
root_s16_mul_s16_s16_fac_less1(value,factor,131072)
/*~E*/
/*~A*/
/*~+:s16_mul_s16_s16_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -0.5 ... 0.4999923         */
/*            (shift 16 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 16                  */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac05(value, factor) \
root_s16_mul_s16_s16_fac_less1(value,factor,65536)

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:s16 s16_mul_s16_s16_fac1( s16 value, s16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s16 by a factor of -1 ... 0.999985                   */
/*            (shift 15 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            s16 = (s16 * s16) >> 15                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_S16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_s16_fac1( s16 value, s16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_mul_s16_s16_fac2( s16 value, s16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s16 by a factor of -2 ... 1.99997                    */
/*            (shift 14 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            s16 = (s16 * s16) >> 14                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_S16_FAC2) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_s16_fac2( s16 value, s16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~A*/
/*~+:s16_mul_s16_s16_fac4*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -4 ... 3.99997             */
/*            (shift 13 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 13                  */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac4(value, factor) \
root_s16_mul_s16_s16_fac_greater1(value,factor,8192)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_s16_fac8*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -8 ... 7.99988             */
/*            (shift 12 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 12                  */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac8(value, factor) \
root_s16_mul_s16_s16_fac_greater1(value,factor,4096)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_s16_fac16*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -16 .. 15.999              */
/*            (shift 11 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 11                  */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac16(value, factor) \
root_s16_mul_s16_s16_fac_greater1(value,factor,2048)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_s16_fac32*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -32 .. 31.999              */
/*            (shift 10 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 10                  */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac32(value, factor) \
root_s16_mul_s16_s16_fac_greater1(value,factor,1024)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_s16_fac64*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -64 .. 63.999              */
/*            (shift 9 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 9                   */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac64(value, factor) \
root_s16_mul_s16_s16_fac_greater1(value,factor,512)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_s16_fac128*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -128 .. 127.999            */
/*            (shift 8 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 8                   */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac128(value, factor) \
root_s16_mul_s16_s16_fac_greater1(value,factor,256)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_s16_fac256*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -256 .. 255.999            */
/*            (shift 7 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 7                   */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac256(value, factor) \
root_s16_mul_s16_s16_fac_greater1(value,factor,128)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_s16_fac512*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -512 ... 511.992           */
/*            (shift 6 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 6                   */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac512(value, factor) \
root_s16_mul_s16_s16_fac_greater1(value,factor,64)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_s16_fac1024*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -1024 .. 1023.875          */
/*            (shift 5 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 5                   */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac1024(value, factor) \
root_s16_mul_s16_s16_fac_greater1(value,factor,32)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_s16_fac2048*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -2048 .. 2047.875          */
/*            (shift 4 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 4                   */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac2048(value, factor) \
root_s16_mul_s16_s16_fac_greater1(value,factor,16)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_s16_fac4096*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of -4096 .. 4095.875          */
/*            (shift 3 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * signed int) >> 3                   */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_s16_fac4096(value, factor) \
root_s16_mul_s16_s16_fac_greater1(value,factor,8)
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:S16_MUL_S16_U8 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:s16 root_s16_mul_s16_u8_fac_less1(s16 value, u16 factor)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_S16_MUL_S16_U8_FAC_LESS1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 root_s16_mul_s16_u8_fac_less1(s16 value, u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 root_s16_mul_s16_u8_fac_greater1(s16 value,u16 factor)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_GRTR1_S16_MUL_S16_U8_FAC) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 root_s16_mul_s16_u8_fac_greater1(s16 value,u16 factor);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:s16_mul_s16_u8_fac0125*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 0.1245             */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u8_fac0125(value, factor) \
root_s16_mul_s16_u8_fac_less1(value,(u16)((u16)(factor) << 5))

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u8_fac025*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply   signed int by a factor of 0 ... 0.24               */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u8_fac025(value, factor) \
root_s16_mul_s16_u8_fac_less1(value,(u16)((u16)(factor) << 6))

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u8_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply   signed int by a factor of 0 ... 0.49               */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u8_fac05(value, factor) \
root_s16_mul_s16_u8_fac_less1(value,(u16)((u16)(factor) << 7))
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:s16 s16_mul_s16_u8_fac1(s16 value, u8 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply   signed int by a factor of 0 ... 0.99               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_U8_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_u8_fac1(s16 value, u8 factor) ;

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_mul_s16_u8_fac2(s16 value, u8 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply   signed int by a factor of 0..1.992                 */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_U8_FAC2) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_u8_fac2(s16 value, u8 factor);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1 */
/*~A*/
/*~+:s16_mul_s16_u8_fac4*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply   s16 by a factor of 0..3.984                        */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u8_fac4(value, factor) \
        root_s16_mul_s16_u8_fac_greater1(value,(u16)((u16)(factor) <<2))

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u8_fac8*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply   s16 by a factor of 0 ... 7.969                     */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u8_fac8(value, factor) \
        root_s16_mul_s16_u8_fac_greater1(value,(u16)((u16)(factor) <<3))

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u8_fac16*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply   s16 by a factor of 0 ... 15.9375                   */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u8_fac16(value, factor) \
        root_s16_mul_s16_u8_fac_greater1(value,(u16)((u16)(factor) <<4))

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u8_fac32*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply   s16 by a factor of 0 ... 31.875                    */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u8_fac32(value, factor) \
        root_s16_mul_s16_u8_fac_greater1(value,(u16)((u16)(factor) <<5))

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u8_fac64*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply   s16 by a factor of 0 ... 63.750                    */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u8_fac64(value, factor) \
        root_s16_mul_s16_u8_fac_greater1(value,(u16)((u16)(factor) <<6))

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u8_fac128*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply   s16 by a factor of 0 ... 127.50                    */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u8_fac128(value, factor) \
        root_s16_mul_s16_u8_fac_greater1(value,(u16)((u16)(factor) <<7))
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:S16_MUL_S16_U16 SERIES*/
/*~A*/
/*~+:ROOT FUNCTION*/
/*~A*/
/*~+:s16 root_s16_mul_s16_u16_fac_less1(s16 value,u16 factor,s32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_S16_MUL_S16_U16_FAC_LESS1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 root_s16_mul_s16_u16_fac_less1(s16 value,u16 factor,s32 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 root_s16_mul_s16_u16_fac_greater1(s16 value,u16 factor,u16 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_GRT1_S16_MUL_S16_U16_FAC) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 root_s16_mul_s16_u16_fac_greater1(s16 value,u16 factor,u16 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:s16_mul_s16_u16_fac0125*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ..0.1245                 */
/*            (shift 19 bits to the right)                                  */
/*            signed int = (signed int * unsigned int) >> 19                */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac0125(value,factor) \
root_s16_mul_s16_u16_fac_less1(value,factor,524288)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u16_fac025*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 0.24                 */
/*            (shift 18 bits to the right)                                  */
/*            signed int = (signed int * unsigned int) >> 18                */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac025(value,factor) \
root_s16_mul_s16_u16_fac_less1(value,factor,262144)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u16_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 0.49                 */
/*            (shift 17 bits to the right)                                  */
/*            signed int = (signed int * unsigned int) >> 17                */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac05(value,factor) \
root_s16_mul_s16_u16_fac_less1(value,factor,131072)
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTION*/
/*~A*/
/*~+:s16 s16_mul_s16_u16_fac1( s16 value, u16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s16 by a factor of 0 ... 0.999985                    */
/*            (shift 16 bits to the right)                                  */
/*            s16 = (s16 * u16) >> 16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_U16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_u16_fac1( s16 value, u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_mul_s16_u16_fac2( s16 value, u16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s16 by a factor of 0 ... 1.992                                                                                  */
/*            (shift 15 bits to the right)                                  */
/*            s16 = (s16 * u16) >> 15                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_U16_FAC2) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_u16_fac2( s16 value, u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~A*/
/*~+:s16_mul_s16_u16_fac4*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 3.999939             */
/*            (shift 14 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 14                */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac4(value,factor) \
root_s16_mul_s16_u16_fac_greater1(value,factor,16384)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u16_fac8*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 7.999939             */
/*            (shift 13 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 13                */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac8(value,factor) \
root_s16_mul_s16_u16_fac_greater1(value,factor,8192)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u16_fac16*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 15.999756            */
/*            (shift 12 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 12                */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac16(value,factor) \
root_s16_mul_s16_u16_fac_greater1(value,factor,4096)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u16_fac32*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 31.999756            */
/*            (shift 11 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 11                */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac32(value,factor) \
root_s16_mul_s16_u16_fac_greater1(value,factor,2048)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u16_fac64*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 63.999023            */
/*            (shift 10 bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 10                */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac64(value,factor) \
root_s16_mul_s16_u16_fac_greater1(value,factor,1024)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u16_fac128*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 127.999023           */
/*            (shift 9 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 9                 */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac128(value,factor) \
root_s16_mul_s16_u16_fac_greater1(value,factor,512)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u16_fac256*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 255.999023           */
/*            (shift 8 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 8                 */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac256(value,factor) \
root_s16_mul_s16_u16_fac_greater1(value,factor,256)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u16_fac512*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 511.999023           */
/*            (shift 7 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 7                 */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac512(value,factor) \
root_s16_mul_s16_u16_fac_greater1(value,factor,128)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u16_fac1024*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 1023.999023          */
/*            (shift 6 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 6                 */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac1024(value,factor) \
root_s16_mul_s16_u16_fac_greater1(value,factor,64)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u16_fac2048*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 2047.999023          */
/*            (shift 5 bits to the right) with overflow and                 */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 5                 */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac2048(value,factor) \
root_s16_mul_s16_u16_fac_greater1(value,factor,32)

/*~E*/
/*~A*/
/*~+:s16_mul_s16_u16_fac4096*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed int by a factor of 0 ... 4095.999023          */
/*            (shift 4  bits to the right) with overflow and                */
/*            underflow limitation                                          */
/*            signed int = (signed int * unsigned int) >> 4                 */
/****************************************************************************/

/*~T*/
#define s16_mul_s16_u16_fac4096(value,factor) \
root_s16_mul_s16_u16_fac_greater1(value,factor,16)
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:U8_MUL_U8_U8 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:u8 root_u8_mul_u8_u8_fac_less1(u8 value,u8 factor,u16 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_U8_MUL_U8_U8_FAC_LESS1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 root_u8_mul_u8_u8_fac_less1(u8 value,u8 factor,u16 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 root_u8_mul_u8_u8_fac_greater1(u8 value,u8 factor,u8 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_U8_MUL_U8_U8_FAC_GREATER1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 root_u8_mul_u8_u8_fac_greater1(u8 value,u8 factor,u8 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC < 1*/
/*~A*/
/*~+:u8_mul_u8_u8_fac0125*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..0.1245               */
/*            (shift 11 bits to the right)                                  */
/*            unsigned char = high char of the 11 bit value (u8 - u8)       */
/****************************************************************************/

/*~T*/
#define u8_mul_u8_u8_fac0125(value,factor) \
root_u8_mul_u8_u8_fac_less1(value,factor,2048)

/*~E*/
/*~A*/
/*~+:u8_mul_u8_u8_fac025*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..0.249                */
/*            (shift 10 bits to the right)                                  */
/*            unsigned char = high char of the 10 bit value (u8 - u8)       */
/****************************************************************************/

/*~T*/
#define u8_mul_u8_u8_fac025(value,factor) \
root_u8_mul_u8_u8_fac_less1(value,factor,1024)

/*~E*/
/*~A*/
/*~+:u8_mul_u8_u8_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..0.498                */
/*            (shift 9 bits to the right)                                   */
/*            unsigned char = high char of the 9 bit value (u8 - u8)        */
/****************************************************************************/

/*~T*/
#define u8_mul_u8_u8_fac05(value,factor) \
root_u8_mul_u8_u8_fac_less1(value,factor,512)
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:u8 u8_mul_u8_u8_fac1(u8 x_value,u8 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u8 by a factor of 0 ... 0.996                        */
/*            (shift 8 bits to the right)                                   */
/*            u8 = high s8 of the 16 bit value (u8 - u8)                    */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_MUL_U8_U8_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_mul_u8_u8_fac1(u8 x_value,u8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_mul_u8_u8_fac2( u8 value, u8 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u8 by a factor of 0 ... 1.992                        */
/*            (shift 7 bits to the right) with overflow limitation          */
/*            u8 = (u8 * u8) >> 7                                          */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_MUL_U8_U8_FAC2) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_mul_u8_u8_fac2( u8 value, u8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC > 1*/
/*~A*/
/*~+:u8_mul_u8_u8_fac4*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..3.984                */
/*            (shift 6 bits to the right) with overflow limitation          */
/*            unsigned char = (unsigned char * unsigned char) >>  6         */
/****************************************************************************/

/*~T*/
#define u8_mul_u8_u8_fac4(value,factor) \
root_u8_mul_u8_u8_fac_greater1(value,factor,64)

/*~E*/
/*~A*/
/*~+:u8_mul_u8_u8_fac8*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..7.968                */
/*            (shift 5 bits to the right) with overflow limitation          */
/*            unsigned char = (unsigned char * unsigned char) >>  5         */
/****************************************************************************/

/*~T*/
#define u8_mul_u8_u8_fac8(value,factor) \
root_u8_mul_u8_u8_fac_greater1(value,factor,32)

/*~E*/
/*~A*/
/*~+:u8_mul_u8_u8_fac16*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..15.936               */
/*            (shift 4 bits to the right) with overflow limitation          */
/*            unsigned char = (unsigned char * unsigned char) >>  4         */
/****************************************************************************/

/*~T*/
#define u8_mul_u8_u8_fac16(value,factor) \
root_u8_mul_u8_u8_fac_greater1(value,factor,16)

/*~E*/
/*~A*/
/*~+:u8_mul_u8_u8_fac32*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..31.872               */
/*            (shift 3 bits to the right) with overflow limitation          */
/*            unsigned char = (unsigned char * unsigned char) >>  3         */
/****************************************************************************/

/*~T*/
#define u8_mul_u8_u8_fac32(value,factor) \
root_u8_mul_u8_u8_fac_greater1(value,factor,8)

/*~E*/
/*~A*/
/*~+:u8_mul_u8_u8_fac64*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..63.744               */
/*            (shift 2 bits to the right) with overflow limitation          */
/*            unsigned char = (unsigned char * unsigned char) >>  2         */
/****************************************************************************/

/*~T*/
#define u8_mul_u8_u8_fac64(value,factor) \
root_u8_mul_u8_u8_fac_greater1(value,factor,4)

/*~E*/
/*~A*/
/*~+:u8_mul_u8_u8_fac128*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned char by a factor of 0..127.488              */
/*            (shift 1 bits to the right) with overflow limitation          */
/*            unsigned char = (unsigned char * unsigned char) >>  1         */
/****************************************************************************/

/*~T*/
#define u8_mul_u8_u8_fac128(value,factor) \
root_u8_mul_u8_u8_fac_greater1(value,factor,2)
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:U16_MUL_U16_U8 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:u16 root_u16_mul_u16_u8_fac_less1(u16 value,u16 factor)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_U16_MUL_U16_U8_FAC_LESS1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 root_u16_mul_u16_u8_fac_less1(u16 value,u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 root_u16_mul_u16_u8_fac_greater_1(u16 value,u16 factor)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_GREATER_1_U16_MUL_U16_U8_FAC) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 root_u16_mul_u16_u8_fac_greater_1(u16 value,u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:u16_mul_u16_u8_fac0125*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 0.1245             */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u8_fac0125(x_value, y_value) \
       root_u16_mul_u16_u8_fac_less1(x_value,(u16)((u16)(y_value) << 5))

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u8_fac025*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 0.24               */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u8_fac025(x_value, y_value) \
       root_u16_mul_u16_u8_fac_less1(x_value,(u16)((u16)(y_value) << 6))

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u8_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 0.49               */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u8_fac05(x_value, y_value) \
       root_u16_mul_u16_u8_fac_less1(x_value,(u16)((u16)(y_value) << 7))
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:u16 u16_mul_u16_u8_fac1(u16 x_value, u8 y_value);*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 0.99               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MUL_U16_U8_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mul_u16_u8_fac1(u16 x_value, u8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_mul_u16_u8_fac2(u16 x_value, u8 y_value);*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 1.99               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MUL_U16_U8_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mul_u16_u8_fac2(u16 x_value, u8 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~A*/
/*~+:u16_mul_u16_u8_fac4*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u16 by a factor of 0..3.998                          */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u8_fac4(x_value, y_value) \
        root_u16_mul_u16_u8_fac_greater_1(x_value,(u16)((u16)(y_value) << 2))

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u8_fac8*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ... 7.968                       */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u8_fac8(x_value, y_value) \
        root_u16_mul_u16_u8_fac_greater_1(x_value,(u16)((u16)(y_value) << 3))

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u8_fac16*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ... 15.9375                     */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u8_fac16(x_value, y_value) \
        root_u16_mul_u16_u8_fac_greater_1(x_value,(u16)((u16)(y_value) << 4))
/*~E*/
/*~A*/
/*~+:u16_mul_u16_u8_fac32*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ...31.99975586                  */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u8_fac32(x_value, y_value) \
        root_u16_mul_u16_u8_fac_greater_1(x_value,(u16)((u16)(y_value) << 5))

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u8_fac64*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ... 63.999023                   */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u8_fac64(x_value, y_value) \
        root_u16_mul_u16_u8_fac_greater_1(x_value,(u16)((u16)(y_value) << 6))

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u8_fac128*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ... 127.98046                   */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u8_fac128(x_value, y_value) \
        root_u16_mul_u16_u8_fac_greater_1(x_value,(u16)((u16)(y_value) << 7))
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:U16_MUL_U16_U16 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:u16 root_u16_mul_u16_u16_fac_less1(u16 value,u16 factor,u32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_U16_MUL_U16_U16_FAC_LESS1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 root_u16_mul_u16_u16_fac_less1(u16 value,u16 factor,u32 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 root_u16_mul_u16_u16_fac_greater1(u16 value,u16 factor,u16 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_GREATER1_U16_MUL_U16_U16_FAC) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 root_u16_mul_u16_u16_fac_greater1(u16 value,u16 factor,u16 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:u16_mul_u16_u16_fac0125*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ...524288              */
/*            (shift 19 bits to the right)                                  */
/*            unsigned int = (unsigned int * unsigned int) >> 19            */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac0125(value,factor) \
root_u16_mul_u16_u16_fac_less1(value,factor,524288)

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u16_fac025*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ...262144              */
/*            (shift 18 bits to the right)                                  */
/*            unsigned int = (unsigned int * unsigned int) >> 18            */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac025(value,factor) \
root_u16_mul_u16_u16_fac_less1(value,factor,262144)

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u16_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ...131072             */
/*            (shift 17 bits to the right)                                  */
/*            unsigned int = (unsigned int * unsigned int) >> 17            */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac05(value,factor) \
root_u16_mul_u16_u16_fac_less1(value,factor,131072)
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:u16 u16_mul_u16_u16_fac1(u16 x_value,u16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ... 0.999985                    */
/*            (shift 16 bits to the right)                                  */
/*            u16 = (u16 * u16) >> 16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MUL_U16_U16_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mul_u16_u16_fac1(u16 x_value,u16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_mul_u16_u16_fac2(u16 x_value,u16 y_value);*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ... 1.99997                     */
/*            (shift 15 bits to the right) with overflow limitation         */
/*            u16 = (u16 * u16) >> 15                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MUL_U16_U16_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mul_u16_u16_fac2( u16 value, u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~A*/
/*~+:u16_mul_u16_u16_fac4*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 3.999938965        */
/*            (shift 14 bits to the right) with overflow limitation         */
/*            unsigned int = (unsigned int * unsigned int) >> 14            */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac4(value,factor) \
root_u16_mul_u16_u16_fac_greater1(value,factor,16384)

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u16_fac8*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 7.99987793         */
/*            (division by 2000H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) / 2000 H         */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac8(value,factor) \
root_u16_mul_u16_u16_fac_greater1(value,factor,8192)

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u16_fac16*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 15.99975586        */
/*            (division by 1000H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) / 1000 H         */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac16(value,factor) \
root_u16_mul_u16_u16_fac_greater1(value,factor,4096)

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u16_fac32*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 31.99975586        */
/*            (division by  800H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) /  800 H         */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac32(value,factor) \
root_u16_mul_u16_u16_fac_greater1(value,factor,2048)

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u16_fac64*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 63.999023          */
/*            (shift 10 bits to the right) with overflow limitation         */
/*            unsigned int = (unsigned int * unsigned int) >> 10            */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac64(value,factor) \
root_u16_mul_u16_u16_fac_greater1(value,factor,1024)

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u16_fac128*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0..127.50                */
/*            (division by 100 H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) / 100 H          */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac128(value,factor) \
root_u16_mul_u16_u16_fac_greater1(value,factor,512)

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u16_fac256*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 255.9960938        */
/*            (division by 100 H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) / 100 H          */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac256(value,factor) \
root_u16_mul_u16_u16_fac_greater1(value,factor,256)

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u16_fac512*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 511.9960938        */
/*            (division by  80 H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) /  80 H          */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac512(value,factor) \
root_u16_mul_u16_u16_fac_greater1(value,factor,128)

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u16_fac1024*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 1023.9960938       */
/*            (division by  40 H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) /  40 H          */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac1024(value,factor) \
root_u16_mul_u16_u16_fac_greater1(value,factor,64)

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u16_fac2048*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 1023.9960938       */
/*            (division by  20 H) with overflow limitation                  */
/*            unsigned int = (unsigned int * unsigned int) /  20 H          */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac2048(value,factor) \
root_u16_mul_u16_u16_fac_greater1(value,factor,32)

/*~E*/
/*~A*/
/*~+:u16_mul_u16_u16_fac4096*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned int by a factor of 0 ... 4095.9375          */
/*            (shift 4 bits to the right) with overflow limitation          */
/*            unsigned int = (unsigned int * unsigned int) >> 4             */
/****************************************************************************/

/*~T*/
#define u16_mul_u16_u16_fac4096(value,factor) \
root_u16_mul_u16_u16_fac_greater1(value,factor,16)
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:U32_MUL_U32_U16 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:u32 root_u32_mul_u32_u16_fac_less1(u32 value,u16 factor, u32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_U32_MUL_U32_U16_FAC_LESS1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 root_u32_mul_u32_u16_fac_less1(u32 value,u16 factor, u32 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:u32_mul_u32_u16_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned long by a factor of 0 ...0.49999            */
/*            (shift 17 bits to the right)                                  */
/*            unsigned long = (unsigned long * unsigned int) >> 17          */
/****************************************************************************/

/*~T*/
#define u32_mul_u32_u16_fac05(value,factor) \
root_u32_mul_u32_u16_fac_less1(value,factor,17)

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:u32 u32_mul_u32_u16_fac1(u32 value, u16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by a factor of 0 ... 0.999985                    */
/*            (shift 16 bits to the right)                                  */
/*            u32 = (u32 * u16) >> 16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_U16_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_u16_fac1(u32 value, u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_u16_fac2(u32 value, u16 factor);*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by a factor of 0 ... 1.99997                     */
/*            (shift 15 bits to the right) with overflow limitation         */
/*            u32 = (u32 * u16) >> 15                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_U16_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_u16_fac2( u32 value, u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:U32_MUL_U32_S16 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:u32 root_u32_mul_u32_s16_fac_less1(u32 value,s16 factor, u32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_U32_MUL_U32_S16_FAC_LESS1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 root_u32_mul_u32_s16_fac_less1(u32 value,s16 factor, u32 count);

/*~-*/
#endif
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:u32_mul_u32_s16_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned long by a factor of -0.5... 0 ... 0.4999923 */
/*            (shift 16 bits to the right)                                  */
/*            unsigned long = (unsigned long * unsigned int >> 16           */
/****************************************************************************/

/*~T*/
#define u32_mul_u32_s16_fac05(value,factor) \
root_u32_mul_u32_s16_fac_less1(value,factor,16)

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:u32 u32_mul_u32_s16_fac1(u32 value, s16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by a factor of -1 ... 0 ... 0.99997              */
/*            (shift 15 bits to the right)                                  */
/*            u32 = (u32 * s16) >> 15                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_S16_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_s16_fac1(u32 value,s16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_s16_fac2( u32 value, s16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by a factor of -2 ... 0 ... 1.99993              */
/*            (shift 14 bits to the right) with overflow limitation         */
/*            u32 = (u32 * s16) >> 14                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_S16_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_s16_fac2( u32 value, s16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:U32_MUL_U32_U32 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:u32 root_u32_mul_u32_u32_fac_less1(u32 value,u32 factor, u32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_U32_MUL_U32_U32_FAC_LESS1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 root_u32_mul_u32_u32_fac_less1(u32 value,u32 factor, u32 count);

/*~-*/
#endif
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:u32_mul_u32_u32_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned long by a factor of 0 ...0.49999            */
/*            (shift 33 bits to the right)                                  */
/*            unsigned long = (unsigned long * unsigned long) >> 33         */
/****************************************************************************/

/*~T*/
#define u32_mul_u32_u32_fac05(value,factor) \
root_u32_mul_u32_u32_fac_less1(value,factor,33)

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:u32 u32_mul_u32_u32_fac1(u32 value,u32 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by a factor of 0 ... 0.999985                    */
/*            (shift 32 bits to the right)                                  */
/*            u32 = (u32 * u32) >> 32                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_U32_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_u32_fac1(u32 value,u32 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_u32_fac2(u32 value,u32 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by a factor of 0 ... 1.99997                     */
/*            (shift 31 bits to the right) with overflow limitation         */
/*            u32 = (u32 * u32) >> 31                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_U32_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_u32_fac2( u32 value, u32 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:U32_MUL_U32_S32 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:u32 root_u32_mul_u32_s32_fac_less1(u32 value, s32 factor, u32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_U32_MUL_U32_S32_FAC_LESS1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 root_u32_mul_u32_s32_fac_less1(u32 value, s32 factor, u32 count);

/*~-*/
#endif
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:u32_mul_u32_s32_fac05*/
/*~+:*/
/*~T*/
/******************************************************************************/
/* function:  multiply unsigned long by a factor of -0.5... 0 ... 0.49999     */
/*            (shift 32 bits to the right)                                    */
/*            unsigned long = (unsigned long * signed long) >> 32             */
/******************************************************************************/

/*~T*/
#define u32_mul_u32_s32_fac05(value,factor) \
root_u32_mul_u32_s32_fac_less1(value,factor,32)

/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:u32 u32_mul_u32_s32_fac1(u32 value,s32 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by a factor of -1 .... 0 ... 0.99999             */
/*            (shift 31 bits to the right)                                  */
/*            u32 = (u32 * s32) >> 31                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_S32_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_s32_fac1(u32 value,s32 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_s32_fac2(u32 value,s32 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by a factor of -2 .... 0 ... 1.99997             */
/*            (shift 30 bits to the right) with overflow limitation         */
/*            u32 = (u32 * s32) >> 30                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_S32_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_s32_fac2( u32 value, s32 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:S32_MUL_S32_U16 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:s32 root_s32_mul_s32_u16_fac_less1(s32 value,u16 factor, u32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_S32_MUL_S32_U16_FAC_LESS1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 root_s32_mul_s32_u16_fac_less1(s32 value,u16 factor, u32 count);

/*~-*/
#endif
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:s32_mul_s32_u16_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed long by a factor of 0 ...0.49999              */
/*            (shift 17 bits to the right)                                  */
/*            signed long = (signed long * unsigned int) >> 19              */
/****************************************************************************/

/*~T*/
#define s32_mul_s32_u16_fac05(value,factor) \
root_s32_mul_s32_u16_fac_less1(value,factor,131072)

/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:s32 s32_mul_s32_u16_fac1(s32 value,u16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by a factor of  0 ... 0.999985                   */
/*            (shift 16 bits to the right)                                  */
/*            s32 = (s32 * u16) >> 16                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_U16_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_u16_fac1(s32 value,u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s32_u16_fac2(s32 value,u16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by a factor of 0 ... 1.99997                     */
/*            (shift 15 bits to the right) with overflow limitation         */
/*            s32 = (s32 * u16) >> 15                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_U16_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_u16_fac2( s32 value, u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:S32_MUL_S32_S16 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:s32 root_s32_mul_s32_s16_fac_less1(s32 value, s16 factor, u32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_S32_MUL_S32_S16_FAC_LESS1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 root_s32_mul_s32_s16_fac_less1(s32 value, s16 factor, u32 count);

/*~-*/
#endif
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:s32_mul_s32_s16_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned long by a factor of -0.5 ... 0 ...0.49998   */
/*            (shift 16 bits to the right)                                  */
/*            signed long = (signed long * signed int) >> 16                */
/****************************************************************************/

/*~T*/
#define s32_mul_s32_s16_fac05(value,factor) \
root_s32_mul_s32_s16_fac_less1(value,factor,65536)

/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:s32 s32_mul_s32_s16_fac1(s32 value,s16 factor);*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by a factor of -1 .... 0 ... 0.99997             */
/*            (shift 15 bits to the right)                                  */
/*            s32 = (s32 * s16) >> 15                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_S16_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_s16_fac1(s32 value,s16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s32_s16_fac2(s32 value,s16 factor);*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by a factor of -2 ... 0 ... 1.99994              */
/*            (shift 14 bits to the right) with overflow limitation         */
/*            s32 = (s32 * u16) >> 14                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_S16_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_s16_fac2( s32 value, s16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:S32_MUL_S32_U32 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:s32 root_s32_mul_s32_u32_fac_less1(s32 value, u32 factor, u64 count)*/
/*~+:*/
/*~K*/
/*~+:The function prototype was deleted since the root function was used only for s32_mul_s32_u32_fac05.*/
/*~+:s32_mul_s32_u32_fac05 was implemented as a direct function with explicit shift parameter because of*/
/*~+:run-time benefits.*/
/*~+:*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:s32 s32_mul_s32_u32_fac1(s32 value,u32 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by a factor of 0 ... 0.999999                    */
/*            (shift 32 bits to the right)                                  */
/*            s32 = (s32 * u32) >> 32                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_U32_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_u32_fac1(s32 value,u32 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s32_u32_fac2(s32 value,u32 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by a factor of 0 ... 1.99999                     */
/*            (shift 31 bits to the right) with overflow limitation         */
/*            s32 = (s32 * u32) >> 31                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_U32_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_u32_fac2( s32 value, u32 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32_mul_s32_u32_fac05(s32 value,u32 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed long by a factor of 0 ...0.499999             */
/*            (shift 33 bits to the right)                                  */
/*            signed long = (signed long * unsigned long) >> 33           */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_U32_FAC05) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_u32_fac05(s32 value, u32 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:S32_MUL_S32_S32 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:s32 root_s32_mul_s32_s32_fac_less1(s32 value, s32 factor, u64 count)*/
/*~+:*/
/*~K*/
/*~+:The function prototype was deleted since the root function was used only for s32_mul_s32_s32_fac05.*/
/*~+:s32_mul_s32_s32_fac05 was implemented as a direct function with explicit shift parameter because of*/
/*~+:run-time benefits.*/
/*~+:*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:s32 s32_mul_s32_s32_fac1(s32 value, s32 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by a factor of 0 ... 0.99999                     */
/*            (shift 31 bits to the right)                                  */
/*            s32 = (s32 * s32) >> 31                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_S32_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_s32_fac1(s32 value, s32 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s32_s32_fac2(s32 value, s32 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by a factor of 0 ... 1.99999                     */
/*            (shift 30 bits to the right) with overflow limitation         */
/*            s32 = (s32 * s32) >> 30                                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_S32_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_s32_fac2( s32 value, s32 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32_mul_s32_s32_fac05(s32 value, s32 factor)*/
/*~+:*/
/*~T*/
/*****************************************************************************/
/* function:  multiply signed long by a factor of -0.5.. 0.499               */
/*            signed long = (signed long * signed long) / 4294967296         */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_S32_FAC05) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_s32_fac05(s32 value, s32 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:U32_MUL_U32_U8 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:u32 root_u32_mul_u32_u8_fac_less1(u32 value, u8 factor, u32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_U32_MUL_U32_U8_FAC_LESS1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 root_u32_mul_u32_u8_fac_less1(u32 value, u8 factor, u32 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:u32_mul_u32_u8_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned long by a factor of 0 ...0.4980             */
/*            (shift 9 bits to the right)                                   */
/*            unsigned long = (unsigned long * unsigned char) >> 9          */
/****************************************************************************/

/*~T*/
#define u32_mul_u32_u8_fac05(value,factor) \
root_u32_mul_u32_u8_fac_less1(value,factor,9)

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:u32 u32_mul_u32_u8_fac1(u32 value, u8 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by a factor of 0 ... 0.996                       */
/*            (shift 8 bits to the right)                                   */
/*            unsigned long = (unsigned long * unsigned char) >> 8          */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_U8_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_u8_fac1(u32 value, u8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_u8_fac2(u32 value, u8 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by a factor of 0 ... 1.9922                      */
/*            (shift 7 bits to the right) with overflow limitation          */
/*            unsigned long = (unsigned long * unsigned char) >> 7          */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_U8_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_u8_fac2( u32 value, u8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:U32_MUL_U32_S8 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:u32 root_u32_mul_u32_s8_fac_less1(u32 value, s8 factor, u32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_U32_MUL_U32_S8_FAC_LESS1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 root_u32_mul_u32_s8_fac_less1(u32 value, s8 factor, u32 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:u32_mul_u32_s8_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply unsigned long by a factor of -0.5 .. 0 ...0.4960     */
/*            (shift 8 bits to the right) with underflow limitation         */
/*            unsigned long = (unsigned long * signed char) >> 8            */
/****************************************************************************/

/*~T*/
#define u32_mul_u32_s8_fac05(value,factor) \
root_u32_mul_u32_s8_fac_less1(value,factor,8)

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:u32 u32_mul_u32_s8_fac1(u32 value, s8 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by a factor of -1 .. 0 .. 0.9922                 */
/*            (shift 7 bits to the right) with underflow limitation         */
/*            unsigned long = (unsigned long * signed char) >> 8            */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_S8_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_s8_fac1(u32 value, s8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_s8_fac2(u32 value, s8 factor)*/
/*~+:*/
/*~T*/
/**************************************************************************************/
/* function:  multiply u32 by a factor of -2 .. 0 ... 1.9844                          */
/*            (shift 7 bits to the right) with overflow and underflow limitation      */
/*            unsigned long = (unsigned long * signed char) >> 6                      */
/**************************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_S8_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_s8_fac2( u32 value, s8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:S32_MUL_S32_U8 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:s32 root_s32_mul_s32_u8_fac_less1(s32 value, u8 factor, u32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_S32_MUL_S32_U8_FAC_LESS1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 root_s32_mul_s32_u8_fac_less1(s32 value, u8 factor, u32 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:s32_mul_s32_u8_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed long by a factor of 0 ...0.4980               */
/*            (shift 9 bits to the right)                                   */
/*            signed long = (signed long * unsigned char) / 512             */
/****************************************************************************/

/*~T*/
#define s32_mul_s32_u8_fac05(value,factor) \
root_s32_mul_s32_u8_fac_less1(value,factor,512)

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:s32 s32_mul_s32_u8_fac1(s32 value, u8 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by a factor of 0 ... 0.996                       */
/*            (shift 8 bits to the right)                                   */
/*            signed long = (signed long * unsigned char) / 256             */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_U8_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_u8_fac1(s32 value, u8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s32_u8_fac2(s32 value, u8 factor)*/
/*~+:*/
/*~T*/
/**************************************************************************************/
/* function:  multiply s32 by a factor of 0 ... 1.9922                                */
/*            (shift 7 bits to the right) with overflow and underflow limitation      */
/*            signed long = (signed long * unsigned char) / 128                       */
/**************************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_U8_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_u8_fac2( s32 value, u8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:S32_MUL_S32_S8 SERIES*/
/*~A*/
/*~+:ROOT FUNCTIONS*/
/*~A*/
/*~+:s32 root_s32_mul_s32_s8_fac_less1(s32 value, s8 factor, u32 count)*/
/*~+:*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_ROOT_S32_MUL_S32_S8_FAC_LESS1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 root_s32_mul_s32_s8_fac_less1(s32 value, s8 factor, u32 count);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC <1*/
/*~A*/
/*~+:s32_mul_s32_s8_fac05*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply signed long by a factor of -1.5 .. 0 .. 0.4960       */
/*            (shift 8 bits to the right)                                   */
/*            signed long = (signed long * signed char) / 256               */
/****************************************************************************/

/*~T*/
#define s32_mul_s32_s8_fac05(value,factor) \
root_s32_mul_s32_s8_fac_less1(value,factor,256)

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:DIRECT FUNCTIONS*/
/*~A*/
/*~+:s32 s32_mul_s32_s8_fac1(s32 value, s8 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by a factor of -1 .. 0 .. 0.9922                  */
/*            (shift 7 bits to the right)                                    */
/*            signed long = (signed long * signed char) / 128                */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_S8_FAC1) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_s8_fac1(s32 value, s8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s32_s8_fac2(s32 value, s8 factor)*/
/*~+:*/
/*~T*/
/**************************************************************************************/
/* function:  multiply s32 by a factor of -2 .. 0 .. 1.9844                           */
/*            (shift 6 bits to the right) with overflow and underflow limitation      */
/*            signed long = (signed long * signed char) / 64                          */
/**************************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_S8_FAC2) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_s8_fac2( s32 value, s8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:FAC >1*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:MACROS*/
/*~T*/

/*~E*/
/*~A*/
/*~+:General Functions*/
/*~A*/
/*~+:s16 s16_mul_s16_u16(s16 value, u16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s16 by u16 with underflow and                        */
/*            overflow limitation                                           */
/*            s16 = s16 - u16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_S16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_s16_u16(s16 value, u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_mul_u16_u16_fac256( u16 value, u16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u16 by a factor of 0 ... 255.9960938                 */
/*            (shift 8 bits to the right)                                   */
/*            s16 = (u16 * u16) >> 8                                        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_MUL_U16_U16_FAC256) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_mul_u16_u16_fac256( u16 value, u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s16_u16(s16 value, u16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s16 by u16 with underflow and                        */
/*            overflow limitation                                           */
/*            s32 = s16 * u16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S16_U16) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s16_u16(s16 value, u16 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s32_u16(s32 value, u16 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply s32 by u16 with underflow and                        */
/*            overflow limitation                                           */
/*            s32 = s32 * u16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_u16(s32 value, u16 factor);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_u16(u32 x_value, u16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  multiply u32 by u16 with underflow and                        */
/*            overflow limitation                                           */
/*            u32 = u32 * u16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_u16(u32 x_value, u16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u8 u8_cal1_u8_u8_s8( u8 val1, u8 val2, s8 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  u8 = (( u8 val1 - u8 val2)                                    */
/*                             * s8 factor) + u8 val2                       */
/*            with underflow and overflow limitation                        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U8_CAL1_U8_U8_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u8 u8_cal1_u8_u8_s8( u8 val1, u8 val2, s8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_cal1_u16_u16_s8( u16 val1, u16 val2, s8 factor)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  u16  = (( u16  val1 - u16  val2)                              */
/*                             * s8 factor) + u16  val2                     */
/*            with underflow and overflow limitation                        */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_CAL1_U16_U16_S8) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_cal1_u16_u16_s8( u16 val1, u16 val2, s8 factor);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_mul_u16_u16( u16 val1, u16 val2)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  u16  = (u16  val1 * u16  val2)                                */
/*            with overflow limitation                                      */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_MUL_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_mul_u16_u16( u16 val1, u16 val2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u16_u16(u16 x_value, u16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  u32 = (u16  val1 * u16  val2)                                 */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U16_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u16_u16(u16 x_value, u16 y_value);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s16_s16(s16 x_value, s16 y_value)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  s32  = (s16  val1 * s16  val2)                                */
/****************************************************************************/

/*~T*/
/****************************************************************************/
/* function:  multiply s32 by u16 with underflow and                        */
/*            overflow limitation                                           */
/*            s32 = s32 * u16                                               */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S16_S16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s16_s16(s16 x_value, s16 y_value);
/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_s32(u32 val1, s32 val2)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  u32  = (u32  val1 * s32  val2)                                */
/*             with underflow and overflow limitation                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_s32(u32 val1, s32 val2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_s32_s32(s32 val1, s32 val2)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  u32  = (s32  val1 * s32  val2)                                */
/*             with underflow and overflow limitation                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_s32_s32(s32 val1, s32 val2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_u32(u32 val1, u32 val2);*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  u32  = (u32  val1 * u32  val2)                                */
/*             with overflow limitation                                     */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u32 u32_mul_u32_u32(u32 val1, u32 val2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_u32_s32(u32 val1, s32 val2)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  s32  = (u32  val1 * s32  val2)                                */
/*             with underflow and overflow limitation                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_U32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_u32_s32(u32 val1, s32 val2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s32_s32(s32 val1, s32 val2)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  s32  = (s32  val1 * s32  val2)                                */
/*             with underflow and overflow limitation                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_S32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_mul_s32_s32(s32 val1, s32 val2);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u32 u32_mul_u32_u32_fac_twopow_u8(u32 value, u32 factor, u8 power)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  u32 = ((u32 value * u32 factor) >> (32 - power)               */
/*                     with overflow limitation                             */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U32_MUL_U32_U32_FAC_TWOPOW_U8) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
/** Multiplies two u32 values then right shifts the product by (32 - power) number of bits.
 *  @param   value     first parameter of u32 type  (phy. 0 to 4294967295)
 *  @param   factor    second parameter of u32 type (phy. 0 to 4294967295)
 *  @param   power     number of bits by which the product should be shifted right (phy. 1..31)
 *  @return  result    value multiplied by a factor greater than one (phy. 0..4294967295)
 */
extern u32 u32_mul_u32_u32_fac_twopow_u8(u32 value,u32 factor, u8 power);

/*~T*/

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_mul_s32_s32_fac_twopow_u8(s32 value, s32 factor, u8 power)*/
/*~+:*/
/*~T*/
/****************************************************************************/
/* function:  s32 = ((s32 value * s32 factor) >> (32 - power)               */
/*             with underflow and overflow limitation                       */
/****************************************************************************/

/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_MUL_S32_S32_FAC_TWOPOW_U8) )
/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
/** Multiplies two s32 values then right shifts the product by (32 - power) number of bits.
 *  @param   value     first parameter of s32 type  (phy. -2147483648 to 2147483647)
 *  @param   factor    second parameter of s32 type (phy. -2147483648 to 2147483647)
 *  @param   power     number of bits by which the product should be shifted right (phy. 1..31)
 *  @return  result    value multiplied by a factor greater than one (phy. -2147483648 to 2147483647)
 */
extern s32 s32_mul_s32_s32_fac_twopow_u8(s32 value, s32 factor, u8 power);

/*~T*/

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:HIGHPASS ROUTINES*/
/*~A*/
/*~+:Functions*/
/*~A*/
/*~+:s16 s16_hip1_s16_u8_u8_u16_fac1(s16 yold, u8 u, u8 uold, u16 m)*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Output of a high-pass filter*/
/*~+:The formulae used*/
/*~+:       result = yold - (m*yold/65536)+ (u -uold)*128  */
/*~+:with rouding off and saturation correction in the result*/
/*~+:*/
/*~T*/

/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_HIP1_S16_U8_U8_U16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_hip1_s16_u8_u8_u16_fac1(s16 yold, u8 u, u8 uold, u16 m);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_hip1_s16_s8_s8_u16_fac1(s16 yold, s8 u, s8 uold, u16 m)*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Output of a high-pass filter*/
/*~+:The formulae used*/
/*~+:       result = yold - (m*yold/65536)+ (u -uold)*128  */
/*~+:with rouding off and saturation correction in the result*/
/*~+:*/
/*~T*/

/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_HIP1_S16_S8_S8_U16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s16 s16_hip1_s16_s8_s8_u16_fac1(s16 yold, s8 u, s8 uold, u16 m);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_hip1_s32_u16_u16_u16_fac1(s32 yold, u16 u, u16 uold, u16 m)*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Output of a high-pass filter*/
/*~+:The formulae used*/
/*~+:       result = yold - (m*yold/65536)+ (u -uold)*32768  */
/*~+:with rouding off and saturation correction in the result*/
/*~+:*/
/*~T*/

/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_HIP1_S32_U16_U16_U16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_hip1_s32_u16_u16_u16_fac1(s32 yold, u16 u, u16 uold, u16 m);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s32 s32_hip1_s32_s16_s16_u16_fac1(s32 yold, s16 u, s16 uold, u16 m)*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Output of a high-pass filter*/
/*~+:The formulae used*/
/*~+:       result = yold - (m*yold/65536)+ (u -uold)*32768  */
/*~+:with rouding off and saturation correction in the result*/
/*~+:*/
/*~T*/

/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S32_HIP1_S32_S16_S16_U16_FAC1) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern s32 s32_hip1_s32_s16_s16_u16_fac1(s32 yold, s16 u, s16 uold, u16 m);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:Macros*/
/*~T*/
/* No Currently Existing Macros Among Addition Routines */
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:SQUARE ROOT ROUTINES*/
/*~A*/
/*~+:Functions*/
/*~A*/
/*~+:u16 u16_sqrt_u32(u32 input)*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Functionality:*/
/*~+:Square Root Function: Returns an u16 value which is the square root value of the u32 input parameter*/
/*~T*/

/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_SQRT_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
extern u16 u16_sqrt_u32(u32 input);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:Macros*/
/*~T*/
/* No Currently Existing Macros Among Square Root Routines */
/*~E*/
/*~E*/
/*~A*/
/*~+:TRIGONOMETRIC ROUTINES*/
/*~A*/
/*~+:Functions*/
/*~A*/
/*~+:u16 u16_sin_u16(u16 phi)*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Functionality:*/
/*~+:Sine Function: Returns an u16 value which is the sine of the u16 input parameter*/
/*~T*/

/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_SIN_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
/** Calculates the sine of the given angle.
 *  @param   phi         angle in radians (phy. 0 to pi/2)
 *  @return  result      sine of the given angle(phy. 0 to 0.99998)
 */
extern u16 u16_sin_u16(u16 phi);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_sin_u32(u32 phi)*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Functionality:*/
/*~+:Sine Function: Returns an s16 value which is the sine of the u32 input parameter*/
/*~T*/

/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_SIN_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
/** Calculates the sine of the given angle.
 *  @param   phi         angle in radians (phy. 0 to 32768 pi)
 *  @return  result      sine of the given angle(phy. -1 to 0.99998)
 */
extern s16 s16_sin_u32(u32 phi);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_cos_u16(u16 phi)*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Functionality:*/
/*~+:Cos Function: Returns an u16 value which is the cosine of the u16 input parameter*/
/*~T*/

/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_COS_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
/** Calculates the cosine of the given angle.
 *  @param   phi         angle in radians (phy. 0 to pi/2)
 *  @return  result      cosine of the given angle(phy. 0 to 0.99998)
 */
extern u16 u16_cos_u16(u16 phi);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_cos_u32(u32 phi)*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Functionality:*/
/*~+:Cos Function: Returns an s16 value which is the cosine of the u32 input parameter*/
/*~T*/

/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_COS_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
/** Calculates the cosine of the given angle.
 *  @param   phi         angle in radians (phy. 0 to 32768 pi)
 *  @return  result      cosine of the given angle(phy. -1 to 0.99998)
 */
extern s16 s16_cos_u32(u32 phi);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:u16 u16_tan_u16(u16 phi)*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Functionality:*/
/*~+:Tan Function: Returns an u16 value which is the tangent of the u16 input parameter*/
/*~T*/

/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_U16_TAN_U16) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
/** Calculates the tangent of the given angle.
 *  @param   phi         angle in radians (phy. 0 to pi/2)
 *  @return  result      tangent of the given angle(phy. 0 to 15.999756)
 */
extern u16 u16_tan_u16(u16 phi);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~A*/
/*~+:s16 s16_tan_u32(u32 phi)*/
/*~A*/
/*~+:Description*/
/*~K*/
/*~+:Functionality:*/
/*~+:Tan Function: Returns an s16 value which is the tangent of the u32 input parameter*/
/*~T*/

/*~E*/
/*~I*/
/* provide function prototype, if default behavior is requested */
#if ( (INLINE_LIBS==0) || !defined(INLINE_S16_TAN_U32) )

/*~A*/
/*~+:If INLINE_LIBS=2 and no inlining choice is made, give error.*/
/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
#error "No inlining choice made for this function."
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
/** Calculates the tangent of the given angle.
 *  @param   phi         angle in radians (phy. 0 to 32768 pi)
 *  @return  result      tangent of the given angle(phy. -16 to 15.999756)
 */
extern s16 s16_tan_u32(u32 phi);

/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/

/*~E*/
/*~A*/
/*~+:Macros*/
/*~T*/
/* No Currently Existing Macros Among Square Root Routines */
/*~E*/
/*~E*/
/*~A*/
/*~+:Provide function definitions, if INLINE_LIBS=1 or INLINE_LIBS=2*/
/*~I*/
#if !(INLINE_LIBS==0)
/*~T*/
/*Function definitions for inlining (INLINE_LIBS = 1 or 2)*/
#include <add.h>
#include <sub.h>
#include <mul.h>
#include <shift.h>
#include <minmax.h>

/*~I*/
#if (INLINE_LIBS==2) 
/*~T*/
/*Additional Function Definitions when INLINE_LIBS = 2) */
#include <div.h>
#include <avrg.h>
#include <hip1.h>
#include <sqrt.h>
#include <trig.h>

/*~-*/
#endif
/*~E*/
/*~-*/
#endif
/*~E*/
/*~E*/
/*~T*/
#include <gmem.h> /* reset the memory allocation>*/

/*~T*/

/*~E*/
/*~T*/

/*~-*/
#endif
/*~E*/
