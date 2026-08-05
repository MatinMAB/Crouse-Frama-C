#include "__fc_builtin.h"
#include "mul_Ccode.h"

int eva_main(void)
{
    u32 value;
    s8 factor;
    u32 count;
    u32 result;

    value =
        Frama_C_unsigned_long_interval(
            0UL,
            0xFFFFFFFFUL);

    factor =
        (s8) Frama_C_int_interval(
            -128,
            127);

    count =
        Frama_C_unsigned_long_interval(
            0UL,
            0xFFFFFFFFUL);

    result =
        root_u32_mul_u32_s8_fac_less1(
            value,
            factor,
            count);

    (void) result;
    return 0;
}
