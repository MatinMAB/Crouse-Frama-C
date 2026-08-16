#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    uint16_t factor1;
    int16_t factor2;
    uint16_t denominator;
    int16_t result;

    klee_make_symbolic(&factor1, sizeof(factor1), "factor1");
    klee_make_symbolic(&factor2, sizeof(factor2), "factor2");
    klee_make_symbolic(&denominator, sizeof(denominator), "denominator");

    result = s16_mul_u16_s16_div_u16(factor1, factor2, denominator);

    (void)result;
    return 0;
}
