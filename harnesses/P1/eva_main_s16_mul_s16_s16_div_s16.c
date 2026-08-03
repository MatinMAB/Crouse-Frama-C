#include "__fc_builtin.h"
#include "div_Ccode.h"

int eva_main(void)
{
    s16 data1;
    s16 data2;
    s16 denominator;
    s16 result;

    data1 =
        Frama_C_short_interval(
            -32768,
            32767);

    data2 =
        Frama_C_short_interval(
            -32768,
            32767);

    denominator =
        Frama_C_short_interval(
            -32768,
            32767);

    result =
        s16_mul_s16_s16_div_s16(
            data1,
            data2,
            denominator);

    (void) result;
    return 0;
}
