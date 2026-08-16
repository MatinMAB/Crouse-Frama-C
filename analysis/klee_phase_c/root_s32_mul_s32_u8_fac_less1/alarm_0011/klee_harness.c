#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    int32_t value;
    uint8_t factor;
    uint32_t count;
    int32_t result;

    klee_make_symbolic(&value, sizeof(value), "value");
    klee_make_symbolic(&factor, sizeof(factor), "factor");
    klee_make_symbolic(&count, sizeof(count), "count");

    result = root_s32_mul_s32_u8_fac_less1(value, factor, count);

    (void)result;
    return 0;
}
