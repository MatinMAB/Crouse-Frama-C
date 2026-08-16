#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BITCODE="$SCRIPT_DIR/build/u16_mul_s16_u16_div_u16_alarm_0135.bc"
OUTPUT_DIR="$SCRIPT_DIR/build/klee-out-alarm-0135"

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
