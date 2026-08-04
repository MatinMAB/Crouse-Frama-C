#include "__fc_builtin.h"
#include "hip_Ccode.h"

int eva_main(void)
{
    s16 yold;
    s8 u;
    s8 uold;
    u16 m;
    s16 result;

    yold =
        Frama_C_short_interval(
            -32768,
            32767);

    u =
        (s8) Frama_C_int_interval(
            -128,
            127);

    uold =
        (s8) Frama_C_int_interval(
            -128,
            127);

    m =
        Frama_C_unsigned_short_interval(
            0,
            65535);

    result =
        s16_hip1_s16_s8_s8_u16_fac1(
            yold,
            u,
            uold,
            m);

    (void) result;
    return 0;
}
