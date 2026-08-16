#include <stdint.h>

#include <klee/klee.h>

#include "klee_analysis.h"

int main(void)
{
    uint16_t mmv;
    uint16_t measure;
    int16_t crlc;
    uint16_t result;

    klee_make_symbolic(&mmv, sizeof(mmv), "mmv");
    klee_make_symbolic(&measure, sizeof(measure), "measure");
    klee_make_symbolic(&crlc, sizeof(crlc), "crlc");

    result = u16_mmv_u16_u16_s16_fac1(mmv, measure, crlc);

    (void)result;
    return 0;
}
