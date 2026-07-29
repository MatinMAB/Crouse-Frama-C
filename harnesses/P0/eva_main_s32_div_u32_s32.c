#include "__fc_builtin.h"
#include "div_Ccode.h"

int eva_main(void)
{
    u32 numerator;
    s32 denominator;
    s32 result;

    numerator =
        Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL);

    denominator =
        Frama_C_long_interval(-2147483647L - 1L, 2147483647L);

    result = s32_div_u32_s32(numerator, denominator);

    (void) result;
    return 0;
}
