#include "__fc_builtin.h"
#include "div_Ccode.h"

int eva_main(void)
{
    s16 factor1;
    u16 factor2;
    s16 denominator;
    s16 result;

    factor1 =
        Frama_C_short_interval(
            -32768,
            32767);

    factor2 =
        Frama_C_unsigned_short_interval(
            0,
            65535);

    denominator =
        Frama_C_short_interval(
            -32768,
            32767);

    result =
        s16_mul_s16_u16_div_s16(
            factor1,
            factor2,
            denominator);

    (void) result;
    return 0;
}
