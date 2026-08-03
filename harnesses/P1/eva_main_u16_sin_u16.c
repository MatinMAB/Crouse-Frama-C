#include "__fc_builtin.h"
#include "trig_Ccode.h"

int eva_main(void)
{
    u16 Phi;
    u16 result;

    Phi =
        Frama_C_unsigned_short_interval(
            0,
            65535);

    result = u16_sin_u16(Phi);

    (void) result;
    return 0;
}
