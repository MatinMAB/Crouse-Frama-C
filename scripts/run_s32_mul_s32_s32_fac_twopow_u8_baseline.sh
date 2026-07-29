#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

FUNC="s32_mul_s32_s32_fac_twopow_u8"
DIR="results/baseline/$FUNC"

mkdir -p "$DIR"

echo "parse $FUNC"

frama-c \
  -machdep ppc_32 \
  -cpp-extra-args="-Isrc_analysis/headers" \
  src_analysis/sources/mul_Ccode.c \
  src_analysis/sources/MulHword.c \
  harnesses/P0/eva_main_s32_mul_s32_s32_fac_twopow_u8.c \
  -main eva_main \
  -save "$DIR/${FUNC}_parse.sav" \
  > "$DIR/${FUNC}_parse.log" 2>&1

echo "eva $FUNC"

frama-c \
  -load "$DIR/${FUNC}_parse.sav" \
  -eva \
  -eva-slevel 1000 \
  -eva-ilevel 256 \
  -save "$DIR/${FUNC}_eva.sav" \
  > "$DIR/${FUNC}_eva.log" 2>&1

echo "done"
echo "$DIR/${FUNC}_parse.sav"
echo "$DIR/${FUNC}_eva.sav"
