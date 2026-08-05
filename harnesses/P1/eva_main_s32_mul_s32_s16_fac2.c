#include "__fc_builtin.h"
#include "mul_Ccode.h"

int eva_main(void)
{
    s32 val1;
    s16 val2;
    s32 result;

    val1 =
        Frama_C_long_interval(
            -2147483647L - 1L,
            2147483647L);

    val2 =
        Frama_C_short_interval(
            -32768,
            32767);

    result =
        s32_mul_s32_s16_fac2(
            val1,
            val2);

    (void) result;
    return 0;
}
