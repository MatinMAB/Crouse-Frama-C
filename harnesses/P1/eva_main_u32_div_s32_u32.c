#include "__fc_builtin.h"
#include "div_Ccode.h"

int eva_main(void)
{
    s32 numerator;
    u32 denominator;
    u32 result;

    numerator =
        Frama_C_long_interval(
            -2147483647L - 1L,
            2147483647L);

    denominator =
        Frama_C_unsigned_long_interval(
            0UL,
            0xFFFFFFFFUL);

    result =
        u32_div_s32_u32(
            numerator,
            denominator);

    (void) result;
    return 0;
}
