#include "__fc_builtin.h"
#include "mul_Ccode.h"

int eva_main(void)
{
    u16 x_value;
    u8 y_value;
    u16 result;

    x_value =
        Frama_C_unsigned_short_interval(0, 65535);

    y_value =
        Frama_C_unsigned_char_interval(0, 255);

    result =
        u16_mul_u16_u8_fac8(x_value, y_value);

    (void) result;
    return 0;
}
