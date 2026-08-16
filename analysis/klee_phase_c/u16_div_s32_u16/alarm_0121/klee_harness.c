#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    int32_t x_value;
    uint16_t y_value;
    uint16_t result;

    klee_make_symbolic(&x_value, sizeof(x_value), "x_value");
    klee_make_symbolic(&y_value, sizeof(y_value), "y_value");

    result = u16_div_s32_u16(x_value, y_value);

    (void)result;
    return 0;
}
