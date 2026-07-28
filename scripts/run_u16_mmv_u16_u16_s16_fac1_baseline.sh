#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

FUNC="u16_mmv_u16_u16_s16_fac1"
DIR="results/baseline/$FUNC"

mkdir -p "$DIR"

echo "parse $FUNC"

frama-c \
  -machdep ppc_32 \
  -cpp-extra-args="-Isrc_analysis/headers" \
  src_analysis/sources/avrg_Ccode.c \
  harnesses/P0/eva_main_u16_mmv_u16_u16_s16_fac1.c \
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
echo "$DIR/${FUNC}_parse.log"
echo "$DIR/${FUNC}_eva.log"
