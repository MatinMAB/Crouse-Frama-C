#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    int32_t numerator;
    int32_t denominator;
    int32_t result;

    klee_make_symbolic(&numerator, sizeof(numerator), "numerator");
    klee_make_symbolic(&denominator, sizeof(denominator), "denominator");

    result = s32_div_s32_s32(numerator, denominator);

    (void)result;
    return 0;
}
