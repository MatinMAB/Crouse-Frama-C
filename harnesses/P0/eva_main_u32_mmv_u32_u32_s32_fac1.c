#include "__fc_builtin.h"
#include "avrg_Ccode.h"

int eva_main(void)
{
    u32 mmv;
    u32 measure;
    s32 crlc;
    u32 result;

    mmv = Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL);
    measure = Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL);
    crlc = Frama_C_long_interval(-2147483647L - 1L, 2147483647L);

    result = u32_mmv_u32_u32_s32_fac1(mmv, measure, crlc);

    (void) result;
    return 0;
}
