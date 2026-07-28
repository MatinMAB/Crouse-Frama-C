#include "__fc_builtin.h"
#include "avrg_Ccode.h"

int eva_main(void)
{
    u16 mmv;
    u16 measure;
    s16 crlc;
    u16 result;

    mmv = Frama_C_unsigned_short_interval(0, 65535);
    measure = Frama_C_unsigned_short_interval(0, 65535);
    crlc = Frama_C_short_interval(-32768, 32767);

    result = u16_mmv_u16_u16_s16_fac1(mmv, measure, crlc);

    (void) result;
    return 0;
}
