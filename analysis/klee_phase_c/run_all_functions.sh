#!/usr/bin/env bash

set -uo pipefail

# Local-only KLEE Phase C runner.
#
# This script invokes only the already prepared per-alarm drivers. It does not
# access the network, install software, or modify original/Eva source artifacts.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPOSITORY_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
RESULTS_ROOT="$SCRIPT_DIR/results"
SUMMARY_FILE="$RESULTS_ROOT/summary.tsv"

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

mkdir -p "$RESULTS_ROOT"
printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
    "Function" \
    "Alarm" \
    "BuildStatus" \
    "KleeStatus" \
    "CompletedPaths" \
    "PartialPaths" \
    "GeneratedTests" \
    "TargetError" \
    "KTest" \
    "Classification" \
    "FailureReason" \
    > "$SUMMARY_FILE"

declare -A CLASSIFICATION_COUNTS=(
    [CONFIRMED]=0
    [NOT_REPRODUCED_COMPLETE]=0
    [INCONCLUSIVE]=0
    [BUILD_FAILED]=0
    [INFRASTRUCTURE_FAILED]=0
)

repository_relative_path() {
    local path="$1"
    printf '%s' "${path#"$REPOSITORY_ROOT/"}"
}

join_with_semicolon() {
    local IFS=';'
    printf '%s' "$*"
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
    if [[ -n "$line" ]]; then
        line="${line//$'\t'/ }"
        line="${line//$'\r'/ }"
        line="${line//$'\n'/ }"
        printf '%s' "$line"
    else
        printf '%s' "$fallback"
    fi
}

next_archive_path() {
    local result_dir="$1"
    local output_basename="$2"
    local candidate="$result_dir/preexisting-$output_basename"
    local number=1

    while [[ -e "$candidate" ]]; do
        candidate="$result_dir/preexisting-$output_basename.$number"
        number=$((number + 1))
    done
    printf '%s' "$candidate"
}

append_summary() {
    local function_name="$1"
    local alarm="$2"
    local build_status="$3"
    local klee_status="$4"
    local completed_paths="$5"
    local partial_paths="$6"
    local generated_tests="$7"
    local target_error="$8"
    local ktest="$9"
    local classification="${10}"
    local failure_reason="${11}"

    printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$function_name" \
        "KLEE-ALARM-$alarm" \
        "$build_status" \
        "$klee_status" \
        "$completed_paths" \
        "$partial_paths" \
        "$generated_tests" \
        "$target_error" \
        "$ktest" \
        "$classification" \
        "$failure_reason" \
        >> "$SUMMARY_FILE"

    CLASSIFICATION_COUNTS["$classification"]=$((CLASSIFICATION_COUNTS["$classification"] + 1))
}

