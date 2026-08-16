#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    int32_t value;
    int32_t factor;
    uint8_t power;
    int32_t result;

    klee_make_symbolic(&value, sizeof(value), "value");
    klee_make_symbolic(&factor, sizeof(factor), "factor");
    klee_make_symbolic(&power, sizeof(power), "power");

    result = s32_mul_s32_s32_fac_twopow_u8(value, factor, power);

    (void)result;
    return 0;
}
