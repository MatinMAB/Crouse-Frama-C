#!/usr/bin/env bash
set -euo pipefail

# FINAL SHIFT WP CAMPAIGN — 13 NEWLY SEMANTICALLY RESOLVED TARGETS ONLY
#
# This script intentionally excludes the 35 previously verified targets and
# all 101 runtime-only properties. It performs target-property-only WP and
# does not enable runtime-error goal generation. Do not run it during preparation/review.

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
targets=(
  KLEE-ALARM-0002
  KLEE-ALARM-0003
  KLEE-ALARM-0005
  KLEE-ALARM-0006
  KLEE-ALARM-0009
  KLEE-ALARM-0010
  KLEE-ALARM-0012
  KLEE-ALARM-0013
  KLEE-ALARM-0014
  KLEE-ALARM-0015
  KLEE-ALARM-0019
  KLEE-ALARM-0020
  KLEE-ALARM-0021
)

printf 'Running %d final shift targets.\n' "${#targets[@]}"
for alarm_id in "${targets[@]}"; do
  "$SCRIPT_DIR/run_one.sh" "$alarm_id" terminal
done
