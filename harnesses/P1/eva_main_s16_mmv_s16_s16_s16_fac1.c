#include "__fc_builtin.h"
#include "avrg_Ccode.h"

int eva_main(void)
{
    s16 mmv;
    s16 measure;
    s16 crlc;
    s16 result;

    mmv =
        Frama_C_short_interval(
            -32768,
            32767);

    measure =
        Frama_C_short_interval(
            -32768,
            32767);

    crlc =
        Frama_C_short_interval(
            -32768,
            32767);

    result =
        s16_mmv_s16_s16_s16_fac1(
            mmv,
            measure,
            crlc);

    (void) result;
    return 0;
}
