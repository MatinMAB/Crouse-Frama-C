#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BITCODE="$SCRIPT_DIR/build/root_s32_mul_s32_s8_fac_less1_alarm_0005.bc"
OUTPUT_DIR="$SCRIPT_DIR/build/klee-out-alarm-0005"

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
