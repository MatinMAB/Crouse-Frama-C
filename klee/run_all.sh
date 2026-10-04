#!/usr/bin/env bash
set -uo pipefail

KLEE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/common.sh
source "$KLEE_DIR/scripts/common.sh"

usage()
{
    printf 'usage: %s [--max-time SECONDS_OR_KLEE_DURATION] [--resume]\n' "$0" >&2
}

max_time="${KLEE_MAX_TIME:-60}"
resume=0
while (( $# > 0 )); do
    case "$1" in
        --max-time)
            (( $# >= 2 )) || die "--max-time requires a value"
            max_time="$2"
            shift 2
            ;;
        --resume)
            resume=1
            shift
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

manifest_count="$(awk 'END { print NR - 1 }' "$MANIFEST")"
[[ "$manifest_count" == "149" ]] || die "manifest must contain 149 targets, found $manifest_count"
"$KLEE_DIR/scripts/check_environment.sh"
mkdir -p "$RESULTS_DIR"
{
    printf 'captured_utc: %s\n' "$(date -u --iso-8601=seconds)"
    printf 'git_commit: %s\n' "$(git -C "$REPO_ROOT" rev-parse HEAD)"
    printf 'max_time_per_target: %s\n\n' "$max_time"
    "$KLEE_DIR/scripts/check_environment.sh"
} > "$RESULTS_DIR/environment.txt"

summary="$RESULTS_DIR/summary.tsv"
printf 'alarm_id\tfunction\tstatus\ttestcase_count\telapsed_seconds\tresult_dir\n' > "$summary"
total_started="$SECONDS"
total_targets=0
skipped=0

while IFS=$'\t' read -r alarm_id function _; do
    [[ "$alarm_id" == "alarm_id" ]] && continue
    total_targets=$((total_targets + 1))
    result_dir="$RESULTS_DIR/$alarm_id"
    if [[ -e "$result_dir" ]]; then
        existing_status=""
        [[ -s "$result_dir/status.txt" ]] && existing_status="$(cat "$result_dir/status.txt")"
        if (( resume == 1 )) && [[ "$existing_status" =~ ^(WITNESS_FOUND|COMPLETED_NO_WITNESS|TIMEOUT|UNSUPPORTED)$ ]]; then
            printf '%s: resume skip (%s)\n' "$alarm_id" "$existing_status"
            skipped=$((skipped + 1))
        else
            printf '%s: existing result not overwritten; valid completed results can be skipped with --resume; remove only this target directory to rerun\n' \
                "$alarm_id" >&2
        fi
    else
        "$KLEE_DIR/scripts/run_one.sh" "$alarm_id" --max-time "$max_time" || true
    fi

    status="MISSING_RESULT"
    elapsed="0"
    [[ -s "$result_dir/status.txt" ]] && status="$(cat "$result_dir/status.txt")"
    [[ -s "$result_dir/elapsed_seconds.txt" ]] && elapsed="$(cat "$result_dir/elapsed_seconds.txt")"
    testcase_count=0
    if [[ -d "$result_dir/klee-out" ]]; then
        testcase_count="$(find "$result_dir/klee-out" -maxdepth 1 -type f -name '*.ktest' | wc -l)"
    fi
    printf '%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$alarm_id" "$function" "$status" "$testcase_count" "$elapsed" \
        "klee/results/$alarm_id" >> "$summary"
done < "$MANIFEST"

total_elapsed=$((SECONDS - total_started))
printf '\nTotal targets: %d\n' "$total_targets"
printf 'Resume-skipped: %d\n' "$skipped"
for status_name in WITNESS_FOUND COMPLETED_NO_WITNESS TIMEOUT BUILD_FAILED KLEE_FAILED UNSUPPORTED MISSING_RESULT; do
    count="$(awk -F '\t' -v wanted="$status_name" \
        'NR > 1 && $3 == wanted { n++ } END { print n+0 }' "$summary")"
    printf '%s: %d\n' "$status_name" "$count"
done
printf 'Total elapsed time: %ds\n' "$total_elapsed"
printf 'Summary: %s\n' "$summary"
