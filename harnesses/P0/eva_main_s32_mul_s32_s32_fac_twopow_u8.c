#include "__fc_builtin.h"
#include "mul_Ccode.h"

int eva_main(void)
{
    s32 value;
    s32 factor;
    u8 power;
    s32 result;

    value =
        Frama_C_long_interval(-2147483647L - 1L, 2147483647L);

    factor =
        Frama_C_long_interval(-2147483647L - 1L, 2147483647L);

    power =
        Frama_C_unsigned_char_interval(0, 255);

    result =
        s32_mul_s32_s32_fac_twopow_u8(value, factor, power);

    (void) result;
    return 0;
}
