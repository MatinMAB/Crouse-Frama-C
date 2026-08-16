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

ANALYSIS_SOURCE_WARNING_FLAGS=(
    -Wno-error=sign-compare
    -Wno-error=shift-op-parentheses
    -Wno-error=unused-variable
    -Wno-error=unused-but-set-variable
)

"$CLANG13" "${COMMON_FLAGS[@]}" -c \
    "$SCRIPT_DIR/klee_harness.c" \
    -o "$OUTPUT_DIR/klee_harness.bc"

"$CLANG13" \
    "${COMMON_FLAGS[@]}" \
    "${ANALYSIS_SOURCE_WARNING_FLAGS[@]}" \
    -c \
    "$SCRIPT_DIR/div_Ccode_alarm_0104.c" \
    -o "$OUTPUT_DIR/div_Ccode_alarm_0104.bc"

"$LLVM_LINK13" \
    "$OUTPUT_DIR/klee_harness.bc" \
    "$OUTPUT_DIR/div_Ccode_alarm_0104.bc" \
    -o "$OUTPUT_DIR/s32_div_s32_u32_alarm_0104.bc"

printf '%s\n' "$OUTPUT_DIR/s32_div_s32_u32_alarm_0104.bc"
