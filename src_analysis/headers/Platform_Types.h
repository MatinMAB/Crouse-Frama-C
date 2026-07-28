
                                       /*******************
 ***************************************** C HEADER FILE ******************************************
                                        *******************/
/**
 *  @file       Platform_Types.h
 *
 *  General Info
 *  ------------
 *  ____
 *  @par        File info
 *  @li @b      Version         : 0.1.0
 *  @li @b      Date            : 2018-10-09
 * 
 *  @par        Project info
 *  @li @b      Project         : 
 *  @li @b      Processor       : Renesas RL78/F12.
 *  @li @b      Tool  @b Chain  : IAR Ver.3.10.1.
 *  @li @b      Clock @b Freq   : 
 *
 *  @par        Description
 *              This file contains all platform dependent types and symbols.
 *
 *  @copyright  (C) 2018 CROUSE PJS Inc. All rights reserved.
 *
 **************************************************************************************************
 *  _______________
 *  Version History
 *  ---------------
 ************************************************************************************************** 
 *  ____
 *  @par        Rev 0.1.0
 *  @li @b      Date            : 2018-11-05
 *  @li @b      Author          : S.Chehresa
 *  @li @b      Approved @b by  : 
 *  @li @b      Desctiption
 *
 *              Development version
 *
 ************************************************************************************************** 
 */
#if !defined(PLATFORM_TYPES_H)
#define PLATFORM_TYPES_H

//typedef unsigned char u8;
//typedef unsigned short u16;
//typedef unsigned long u32; 
//typedef signed char s8;
//typedef signed short s16;
//typedef signed long s32;


/*
 **************************************************************************************************
 *
 *      DEFINITIONS AND MACROS
 *
 **************************************************************************************************
 */

/*
 **************************************************************************************************
 *
 *      TYPEDEFS AND STRUCTURES
 *
 **************************************************************************************************
 */
/*
 **************************************************************************************************
 *
 *      typedef for MathFunc project (by sm90985) 2020-08-15
 *
 **************************************************************************************************
 */


/*!
 ***********************************************
 * @typedef     char bool
 * 
 * @brief       define bool variable as single 
 *              bit long.
 *
 ***********************************************
 */ 
typedef unsigned char bool;
 
/*!
 ***********************************************
 * @typedef     unsigned char int8u
 * 
 * @brief       define int8u variable as  
 *              unsigned 8 bits length bit long.
 *
 ***********************************************
 */
typedef unsigned char int8u;

/*!
 ***********************************************
 * @typedef     unsigned char u8
 * 
 * @brief       define u8 variable as  
 *              unsigned 8 bits length bit long.
 *
 ***********************************************
 */
typedef unsigned char u8;

/*!
 ***********************************************
 * @typedef     signed char int8s
 * 
 * @brief       define int8s variable as signed 
 *              value 8 bits length.
 *
 ***********************************************
 */
typedef signed char int8s;

/*!
 ***********************************************
 * @typedef     unsigned int int16u
 * 
 * @brief       define int16u variable as 
 *              unsigned value 8 bits length.
 *
 ***********************************************
 */
typedef unsigned int int16u;


/*!
 ***********************************************
 * @typedef     signed char s8
 * 
 * @brief       define s8 variable as  
 *              signed value 8 bits length.
 *
 ***********************************************
 */
typedef signed char s8;


/*!
 ***********************************************
 * @typedef     unsigned int u16
 * 
 * @brief       define u16 variable as 
 *              unsigned value 8 bits length.
 *
 ***********************************************
 */
//typedef unsigned int u16;


/*!
 ***********************************************
 * @typedef     unsigned short u16
 * 
 * @brief       define u16 variable as 
 *              unsigned value 16 bits length.
 *
 ***********************************************
*/
typedef unsigned short u16;

/*!
 ***********************************************
 * @typedef     signed int int16s
 * 
 * @brief       define int16s variable as signed
 *              value 16 bits length.
 *
 ***********************************************
 */
typedef signed int int16s;


/*!
 ***********************************************
 * @typedef     signed short s16
 * 
 * @brief       define s16 variable as signed
 *              value 16 bits length.
 *
 ***********************************************
 */
typedef signed short s16;


/*!
 ***********************************************
 * @typedef     unsigned long int32u
 * 
 * @brief       define int32u variable as 
 *              unsigned value 32 bits length.
 *
 ***********************************************
 */
typedef unsigned long int32u;

/*!
 ***********************************************
 * @typedef     unsigned long iu32
 * 
 * @brief       define u32 variable as 
 *              unsigned value 32 bits length.
 *
 ***********************************************
 */
typedef unsigned long u32;

/*!
 ***********************************************
 * @typedef     signed long int32s
 * 
 * @brief       define int32s variable as signed
 *              value 32 bits length.
 *
 ***********************************************
 */
typedef signed long int32s;


/*!
 ***********************************************
 * @typedef     signed long s32
 * 
 * @brief       define s32 variable as signed
 *              value 32 bits length.
 *
 ***********************************************
 */
typedef signed long s32;


typedef unsigned long long u64;
typedef signed long long s64;

typedef double f32;


/*
 **************************************************************************************************
 *
 *      EXPORTED VARIABLES
 *
 **************************************************************************************************
 */

/*
 **************************************************************************************************
 *
 *      PROTOTYPEDEFS OF EXPORTED FUNCTIONS
 *
 **************************************************************************************************
 */

#endif
/*
 **************************************************************************************************
 *
 *      EOF
 *
 **************************************************************************************************
 */

