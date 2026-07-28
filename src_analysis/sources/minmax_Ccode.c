/**
 * @file minmax_Ccode.c
 * @brief Clamping, limiting, normalization, and min/max routines.
 *
 * @details
 * C-only ECMath implementation prepared for formal analysis with Frama-C/EVA. Assembly
 * implementations were removed, while the executable C statements were retained. Function-level
 * documentation was reconstructed from the legacy `ecmath.h` contract and checked against the
 * corresponding implementation.
 *
 * @note Documentation edition: EVA C-only Doxygen v2.
 * @note The documentation pass does not intentionally change executable C statements.
 * @defgroup ecmath_limit Clamping, limiting, normalization, and min/max routines
 * @{
 */

/*
 * minmax_Ccode.c
 *
 *  Created on: Jan 11, 2020
 *      Author: ng104383
 */

#include "minmax_Ccode.h"


/**
 * @brief Limits an input value according to the specified minimum and maximum constraints.
 *
 * @details
 * limit s8 to a limit in dependence on the sign of the limit (minmaxwert). If the limit is
 * positive overflow is limited, if it is negative underflow is limited. s8 = minmaxwert (if value
 * < minmaxwert) AND (minmaxwert < 0) s8 = minmaxwert (if value > minmaxwert) AND (minmaxwert > 0)
 * s8 = value If the above condition are not satisfied.
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] minmaxwert Signed one-sided limiting threshold; its sign selects lower or upper limiting. Representable range: -128 to 127.
 * @return Result of `s8_min_max_s8_s8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @ingroup ecmath_limit
 */
s8 s8_min_max_s8_s8( s8 value, s8 minmaxwert)
{
	if(minmaxwert < 0)
	{
		if(value >= minmaxwert)
		{
			return value;
		}
		else
		{
			return minmaxwert;
		}
	}
	else
	{
		if(value <= minmaxwert)
		{
			return value;
		}
		else
		{
			return minmaxwert;
		}
	}
}


/**
 * @brief Limits an input value according to the specified minimum and maximum constraints.
 *
 * @details
 * limit s8 to minimum or maximum s8 = minimum (if value < minimum) s8 = maximum (if value >
 * maximum) s8 = value (if minimum <= value <= maximum)
 *
 * @param[in] value Input value. Representable range: -128 to 127.
 * @param[in] minimum Lower limiting bound. Representable range: -128 to 127.
 * @param[in] maximum Upper limiting bound. Representable range: -128 to 127.
 * @return Result of `s8_min_max_s8_s8_s8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @warning Callers should provide an ordered interval (`minimum <= maximum`) unless the documented function contract defines another behavior.
 * @ingroup ecmath_limit
 */
s8 s8_min_max_s8_s8_s8(s8 value, s8 minimum, s8 maximum)
{
	if(value <= maximum)
	{
		if(value >= minimum)
		{
			return value;
		}
		else
		{
			return minimum;
		}
	}
	else
	{
		return maximum;
	}
}


/**
 * @brief Limits an input value according to the specified minimum and maximum constraints.
 *
 * @details
 * limit s16 to a limit in dependence on the sign of the limit (minmaxwert). If the limit is
 * positive overflow is limited, if it is negative underflow is limited. s16 = minmaxwert (if value
 * < minmaxwert) AND (minmaxwert < 0) s16 = minmaxwert (if value > minmaxwert) AND (minmaxwert > 0)
 * s16 = value If the above condition are not satisfied.
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] minmaxwert Signed one-sided limiting threshold; its sign selects lower or upper limiting. Representable range: -32768 to 32767.
 * @return Result of `s16_min_max_s16_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_limit
 */
s16 s16_min_max_s16_s16( s16 value, s16 minmaxwert)
{
	if(minmaxwert < 0)
	{
		if(value >= minmaxwert)
		{
			return value;
		}
		else
		{
			return minmaxwert;
		}
	}
	else
	{
		if(value <= minmaxwert)
		{
			return value;
		}
		else
		{
			return minmaxwert;
		}
	}	
}


/**
 * @brief Limits an input value according to the specified minimum and maximum constraints.
 *
 * @details
 * limit s16 to minimum or maximum s16 = minimum (if value < minimum) s16 = maximum (if value >
 * maximum) s16 = value (if minimum <= value <= maximum)
 *
 * @param[in] value Input value. Representable range: -32768 to 32767.
 * @param[in] minimum Lower limiting bound. Representable range: -32768 to 32767.
 * @param[in] maximum Upper limiting bound. Representable range: -32768 to 32767.
 * @return Result of `s16_min_max_s16_s16_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @warning Callers should provide an ordered interval (`minimum <= maximum`) unless the documented function contract defines another behavior.
 * @ingroup ecmath_limit
 */
