#include "__fc_builtin.h"
#include "mul_Ccode.h"

int eva_main(void)
{
    s32 value;
    s8 factor;
    s32 result;

    value =
        Frama_C_long_interval(
            -2147483647L - 1L,
            2147483647L);

    factor =
        (s8) Frama_C_int_interval(
            -128,
            127);

    result =
        s32_mul_s32_s8_fac2(
            value,
            factor);

    (void) result;
    return 0;
}
