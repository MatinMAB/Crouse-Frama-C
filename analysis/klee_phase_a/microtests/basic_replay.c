/* Synthetic Phase-A replay probe using only klee_make_symbolic. */
typedef __SIZE_TYPE__ size_t;

extern void klee_make_symbolic(void *address, size_t size, const char *name);

int main(void)
{
    int value;

    klee_make_symbolic(&value, sizeof(value), "value");
    if (value == 42) {
        return 42;
    }

    return 0;
}
