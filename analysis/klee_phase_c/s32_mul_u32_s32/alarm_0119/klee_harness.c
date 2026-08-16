#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    uint32_t val1;
    int32_t val2;
    int32_t result;

    klee_make_symbolic(&val1, sizeof(val1), "val1");
    klee_make_symbolic(&val2, sizeof(val2), "val2");

    result = s32_mul_u32_s32(val1, val2);

    (void)result;
    return 0;
}
