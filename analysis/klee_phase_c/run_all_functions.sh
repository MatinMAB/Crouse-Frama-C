#!/usr/bin/env bash

set -uo pipefail

# Local-only KLEE Phase C batch runner.
#
# With no arguments, alarms are processed in the canonical function/alarm order.
# Optional four-digit alarm arguments restrict a run for local validation while
# preserving that canonical order.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPOSITORY_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
RESULTS_ROOT="${KLEE_PHASE_C_RESULTS_DIR:-$SCRIPT_DIR/results}"
SUMMARY_FILE="$RESULTS_ROOT/summary.tsv"
COMMON_RUNNER="$SCRIPT_DIR/klee_run_common.sh"

FUNCTION_SPECS=(
    "root_s32_mul_s32_s16_fac_less1:0001:0003"
    "root_s32_mul_s32_s8_fac_less1:0004:0006"
    "root_s32_mul_s32_u16_fac_less1:0007:0010"
    "root_s32_mul_s32_u8_fac_less1:0011:0013"
    "root_u32_mul_u32_s16_fac_less1:0014:0015"
    "root_u32_mul_u32_s32_fac_less1:0016:0019"
    "root_u32_mul_u32_s8_fac_less1:0020:0021"
    "rotateRight:0022:0022"
    "s16_div_s32_s16:0023:0042"
    "s16_div_s32_u32:0043:0043"
    "s16_fac05_div_s16_s16:0044:0052"
    "s16_fac05_div_s16_u16:0053:0057"
    "s16_hip1_s16_s8_s8_u16_fac1:0058:0062"
    "s16_hip1_s16_u8_u8_u16_fac1:0063:0067"
    "s16_mul_s16_s16_div_s16:0068:0075"
    "s16_mul_s16_s16_div_u16:0076:0080"
    "s16_mul_s16_u16_div_s16:0081:0088"
    "s16_mul_u16_s16_div_u16:0089:0094"
    "s32_div_s32_s32:0095:0103"
    "s32_div_s32_u32:0104:0104"
    "s32_div_u32_s32:0105:0105"
    "s32_mul_s32_s16_fac2:0106:0106"
    "s32_mul_s32_s32:0107:0109"
    "s32_mul_s32_s32_fac2:0110:0112"
    "s32_mul_s32_s32_fac_twopow_u8:0113:0115"
    "s32_mul_s32_s8_fac2:0116:0116"
    "s32_mul_s32_u16:0117:0118"
    "s32_mul_u32_s32:0119:0119"
    "u16_div_s32_u16:0120:0124"
    "u16_mmv_u16_u16_s16_fac1:0125:0125"
    "u16_mul_s16_u16_div_s16:0126:0134"
    "u16_mul_s16_u16_div_u16:0135:0140"
    "u32_div_s32_s32:0141:0149"
)

if [[ ! -r "$COMMON_RUNNER" ]]; then
    printf 'Shared KLEE runner not found: %s\n' "$COMMON_RUNNER" >&2
    exit 1
fi

# shellcheck source=klee_run_common.sh
source "$COMMON_RUNNER"

