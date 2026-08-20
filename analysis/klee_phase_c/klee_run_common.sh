#!/usr/bin/env bash

# Shared execution-control support for KLEE Phase C alarm drivers.
# This file is sourced by run_klee.sh and run_all_functions.sh.

phase_c_utc_now() {
    date -u '+%Y-%m-%dT%H:%M:%SZ'
}

phase_c_next_archive_path() {
    local archive_root="$1"
    local base_name="$2"
    local candidate="$archive_root/preexisting-$base_name"
    local number=1

    while [[ -e "$candidate" ]]; do
        candidate="$archive_root/preexisting-$base_name.$number"
        number=$((number + 1))
    done
    printf '%s' "$candidate"
}

phase_c_join_semicolon() {
    local IFS=';'
    printf '%s' "$*"
}

phase_c_write_status() {
    local status_file="$1"
    local alarm_id="$2"
    local started_at="$3"
    local finished_at="$4"
    local timeout_seconds="$5"
    local elapsed_seconds="$6"
    local exit_code="$7"
    local final_status="$8"
    local target_error="$9"
    local generated_tests="${10}"
    local total_error_files="${11}"
    local temporary_status="$status_file.tmp.$$"

    mkdir -p "$(dirname "$status_file")"
    {
        printf 'alarm_id=%s\n' "$alarm_id"
        printf 'started_at=%s\n' "$started_at"
        printf 'finished_at=%s\n' "$finished_at"
        printf 'timeout_seconds=%s\n' "$timeout_seconds"
        printf 'elapsed_seconds=%s\n' "$elapsed_seconds"
        printf 'exit_code=%s\n' "$exit_code"
        printf 'final_status=%s\n' "$final_status"
        printf 'target_error=%s\n' "$target_error"
        if [[ -n "$generated_tests" ]]; then
            printf 'generated_tests=%s\n' "$generated_tests"
        fi
        if [[ -n "$total_error_files" ]]; then
            printf 'total_error_files=%s\n' "$total_error_files"
        fi
    } > "$temporary_status"
    mv "$temporary_status" "$status_file"
}

phase_c_archive_previous_run() {
    local output_dir="$1"
    local status_file="$2"
    local archive_root="$3"
    local archive_path=""
    local status_archive=""

    if [[ -d "$output_dir" ]]; then
        mkdir -p "$archive_root"
        archive_path="$(phase_c_next_archive_path "$archive_root" "$(basename "$output_dir")")"
        mv "$output_dir" "$archive_path"
        printf 'Archived previous KLEE output: %s\n' "$archive_path"
        if [[ -f "$status_file" ]]; then
            status_archive="$(phase_c_next_archive_path "$archive_root" "$(basename "$status_file")")"
            mv "$status_file" "$status_archive"
            printf 'Archived previous KLEE status: %s\n' "$status_archive"
        fi
    elif [[ -f "$status_file" ]]; then
        mkdir -p "$archive_root"
        status_archive="$(phase_c_next_archive_path "$archive_root" "$(basename "$status_file")")"
        mv "$status_file" "$status_archive"
        printf 'Archived previous KLEE status: %s\n' "$status_archive"
    fi
}

phase_c_archive_previous_status() {
    local status_file="$1"
    local archive_root="$2"
    local status_archive=""

    if [[ -f "$status_file" ]]; then
        mkdir -p "$archive_root"
        status_archive="$(phase_c_next_archive_path "$archive_root" "$(basename "$status_file")")"
        mv "$status_file" "$status_archive"
        printf 'Archived previous KLEE status: %s\n' "$status_archive"
    fi
}

