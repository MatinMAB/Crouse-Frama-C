#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BITCODE="$SCRIPT_DIR/build/root_u32_mul_u32_s32_fac_less1_alarm_0019.bc"
OUTPUT_DIR="$SCRIPT_DIR/build/klee-out-alarm-0019"

if [[ ! -f "$BITCODE" ]]; then
    printf '%s\n' \
        "Bitcode not found." \
        "Run:" \
        "  bash ./build_bitcode.sh"
    exit 1
fi

klee \
    --output-dir="$OUTPUT_DIR" \
    "$BITCODE"
