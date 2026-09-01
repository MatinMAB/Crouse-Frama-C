#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../.."

FUNC="s16_mul_s16_u16_div_s16"
DIR="results/high_precision/$FUNC"

if [[ "${TIMING_ONLY:-0}" == "1" ]]; then
  TIMING_MODE="high_precision"
  TIMING_CANONICAL_DIR="$DIR"
  source scripts/eva_timing_common.sh
  eva_timing_setup
fi

mkdir -p "$DIR"

echo "parse $FUNC"

frama-c \
  -machdep ppc_32 \
  -cpp-extra-args="-Isrc_analysis/headers" \
  src_analysis/sources/div_Ccode.c \
  harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c \
  -main eva_main \
  -save "$DIR/${FUNC}_parse.sav" \
  > "$DIR/${FUNC}_parse.log" 2>&1

echo "eva high precision $FUNC"

frama-c \
  -load "$DIR/${FUNC}_parse.sav" \
  -eva \
  -eva-precision 11 \
  -eva-domains cvalue,equality,symbolic-locations,gauges,octagon,bitwise \
  -eva-equality-through-calls all \
  -eva-octagon-through-calls \
  -eva-interprocedural-splits \
  -eva-interprocedural-history \
  -eva-split-return full \
  -eva-subdivide-non-linear 500 \
  -eva-ilevel 1024 \
  -save "$DIR/${FUNC}_eva.sav" \
  > "$DIR/${FUNC}_eva.log" 2>&1

echo "done"
echo "$DIR/${FUNC}_parse.sav"
echo "$DIR/${FUNC}_eva.sav"
