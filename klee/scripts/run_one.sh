#!/usr/bin/env bash
set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=common.sh
source "$SCRIPT_DIR/common.sh"

usage()
{
    printf 'usage: %s KLEE-ALARM-NNNN [--max-time SECONDS_OR_KLEE_DURATION]\n' "$0" >&2
}

(( $# >= 1 )) || { usage; exit 2; }
alarm_id="$1"
shift
validate_alarm_id "$alarm_id"
max_time="${KLEE_MAX_TIME:-60}"
while (( $# > 0 )); do
    case "$1" in
        --max-time)
            (( $# >= 2 )) || die "--max-time requires a value"
            max_time="$2"
            shift 2
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            die "unknown argument: $1"
            ;;
    esac
done
max_time="$(normalize_max_time "$max_time")"
timeout_grace="$(normalize_max_time "${KLEE_TIMEOUT_GRACE:-5s}")"
hard_timeout="$(add_duration_seconds "$max_time" "$timeout_grace")"
row="$(manifest_row "$alarm_id")" || die "$alarm_id is absent from $MANIFEST"
IFS=$'\t' read -r _ function _ <<< "$row"

result_dir="$RESULTS_DIR/$alarm_id"
if [[ -e "$result_dir" ]]; then
    printf 'result already exists; not overwriting: %s\n' "$result_dir" >&2
    exit 3
fi
mkdir -p "$result_dir/build"
run_log="$result_dir/run.log"
status_file="$result_dir/status.txt"
started_ns="$(date +%s%N)"

{
    printf 'alarm_id: %s\n' "$alarm_id"
    printf 'function: %s\n' "$function"
    printf 'max_time: %s\n' "$max_time"
    printf 'hard_timeout: %s\n' "$hard_timeout"
    printf 'termination_grace: %s\n' "$timeout_grace"
    printf 'started_utc: %s\n\n' "$(date -u --iso-8601=seconds)"
    printf '== build ==\n'
} > "$run_log"

build_started_ns="$(date +%s%N)"
target_bc="$($SCRIPT_DIR/build_one.sh "$alarm_id" 2>> "$run_log")"
build_exit=$?
build_ended_ns="$(date +%s%N)"
write_duration_seconds "$build_started_ns" "$build_ended_ns" \
    "$result_dir/build_seconds.txt"
if (( build_exit != 0 )); then
    printf 'BUILD_FAILED\n' > "$status_file"
    ended_ns="$(date +%s%N)"
    write_duration_seconds "$started_ns" "$ended_ns" \
        "$result_dir/elapsed_seconds.txt"
    exit 1
fi

printf '\n== KLEE ==\n' >> "$run_log"
klee_started_ns="$(date +%s%N)"
run_with_hard_timeout "$hard_timeout" 1s \
    "$KLEE" --watchdog "--max-time=$max_time" \
    "--output-dir=$result_dir/klee-out" \
    "$target_bc" >> "$run_log" 2>&1
klee_exit=$?
klee_ended_ns="$(date +%s%N)"
write_duration_seconds "$klee_started_ns" "$klee_ended_ns" \
    "$result_dir/klee_seconds.txt"
printf '\nklee_exit_status: %s\n' "$klee_exit" >> "$run_log"

target_suffix="${alarm_id,,}.err"
mapfile -t target_errors < <(
    find "$result_dir/klee-out" -maxdepth 1 -type f -name "*.${target_suffix}" -print 2>/dev/null | sort
)
if (( ${#target_errors[@]} > 0 )); then
    status="WITNESS_FOUND"
    "$SCRIPT_DIR/extract_testcase.sh" "$alarm_id" >> "$run_log" 2>&1 || \
        printf 'warning: witness exists, but testcase extraction failed\n' >> "$run_log"
elif klee_timed_out "$klee_exit" "$run_log"; then
    status="TIMEOUT"
elif (( klee_exit != 0 )); then
    status="KLEE_FAILED"
else
    status="COMPLETED_NO_WITNESS"
fi

printf '%s\n' "$status" > "$status_file"
ended_ns="$(date +%s%N)"
write_duration_seconds "$started_ns" "$ended_ns" \
    "$result_dir/elapsed_seconds.txt"
printf '%s: %s (%ss)\n' "$alarm_id" "$status" "$(cat "$result_dir/elapsed_seconds.txt")"
[[ "$status" != "BUILD_FAILED" && "$status" != "KLEE_FAILED" ]]
