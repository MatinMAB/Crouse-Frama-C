#include "__fc_builtin.h"
#include "div_Ccode.h"

int eva_main(void)
{
    s32 numerator;
    u16 denominator;
    u16 result;

    numerator =
        Frama_C_long_interval(
            -2147483647L - 1L,
            2147483647L);

    denominator =
        Frama_C_unsigned_short_interval(
            0,
            65535);

    result =
        u16_div_s32_u16(
            numerator,
            denominator);

    (void) result;
    return 0;
}