phase_c_run_klee() {
    local alarm_id="$1"
    local bitcode="$2"
    local output_dir="$3"
    local status_file="$4"
    local timeout_seconds="${KLEE_TIMEOUT_SECONDS:-1800}"
    local kill_after_seconds="${KLEE_TIMEOUT_KILL_AFTER_SECONDS:-30}"
    local timeout_command="${GNU_TIMEOUT_COMMAND:-timeout}"
    local alarm_dir=""
    local function_dir=""
    local phase_c_root=""
    local default_archive_root=""
    local archive_root=""
    local started_at=""
    local finished_at=""
    local start_epoch=0
    local finish_epoch=0
    local elapsed_seconds=0
    local exit_code=0
    local final_status="INCONCLUSIVE_TOOL_ERROR"
    local target_error=""
    local generated_tests=""
    local total_error_files=""
    local timed_out=0
    local target_path
    local -a target_errors=()
    local -a target_errors_relative=()
    local -a generated_test_files=()
    local -a all_error_files=()

    alarm_dir="$(dirname "$(dirname "$output_dir")")"
    function_dir="$(dirname "$alarm_dir")"
    phase_c_root="$(dirname "$function_dir")"
    default_archive_root="$phase_c_root/results/$(basename "$function_dir")/$(basename "$alarm_dir")"
    archive_root="${KLEE_ARCHIVE_DIR:-$default_archive_root}"

    if [[ ! "$timeout_seconds" =~ ^[1-9][0-9]*$ ]]; then
        phase_c_archive_previous_status "$status_file" "$archive_root"
        started_at="$(phase_c_utc_now)"
        phase_c_write_status "$status_file" "$alarm_id" "$started_at" "$started_at" \
            "$timeout_seconds" 0 2 "INCONCLUSIVE_TOOL_ERROR" "" "" ""
        printf 'Invalid KLEE_TIMEOUT_SECONDS: %s\n' "$timeout_seconds" >&2
        return 2
    fi

    if [[ ! "$kill_after_seconds" =~ ^[1-9][0-9]*$ ]]; then
        phase_c_archive_previous_status "$status_file" "$archive_root"
        started_at="$(phase_c_utc_now)"
        phase_c_write_status "$status_file" "$alarm_id" "$started_at" "$started_at" \
            "$timeout_seconds" 0 2 "INCONCLUSIVE_TOOL_ERROR" "" "" ""
        printf 'Invalid KLEE_TIMEOUT_KILL_AFTER_SECONDS: %s\n' "$kill_after_seconds" >&2
        return 2
    fi

    if [[ ! -f "$bitcode" ]]; then
        phase_c_archive_previous_status "$status_file" "$archive_root"
        started_at="$(phase_c_utc_now)"
        phase_c_write_status "$status_file" "$alarm_id" "$started_at" "$started_at" \
            "$timeout_seconds" 0 1 "PREPARATION_ERROR" "" "" ""
        printf '%s\n' \
            'Bitcode not found.' \
            'Run:' \
            '  ./build_bitcode.sh' >&2
        return 1
    fi

    if ! command -v "$timeout_command" >/dev/null 2>&1; then
        phase_c_archive_previous_status "$status_file" "$archive_root"
        started_at="$(phase_c_utc_now)"
        phase_c_write_status "$status_file" "$alarm_id" "$started_at" "$started_at" \
            "$timeout_seconds" 0 127 "INCONCLUSIVE_TOOL_ERROR" "" "" ""
        printf 'GNU timeout command not found: %s\n' "$timeout_command" >&2
        return 127
    fi

    if ! command -v klee >/dev/null 2>&1; then
        phase_c_archive_previous_status "$status_file" "$archive_root"
        started_at="$(phase_c_utc_now)"
        phase_c_write_status "$status_file" "$alarm_id" "$started_at" "$started_at" \
            "$timeout_seconds" 0 127 "INCONCLUSIVE_TOOL_ERROR" "" "" ""
        printf 'KLEE executable not found in PATH.\n' >&2
        return 127
    fi

    if ! phase_c_archive_previous_run "$output_dir" "$status_file" "$archive_root"; then
        started_at="$(phase_c_utc_now)"
        phase_c_write_status "$status_file" "$alarm_id" "$started_at" "$started_at" \
            "$timeout_seconds" 0 1 "INCONCLUSIVE_TOOL_ERROR" "" "" ""
        printf 'Could not archive previous KLEE evidence.\n' >&2
        return 1
    fi

    started_at="$(phase_c_utc_now)"
    start_epoch="$(date +%s)"

    if "$timeout_command" \
        --signal=TERM \
        --kill-after="${kill_after_seconds}s" \
        "${timeout_seconds}s" \
        klee \
        --output-dir="$output_dir" \
        "$bitcode"; then
        exit_code=0
    else
        exit_code=$?
    fi

    finish_epoch="$(date +%s)"
    finished_at="$(phase_c_utc_now)"
    elapsed_seconds=$((finish_epoch - start_epoch))

    shopt -s nullglob
    target_errors=("$output_dir"/*.klee-alarm-"$alarm_id".err)
    generated_test_files=("$output_dir"/*.ktest)
    all_error_files=("$output_dir"/*.err)
    shopt -u nullglob

    for target_path in "${target_errors[@]}"; do
        target_errors_relative+=("$target_path")
    done
    if (( ${#target_errors_relative[@]} > 0 )); then
        target_error="$(phase_c_join_semicolon "${target_errors_relative[@]}")"
    fi

    generated_tests="${#generated_test_files[@]}"
    total_error_files="${#all_error_files[@]}"

    if (( exit_code == 124 )); then
        timed_out=1
    elif (( exit_code == 137 && elapsed_seconds >= timeout_seconds )); then
        timed_out=1
    fi

    if (( ${#target_errors[@]} > 0 )); then
        final_status="CONFIRMED_COUNTEREXAMPLE"
    elif (( timed_out != 0 )); then
        final_status="INCONCLUSIVE_TIMEOUT"
    elif (( exit_code == 0 )); then
        final_status="NO_COUNTEREXAMPLE_FOUND"
    else
        final_status="INCONCLUSIVE_TOOL_ERROR"
    fi

    phase_c_write_status "$status_file" "$alarm_id" "$started_at" "$finished_at" \
        "$timeout_seconds" "$elapsed_seconds" "$exit_code" "$final_status" \
        "$target_error" "$generated_tests" "$total_error_files"

    printf 'KLEE Phase C status: %s\n' "$final_status"
    printf 'Status file: %s\n' "$status_file"
    return "$exit_code"
}
