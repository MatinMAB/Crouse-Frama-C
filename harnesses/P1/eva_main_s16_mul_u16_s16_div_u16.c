#include "__fc_builtin.h"
#include "div_Ccode.h"

int eva_main(void)
{
    u16 factor1;
    s16 factor2;
    u16 denominator;
    s16 result;

    factor1 =
        Frama_C_unsigned_short_interval(
            0,
            65535);

    factor2 =
        Frama_C_short_interval(
            -32768,
            32767);

    denominator =
        Frama_C_unsigned_short_interval(
            0,
            65535);

    result =
        s16_mul_u16_s16_div_u16(
            factor1,
            factor2,
            denominator);

    (void) result;
    return 0;
}
