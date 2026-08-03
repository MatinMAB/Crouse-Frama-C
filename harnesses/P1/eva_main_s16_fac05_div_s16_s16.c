#include "__fc_builtin.h"
#include "div_Ccode.h"

int eva_main(void)
{
    s16 numerator;
    s16 denominator;
    s16 result;

    numerator =
        Frama_C_short_interval(
            -32768,
            32767);

    denominator =
        Frama_C_short_interval(
            -32768,
            32767);

    result =
        s16_fac05_div_s16_s16(
            numerator,
            denominator);

    (void) result;
    return 0;
}
