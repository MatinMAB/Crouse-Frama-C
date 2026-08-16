#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    int16_t numerator;
    uint16_t denominator;
    int16_t result;

    klee_make_symbolic(&numerator, sizeof(numerator), "numerator");
    klee_make_symbolic(&denominator, sizeof(denominator), "denominator");

    result = s16_fac05_div_s16_u16(numerator, denominator);

    (void)result;
    return 0;
}
