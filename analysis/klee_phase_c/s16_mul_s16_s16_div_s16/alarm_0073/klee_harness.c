#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    int16_t fak1;
    int16_t fak2;
    int16_t div;
    int16_t result;

    klee_make_symbolic(&fak1, sizeof(fak1), "fak1");
    klee_make_symbolic(&fak2, sizeof(fak2), "fak2");
    klee_make_symbolic(&div, sizeof(div), "div");

    result = s16_mul_s16_s16_div_s16(fak1, fak2, div);

    (void)result;
    return 0;
}
