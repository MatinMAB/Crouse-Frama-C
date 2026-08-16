#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    int16_t data1;
    int16_t data2;
    uint16_t denominator;
    int16_t result;

    klee_make_symbolic(&data1, sizeof(data1), "data1");
    klee_make_symbolic(&data2, sizeof(data2), "data2");
    klee_make_symbolic(&denominator, sizeof(denominator), "denominator");

    result = s16_mul_s16_s16_div_u16(data1, data2, denominator);

    (void)result;
    return 0;
}
