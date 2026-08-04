#include "__fc_builtin.h"
#include "hip_Ccode.h"

int eva_main(void)
{
    s16 yold;
    u8 u;
    u8 uold;
    u16 m;
    s16 result;

    yold =
        Frama_C_short_interval(
            -32768,
            32767);

    u =
        Frama_C_unsigned_char_interval(
            0,
            255);

    uold =
        Frama_C_unsigned_char_interval(
            0,
            255);

    m =
        Frama_C_unsigned_short_interval(
            0,
            65535);

    result =
        s16_hip1_s16_u8_u8_u16_fac1(
            yold,
            u,
            uold,
            m);

    (void) result;
    return 0;
}
