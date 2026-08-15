/* Synthetic Phase-A natural signed-overflow characterization. */
typedef __SIZE_TYPE__ size_t;

extern void klee_make_symbolic(void *address, size_t size, const char *name);

int main(void)
{
    int value;
    volatile int sum;

    klee_make_symbolic(&value, sizeof(value), "value");
    sum = value + 1;

    return sum == 7;
}
