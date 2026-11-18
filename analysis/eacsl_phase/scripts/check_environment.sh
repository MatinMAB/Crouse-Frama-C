#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
source "$SCRIPT_DIR/common.sh"

failures=0
require_command() {
  local name=$1 command_name=$2
  if command -v "$command_name" >/dev/null 2>&1; then
    printf '%-18s %s\n' "$name" "$(command -v "$command_name")"
  else
    printf 'ERROR: missing %s (%s)\n' "$name" "$command_name" >&2
    failures=$((failures + 1))
  fi
}

require_command Frama-C "$FRAMAC"
require_command e-acsl-gcc "$EACSL_GCC"
require_command C-compiler "$CC"
require_command GNU-time "$TIME_BIN"
require_command taskset "$TASKSET"
require_command Python python3

[[ $EACSL_CPU_ID =~ ^[0-9]+$ ]] || {
  printf 'ERROR: EACSL_CPU_ID must be a non-negative integer\n' >&2
  failures=$((failures + 1))
}
if command -v "$TASKSET" >/dev/null 2>&1 && [[ $EACSL_CPU_ID =~ ^[0-9]+$ ]]; then
  "$TASKSET" -c "$EACSL_CPU_ID" true >/dev/null 2>&1 || {
    printf 'ERROR: CPU %s is unavailable for taskset pinning\n' "$EACSL_CPU_ID" >&2
    failures=$((failures + 1))
  }
fi

if (( failures == 0 )); then
  version=$($FRAMAC -version)
  printf 'Frama-C version: %s\n' "$version"
  [[ $version == "33.0 (Arsenic)" ]] || {
    printf 'ERROR: frozen workflow requires Frama-C 33.0 (Arsenic), found %s\n' "$version" >&2
    failures=$((failures + 1))
  }
  $FRAMAC -e-acsl-help >/dev/null 2>&1 || {
    printf 'ERROR: stock E-ACSL plugin is unavailable\n' >&2
    failures=$((failures + 1))
  }
  share=$($FRAMAC -print-share-path)/e-acsl
  [[ -d $share ]] || {
    printf 'ERROR: E-ACSL runtime share directory missing: %s\n' "$share" >&2
    failures=$((failures + 1))
  }
  printf 'E-ACSL share: %s\n' "$share"
  printf 'Compiler: %s\n' "$($CC --version | head -1)"
fi

for required in \
  "$EACSL_PHASE_DIR/data/eacsl_selection_matrix.tsv" \
  "$EACSL_PHASE_DIR/data/eacsl_targets.tsv" \
  "$EACSL_PHASE_DIR/scenarios/harness/thesis_runtime_harness.c" \
  "$EACSL_REPO_ROOT/analysis/repair_phase/149_ACSL_PROPERTY_MAP.tsv" \
  "$EACSL_REPO_ROOT/analysis/wp_phase/data/wp_targets.tsv"; do
  [[ -f $required ]] || { printf 'ERROR: missing required file %s\n' "$required" >&2; failures=$((failures + 1)); }
done

printf 'Tool identity: stock Frama-C E-ACSL (not custom E-ACSL2)\n'
if (( failures )); then
  printf 'Environment validation: FAIL (%d issue(s))\n' "$failures" >&2
  exit 1
fi
printf 'Environment validation: PASS\n'
