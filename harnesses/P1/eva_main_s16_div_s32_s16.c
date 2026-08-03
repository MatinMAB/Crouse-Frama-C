#include "__fc_builtin.h"
#include "div_Ccode.h"

int eva_main(void)
{
    s32 numerator;
    s16 denominator;
    s16 result;

    numerator =
        Frama_C_long_interval(
            -2147483647L - 1L,
            2147483647L);

    denominator =
        Frama_C_short_interval(
            -32768,
            32767);

    result =
        s16_div_s32_s16(
            numerator,
            denominator);

    (void) result;
    return 0;
}
