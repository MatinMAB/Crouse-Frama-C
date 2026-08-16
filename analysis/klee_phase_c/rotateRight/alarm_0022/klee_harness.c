#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    uint32_t num;
    uint32_t rotation;
    uint32_t result;

    klee_make_symbolic(&num, sizeof(num), "num");
    klee_make_symbolic(&rotation, sizeof(rotation), "rotation");

    result = rotateRight(num, rotation);

    (void)result;
    return 0;
}
