#include "__fc_builtin.h"
#include "trig_Ccode.h"

int eva_main(void)
{
    u16 phi;
    u16 result;

    phi =
        Frama_C_unsigned_short_interval(
            0,
            65535);

    result = u16_cos_u16(phi);

    (void) result;
    return 0;
}
