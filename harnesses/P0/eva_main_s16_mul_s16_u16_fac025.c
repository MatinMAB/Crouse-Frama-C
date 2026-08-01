#include "__fc_builtin.h"
#include "mul_Ccode.h"

int eva_main(void)
{
    s16 value;
    u16 factor;
    s16 result;

    value =
        Frama_C_short_interval(-32768, 32767);

    factor =
        Frama_C_unsigned_short_interval(0, 65535);

    result =
        s16_mul_s16_u16_fac025(value, factor);

    (void) result;
    return 0;
}
