#include "__fc_builtin.h"
#include "mul_Ccode.h"

int eva_main(void)
{
    u32 value;
    s16 factor;
    u32 count;
    u32 result;

    value =
        Frama_C_unsigned_long_interval(
            0UL,
            0xFFFFFFFFUL);

    factor =
        Frama_C_short_interval(
            -32768,
            32767);

    count =
        Frama_C_unsigned_long_interval(
            0UL,
            0xFFFFFFFFUL);

    result =
        root_u32_mul_u32_s16_fac_less1(
            value,
            factor,
            count);

    (void) result;
    return 0;
}
