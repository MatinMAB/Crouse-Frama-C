#!/usr/bin/env bash
set -euo pipefail

cd /home/matin/frama-work/frama-eva-analysis

mkdir -p "results/baseline/s32_mul_s32_s8_fac2"

echo "parse s32_mul_s32_s8_fac2"

frama-c \
  -machdep ppc_32 \
  -cpp-extra-args="-Isrc_analysis/headers" \
  src_analysis/sources/mul_Ccode.c \
  src_analysis/sources/MulHword.c \
  harnesses/P1/eva_main_s32_mul_s32_s8_fac2.c \
  -main eva_main \
  -save "results/baseline/s32_mul_s32_s8_fac2/s32_mul_s32_s8_fac2_parse.sav" \
  > "results/baseline/s32_mul_s32_s8_fac2/s32_mul_s32_s8_fac2_parse.log" 2>&1

echo "eva s32_mul_s32_s8_fac2"

frama-c \
  -load "results/baseline/s32_mul_s32_s8_fac2/s32_mul_s32_s8_fac2_parse.sav" \
  -eva \
  -eva-slevel 1000 \
  -eva-ilevel 256 \
  -save "results/baseline/s32_mul_s32_s8_fac2/s32_mul_s32_s8_fac2_eva.sav" \
  > "results/baseline/s32_mul_s32_s8_fac2/s32_mul_s32_s8_fac2_eva.log" 2>&1

echo "done"
echo "results/baseline/s32_mul_s32_s8_fac2/s32_mul_s32_s8_fac2_parse.sav"
echo "results/baseline/s32_mul_s32_s8_fac2/s32_mul_s32_s8_fac2_eva.sav"
