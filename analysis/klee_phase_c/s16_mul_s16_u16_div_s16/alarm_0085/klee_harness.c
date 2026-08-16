#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    int16_t factor1;
    uint16_t factor2;
    int16_t denominator;
    int16_t result;

    klee_make_symbolic(&factor1, sizeof(factor1), "factor1");
    klee_make_symbolic(&factor2, sizeof(factor2), "factor2");
    klee_make_symbolic(&denominator, sizeof(denominator), "denominator");

    result = s16_mul_s16_u16_div_s16(factor1, factor2, denominator);

    (void)result;
    return 0;
}
