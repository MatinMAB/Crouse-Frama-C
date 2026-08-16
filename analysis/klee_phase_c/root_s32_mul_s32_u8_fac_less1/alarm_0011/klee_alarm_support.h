#ifndef KLEE_ALARM_SUPPORT_H
#define KLEE_ALARM_SUPPORT_H

#include <limits.h>
#include <stdint.h>

#include <klee/klee.h>

#include "Platform_Types.h"

_Static_assert(CHAR_BIT == 8, "KLEE preparation requires 8-bit bytes");
_Static_assert(sizeof(int) * CHAR_BIT == 32, "int must be 32-bit");
_Static_assert(sizeof(s8) * CHAR_BIT == 8, "s8 must be 8-bit");
_Static_assert(sizeof(u8) * CHAR_BIT == 8, "u8 must be 8-bit");
_Static_assert(sizeof(s16) * CHAR_BIT == 16, "s16 must be 16-bit");
_Static_assert(sizeof(u16) * CHAR_BIT == 16, "u16 must be 16-bit");
_Static_assert(sizeof(s32) * CHAR_BIT == 32, "s32 must be 32-bit");
_Static_assert(sizeof(u32) * CHAR_BIT == 32, "u32 must be 32-bit");
_Static_assert(sizeof(int64_t) * CHAR_BIT == 64, "predicate type must be 64-bit");

static volatile int64_t klee_alarm_sink_s64 __attribute__((unused));

static inline __attribute__((unused))
int klee_alarm_divisor_nonzero(int64_t denominator)
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

static inline __attribute__((unused))
int klee_alarm_s32_neg_valid(int64_t value)
{
    return value != INT32_MIN;
}

static inline __attribute__((unused))
int klee_alarm_s32_add_lower(int64_t left, int64_t right)
{
    return left + right >= INT32_MIN;
}

static inline __attribute__((unused))
int klee_alarm_s32_add_upper(int64_t left, int64_t right)
{
    return left + right <= INT32_MAX;
}

static inline __attribute__((unused))
int klee_alarm_s32_sub_lower(int64_t left, int64_t right)
{
    return left - right >= INT32_MIN;
}

static inline __attribute__((unused))
int klee_alarm_s32_sub_upper(int64_t left, int64_t right)
{
    return left - right <= INT32_MAX;
}

static inline __attribute__((unused))
int klee_alarm_s32_mul_lower(int64_t left, int64_t right)
{
    return left * right >= INT32_MIN;
}

static inline __attribute__((unused))
int klee_alarm_s32_mul_upper(int64_t left, int64_t right)
{
    return left * right <= INT32_MAX;
}

static inline __attribute__((unused))
int klee_alarm_s32_lshift_lhs_nonnegative(int64_t left)
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
