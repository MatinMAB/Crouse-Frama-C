#!/usr/bin/env bash

set -o pipefail

KLEE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO_ROOT="$(cd "$KLEE_DIR/.." && pwd)"
MANIFEST="$KLEE_DIR/manifest.tsv"
RESULTS_DIR="$KLEE_DIR/results"

CLANG="${CLANG:-clang}"
LLVM_LINK="${LLVM_LINK:-llvm-link}"
LLVM_DIS="${LLVM_DIS:-llvm-dis}"
KLEE="${KLEE:-klee}"
KTEST_TOOL="${KTEST_TOOL:-ktest-tool}"
GNU_TIMEOUT="${GNU_TIMEOUT:-timeout}"
if [[ "$KTEST_TOOL" == "ktest-tool" ]] \
    && ! command -v "$KTEST_TOOL" >/dev/null 2>&1 \
    && command -v klee.ktest-tool >/dev/null 2>&1; then
    KTEST_TOOL="klee.ktest-tool"
fi

die()
{
    printf 'error: %s\n' "$*" >&2
    exit 1
}

require_command()
{
    command -v "$1" >/dev/null 2>&1 || {
        printf 'missing required tool: %s\n' "$1" >&2
        return 1
    }
}

validate_alarm_id()
{
    [[ "$1" =~ ^KLEE-ALARM-[0-9]{4}$ ]] || die "invalid alarm ID: $1"
}

manifest_row()
{
    local alarm_id="$1"
    awk -F '\t' -v wanted="$alarm_id" \
        'NR > 1 && $1 == wanted { print; found++ } END { if (found != 1) exit 1 }' \
        "$MANIFEST"
}

normalize_max_time()
{
    local value="$1"
    if [[ "$value" =~ ^[1-9][0-9]*$ ]]; then
        printf '%ss\n' "$value"
    elif [[ "$value" =~ ^([1-9][0-9]*)s$ ]]; then
        printf '%ss\n' "${BASH_REMATCH[1]}"
    elif [[ "$value" =~ ^([1-9][0-9]*)(m|min)$ ]]; then
        printf '%ss\n' "$((BASH_REMATCH[1] * 60))"
    elif [[ "$value" =~ ^([1-9][0-9]*)h$ ]]; then
        printf '%ss\n' "$((BASH_REMATCH[1] * 3600))"
    else
        die "invalid --max-time '$value' (use a positive duration such as 60, 60s, 5m, 5min, or 1h)"
    fi
}

add_duration_seconds()
{
    local first="$(normalize_max_time "$1")"
    local second="$(normalize_max_time "$2")"
    printf '%ss\n' "$(( ${first%s} + ${second%s} ))"
}

run_with_hard_timeout()
{
    local max_time="$1"
    local kill_after="$2"
    local watchdog_pid
    local watchdog_exit
    local cleanup_attempt
    shift 2

    "$GNU_TIMEOUT" --verbose --signal=TERM --kill-after="$kill_after" \
        "$max_time" "$@" &
    watchdog_pid=$!
    if wait "$watchdog_pid"; then
        watchdog_exit=0
    else
        watchdog_exit=$?
    fi

    if is_watchdog_timeout_exit "$watchdog_exit"; then
        # GNU timeout uses its PID as the process-group ID unless --foreground
        # is requested. Re-kill and briefly verify that no live descendant in
        # that group survives a watchdog expiry.
        kill -KILL -- "-$watchdog_pid" 2>/dev/null || true
        for ((cleanup_attempt = 0; cleanup_attempt < 100; cleanup_attempt++)); do
            process_group_has_live_members "$watchdog_pid" || break
            if (( cleanup_attempt > 0 && cleanup_attempt % 20 == 0 )); then
                kill -KILL -- "-$watchdog_pid" 2>/dev/null || true
            fi
            sleep 0.05
        done
        if process_group_has_live_members "$watchdog_pid"; then
            printf 'warning: live process remains in timed-out process group %s\n' \
                "$watchdog_pid" >&2
        fi
    fi

    return "$watchdog_exit"
}

is_watchdog_timeout_exit()
{
    [[ "$1" == "124" || "$1" == "137" ]]
}

klee_timed_out()
{
    local exit_status="$1"
    local run_log="$2"
    is_watchdog_timeout_exit "$exit_status" || \
        grep -Eqi 'HaltTimer invoked|time limit|max-time|timed out|watchdog.*time' \
            "$run_log"
}

process_group_has_live_members()
{
    local process_group="$1"
    ps -eo pgid=,stat= | awk -v wanted="$process_group" \
        '$1 == wanted && $2 !~ /^Z/ { found=1 } END { exit !found }'
}

write_duration_seconds()
{
    local started_ns="$1"
    local ended_ns="$2"
    local output_file="$3"
    awk -v start="$started_ns" -v end="$ended_ns" \
        'BEGIN { printf "%.3f\n", (end-start)/1000000000 }' > "$output_file"
}

resolve_klee_include()
{
    local candidate
    if [[ -n "${KLEE_INCLUDE:-}" ]]; then
        [[ -f "$KLEE_INCLUDE/klee/klee.h" ]] || return 1
        printf '%s\n' "$KLEE_INCLUDE"
        return 0
    fi
    if printf '#include <klee/klee.h>\n' | "$CLANG" -E -x c - >/dev/null 2>&1; then
        printf '%s\n' ""
        return 0
    fi
    for candidate in /usr/local/include /usr/include /snap/klee/current/usr/local/include; do
        if [[ -f "$candidate/klee/klee.h" ]]; then
            printf '%s\n' "$candidate"
            return 0
        fi
    done
    return 1
}

tool_major_version()
{
    "$1" --version 2>&1 | sed -nE \
        's/.*(version |LLVM version )([0-9]+)(\.[0-9]+)*.*/\2/p' | head -n 1
}
