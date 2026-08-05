#include "__fc_builtin.h"
#include "mul_Ccode.h"

int eva_main(void)
{
    u32 value;
    s32 factor;
    u32 count;
    u32 result;

    value =
        Frama_C_unsigned_long_interval(
            0UL,
            0xFFFFFFFFUL);

    factor =
        Frama_C_long_interval(
            -2147483647L - 1L,
            2147483647L);

    count =
        Frama_C_unsigned_long_interval(
            0UL,
            0xFFFFFFFFUL);

    result =
        root_u32_mul_u32_s32_fac_less1(
            value,
            factor,
            count);

    (void) result;
    return 0;
}
