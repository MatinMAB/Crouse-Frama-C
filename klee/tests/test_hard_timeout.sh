#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=../scripts/common.sh
source "$SCRIPT_DIR/../scripts/common.sh"

assert_equal()
{
    local expected="$1"
    local actual="$2"
    [[ "$actual" == "$expected" ]] || \
        die "expected '$expected', got '$actual'"
}

assert_equal 2s "$(normalize_max_time 2)"
assert_equal 2s "$(normalize_max_time 2s)"
assert_equal 60s "$(normalize_max_time 1m)"
assert_equal 300s "$(normalize_max_time 5min)"
assert_equal 3600s "$(normalize_max_time 1h)"
assert_equal 3605s "$(add_duration_seconds 1h 5s)"

for cli_duration in 2 2s 1m; do
    set +e
    cli_output="$("$SCRIPT_DIR/../scripts/run_one.sh" \
        KLEE-ALARM-9999 --max-time "$cli_duration" 2>&1)"
    cli_exit=$?
    set -e
    (( cli_exit != 0 )) || die "absent test alarm unexpectedly succeeded"
    grep -q 'is absent from' <<< "$cli_output" || \
        die "run_one rejected supported --max-time value '$cli_duration': $cli_output"
done

run_with_hard_timeout 2s 1s bash -c 'exit 0'
short_exit=$?
assert_equal 0 "$short_exit"

test_dir="$(mktemp -d)"
trap 'rm -rf -- "$test_dir"' EXIT

started="$SECONDS"
set +e
run_with_hard_timeout 2s 1s \
    "$SCRIPT_DIR/fixtures/long_running_process_tree.sh" "$test_dir"
watchdog_exit=$?
set -e
elapsed=$((SECONDS - started))

is_watchdog_timeout_exit "$watchdog_exit" || \
    die "long-running command was not classified as TIMEOUT (exit=$watchdog_exit)"
status=TIMEOUT
printf '%s\n' "$status" > "$test_dir/status.txt"
assert_equal TIMEOUT "$(cat "$test_dir/status.txt")"
(( elapsed >= 2 && elapsed <= 5 )) || \
    die "hard timeout elapsed outside expected 2-5s range: ${elapsed}s"

sleep 0.2
for pid_file in "$test_dir/parent.pid" "$test_dir/child.pid"; do
    pid="$(cat "$pid_file")"
    if kill -0 "$pid" 2>/dev/null; then
        state="$(ps -o stat= -p "$pid" 2>/dev/null || true)"
        [[ "$state" == Z* ]] || die "watchdog left process $pid running (state=$state)"
    fi
done

printf 'KLEE: WARNING: KLEE: WATCHDOG: time expired\n' \
    > "$test_dir/klee-watchdog.log"
klee_timed_out 1 "$test_dir/klee-watchdog.log" || \
    die "KLEE watchdog log was not classified as TIMEOUT"

set +e
run_with_hard_timeout 1s 1s bash -c \
    'trap "" TERM; while :; do sleep 1; done'
forced_exit=$?
set -e
assert_equal 137 "$forced_exit"
is_watchdog_timeout_exit "$forced_exit" || \
    die "SIGKILL watchdog exit was not classified as TIMEOUT"

printf 'hard-timeout tests passed (TERM exit=%d, KILL exit=%d, elapsed=%ds)\n' \
    "$watchdog_exit" "$forced_exit" "$elapsed"
