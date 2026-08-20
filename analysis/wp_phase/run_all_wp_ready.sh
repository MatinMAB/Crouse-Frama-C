#!/usr/bin/env bash
set -euo pipefail

# WARNING:
# This script performs the actual WP verification campaign.
# Do not run automatically.

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
targets=(
  KLEE-ALARM-0001
  KLEE-ALARM-0004
  KLEE-ALARM-0007
  KLEE-ALARM-0008
  KLEE-ALARM-0011
  KLEE-ALARM-0016
  KLEE-ALARM-0017
  KLEE-ALARM-0018
  KLEE-ALARM-0022
  KLEE-ALARM-0043
  KLEE-ALARM-0044
  KLEE-ALARM-0053
  KLEE-ALARM-0058
  KLEE-ALARM-0063
  KLEE-ALARM-0095
  KLEE-ALARM-0096
  KLEE-ALARM-0097
  KLEE-ALARM-0099
  KLEE-ALARM-0104
  KLEE-ALARM-0105
  KLEE-ALARM-0106
  KLEE-ALARM-0107
  KLEE-ALARM-0108
  KLEE-ALARM-0109
  KLEE-ALARM-0110
  KLEE-ALARM-0111
  KLEE-ALARM-0112
  KLEE-ALARM-0113
  KLEE-ALARM-0114
  KLEE-ALARM-0115
  KLEE-ALARM-0116
  KLEE-ALARM-0119
)

printf "Running %d WP_READY targets.\n" "${#targets[@]}"
for alarm_id in "${targets[@]}"; do
  "$SCRIPT_DIR/run_one.sh" "$alarm_id" terminal
done
