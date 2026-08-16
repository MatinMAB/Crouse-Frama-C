#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    uint32_t value;
    int32_t factor;
    uint32_t count;
    uint32_t result;

    klee_make_symbolic(&value, sizeof(value), "value");
    klee_make_symbolic(&factor, sizeof(factor), "factor");
    klee_make_symbolic(&count, sizeof(count), "count");

    result = root_u32_mul_u32_s32_fac_less1(value, factor, count);

    (void)result;
    return 0;
}
