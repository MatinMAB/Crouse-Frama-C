/* Synthetic Phase-A probe showing why optimization must be controlled. */
typedef __SIZE_TYPE__ size_t;

extern void klee_make_symbolic(void *address, size_t size, const char *name);
extern void klee_report_error(
    const char *file,
    int line,
    const char *message,
    const char *suffix) __attribute__((noreturn));

int main(void)
{
    int value;

    klee_make_symbolic(&value, sizeof(value), "value");
    if (value + 1 < value) {
        klee_report_error(
            __FILE__, __LINE__, "overflow-dependent branch", "optimization.err");
    }

    return 0;
}
