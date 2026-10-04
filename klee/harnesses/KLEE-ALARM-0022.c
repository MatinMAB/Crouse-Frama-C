/*
 * KLEE-ALARM-0022
 * Eva target: src_analysis/sources/rotatefunc.c:119 in rotateRight
 * Category: integer overflow
 * Expression: 1 << INT_BITS
 * Safety predicate (checked before the selected operation): MATHEMATICAL_LEFT_SHIFT(1,INT_BITS) <= INT32_MAX
 *
 * This file embeds the occurrence-specific fixed-width source adapter that was
 * validated for the frozen High Precision alarm mapping. It deliberately contains
 * exactly one target error site. Original project sources remain unchanged.
 */
#include "../scripts/klee_compat.h"
#line 1 "src_analysis/sources/rotatefunc.c"
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
/* fixed-width aliases come from Platform_Types.h */

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
        /* KLEE-ALARM-0022: signed overflow. assert 1 << INT_BITS <= 2147483647; */
        if (!(klee_alarm_s32_lshift_upper((int64_t)(1), (uint32_t)(INT_BITS)))) {
            klee_report_error(
                __FILE__,
                __LINE__,
                "KLEE-ALARM-0022: signed overflow. assert 1 << INT_BITS <= 2147483647;",
                "klee-alarm-0022.err");
        }
        /* Safe branch evaluates only the exact selected source expression. */
        klee_alarm_sink_s64 = (int64_t)(1 << INT_BITS);
        return 0;

        // Set its dropped LSB as new MSB
        num = num | (DROPPED_LSB << INT_BITS);
    }
    return num;
}

/** @} */ /* end of ecmath_rotate_helpers */

int main(void)
{
    uint32_t num;
    uint32_t rotation;
    uint32_t result;

    klee_make_symbolic(&num, sizeof(num), "num");
    klee_make_symbolic(&rotation, sizeof(rotation), "rotation");

    result = rotateRight(num, rotation);

    (void)result;
    return 0;
}
