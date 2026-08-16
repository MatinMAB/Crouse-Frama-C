#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    int16_t yold;
    int8_t u;
    int8_t uold;
    uint16_t m;
    int16_t result;

    klee_make_symbolic(&yold, sizeof(yold), "yold");
    klee_make_symbolic(&u, sizeof(u), "u");
    klee_make_symbolic(&uold, sizeof(uold), "uold");
    klee_make_symbolic(&m, sizeof(m), "m");

    result = s16_hip1_s16_s8_s8_u16_fac1(yold, u, uold, m);

    (void)result;
    return 0;
}
