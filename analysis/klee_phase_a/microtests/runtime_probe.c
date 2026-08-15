/* Synthetic Phase-A KLEE libc/POSIX runtime probe. */
typedef __SIZE_TYPE__ size_t;

extern void klee_make_symbolic(void *address, size_t size, const char *name);

int main(int argc, char **argv)
{
    int value;

    (void)argv;
    klee_make_symbolic(&value, sizeof(value), "value");
    return value == argc;
}