declare -A SELECTED_ALARMS=()
if (( $# > 0 )); then
    for requested_alarm in "$@"; do
        if [[ ! "$requested_alarm" =~ ^[0-9]{4}$ ]]; then
            printf 'Invalid alarm ID: %s (expected four digits)\n' "$requested_alarm" >&2
            exit 2
        fi
        SELECTED_ALARMS["$requested_alarm"]=1
    done
fi

mkdir -p "$RESULTS_ROOT"
if [[ -f "$SUMMARY_FILE" ]]; then
    summary_archive="$(phase_c_next_archive_path "$RESULTS_ROOT/archive" "summary.tsv")"
    mkdir -p "$(dirname "$summary_archive")"
    mv "$SUMMARY_FILE" "$summary_archive"
    printf 'Archived previous summary: %s\n' "$summary_archive"
fi

printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
    "alarm_id" \
    "function" \
    "elapsed_seconds" \
    "final_status" \
    "exit_code" \
    "target_error" \
    "build_status" \
    "klee_status" \
    "completed_paths" \
    "partial_paths" \
    "generated_tests" \
    "ktest" \
    "failure_reason" \
    > "$SUMMARY_FILE"

declare -A STATUS_COUNTS=(
    [CONFIRMED_COUNTEREXAMPLE]=0
    [NO_COUNTEREXAMPLE_FOUND]=0
    [INCONCLUSIVE_TIMEOUT]=0
    [INCONCLUSIVE_TOOL_ERROR]=0
    [PREPARATION_ERROR]=0
)
TOTAL_ALARMS=0

repository_relative_path() {
    local path="$1"
    if [[ "$path" == "$REPOSITORY_ROOT/"* ]]; then
        printf '%s' "${path#"$REPOSITORY_ROOT/"}"
    else
        printf '%s' "$path"
    fi
}

status_value() {
    local key="$1"
    local status_file="$2"
    local value

    value="$(sed -n "s/^${key}=//p" "$status_file" | tail -n 1)"
    printf '%s' "$value"
}

last_klee_stat() {
    local label="$1"
    local log_file="$2"
    local value

    value="$(sed -n "s/^KLEE: done: ${label} = //p" "$log_file" | tail -n 1)"
    if [[ -n "$value" ]]; then
        printf '%s' "$value"
    else
        printf '%s' '-'
    fi
}

first_failure_line() {
    local log_file="$1"
    local fallback="$2"
    local line

    line="$(grep -m 1 -E '(^|[[:space:]])(fatal:|error:|ERROR:)|not found|No such file|Permission denied|snap-confine|failed' "$log_file" || true)"
    if [[ -z "$line" ]]; then
        line="$fallback"
    fi
    line="${line//$'\t'/ }"
    line="${line//$'\r'/ }"
    line="${line//$'\n'/ }"
    printf '%s' "$line"
}

archive_previous_logs() {
    local result_dir="$1"
    local history_root="$result_dir/history"
    local history_dir=""
    local candidate
    local -a candidates=(
        "$result_dir/build.log"
        "$result_dir/klee.log"
        "$result_dir/ktest.log"
        "$result_dir/klee.status"
    )

    for candidate in "${candidates[@]}"; do
        if [[ -e "$candidate" ]]; then
            mkdir -p "$history_root"
            history_dir="$(phase_c_next_archive_path "$history_root" "execution")"
            mkdir -p "$history_dir"
            break
        fi
    done

    if [[ -n "$history_dir" ]]; then
        for candidate in "${candidates[@]}"; do
            if [[ -e "$candidate" ]]; then
                mv "$candidate" "$history_dir/"
            fi
        done
        printf 'Archived previous logs: %s\n' "$history_dir"
    fi
}

archive_status_only() {
    local status_file="$1"
    local result_dir="$2"
    local status_archive

    if [[ -f "$status_file" ]]; then
        status_archive="$(phase_c_next_archive_path "$result_dir" "klee.status")"
        mv "$status_file" "$status_archive"
        printf 'Archived previous KLEE status: %s\n' "$status_archive"
    fi
}

append_summary() {
    local alarm="$1"
    local function_name="$2"
    local elapsed_seconds="$3"
    local final_status="$4"
    local exit_code="$5"
    local target_error="$6"
    local build_status="$7"
    local klee_status="$8"
    local completed_paths="$9"
    local partial_paths="${10}"
    local generated_tests="${11}"
    local ktest="${12}"
    local failure_reason="${13}"

    printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "KLEE-ALARM-$alarm" \
        "$function_name" \
        "$elapsed_seconds" \
        "$final_status" \
        "$exit_code" \
        "$target_error" \
        "$build_status" \
        "$klee_status" \
        "$completed_paths" \
        "$partial_paths" \
        "$generated_tests" \
        "$ktest" \
        "$failure_reason" \
        >> "$SUMMARY_FILE"

    STATUS_COUNTS["$final_status"]=$((STATUS_COUNTS["$final_status"] + 1))
    TOTAL_ALARMS=$((TOTAL_ALARMS + 1))
}

write_preparation_error() {
    local alarm="$1"
    local status_file="$2"
    local exit_code="$3"
    local timestamp

    timestamp="$(phase_c_utc_now)"
    phase_c_write_status "$status_file" "$alarm" "$timestamp" "$timestamp" \
        "${KLEE_TIMEOUT_SECONDS:-1800}" 0 "$exit_code" "PREPARATION_ERROR" "" "" ""
}

process_alarm() {
    local function_name="$1"
    local alarm="$2"
    local alarm_dir="$SCRIPT_DIR/$function_name/alarm_$alarm"
    local result_dir="$RESULTS_ROOT/$function_name/alarm_$alarm"
    local build_log="$result_dir/build.log"
    local klee_log="$result_dir/klee.log"
    local ktest_log="$result_dir/ktest.log"
    local status_file="$alarm_dir/build/klee.status"
    local result_status="$result_dir/klee.status"
    local build_status="NOT_RUN"
    local klee_status="NOT_RUN"
    local elapsed_seconds=0
    local final_status="PREPARATION_ERROR"
    local status_exit_code=1
    local target_error=""
    local completed_paths="-"
    local partial_paths="-"
    local generated_tests="-"
    local ktest_field="-"
    local failure_reason=""
    local build_exit=0
    local klee_exit=0
    local show_exit=0
    local timestamp=""
    local target_path
    local matching_ktest
    local -a target_paths=()
    local -a matching_ktests=()

    mkdir -p "$result_dir"
    archive_previous_logs "$result_dir"
    : > "$build_log"
    : > "$klee_log"
    : > "$ktest_log"

    printf '[%s] %s alarm_%s\n' "$(phase_c_utc_now)" "$function_name" "$alarm"

    if [[ ! -d "$alarm_dir" ]]; then
        build_status="BUILD_ERROR"
        failure_reason="alarm directory not found: $(repository_relative_path "$alarm_dir")"
        printf '%s\n' "$failure_reason" > "$build_log"
        timestamp="$(phase_c_utc_now)"
        phase_c_write_status "$result_status" "$alarm" "$timestamp" "$timestamp" \
            "${KLEE_TIMEOUT_SECONDS:-1800}" 0 1 "PREPARATION_ERROR" "" "" ""
        append_summary "$alarm" "$function_name" 0 "PREPARATION_ERROR" 1 "" \
            "$build_status" "$klee_status" "-" "-" "-" "-" "$failure_reason"
        printf '  final_status: PREPARATION_ERROR\n'
        return
    fi

    if [[ ! -x "$alarm_dir/build_bitcode.sh" ]]; then
        build_status="BUILD_ERROR"
        failure_reason="build_bitcode.sh is missing or not executable"
        printf '%s\n' "$failure_reason" > "$build_log"
        mkdir -p "$(dirname "$status_file")"
        archive_status_only "$status_file" "$result_dir"
        write_preparation_error "$alarm" "$status_file" 126
        cp "$status_file" "$result_status"
        append_summary "$alarm" "$function_name" 0 "PREPARATION_ERROR" 126 "" \
            "$build_status" "$klee_status" "-" "-" "-" "-" "$failure_reason"
        printf '  final_status: PREPARATION_ERROR\n'
        return
    fi

    (
        cd "$alarm_dir" || exit 125
        ./build_bitcode.sh
    ) > "$build_log" 2>&1
    build_exit=$?

    if (( build_exit != 0 )); then
        build_status="BUILD_ERROR"
        failure_reason="$(first_failure_line "$build_log" "build_bitcode.sh exited with status $build_exit")"
        printf 'Not run because build failed.\n' > "$klee_log"
        printf 'Not run because no target KTest was produced.\n' > "$ktest_log"
        mkdir -p "$(dirname "$status_file")"
        archive_status_only "$status_file" "$result_dir"
        write_preparation_error "$alarm" "$status_file" "$build_exit"
        cp "$status_file" "$result_status"
        append_summary "$alarm" "$function_name" 0 "PREPARATION_ERROR" "$build_exit" "" \
            "$build_status" "$klee_status" "-" "-" "-" "-" "$failure_reason"
        printf '  final_status: PREPARATION_ERROR\n'
        return
    fi
    build_status="SUCCESS"

    if [[ ! -x "$alarm_dir/run_klee.sh" ]]; then
        failure_reason="run_klee.sh is missing or not executable"
        printf '%s\n' "$failure_reason" > "$klee_log"
        printf 'Not run because the KLEE driver was unavailable.\n' > "$ktest_log"
        mkdir -p "$(dirname "$status_file")"
        archive_status_only "$status_file" "$result_dir"
        write_preparation_error "$alarm" "$status_file" 126
        cp "$status_file" "$result_status"
        append_summary "$alarm" "$function_name" 0 "PREPARATION_ERROR" 126 "" \
            "$build_status" "$klee_status" "-" "-" "-" "-" "$failure_reason"
        printf '  final_status: PREPARATION_ERROR\n'
        return
    fi

    (
        cd "$alarm_dir" || exit 125
        KLEE_ARCHIVE_DIR="$result_dir" ./run_klee.sh
    ) > "$klee_log" 2>&1
    klee_exit=$?

    if [[ ! -f "$status_file" ]]; then
        failure_reason="run_klee.sh did not produce klee.status"
        timestamp="$(phase_c_utc_now)"
        phase_c_write_status "$status_file" "$alarm" "$timestamp" "$timestamp" \
            "${KLEE_TIMEOUT_SECONDS:-1800}" 0 "$klee_exit" "INCONCLUSIVE_TOOL_ERROR" "" "" ""
    fi
    cp "$status_file" "$result_status"

    elapsed_seconds="$(status_value elapsed_seconds "$status_file")"
    final_status="$(status_value final_status "$status_file")"
    status_exit_code="$(status_value exit_code "$status_file")"
    target_error="$(status_value target_error "$status_file")"
    generated_tests="$(status_value generated_tests "$status_file")"
    [[ -n "$elapsed_seconds" ]] || elapsed_seconds=0
    [[ -n "$status_exit_code" ]] || status_exit_code="$klee_exit"
    [[ -n "$generated_tests" ]] || generated_tests="-"

    completed_paths="$(last_klee_stat 'completed paths' "$klee_log")"
    partial_paths="$(last_klee_stat 'partially completed paths' "$klee_log")"

    case "$final_status" in
        CONFIRMED_COUNTEREXAMPLE)
            klee_status="TARGET_ERROR_GENERATED"
            ;;
        NO_COUNTEREXAMPLE_FOUND)
            klee_status="COMPLETED"
            ;;
        INCONCLUSIVE_TIMEOUT)
            klee_status="TIMED_OUT"
            failure_reason="GNU timeout ended KLEE after ${KLEE_TIMEOUT_SECONDS:-1800} seconds"
            ;;
        INCONCLUSIVE_TOOL_ERROR)
            klee_status="FAILED"
            failure_reason="$(first_failure_line "$klee_log" "run_klee.sh exited with status $status_exit_code")"
            ;;
        PREPARATION_ERROR)
            klee_status="NOT_RUN"
            failure_reason="$(first_failure_line "$klee_log" "required bitcode was unavailable")"
            ;;
        *)
            final_status="INCONCLUSIVE_TOOL_ERROR"
            klee_status="FAILED"
            failure_reason="unrecognized final_status in klee.status"
            ;;
    esac

    if [[ -n "$target_error" ]]; then
        IFS=';' read -r -a target_paths <<< "$target_error"
        for target_path in "${target_paths[@]}"; do
            matching_ktest="${target_path%.klee-alarm-$alarm.err}.ktest"
            if [[ -f "$matching_ktest" ]]; then
                matching_ktests+=("$matching_ktest")
            fi
        done
    fi

    if (( ${#matching_ktests[@]} > 0 )); then
        ktest_field="$(phase_c_join_semicolon "${matching_ktests[@]}")"
        if [[ -x "$alarm_dir/show_ktest.sh" ]]; then
            (
                cd "$alarm_dir" || exit 125
                ./show_ktest.sh
            ) > "$ktest_log" 2>&1
            show_exit=$?
            if (( show_exit != 0 )); then
                if [[ -n "$failure_reason" ]]; then
                    failure_reason="$failure_reason; show_ktest.sh exited with status $show_exit"
                else
                    failure_reason="show_ktest.sh exited with status $show_exit"
                fi
            fi
        else
            printf 'show_ktest.sh is missing or not executable.\n' > "$ktest_log"
            if [[ -n "$failure_reason" ]]; then
                failure_reason="$failure_reason; show_ktest.sh is missing or not executable"
            else
                failure_reason="show_ktest.sh is missing or not executable"
            fi
        fi
    else
        printf 'No matching target-specific KTest was available; show_ktest.sh was not run.\n' > "$ktest_log"
    fi

    append_summary "$alarm" "$function_name" "$elapsed_seconds" "$final_status" \
        "$status_exit_code" "$target_error" "$build_status" "$klee_status" \
        "$completed_paths" "$partial_paths" "$generated_tests" "$ktest_field" "$failure_reason"
    printf '  final_status: %s\n' "$final_status"
}

for specification in "${FUNCTION_SPECS[@]}"; do
    IFS=':' read -r function_name first_alarm last_alarm <<< "$specification"
    first_number=$((10#$first_alarm))
    last_number=$((10#$last_alarm))
    function_header_printed=0

    for ((alarm_number = first_number; alarm_number <= last_number; alarm_number++)); do
        printf -v alarm '%04d' "$alarm_number"
        if (( ${#SELECTED_ALARMS[@]} > 0 )) && [[ ! -v "SELECTED_ALARMS[$alarm]" ]]; then
            continue
        fi
        if (( function_header_printed == 0 )); then
            printf '\n=== Function: %s (alarms %s-%s) ===\n' \
                "$function_name" "$first_alarm" "$last_alarm"
            function_header_printed=1
        fi
        process_alarm "$function_name" "$alarm"
    done
done

printf '\n=== Phase C summary ===\n'
printf 'Total alarms: %d\n' "$TOTAL_ALARMS"
printf 'Confirmed counterexamples: %d\n' "${STATUS_COUNTS[CONFIRMED_COUNTEREXAMPLE]}"
printf 'No counterexample found: %d\n' "${STATUS_COUNTS[NO_COUNTEREXAMPLE_FOUND]}"
printf 'Timeouts: %d\n' "${STATUS_COUNTS[INCONCLUSIVE_TIMEOUT]}"
printf 'Tool errors: %d\n' "${STATUS_COUNTS[INCONCLUSIVE_TOOL_ERROR]}"
printf 'Preparation errors: %d\n' "${STATUS_COUNTS[PREPARATION_ERROR]}"
printf 'Summary: %s\n' "$SUMMARY_FILE"
