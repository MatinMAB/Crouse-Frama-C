/* Synthetic Phase-A natural C overshift characterization. */
typedef __SIZE_TYPE__ size_t;

extern void klee_make_symbolic(void *address, size_t size, const char *name);

int main(void)
{
    unsigned count;
    volatile unsigned shifted;

    klee_make_symbolic(&count, sizeof(count), "count");
    shifted = 1U << count;

    return shifted == 7U;
}
