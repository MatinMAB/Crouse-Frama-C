#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    int32_t numerator;
    int16_t denominator;
    int16_t result;

    klee_make_symbolic(&numerator, sizeof(numerator), "numerator");
    klee_make_symbolic(&denominator, sizeof(denominator), "denominator");

    result = s16_div_s32_s16(numerator, denominator);

    (void)result;
    return 0;
}
