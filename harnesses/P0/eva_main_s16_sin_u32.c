#include "__fc_builtin.h"
#include "trig_Ccode.h"

int eva_main(void)
{
    u32 phi;
    s16 result;

    phi =
        Frama_C_unsigned_long_interval(
            0UL,
            0xFFFFFFFFUL);

    result = s16_sin_u32(phi);

    (void) result;
    return 0;
}