s16 s16_min_max_s16_s16_s16(s16 value, s16 minimum, s16 maximum)
{
	if(value <= maximum)
	{
		if(value >= minimum)
		{
			return value;
		}
		else
		{
			return minimum;
		}

	}
	else
	{
		return maximum;
	}
}


/**
 * @brief Limits an input value according to the specified minimum and maximum constraints.
 *
 * @details
 * limit u8 to minimum or maximum u8 = minimum (if value < minimum) u8 = maximum (if value >
 * maximum) u8 = value (if minimum <= value <= maximum)
 *
 * @param[in] value Input value. Representable range: 0 to 255.
 * @param[in] minimum Lower limiting bound. Representable range: 0 to 255.
 * @param[in] maximum Upper limiting bound. Representable range: 0 to 255.
 * @return Result of `u8_min_max_u8_u8_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @warning Callers should provide an ordered interval (`minimum <= maximum`) unless the documented function contract defines another behavior.
 * @ingroup ecmath_limit
 */
u8 u8_min_max_u8_u8_u8( u8 value, u8 minimum,u8 maximum)
{
	if(value <= maximum)
	{
		if(value >= minimum)
		{
			return value;
		}
		else
		{
			return (minimum & 0xFF);	
		}
	}
	else
	{
		return (maximum & 0xFF);
	}
}


/**
 * @brief Limits an input value according to the specified minimum and maximum constraints.
 *
 * @details
 * limit u16 to minimum or maximum u16 = minimum (if value < minimum) u16 = maximum (if value >
 * maximum) u16 = value (if minimum <= value <= maximum)
 *
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @param[in] minimum Lower limiting bound. Representable range: 0 to 65535.
 * @param[in] maximum Upper limiting bound. Representable range: 0 to 65535.
 * @return Result of `u16_min_max_u16_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @warning Callers should provide an ordered interval (`minimum <= maximum`) unless the documented function contract defines another behavior.
 * @ingroup ecmath_limit
 */
