#ifndef KLEE_STANDALONE_COMPAT_H
#define KLEE_STANDALONE_COMPAT_H

#include <limits.h>
#include <stdint.h>
#include <klee/klee.h>

/* Preserve the Eva ppc_32 scalar widths in KLEE's host LLVM model. */
#ifndef PLATFORM_TYPES_H
#define PLATFORM_TYPES_H
typedef uint8_t bool;
typedef uint8_t u8;
typedef int8_t s8;
typedef uint16_t u16;
typedef int16_t s16;
typedef uint32_t u32;
typedef int32_t s32;
typedef uint64_t u64;
typedef int64_t s64;
typedef uint8_t int8u;
typedef int8_t int8s;
typedef uint16_t int16u;
typedef int16_t int16s;
typedef uint32_t int32u;
typedef int32_t int32s;
typedef uint32_t iu32;
typedef double f32;
#endif

_Static_assert(CHAR_BIT == 8, "KLEE targets require 8-bit bytes");
_Static_assert(sizeof(s8) == 1, "s8 must be 8-bit");
_Static_assert(sizeof(u8) == 1, "u8 must be 8-bit");
_Static_assert(sizeof(s16) == 2, "s16 must be 16-bit");
_Static_assert(sizeof(u16) == 2, "u16 must be 16-bit");
_Static_assert(sizeof(s32) == 4, "s32 must be 32-bit");
_Static_assert(sizeof(u32) == 4, "u32 must be 32-bit");

static volatile int64_t klee_alarm_sink_s64 __attribute__((unused));

static inline __attribute__((unused)) int klee_alarm_divisor_nonzero(int64_t denominator)
{
    return denominator != INT64_C(0);
}

static inline __attribute__((unused))
int klee_alarm_s32_div_representable(int64_t numerator, int64_t denominator)
{
    return !(numerator == INT32_MIN && denominator == -INT64_C(1));
}

static inline __attribute__((unused))
int klee_alarm_shift_count_valid(int64_t count, int64_t width)
{
    return count >= INT64_C(0) && count < width;
}

static inline __attribute__((unused)) int klee_alarm_s32_neg_valid(int64_t value)
{
    return value != INT32_MIN;
}

static inline __attribute__((unused)) int klee_alarm_s32_add_lower(int64_t left, int64_t right)
{
    return left + right >= INT32_MIN;
}

static inline __attribute__((unused)) int klee_alarm_s32_add_upper(int64_t left, int64_t right)
{
    return left + right <= INT32_MAX;
}

static inline __attribute__((unused)) int klee_alarm_s32_sub_lower(int64_t left, int64_t right)
{
    return left - right >= INT32_MIN;
}

static inline __attribute__((unused)) int klee_alarm_s32_sub_upper(int64_t left, int64_t right)
{
    return left - right <= INT32_MAX;
}

static inline __attribute__((unused)) int klee_alarm_s32_mul_lower(int64_t left, int64_t right)
{
    return left * right >= INT32_MIN;
}

static inline __attribute__((unused)) int klee_alarm_s32_mul_upper(int64_t left, int64_t right)
{
    return left * right <= INT32_MAX;
}

static inline __attribute__((unused)) int klee_alarm_s32_lshift_lhs_nonnegative(int64_t left)
{
    return left >= INT64_C(0);
}

static inline __attribute__((unused))
int klee_alarm_s32_lshift_upper(int64_t left, uint32_t count)
{
    if (count >= UINT32_C(63)) {
        return 0;
    }
    return left * (INT64_C(1) << count) <= INT32_MAX;
}

#endif
