#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BITCODE="$SCRIPT_DIR/build/s16_fac05_div_s16_s16_alarm_0047.bc"
OUTPUT_DIR="$SCRIPT_DIR/build/klee-out-alarm-0047"
STATUS_FILE="$SCRIPT_DIR/build/klee.status"
COMMON_RUNNER="$SCRIPT_DIR/../../klee_run_common.sh"
ALARM_ID="0047"

if [[ ! -r "$COMMON_RUNNER" ]]; then
    printf 'Shared KLEE runner not found: %s\n' "$COMMON_RUNNER" >&2
    exit 1
fi

# shellcheck source=../../klee_run_common.sh
source "$COMMON_RUNNER"

phase_c_run_klee "$ALARM_ID" "$BITCODE" "$OUTPUT_DIR" "$STATUS_FILE"