u16 u16_min_max_u16_u16_u16( u16 value, u16 minimum,u16 maximum)
{
	if(value <= maximum)
	{
		if(value >= minimum)
		{
			return value;
		}
		else
		{
			return (minimum & 0xFFFF);
		}
	}
	else
	{
		return (maximum & 0xFFFF);
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * gradient limitation and limitation to zero with a s16 s16 = value u16 = gradient
 *
 * @param[in] grdlmt Current gradient-limited value. Representable range: -32768 to 32767.
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @return Result of `s16_grdlmt20_s16_u16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_limit
 */
s16 s16_grdlmt20_s16_u16(s16 grdlmt, u16 value)
{
	s16 Neggrdlmt = 0;
	if(value < grdlmt)
	{
		if(grdlmt <= 0)
		{
			return (s16)(grdlmt + value);
		}
		else
		{
			return (s16)(grdlmt - value);
		}
	}
	else
	{
		Neggrdlmt = -grdlmt;
		if(Neggrdlmt > value)
		{
			if(grdlmt <= 0)
			{
				return (s16)(grdlmt + value);
			}
			else
			{
				return (s16)(grdlmt - value);
			}
		}
		else
		{
			return 0;
		}
	}
}


/**
 * @brief Normalizes an input value to an unsigned fixed-point full-scale range.
 *
 * @details
 * Normalizing function of a value between a bottom and a top-limit to a percentage [0..100%]
 * [0..FFFF] (fak1-resolution) (value-bottom_lim) fak1-result = --------------------*(total range)
 * (top_lim-bottom_lim) limitation of result to FFFFH if value >= top_lim 0H if value <= bottom_lim
 * FFFFH if top_lim <= bottom_lim
 *
 * @param[in] bottom_lim Lower normalization bound. Representable range: 0 to 65535.
 * @param[in] top_lim Upper normalization bound. Representable range: 0 to 65535.
 * @param[in] value Input value. Representable range: 0 to 65535.
 * @return Result of `u16_norm_u16_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @note The implementation uses integer bit scaling (left shift(s): 16).
 * @note The result is limited or saturated according to the legacy implementation rather than intentionally wrapped.
 * @ingroup ecmath_limit
 */
u16 u16_norm_u16_u16_u16(u16 bottom_lim, u16 top_lim, u16 value )
{
	if(bottom_lim >= top_lim)
	{
		return 0xFFFFU;
	}
	else
	{
		if(value < top_lim)
		{
			if(value > bottom_lim)
			{
				value = ((value - bottom_lim) << 16) / (top_lim - bottom_lim);
				return value;
			}
			else
			{
				return 0;
			}
		}
		else
		{
			return 0xFFFFU;
		}
	}
}


/**
 * @brief Converts an integer value to the destination type with the implemented limitation behavior.
 *
 * @details
 * limits a s16 to an upper or lower value based on the value of an u16. A bit set in case of
 * limitation If (val >= hys) then val = hys; If (val <= -hys) then val = -hys; return val. In case
 * of limitation: lv_lim_act = 1 normal case (unlimited): lv_lim_act = 0
 *
 * @param[in] input_val Input value to limit. Representable range: -32768 to 32767.
 * @param[in] hysteresis Symmetric limiting magnitude. Representable range: 0 to 65535.
 * @return Result of `s16_lim_hys_s16_u16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_limit
 */
s16 s16_lim_hys_s16_u16(s16 input_val, u16 hysteresis)
{
	s16 Neg_hysteresis = 0;
	if(input_val < (s16)hysteresis)
	{
		Neg_hysteresis = -hysteresis;
		if(Neg_hysteresis < input_val)
		{
			return (s16)input_val;
		}
		else
		{
			return -hysteresis;
		}
	}
	else
	{
		return (s16)hysteresis;
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = old+maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: 0 to 65535.
 * @param[in] oldval Previous value. Representable range: 0 to 65535.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 65535.
 * @return Result of `u16_limitnew_up_u16_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_limit
 */
u16 u16_limitnew_up_u16_u16_u16(u16 newval,u16 oldval,u16 maxdif)
{
	if(newval <= oldval)
	{
		return (newval & 0xFFFF);
	}
	else
	{
		if((newval - oldval) <= maxdif)
		{
			return (newval & 0xFFFF);
		}
		else
		{
			return (u16)(oldval + maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (oldval > newval) if (oldval-newval) > maxdif value = old-maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: 0 to 65535.
 * @param[in] oldval Previous value. Representable range: 0 to 65535.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 65535.
 * @return Result of `u16_limitnew_down_u16_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_limit
 */
u16 u16_limitnew_down_u16_u16_u16(u16 newval,u16 oldval,u16 maxdif)
{
	if(oldval <= newval)
	{
		return (newval & 0xFFFF);
	}
	else
	{
		if((oldval - newval) <= maxdif)
		{
			return (newval & 0xFFFF);
		}
		else
		{
			return (u16)(oldval - maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if ( newval > oldval ) if ( newval - oldval ) > maxdif result = oldval + maxdif result = newval
 * if ( oldval - newval ) > maxdif result = oldval - maxdif result = newval
 *
 * @param[in] newval Requested new value. Representable range: 0 to 65535.
 * @param[in] oldval Previous value. Representable range: 0 to 65535.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 65535.
 * @return Result of `u16_limitnew_u16_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_limit
 */
u16 u16_limitnew_u16_u16_u16(u16 newval,u16 oldval,u16 maxdif)
{
	if(newval <= oldval)
	{
		if((oldval - newval) <= maxdif)
		{
			return (newval & 0xFFFF);
		}
		else
		{
			return (u16)(oldval - maxdif);
		}
	}
	else
	{
		if((newval - oldval)<=maxdif)
		{
			return (newval & 0xFFFF);
		}
		else
		{
			return (u16)(oldval + maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = old+maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: -32768 to 32767.
 * @param[in] oldval Previous value. Representable range: -32768 to 32767.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 65535.
 * @return Result of `s16_limitnew_up_s16_s16_u16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_limit
 */
s16 s16_limitnew_up_s16_s16_u16(s16 newval,s16 oldval,u16 maxdif)
{
	if(newval <= oldval)
	{
		return (newval & 0xFFFF);
	}
	else
	{
		if((newval - oldval) <= maxdif)
		{
			return (newval & 0xFFFF); 
		}
		else
		{
			return (s16)(oldval+maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (oldval > newval) if (oldval-newval) > maxdif value = old-maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: -32768 to 32767.
 * @param[in] oldval Previous value. Representable range: -32768 to 32767.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 65535.
 * @return Result of `s16_limitnew_down_s16_s16_u16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_limit
 */
s16 s16_limitnew_down_s16_s16_u16(s16 newval,s16 oldval,u16 maxdif)
{
	if(newval >= oldval)
	{
		return (s16)newval;
	}
	else
	{
		if((oldval - newval) <= maxdif)
		{
			return (s16)newval;
		}
		else
		{
			return (s16)(oldval - maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = oldval+maxdif value = newval if
 * (oldval-newval) > maxdif value = oldval-maxdif value = newval
 *
 * @param[in] newval Requested new value. Representable range: -32768 to 32767.
 * @param[in] oldval Previous value. Representable range: -32768 to 32767.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 65535.
 * @return Result of `s16_limitnew_s16_s16_u16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_limit
 */
s16 s16_limitnew_s16_s16_u16(s16 newval,s16 oldval,u16 maxdif)
{
	if(newval <= oldval)
	{
		if((oldval - newval) <= maxdif)
		{
			return (s16)newval;
		}
		else
		{
			return (s16)(oldval - maxdif);
		}
	}
	else
	{
		if((newval - oldval) <= maxdif)
		{
			return (s16)newval;
		}
		else
		{
			return (s16)(oldval + maxdif);
		}
	}
}


/**
 * @brief Returns the smaller of two values.
 *
 * @details
 * compare value1 with value2 and return minimum value u16 = value1 (if value1 < value2) u16 =
 * value2 (if value2 < value1)
 *
 * @param[in] value1 First value. Representable range: 0 to 65535.
 * @param[in] value2 Second value. Representable range: 0 to 65535.
 * @return Result of `u16_min_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_limit
 */
u16 u16_min_u16_u16(u16 value1 ,u16 value2)
{
	if(value1 >= value2)
	{
		return value2;
	}
	else
	{
		return value1;
	}
}


/**
 * @brief Returns the smaller of two values.
 *
 * @details
 * compare value1 with value2 and return minimum value s16 = value1 (if value1 < value2) s16 =
 * value2 (if value2 < value1)
 *
 * @param[in] value1 First value. Representable range: -32768 to 32767.
 * @param[in] value2 Second value. Representable range: -32768 to 32767.
 * @return Result of `s16_min_s16_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_limit
 */
s16 s16_min_s16_s16(s16 value1,s16 value2)
{
	if(value1 >= value2)
	{
		return value2;
	}
	else
	{
		return value1;
	}
}


/**
 * @brief Returns the larger of two values.
 *
 * @details
 * compare value1 with value2 and return maximum value u16 = value1 (if value1 > value2) u16 =
 * value2 (if value2 > value1)
 *
 * @param[in] value1 First value. Representable range: 0 to 65535.
 * @param[in] value2 Second value. Representable range: 0 to 65535.
 * @return Result of `u16_max_u16_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 65535.
 * @ingroup ecmath_limit
 */
u16 u16_max_u16_u16(u16 value1,u16 value2)
{
	if(value1 <= value2)
	{
		return value2;
	}
	else
	{
		return value1;
	}
}


/**
 * @brief Returns the larger of two values.
 *
 * @details
 * compare value1 with value2 and return maximum value s16 = value1 (if value1 > value2) s16 =
 * value2 (if value2 > value1)
 *
 * @param[in] value1 First value. Representable range: -32768 to 32767.
 * @param[in] value2 Second value. Representable range: -32768 to 32767.
 * @return Result of `s16_max_s16_s16` after the documented scaling and limiting behavior. The return type can represent -32768 to 32767.
 * @ingroup ecmath_limit
 */
s16 s16_max_s16_s16(s16 value1,s16 value2)
{
	if(value1 <= value2)
	{
		return (s16)value2;
	}
	else
	{
		return (s16)value1;
	}
}


/**
 * @brief Limits an input value according to the specified minimum and maximum constraints.
 *
 * @details
 * limit u32 to minimum or maximum u32 = minimum (if value < minimum) u32 = maximum (if value >
 * maximum) u32 = value (if minimum <= value <= maximum)
 *
 * @param[in] value Input value. Representable range: 0 to 4294967295.
 * @param[in] minimum Lower limiting bound. Representable range: 0 to 4294967295.
 * @param[in] maximum Upper limiting bound. Representable range: 0 to 4294967295.
 * @return Result of `u32_min_max_u32_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @warning Callers should provide an ordered interval (`minimum <= maximum`) unless the documented function contract defines another behavior.
 * @ingroup ecmath_limit
 */
u32 u32_min_max_u32_u32_u32(u32 value, u32 minimum,u32 maximum)
{
	if(value < maximum)
	{
		if(value > minimum)
		{
			return value;
		}
		else
		{
			return minimum;
		}
	}
	else
	{
		return maximum;
	}
}


/**
 * @brief Limits an input value according to the specified minimum and maximum constraints.
 *
 * @details
 * limit s32 to a limit in dependence on the sign of the limit (minmaxwert). If the limit is
 * positive overflow is limited, if it is negative underflow is limited. s32 = minmaxwert (if value
 * < minmaxwert) AND (minmaxwert < 0) s32 = minmaxwert (if value > minmaxwert) AND (minmaxwert > 0)
 * s32 = value If the above condition are not satisfied.
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] minmaxwert Signed one-sided limiting threshold; its sign selects lower or upper limiting. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_min_max_s32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @ingroup ecmath_limit
 */
s32 s32_min_max_s32_s32(s32 value, s32 minmaxwert)
{
	if(minmaxwert < 0)
	{
		if(value >= minmaxwert)
		{
			return value;
		}
		else
		{
			return minmaxwert;
		}
	}
	else
	{
		if(value <= minmaxwert)
		{
			return value;
		}
		else
		{
			return minmaxwert;
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = oldval+maxdif value = newval if
 * (oldval-newval) > maxdif value = oldval-maxdif value = newval
 *
 * @param[in] newval Requested new value. Representable range: 0 to 4294967295.
 * @param[in] oldval Previous value. Representable range: 0 to 4294967295.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 4294967295.
 * @return Result of `u32_limitnew_u32_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_limit
 */
u32 u32_limitnew_u32_u32_u32(u32 newval,u32 oldval,u32 maxdif)
{
	if(newval <= oldval)
	{
		if((oldval - newval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (oldval - maxdif);
		}
	}
	else
	{
		if((newval - oldval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (oldval + maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = old+maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: 0 to 4294967295.
 * @param[in] oldval Previous value. Representable range: 0 to 4294967295.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 4294967295.
 * @return Result of `u32_limitnew_up_u32_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_limit
 */
u32 u32_limitnew_up_u32_u32_u32(u32 newval,u32 oldval,u32 maxdif)
{
	if(newval <= oldval)
	{
		return newval;
	}
	else
	{
		if((newval - oldval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (oldval + maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (oldval > newval) if (oldval-newval) > maxdif value = old-maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: 0 to 4294967295.
 * @param[in] oldval Previous value. Representable range: 0 to 4294967295.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 4294967295.
 * @return Result of `u32_limitnew_down_u32_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_limit
 */
u32 u32_limitnew_down_u32_u32_u32(u32 newval,u32 oldval,u32 maxdif)
{
	if(oldval <= newval)
	{
		return newval;
	}
	else
	{
		if((oldval-newval) <= maxdif)
		{
			return newval;

		}
		else
		{
			return (oldval - maxdif);
		}
	}		
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = oldval+maxdif value = newval if
 * (oldval-newval) > maxdif value = oldval-maxdif value = newval
 *
 * @param[in] newval Requested new value. Representable range: 0 to 4294967295.
 * @param[in] oldval Previous value. Representable range: 0 to 4294967295.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 65535.
 * @return Result of `u32_limitnew_u32_u32_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_limit
 */
u32 u32_limitnew_u32_u32_u16(u32 newval,u32 oldval,u16 maxdif)
{
	if(newval <= oldval)
	{
		if((oldval-newval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (oldval - maxdif);
		}
	}
	else
	{
		if((newval-oldval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (u32)(oldval + maxdif);
		}

	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = old+maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: 0 to 4294967295.
 * @param[in] oldval Previous value. Representable range: 0 to 4294967295.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 65535.
 * @return Result of `u32_limitnew_up_u32_u32_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_limit
 */
u32 u32_limitnew_up_u32_u32_u16(u32 newval,u32 oldval,u16 maxdif)
{
	if(newval <= oldval)
	{
		return newval;
	}
	else
	{
		if((newval - oldval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (u32)(oldval + maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (oldval > newval) if (oldval-newval) > maxdif value = old-maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: 0 to 4294967295.
 * @param[in] oldval Previous value. Representable range: 0 to 4294967295.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 65535.
 * @return Result of `u32_limitnew_down_u32_u32_u16` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_limit
 */
u32 u32_limitnew_down_u32_u32_u16(u32 newval,u32 oldval,u16 maxdif)
{
	if(oldval <= newval)
	{
		return newval;
	}
	else
	{
		if((oldval - newval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (oldval - maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = oldval+maxdif value = newval if
 * (oldval-newval) > maxdif value = oldval-maxdif value = newval
 *
 * @param[in] newval Requested new value. Representable range: -2147483648 to 2147483647.
 * @param[in] oldval Previous value. Representable range: -2147483648 to 2147483647.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 4294967295.
 * @return Result of `s32_limitnew_s32_s32_u32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @ingroup ecmath_limit
 */
s32 s32_limitnew_s32_s32_u32(s32 newval,s32 oldval,u32 maxdif)
{
	if(newval <= oldval)
	{
		if((oldval - newval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (oldval - maxdif);
		}
	}
	else
	{
		if((newval - oldval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (s32)(oldval + maxdif);
		}

	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = old+maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: -2147483648 to 2147483647.
 * @param[in] oldval Previous value. Representable range: -2147483648 to 2147483647.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 4294967295.
 * @return Result of `s32_limitnew_up_s32_s32_u32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @ingroup ecmath_limit
 */
s32 s32_limitnew_up_s32_s32_u32(s32 newval,s32 oldval,u32 maxdif)
{
	if(newval <= oldval)
	{
		return newval;
	}
	else
	{
		if((newval - oldval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (oldval + maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (oldval > newval) if (oldval-newval) > maxdif value = old-maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: -2147483648 to 2147483647.
 * @param[in] oldval Previous value. Representable range: -2147483648 to 2147483647.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 4294967295.
 * @return Result of `s32_limitnew_down_s32_s32_u32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @ingroup ecmath_limit
 */
s32 s32_limitnew_down_s32_s32_u32(s32 newval,s32 oldval,u32 maxdif)
{
	if(newval <= oldval)
	{
		return newval;
	}
	else
	{
		if((oldval - newval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (s32)(maxdif - oldval);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = oldval+maxdif value = newval if
 * (oldval-newval) > maxdif value = oldval-maxdif value = newval
 *
 * @param[in] newval Requested new value. Representable range: -2147483648 to 2147483647.
 * @param[in] oldval Previous value. Representable range: -2147483648 to 2147483647.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 65535.
 * @return Result of `s32_limitnew_s32_s32_u16` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @ingroup ecmath_limit
 */
s32 s32_limitnew_s32_s32_u16(s32 newval,s32 oldval,u16 maxdif)
{
	if(newval <= oldval)
	{
		maxdif = maxdif & 0xFFFF;
		if((oldval-newval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (s32)(oldval - maxdif);
		}
	}
	else
	{
		maxdif = maxdif & 0xFFFF;
		if((u32)(newval-oldval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (s32)(oldval + maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = old+maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: -2147483648 to 2147483647.
 * @param[in] oldval Previous value. Representable range: -2147483648 to 2147483647.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 65535.
 * @return Result of `s32_limitnew_up_s32_s32_u16` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @ingroup ecmath_limit
 */
s32 s32_limitnew_up_s32_s32_u16(s32 newval,s32 oldval,u16 maxdif)
{
	if(newval <= oldval)
	{
		return newval;
	}
	else
	{
		maxdif = maxdif & 0xFFFF;
		if((u32)(newval - oldval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (s32)(oldval + maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (oldval > newval) if (oldval-newval) > maxdif value = old-maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: -2147483648 to 2147483647.
 * @param[in] oldval Previous value. Representable range: -2147483648 to 2147483647.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 65535.
 * @return Result of `s32_limitnew_down_s32_s32_u16` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @ingroup ecmath_limit
 */
s32 s32_limitnew_down_s32_s32_u16(s32 newval,s32 oldval,u16 maxdif)
{
	if(oldval <= newval)
	{
		return newval;
	}
	else
	{
		maxdif = maxdif & 0xFFFF;
		if ((u32)(oldval - newval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (s32)(oldval - maxdif);
		}
	}
}


/**
 * @brief Limits an input value according to the specified minimum and maximum constraints.
 *
 * @details
 * limit s16 to minimum or maximum s16 = minimum (if value < minimum) s16 = maximum (if value >
 * maximum) s16 = value (if minimum <= value <= maximum)
 *
 * @param[in] value Input value. Representable range: -2147483648 to 2147483647.
 * @param[in] minimum Lower limiting bound. Representable range: -2147483648 to 2147483647.
 * @param[in] maximum Upper limiting bound. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_min_max_s32_s32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @warning Callers should provide an ordered interval (`minimum <= maximum`) unless the documented function contract defines another behavior.
 * @ingroup ecmath_limit
 */
s32 s32_min_max_s32_s32_s32(s32 value, s32 minimum, s32 maximum)
{
	if(value <= maximum)
	{
		if(value >= minimum)
		{
			return value;
		}
		else
		{
			return minimum;
		}
	}
	else
	{
		return maximum;
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = old+maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: -128 to 127.
 * @param[in] oldval Previous value. Representable range: -128 to 127.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 255.
 * @return Result of `s8_limitnew_up_s8_s8_u8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @ingroup ecmath_limit
 */
s8 s8_limitnew_up_s8_s8_u8(s8 newval,s8 oldval,u8 maxdif)
{
	if(newval <= oldval)
	{
		return newval;
	}
	else
	{
		if((newval - oldval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (s8)(oldval + maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (oldval > newval) if (oldval-newval) > maxdif value = old-maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: -128 to 127.
 * @param[in] oldval Previous value. Representable range: -128 to 127.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 255.
 * @return Result of `s8_limitnew_down_s8_s8_u8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @ingroup ecmath_limit
 */
s8 s8_limitnew_down_s8_s8_u8(s8 newval,s8 oldval,u8 maxdif)
{
	if(newval >= oldval)
	{
		return newval;
	}
	else
	{
		if((u16)(oldval - newval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (s8)(maxdif - oldval);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = oldval+maxdif value = newval if
 * (oldval-newval) > maxdif value = oldval-maxdif value = newval
 *
 * @param[in] newval Requested new value. Representable range: -128 to 127.
 * @param[in] oldval Previous value. Representable range: -128 to 127.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 255.
 * @return Result of `s8_limitnew_s8_s8_u8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @ingroup ecmath_limit
 */
s8 s8_limitnew_s8_s8_u8(s8 newval,s8 oldval,u8 maxdif)
{
	if(newval <= oldval)
	{
		if((u16)(oldval-newval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (s8)(oldval - maxdif);
		}
	}
	else
	{
		if((u16)(newval-oldval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (s8)(oldval + maxdif);
		}
	}

}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = old+maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: 0 to 255.
 * @param[in] oldval Previous value. Representable range: 0 to 255.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 255.
 * @return Result of `u8_limitnew_up_u8_u8_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_limit
 */
u8 u8_limitnew_up_u8_u8_u8(u8 newval,u8 oldval,u8 maxdif)
{
	if(newval <= oldval)
	{
		return newval;

	}
	else
	{
		if((newval - oldval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (u8)(oldval + maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (oldval > newval) if (oldval-newval) > maxdif value = old-maxdif value = newval value =
 * newval
 *
 * @param[in] newval Requested new value. Representable range: 0 to 255.
 * @param[in] oldval Previous value. Representable range: 0 to 255.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 255.
 * @return Result of `u8_limitnew_down_u8_u8_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_limit
 */
u8 u8_limitnew_down_u8_u8_u8(u8 newval,u8 oldval,u8 maxdif)
{
	if(oldval <= newval)
	{
		return newval;
	}
	else
	{
		if((oldval - newval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (u8)(oldval - maxdif);
		}
	}
}


/**
 * @brief Limits the permitted change between a new value and a previous value.
 *
 * @details
 * if (newval > oldval) if (newval-oldval) > maxdif value = oldval+maxdif value = newval if
 * (oldval-newval) > maxdif value = oldval-maxdif value = newval
 *
 * @param[in] newval Requested new value. Representable range: 0 to 255.
 * @param[in] oldval Previous value. Representable range: 0 to 255.
 * @param[in] maxdif Maximum permitted magnitude of change. Representable range: 0 to 255.
 * @return Result of `u8_limitnew_u8_u8_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_limit
 */
u8 u8_limitnew_u8_u8_u8(u8 newval,u8 oldval,u8 maxdif)
{
	if(newval <= oldval)
	{
		if((oldval - newval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (u8)(oldval - maxdif);
		}
	}
	else
	{
		if((newval - oldval) <= maxdif)
		{
			return newval;
		}
		else
		{
			return (u8)(oldval + maxdif);
		}
	}
}


/**
 * @brief Returns the smaller of two values.
 *
 * @details
 * compare value1 with value2 and return minimum value u8 = value1 (if value1 < value2) u8 = value2
 * (if value2 < value1)
 *
 * @param[in] value1 First value. Representable range: 0 to 255.
 * @param[in] value2 Second value. Representable range: 0 to 255.
 * @return Result of `u8_min_u8_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_limit
 */
u8 u8_min_u8_u8(u8 value1 ,u8 value2)
{
	if(value1 >= value2)
	{
		return value2;
	}
	else
	{
		return value1;
	}
}


/**
 * @brief Returns the smaller of two values.
 *
 * @details
 * compare value1 with value2 and return minimum value u32 = value1 (if value1 < value2) u32 =
 * value2 (if value2 < value1)
 *
 * @param[in] value1 First value. Representable range: 0 to 4294967295.
 * @param[in] value2 Second value. Representable range: 0 to 4294967295.
 * @return Result of `u32_min_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_limit
 */
u32 u32_min_u32_u32(u32 value1 ,u32 value2)
{
	if(value1 >= value2)
	{
		return value2;
	}
	else
	{
		return value1;
	}
}


/**
 * @brief Returns the larger of two values.
 *
 * @details
 * compare value1 with value2 and return maximum value u8 = value1 (if value1 > value2) u8 = value2
 * (if value2 > value1)
 *
 * @param[in] value1 First value. Representable range: 0 to 255.
 * @param[in] value2 Second value. Representable range: 0 to 255.
 * @return Result of `u8_max_u8_u8` after the documented scaling and limiting behavior. The return type can represent 0 to 255.
 * @ingroup ecmath_limit
 */
u8 u8_max_u8_u8(u8 value1,u8 value2)
{
	if(value1 <= value2)
	{
		return value2;
	}
	else
	{
		return value1;
	}
}


/**
 * @brief Returns the larger of two values.
 *
 * @details
 * compare value1 with value2 and return maximum value u32 = value1 (if value1 > value2) u32 =
 * value2 (if value2 > value1)
 *
 * @param[in] value1 First value. Representable range: 0 to 4294967295.
 * @param[in] value2 Second value. Representable range: 0 to 4294967295.
 * @return Result of `u32_max_u32_u32` after the documented scaling and limiting behavior. The return type can represent 0 to 4294967295.
 * @ingroup ecmath_limit
 */
u32 u32_max_u32_u32(u32 value1,u32 value2)
{
	if(value1 <= value2)
	{
		return value2;
	}
	else
	{
		return value1;
	}
}


/**
 * @brief Returns the smaller of two values.
 *
 * @details
 * compare value1 with value2 and return minimum value s8 = value1 (if value1 < value2) s8 = value2
 * (if value2 < value1)
 *
 * @param[in] value1 First value. Representable range: -128 to 127.
 * @param[in] value2 Second value. Representable range: -128 to 127.
 * @return Result of `s8_min_s8_s8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @ingroup ecmath_limit
 */
s8 s8_min_s8_s8(s8 value1,s8 value2)
{
	if(value1 >= value2)
	{
		return value2;
	}
	else
	{
		return value1;
	}
}


/**
 * @brief Returns the smaller of two values.
 *
 * @details
 * compare value1 with value2 and return minimum value s32 = value1 (if value1 < value2) s32 =
 * value2 (if value2 < value1)
 *
 * @param[in] value1 First value. Representable range: -2147483648 to 2147483647.
 * @param[in] value2 Second value. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_min_s32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @ingroup ecmath_limit
 */
s32 s32_min_s32_s32(s32 value1,s32 value2)
{
	if(value1 >= value2)
	{
		return value2;
	}
	else
	{
		return value1;
	}
}


/**
 * @brief Returns the larger of two values.
 *
 * @details
 * compare value1 with value2 and return maximum value s8 = value1 (if value1 > value2) s8 = value2
 * (if value2 > value1)
 *
 * @param[in] value1 First value. Representable range: -128 to 127.
 * @param[in] value2 Second value. Representable range: -128 to 127.
 * @return Result of `s8_max_s8_s8` after the documented scaling and limiting behavior. The return type can represent -128 to 127.
 * @ingroup ecmath_limit
 */
s8 s8_max_s8_s8(s8 value1,s8 value2)
{
	if(value1 <= value2)
	{
		return value2;
	}
	else
	{
		return value1;
	}
}


/**
 * @brief Returns the larger of two values.
 *
 * @details
 * compare value1 with value2 and return maximum value s32 = value1 (if value1 > value2) s32 =
 * value2 (if value2 > value1)
 *
 * @param[in] value1 First value. Representable range: -2147483648 to 2147483647.
 * @param[in] value2 Second value. Representable range: -2147483648 to 2147483647.
 * @return Result of `s32_max_s32_s32` after the documented scaling and limiting behavior. The return type can represent -2147483648 to 2147483647.
 * @ingroup ecmath_limit
 */
s32 s32_max_s32_s32(s32 value1,s32 value2)
{
	if(value1 <= value2)
	{
		return value2;
	}
	else
	{
		return value1;
	}
}

/** @} */ /* end of ecmath_limit */
