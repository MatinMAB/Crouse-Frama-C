#include "__fc_builtin.h"
#include "rotatefunc.h"

int eva_main(void)
{
    u32 num;
    u32 rotation;
    u32 result;

    num =
        Frama_C_unsigned_long_interval(
            0UL,
            0xFFFFFFFFUL);

    rotation =
        Frama_C_unsigned_long_interval(
            0UL,
            0xFFFFFFFFUL);

    result = rotateRight(num, rotation);

    (void) result;
    return 0;
}
