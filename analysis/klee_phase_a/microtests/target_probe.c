/* Synthetic Phase-A target/data-layout probe. No project source is used. */
const unsigned probe_sizeof_char = sizeof(char);
const unsigned probe_sizeof_short = sizeof(short);
const unsigned probe_sizeof_int = sizeof(int);
const unsigned probe_sizeof_long = sizeof(long);
const unsigned probe_sizeof_long_long = sizeof(long long);
const unsigned probe_sizeof_pointer = sizeof(void *);
const int probe_plain_char_is_signed = ((char)-1 < 0);

struct probe_layout {
    char c;
    long value;
    void *pointer;
};

const unsigned probe_sizeof_struct = sizeof(struct probe_layout);
const unsigned probe_alignof_long = _Alignof(long);
const unsigned probe_alignof_pointer = _Alignof(void *);

int main(void)
{
    return 0;
}
