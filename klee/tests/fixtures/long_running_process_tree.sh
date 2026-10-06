#!/usr/bin/env bash
set -eu

test_dir="$1"
printf '%s\n' "$$" > "$test_dir/parent.pid"
sleep 60 &
child_pid=$!
printf '%s\n' "$child_pid" > "$test_dir/child.pid"
wait "$child_pid"
