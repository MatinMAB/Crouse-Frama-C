#include <stdio.h>

#include "avrg_Ccode.h"
#include "div_Ccode.h"
#include "hip_Ccode.h"
#include "mul_Ccode.h"
#include "rotatefunc.h"

/* THESIS_CONTROLLED_WORKLOAD: deterministic, not a production benchmark. */
static volatile unsigned long long result_checksum;

static unsigned long parse_unsigned(const char *text)
{
  unsigned long value = 0;
  while (*text >= '0' && *text <= '9') {
    value = value * 10UL + (unsigned long)(*text - '0');
    ++text;
  }
  return value;
}

static void consume(unsigned long long value)
{
  result_checksum = (result_checksum * 1099511628211ULL) ^
                    (value + 1469598103934665603ULL);
}

static unsigned long long call_target(unsigned function_id, unsigned profile)
{
  switch (function_id) {
  case 1: return (unsigned long long)root_s32_mul_s32_s16_fac_less1(profile == 2 ? -100000 : 100000, 2, profile == 1 ? 31 : 16);
  case 2: return (unsigned long long)root_s32_mul_s32_s8_fac_less1(profile == 2 ? -100000 : 100000, 2, profile == 1 ? 31 : 8);
  case 3: return (unsigned long long)root_s32_mul_s32_u16_fac_less1(profile == 2 ? -100000 : 100000, 2, profile == 1 ? 31 : 17);
  case 4: return (unsigned long long)root_s32_mul_s32_u8_fac_less1(profile == 2 ? -100000 : 100000, 2, profile == 1 ? 31 : 9);
  case 5: return (unsigned long long)root_u32_mul_u32_s16_fac_less1(profile == 2 ? 0x7fffffffUL : 100000UL, 2, profile == 1 ? 31 : 16);
  case 6: return (unsigned long long)root_u32_mul_u32_s32_fac_less1(profile == 2 ? 0x7fffffffUL : 100000UL, 2, profile == 1 ? 63 : 32);
  case 7: return (unsigned long long)root_u32_mul_u32_s8_fac_less1(profile == 2 ? 0x7fffffffUL : 100000UL, 2, profile == 1 ? 31 : 8);
  case 8: return (unsigned long long)rotateRight(profile == 2 ? 0xffffffffUL : 0x12345678UL, profile == 1 ? 31 : 8);
  case 9: return (unsigned long long)s16_div_s32_s16(profile == 2 ? (-2147483647L - 1L) : 12345, profile == 1 ? 0 : 7);
  case 10: return (unsigned long long)s16_div_s32_u32(profile == 2 ? (-2147483647L - 1L) : 12345, profile == 1 ? 0UL : 7UL);
  case 11: return (unsigned long long)s16_fac05_div_s16_s16(profile == 2 ? -32768 : 1234, profile == 1 ? 0 : 7);
  case 12: return (unsigned long long)s16_fac05_div_s16_u16(profile == 2 ? -32768 : 1234, profile == 1 ? 0 : 7);
  case 13: return (unsigned long long)s16_hip1_s16_s8_s8_u16_fac1(profile == 2 ? -32768 : 100, profile == 2 ? 127 : 20, profile == 2 ? -128 : 10, 256);
  case 14: return (unsigned long long)s16_hip1_s16_u8_u8_u16_fac1(profile == 2 ? -32768 : 100, profile == 2 ? 255 : 20, profile == 2 ? 0 : 10, 256);
  case 15: return (unsigned long long)s16_mul_s16_s16_div_s16(profile == 2 ? -32768 : 100, profile == 2 ? -32768 : 3, profile == 1 ? 0 : 7);
  case 16: return (unsigned long long)s16_mul_s16_s16_div_u16(profile == 2 ? -32768 : 100, profile == 2 ? -32768 : 3, profile == 1 ? 0 : 7);
  case 17: return (unsigned long long)s16_mul_s16_u16_div_s16(profile == 2 ? -32768 : 100, profile == 2 ? 65535 : 3, profile == 1 ? 0 : 7);
  case 18: return (unsigned long long)s16_mul_u16_s16_div_u16(profile == 2 ? 65535 : 100, profile == 2 ? -32768 : 3, profile == 1 ? 0 : 7);
  case 19: return (unsigned long long)s32_div_s32_s32(profile == 2 ? (-2147483647L - 1L) : 12345, profile == 1 ? 0 : 7);
  case 20: return (unsigned long long)s32_div_s32_u32(profile == 2 ? (-2147483647L - 1L) : 12345, profile == 1 ? 0UL : 7UL);
  case 21: return (unsigned long long)s32_div_u32_s32(profile == 2 ? 0xffffffffUL : 12345UL, profile == 1 ? 0 : 7);
  case 22: return (unsigned long long)s32_mul_s32_s16_fac2(profile == 2 ? 2147483647L : 1000, profile == 2 ? 32767 : 3);
  case 23: return (unsigned long long)s32_mul_s32_s32(profile == 2 ? 2147483647L : 1000, profile == 2 ? 2147483647L : 3);
  case 24: return (unsigned long long)s32_mul_s32_s32_fac2(profile == 2 ? 2147483647L : 1000, profile == 2 ? 2147483647L : 3);
  case 25: return (unsigned long long)s32_mul_s32_s32_fac_twopow_u8(profile == 2 ? 2147483647L : 1000, profile == 2 ? 2147483647L : 3, profile == 1 ? 31 : 8);
  case 26: return (unsigned long long)s32_mul_s32_s8_fac2(profile == 2 ? 2147483647L : 1000, profile == 2 ? 127 : 3);
  case 27: return (unsigned long long)s32_mul_s32_u16(profile == 2 ? 2147483647L : 1000, profile == 2 ? 65535 : 3);
  case 28: return (unsigned long long)s32_mul_u32_s32(profile == 2 ? 0xffffffffUL : 1000UL, profile == 2 ? 2147483647L : 3);
  case 29: return (unsigned long long)u16_div_s32_u16(profile == 2 ? (-2147483647L - 1L) : 12345, profile == 1 ? 0 : 7);
  case 30: return (unsigned long long)u16_mmv_u16_u16_s16_fac1(profile == 2 ? 65535 : 1000, profile == 2 ? 0 : 1200, profile == 2 ? 32767 : 1000);
  case 31: return (unsigned long long)u16_mul_s16_u16_div_s16(profile == 2 ? -32768 : 100, profile == 2 ? 65535 : 3, profile == 1 ? 0 : 7);
  case 32: return (unsigned long long)u16_mul_s16_u16_div_u16(profile == 2 ? -32768 : 100, profile == 2 ? 65535 : 3, profile == 1 ? 0 : 7);
  case 33: return (unsigned long long)u32_div_s32_s32(profile == 2 ? (-2147483647L - 1L) : 12345, profile == 1 ? 0 : 7);
  default: return 0;
  }
}

int main(int argc, char **argv)
{
  unsigned long iterations = 1;
  unsigned i;
  unsigned long n;

  result_checksum = 1469598103934665603ULL;
  if (argc >= 2 && argv[1][0] == 'p') {
    if (argc != 3) return 2;
    iterations = parse_unsigned(argv[2]);
    for (n = 0; n < iterations; ++n)
      for (i = 1; i <= 33; ++i)
        consume(call_target(i, 0));
  } else if (argc >= 2 && argv[1][0] == 'o') {
    unsigned function_id;
    unsigned profile;
    if (argc != 4) return 2;
    function_id = (unsigned)parse_unsigned(argv[2]);
    profile = (unsigned)parse_unsigned(argv[3]);
    consume(call_target(function_id, profile));
  } else {
    return 2;
  }
  printf("RESULT_CHECKSUM=%llu\n", result_checksum);
  return 0;
}
