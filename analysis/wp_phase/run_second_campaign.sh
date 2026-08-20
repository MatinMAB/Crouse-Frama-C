#!/usr/bin/env bash
set -euo pipefail

# SECOND WP CAMPAIGN — NEWLY RESOLVED REPAIR-POLICY TARGETS ONLY
#
# This script performs the later terminal WP experiment. It intentionally
# excludes the 32 targets from the frozen first campaign. Do not run it while
# preparing or reviewing the repair-policy phase.

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
targets=(
  KLEE-ALARM-0061
  KLEE-ALARM-0066
  KLEE-ALARM-0144
)

printf 'Running %d newly repaired targets in the second WP campaign.\n' "${#targets[@]}"
for alarm_id in "${targets[@]}"; do
  "$SCRIPT_DIR/run_one.sh" "$alarm_id" terminal
done
