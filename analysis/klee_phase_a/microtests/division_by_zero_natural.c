/* Synthetic Phase-A natural C division-by-zero characterization. */
typedef __SIZE_TYPE__ size_t;

extern void klee_make_symbolic(void *address, size_t size, const char *name);

int main(void)
{
    int denominator;
    volatile int quotient;

    klee_make_symbolic(&denominator, sizeof(denominator), "denominator");
    quotient = 100 / denominator;

    return quotient == 7;
}
