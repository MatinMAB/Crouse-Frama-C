/*
 * KLEE-ALARM-0110
 * Eva target: src_analysis/sources/MulHword.c:47 in s32_mul_s32_s32_fac2
 * Category: integer overflow
 * Expression: (int)arg1_LW * (int)arg2_LW
 * Safety predicate (checked before the selected operation): MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX
 *
 * This file embeds the occurrence-specific fixed-width source adapter that was
 * validated for the frozen High Precision alarm mapping. It deliberately contains
 * exactly one target error site. Original project sources remain unchanged.
 */
#include "../scripts/klee_compat.h"
#line 1 "src_analysis/sources/MulHword.c"
/**
 * @file MulHword.c
 * @brief 32-bit multiplication helper routines.
 *
 * @details
 * C-only ECMath implementation prepared for formal analysis with Frama-C/EVA. Assembly
 * implementations were removed, while the executable C statements were retained. Function-level
 * documentation was reconstructed from the legacy `ecmath.h` contract and checked against the
 * corresponding implementation.
 *
 * @note Documentation edition: EVA C-only Doxygen v2.
 * @note The documentation pass does not intentionally change executable C statements.
 * @defgroup ecmath_mul_helpers 32-bit multiplication helper routines
 * @{
 */

/*
 * MulHword.c
 *
 *  Created on: Dec 8, 2019
 *      Author: ng104383
 */
#include "MulHword.h"


/**
 * @brief Returns the upper 32 bits of an unsigned 32-by-32-bit product.
 *
 * @details
 * Returns the upper 32 bits of an unsigned 32-by-32-bit product.
 *
 * @param[in] arg1 First unsigned multiplication operand. Representable range: 0 to 4294967295.
 * @param[in] arg2 Second unsigned multiplication operand. Representable range: 0 to 4294967295.
 * @return Result of `MulHighWord` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 1, 16, 32; left shift(s): 15).
 * @note The operation decomposes each 32-bit operand into 16-bit halves to emulate a 64-bit product without requiring a native 64-bit multiply result.
 * @ingroup ecmath_mul_helpers
 */
u32 MulHighWord(register u32 arg1,register u32 arg2)
{
	u16 arg1_LW,arg1_HW,arg2_LW,arg2_HW;
	u32 MulTemp1, MulTemp2, MulTemp3, MulTemp4 , HIGHWORD, OverFlow;
	arg1_LW = arg1 & 0xFFFF;
	arg1_HW = (arg1 & 0xFFFF0000)>>16;
	arg2_LW = arg2 & 0xFFFF;
	arg2_HW = (arg2 & 0xFFFF0000)>>16;
	/* KLEE-ALARM-0110: signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647; */
	if (!(klee_alarm_s32_mul_upper((int64_t)((int)arg1_LW), (int64_t)((int)arg2_LW)))) {
	    klee_report_error(
	        __FILE__,
	        __LINE__,
	        "KLEE-ALARM-0110: signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;",
	        "klee-alarm-0110.err");
	}
	/* Safe branch evaluates only the exact selected source expression. */
	klee_alarm_sink_s64 = (int64_t)((int)arg1_LW * (int)arg2_LW);
	return 0;
	MulTemp2 = arg1_LW * arg2_HW;
	MulTemp3 = arg1_HW * arg2_LW;
	MulTemp4 = arg1_HW * arg2_HW;

	HIGHWORD = (MulTemp2 >> 16) + (MulTemp3 >> 16) + MulTemp4;//HIGHWORD = (MulTemp2 >> 16) + (MulTemp3 >> 16) + (MulTemp4 >> 32);
	OverFlow = (MulTemp1>>16) + (MulTemp2 & 0xFFFF) + (MulTemp3 & 0xFFFF);//OverFlow = (MulTemp1>>1) + ((MulTemp2 & 0xFFFF)<<15) + ((MulTemp3 & 0xFFFF)<<15);
	if (OverFlow > 0xFFFF)
	{
		return HIGHWORD + (OverFlow>>16);
	}
	else
	{
		return HIGHWORD;
	}
}


/**
 * @brief Returns the lower 32 bits of an unsigned 32-by-32-bit product.
 *
 * @details
 * Returns the lower 32 bits of an unsigned 32-by-32-bit product.
 *
 * @param[in] arg1 First unsigned multiplication operand. Representable range: 0 to 4294967295.
 * @param[in] arg2 Second unsigned multiplication operand. Representable range: 0 to 4294967295.
 * @return Result of `MulLowWord` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @note The implementation uses integer bit scaling (right shift(s): 16; left shift(s): 16).
 * @note The operation decomposes each 32-bit operand into 16-bit halves to emulate a 64-bit product without requiring a native 64-bit multiply result.
 * @ingroup ecmath_mul_helpers
 */
u32 MulLowWord(register u32 arg1,register u32 arg2)
{
	u16 arg1_LW,arg1_HW,arg2_LW,arg2_HW;
	u32 MulTemp1, MulTemp2, MulTemp3, MulTemp4 , HIGHWORD, OverFlow;
	arg1_LW = arg1 & 0xFFFF;
	arg1_HW = (arg1 & 0xFFFF0000)>>16;
	arg2_LW = arg2 & 0xFFFF;
	arg2_HW = (arg2 & 0xFFFF0000)>>16;
	MulTemp1 = arg1_LW * arg2_LW;
	MulTemp2 = arg1_LW * arg2_HW;
	MulTemp3 = arg1_HW * arg2_LW;
	MulTemp4 = arg1_HW * arg2_HW;
	OverFlow = (MulTemp1) + ((MulTemp2 & 0xFFFF)<<16) + ((MulTemp3 & 0xFFFF)<<16);

	return OverFlow;

}

/** @} */ /* end of ecmath_mul_helpers */

int main(void)
{
    int32_t value;
    int32_t factor;
    int32_t result;

    klee_make_symbolic(&value, sizeof(value), "value");
    klee_make_symbolic(&factor, sizeof(factor), "factor");

    result = s32_mul_s32_s32_fac2(value, factor);

    (void)result;
    return 0;
}
