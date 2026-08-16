#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/build/klee-out-alarm-0144"
KTEST_TOOL="/snap/klee/20/usr/local/bin/ktest-tool"

shopt -s nullglob
ERROR_FILES=("$OUTPUT_DIR"/*.klee-alarm-0144.err)

if (( ${#ERROR_FILES[@]} == 0 )); then
    printf '%s\n' \
        "No KLEE-ALARM-0144 target error files found in:" \
        "  $OUTPUT_DIR"
    exit 0
fi

for ERROR_FILE in "${ERROR_FILES[@]}"; do
    KTEST_FILE="${ERROR_FILE%.klee-alarm-0144.err}.ktest"

    printf 'Error file: %s\n' "$ERROR_FILE"
    sed -n '1,240p' "$ERROR_FILE"

    if [[ ! -f "$KTEST_FILE" ]]; then
        printf 'Corresponding KTest not found: %s\n' "$KTEST_FILE"
        continue
    fi

    printf 'KTest file: %s\n' "$KTEST_FILE"
    "$KTEST_TOOL" "$KTEST_FILE"
done
