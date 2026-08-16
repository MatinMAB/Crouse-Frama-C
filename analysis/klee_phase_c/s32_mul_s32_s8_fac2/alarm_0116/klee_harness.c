#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    int32_t value;
    int8_t factor;
    int32_t result;

    klee_make_symbolic(&value, sizeof(value), "value");
    klee_make_symbolic(&factor, sizeof(factor), "factor");

    result = s32_mul_s32_s8_fac2(value, factor);

    (void)result;
    return 0;
}
