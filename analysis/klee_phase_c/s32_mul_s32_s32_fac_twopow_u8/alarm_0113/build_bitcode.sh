#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLANG13="/home/matin/opt/clang13/bin/clang"
LLVM_LINK13="/home/matin/opt/clang13/bin/llvm-link"
KLEE_INCLUDE="/snap/klee/20/usr/local/include"
OUTPUT_DIR="${KLEE_PHASE_C_OUTPUT_DIR:-$SCRIPT_DIR/build}"

mkdir -p "$OUTPUT_DIR"
OUTPUT_DIR="$(cd "$OUTPUT_DIR" && pwd)"

COMMON_FLAGS=(
    -target x86_64-pc-linux-gnu
    -std=c11
    -O0
    -g
    -fno-discard-value-names
    -Xclang -disable-O0-optnone
    -Wall
    -Wextra
    -Werror
    -emit-llvm
    -I"$KLEE_INCLUDE"
    -I"$SCRIPT_DIR"
)

"$CLANG13" "${COMMON_FLAGS[@]}" -c \
    "$SCRIPT_DIR/klee_harness.c" \
    -o "$OUTPUT_DIR/klee_harness.bc"

"$CLANG13" "${COMMON_FLAGS[@]}" -c \
    "$SCRIPT_DIR/mul_Ccode_alarm_0113.c" \
    -o "$OUTPUT_DIR/mul_Ccode_alarm_0113.bc"

"$CLANG13" "${COMMON_FLAGS[@]}" -c \
    "$SCRIPT_DIR/MulHword_alarm_0113.c" \
    -o "$OUTPUT_DIR/MulHword_alarm_0113.bc"

"$LLVM_LINK13" \
    "$OUTPUT_DIR/klee_harness.bc" \
    "$OUTPUT_DIR/mul_Ccode_alarm_0113.bc" \
    "$OUTPUT_DIR/MulHword_alarm_0113.bc" \
    -o "$OUTPUT_DIR/s32_mul_s32_s32_fac_twopow_u8_alarm_0113.bc"

printf '%s\n' "$OUTPUT_DIR/s32_mul_s32_s32_fac_twopow_u8_alarm_0113.bc"