process_alarm() {
    local function_name="$1"
    local alarm="$2"
    local alarm_dir="$SCRIPT_DIR/$function_name/alarm_$alarm"
    local result_dir="$RESULTS_ROOT/$function_name/alarm_$alarm"
    local build_log="$result_dir/build.log"
    local klee_log="$result_dir/klee.log"
    local ktest_log="$result_dir/ktest.log"
    local klee_output_dir="$alarm_dir/build/klee-out-alarm-$alarm"
    local build_status="NOT_RUN"
    local klee_status="NOT_RUN"
    local completed_paths="-"
    local partial_paths="-"
    local generated_tests="-"
    local target_error_field="-"
    local ktest_field="-"
    local classification="INFRASTRUCTURE_FAILED"
    local failure_reason=""
    local build_exit=0
    local klee_exit=0
    local show_exit=0
    local archive_path
    local other_error_count=0
    local blocker_found=0
    local target_err
    local matching_ktest
    local path
    local -a target_errors=()
    local -a target_errors_relative=()
    local -a matching_ktests=()
    local -a matching_ktests_relative=()
    local -a other_errors=()

    mkdir -p "$result_dir"
    : > "$build_log"
    : > "$klee_log"
    : > "$ktest_log"

    printf '[%s] %s alarm_%s\n' "$(date -u '+%Y-%m-%dT%H:%M:%SZ')" "$function_name" "$alarm"

    if [[ ! -d "$alarm_dir" ]]; then
        failure_reason="alarm directory not found: $(repository_relative_path "$alarm_dir")"
        printf '%s\n' "$failure_reason" > "$build_log"
        append_summary "$function_name" "$alarm" "$build_status" "$klee_status" \
            "$completed_paths" "$partial_paths" "$generated_tests" \
            "$target_error_field" "$ktest_field" "$classification" "$failure_reason"
        printf '  classification: %s\n' "$classification"
        return
    fi

    if [[ ! -x "$alarm_dir/build_bitcode.sh" ]]; then
        failure_reason="build_bitcode.sh is missing or not executable"
        printf '%s\n' "$failure_reason" > "$build_log"
        append_summary "$function_name" "$alarm" "$build_status" "$klee_status" \
            "$completed_paths" "$partial_paths" "$generated_tests" \
            "$target_error_field" "$ktest_field" "$classification" "$failure_reason"
        printf '  classification: %s\n' "$classification"
        return
    fi

    (
        cd "$alarm_dir" || exit 125
        ./build_bitcode.sh
    ) > "$build_log" 2>&1
    build_exit=$?

    if (( build_exit != 0 )); then
        build_status="FAILED($build_exit)"
        classification="BUILD_FAILED"
        failure_reason="$(first_failure_line "$build_log" "build_bitcode.sh exited with status $build_exit")"
        printf 'Not run because build failed.\n' > "$klee_log"
        printf 'Not run because KLEE was not run.\n' > "$ktest_log"
        append_summary "$function_name" "$alarm" "$build_status" "$klee_status" \
            "$completed_paths" "$partial_paths" "$generated_tests" \
            "$target_error_field" "$ktest_field" "$classification" "$failure_reason"
        printf '  classification: %s\n' "$classification"
        return
    fi
    build_status="SUCCESS"

    if [[ ! -x "$alarm_dir/run_klee.sh" ]]; then
        failure_reason="run_klee.sh is missing or not executable"
        printf '%s\n' "$failure_reason" > "$klee_log"
        printf 'Not run because the KLEE driver was unavailable.\n' > "$ktest_log"
        append_summary "$function_name" "$alarm" "$build_status" "$klee_status" \
            "$completed_paths" "$partial_paths" "$generated_tests" \
            "$target_error_field" "$ktest_field" "$classification" "$failure_reason"
        printf '  classification: %s\n' "$classification"
        return
    fi

    if [[ -d "$klee_output_dir" ]]; then
        archive_path="$(next_archive_path "$result_dir" "klee-out-alarm-$alarm")"
        if ! mv "$klee_output_dir" "$archive_path" >> "$klee_log" 2>&1; then
            klee_status="NOT_RUN"
            failure_reason="could not archive the pre-existing KLEE output directory"
            printf 'Not run because the previous KLEE output could not be archived.\n' > "$ktest_log"
            append_summary "$function_name" "$alarm" "$build_status" "$klee_status" \
                "$completed_paths" "$partial_paths" "$generated_tests" \
                "$target_error_field" "$ktest_field" "$classification" "$failure_reason"
            printf '  classification: %s\n' "$classification"
            return
        fi
        printf 'Archived pre-existing output as: %s\n' \
            "$(repository_relative_path "$archive_path")" >> "$klee_log"
    fi

    (
        cd "$alarm_dir" || exit 125
        ./run_klee.sh
    ) >> "$klee_log" 2>&1
    klee_exit=$?

    completed_paths="$(last_klee_stat 'completed paths' "$klee_log")"
    partial_paths="$(last_klee_stat 'partially completed paths' "$klee_log")"
    generated_tests="$(last_klee_stat 'generated tests' "$klee_log")"

    shopt -s nullglob
    target_errors=("$klee_output_dir"/*.klee-alarm-"$alarm".err)
    other_errors=("$klee_output_dir"/*.err)
    shopt -u nullglob

    for target_err in "${target_errors[@]}"; do
        target_errors_relative+=("$(repository_relative_path "$target_err")")
        matching_ktest="${target_err%.klee-alarm-$alarm.err}.ktest"
        if [[ -f "$matching_ktest" ]]; then
            matching_ktests+=("$matching_ktest")
            matching_ktests_relative+=("$(repository_relative_path "$matching_ktest")")
        fi
    done

    for path in "${other_errors[@]}"; do
        if [[ "$path" != *.klee-alarm-"$alarm".err ]]; then
            other_error_count=$((other_error_count + 1))
        fi
    done

    if (( ${#target_errors_relative[@]} > 0 )); then
        target_error_field="$(join_with_semicolon "${target_errors_relative[@]}")"
    fi
    if (( ${#matching_ktests_relative[@]} > 0 )); then
        ktest_field="$(join_with_semicolon "${matching_ktests_relative[@]}")"
    fi

    if (( klee_exit == 0 )); then
        klee_status="SUCCESS"
    else
        klee_status="FAILED($klee_exit)"
    fi

    if (( ${#target_errors[@]} > 0 && ${#matching_ktests[@]} > 0 )); then
        classification="CONFIRMED"
        if (( klee_exit != 0 )); then
            failure_reason="$(first_failure_line "$klee_log" "run_klee.sh exited with status $klee_exit after producing target evidence")"
        fi
    elif (( klee_exit != 0 )); then
        failure_reason="$(first_failure_line "$klee_log" "run_klee.sh exited with status $klee_exit")"
        if grep -q '^KLEE:' "$klee_log" || [[ -f "$klee_output_dir/info" ]]; then
            classification="INCONCLUSIVE"
        else
            classification="INFRASTRUCTURE_FAILED"
        fi
    elif (( ${#target_errors[@]} > 0 )); then
        classification="INCONCLUSIVE"
        failure_reason="target error exists, but no matching KTest was found"
    else
        if grep -Eqi 'undefined reference|unsupported|solver[^[:alnum:]]*(failure|failed|error)|timed out|timeout|memory limit|halting execution|unable to load|external call' "$klee_log"; then
            blocker_found=1
        fi

        if [[ "$completed_paths" != "-" && "$partial_paths" == "0" ]] \
            && (( other_error_count == 0 && blocker_found == 0 )); then
            classification="NOT_REPRODUCED_COMPLETE"
        else
            classification="INCONCLUSIVE"
            if (( other_error_count > 0 )); then
                failure_reason="$other_error_count non-target KLEE error artifact(s) were generated"
            elif (( blocker_found != 0 )); then
                failure_reason="KLEE log contains an unsupported/solver/resource/external-call limitation"
            elif [[ "$partial_paths" != "0" ]]; then
                failure_reason="KLEE did not report zero partially completed paths"
            else
                failure_reason="KLEE completion statistics were unavailable"
            fi
        fi
    fi

    if (( ${#matching_ktests[@]} > 0 )); then
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
        printf 'No target-specific KTest was available; show_ktest.sh was not run.\n' > "$ktest_log"
    fi

    append_summary "$function_name" "$alarm" "$build_status" "$klee_status" \
        "$completed_paths" "$partial_paths" "$generated_tests" \
        "$target_error_field" "$ktest_field" "$classification" "$failure_reason"
    printf '  classification: %s\n' "$classification"
}

for specification in "${FUNCTION_SPECS[@]}"; do
    IFS=':' read -r function_name first_alarm last_alarm <<< "$specification"
    first_number=$((10#$first_alarm))
    last_number=$((10#$last_alarm))

    printf '\n=== Function: %s (alarms %s-%s) ===\n' \
        "$function_name" "$first_alarm" "$last_alarm"

    for ((alarm_number = first_number; alarm_number <= last_number; alarm_number++)); do
        printf -v alarm '%04d' "$alarm_number"
        process_alarm "$function_name" "$alarm"
    done
done

printf '\n=== Phase C summary ===\n'
printf 'CONFIRMED: %d\n' "${CLASSIFICATION_COUNTS[CONFIRMED]}"
printf 'NOT_REPRODUCED_COMPLETE: %d\n' "${CLASSIFICATION_COUNTS[NOT_REPRODUCED_COMPLETE]}"
printf 'INCONCLUSIVE: %d\n' "${CLASSIFICATION_COUNTS[INCONCLUSIVE]}"
printf 'BUILD_FAILED: %d\n' "${CLASSIFICATION_COUNTS[BUILD_FAILED]}"
printf 'INFRASTRUCTURE_FAILED: %d\n' "${CLASSIFICATION_COUNTS[INFRASTRUCTURE_FAILED]}"
printf 'Summary: %s\n' "$SUMMARY_FILE"
