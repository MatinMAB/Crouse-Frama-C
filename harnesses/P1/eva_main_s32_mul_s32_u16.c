#include "__fc_builtin.h"
#include "mul_Ccode.h"

int eva_main(void)
{
    s32 value;
    u16 factor;
    s32 result;

    value =
        Frama_C_long_interval(
            -2147483647L - 1L,
            2147483647L);

    factor =
        Frama_C_unsigned_short_interval(
            0,
            65535);

    result =
        s32_mul_s32_u16(
            value,
            factor);

    (void) result;
    return 0;
}
