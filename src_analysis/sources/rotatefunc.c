/**
 * @file rotatefunc.c
 * @brief Bit-rotation helper routines.
 *
 * @details
 * C-only ECMath implementation prepared for formal analysis with Frama-C/EVA. Assembly
 * implementations were removed, while the executable C statements were retained. Function-level
 * documentation was reconstructed from the legacy `ecmath.h` contract and checked against the
 * corresponding implementation.
 *
 * @note Documentation edition: EVA C-only Doxygen v2.
 * @note The documentation pass does not intentionally change executable C statements.
 * @defgroup ecmath_rotate_helpers Bit-rotation helper routines
 * @{
 */

/*
 * rotatefunc.c
 *
 *  Created on: Dec 7, 2019
 *      Author: ng104383
 */

#include <stdio.h>
 typedef unsigned char u8;
 typedef unsigned short u16;
 typedef unsigned long u32; 
 typedef signed char s8;
 typedef signed short s16;
 typedef signed long s32;

//#define INT_SIZE sizeof(u32)        // Size of int in bytes
//#define INT_BITS INT_SIZE * 8 - 1   // Size of int in bits - 1


/**
 * Function to rotate bits of a number to left.
 *
 * @num         Number to rotate.
 * @rotation    Number of times to rotate left.
 */
/**
 * @brief Rotates a 32-bit value to the left.
 *
 * @details
 * Rotates a 32-bit value to the left.
 *
 * @param[in] num Input parameter `num`. Representable range: 0 to 4294967295.
 * @param[in] rotation Number of bit positions to rotate. Representable range: 0 to 4294967295.
 * @return Result of `rotateLeft` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (left shift(s): 1).
 * @note Rotation counts should be interpreted modulo the 32-bit word width only where the implementation explicitly performs that reduction.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_rotate_helpers
 */
 u32 rotateLeft(u32 num, u32 rotation)
{
    u32 DROPPED_MSB, INT_SIZE, INT_BITS;
    INT_SIZE = sizeof(num);
    INT_BITS = INT_SIZE * 8 - 1;

    // The effective rotation
    rotation %= INT_BITS;


    // Loop till rotation becomes 0
    while(rotation--)
    {
        // Get MSB of num before it gets dropped
        DROPPED_MSB = (num >> INT_BITS) & 1; 

        // Left rotate num by 1 and 
        // Set its dropped MSB as new LSB
        num = (num << 1) | DROPPED_MSB;
    }

    return num;
}


/**
 * Function to rotate bits of a number to right.
 *
 * @num         Number to rotate.
 * @rotation    Number of times to rotate right.
 */
/**
 * @brief Rotates a 32-bit value to the right.
 *
 * @details
 * Rotates a 32-bit value to the right.
 *
 * @param[in] num Input parameter `num`. Representable range: 0 to 4294967295.
 * @param[in] rotation Number of bit positions to rotate. Representable range: 0 to 4294967295.
 * @return Result of `rotateRight` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 1).
 * @note Rotation counts should be interpreted modulo the 32-bit word width only where the implementation explicitly performs that reduction.
 * @warning A shift count equal to or greater than the promoted operand width is undefined in standard C unless the implementation guards or masks it.
 * @ingroup ecmath_rotate_helpers
 */
u32 rotateRight(u32 num, u32 rotation)
{
    u32 DROPPED_LSB, INT_SIZE, INT_BITS;
    INT_SIZE = sizeof(num);
    INT_BITS = INT_SIZE * 8 - 1;

    // The effective rotation
    rotation %= INT_BITS;


    // Loop till rotation becomes 0
    while(rotation--)
    {
        // Get LSB of num before it gets dropped
        DROPPED_LSB = num & 1;

        // Right shift num by 1 and 
        // Clear its MSB
        num = (num >> 1) & (~(1 << INT_BITS));

        // Set its dropped LSB as new MSB
        num = num | (DROPPED_LSB << INT_BITS);
    }

    return num;
}

/** @} */ /* end of ecmath_rotate_helpers */
