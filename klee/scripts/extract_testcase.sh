#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=common.sh
source "$SCRIPT_DIR/common.sh"

[[ $# -eq 1 ]] || die "usage: $0 KLEE-ALARM-NNNN"
alarm_id="$1"
validate_alarm_id "$alarm_id"
row="$(manifest_row "$alarm_id")" || die "$alarm_id is absent from $MANIFEST"
IFS=$'\t' read -r _ function _ <<< "$row"

result_dir="$RESULTS_DIR/$alarm_id"
output_file="$result_dir/testcase.txt"
error_suffix="${alarm_id,,}.err"
mapfile -t error_files < <(
    find "$result_dir/klee-out" -maxdepth 1 -type f -name "*.${error_suffix}" -print | sort
)
(( ${#error_files[@]} > 0 )) || die "no target assertion testcase found for $alarm_id"

{
    printf 'alarm_id: %s\n' "$alarm_id"
    printf 'function: %s\n' "$function"
    printf 'target_error_suffix: %s\n\n' "$error_suffix"
    printf 'inputs (raw ktest-tool output):\n'
    for error_file in "${error_files[@]}"; do
        test_base="${error_file%.$error_suffix}"
        ktest_file="$test_base.ktest"
        [[ -f "$ktest_file" ]] || continue
        printf '\nKLEE test: %s\n' "$(basename "$ktest_file")"
        "$KTEST_TOOL" "$ktest_file"
    done
} > "$output_file"
printf '%s\n' "$output_file"
