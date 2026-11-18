#!/usr/bin/env bash
set -euo pipefail

EACSL_PHASE_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)
EACSL_REPO_ROOT=$(cd -- "$EACSL_PHASE_DIR/../.." && pwd -P)
FRAMAC=${FRAMAC:-frama-c}
EACSL_GCC=${EACSL_GCC:-e-acsl-gcc}
CC=${CC:-gcc}
TIME_BIN=${TIME_BIN:-/usr/bin/time}
TASKSET=${TASKSET:-taskset}
EACSL_CPU_ID=${EACSL_CPU_ID:-0}
EACSL_SOURCE_NAMES=(MulHword.c avrg_Ccode.c div_Ccode.c hip_Ccode.c mul_Ccode.c rotatefunc.c)

eacsl_selected_count() {
  case "$1" in
    control) printf '0\n' ;;
    full) printf '149\n' ;;
    selective) printf '101\n' ;;
    *) printf 'unknown scenario: %s\n' "$1" >&2; return 2 ;;
  esac
}

eacsl_source_args() {
  local scenario=$1 source_name
  for source_name in "${EACSL_SOURCE_NAMES[@]}"; do
    printf '%s\n' "$EACSL_PHASE_DIR/work/generated/$scenario/sources/$source_name"
  done
}

eacsl_assert_generated_selection() {
  local generated=$1 scenario=$2 expected
  expected=$(eacsl_selected_count "$scenario")
  python3 - "$generated" "$expected" <<'PY'
import re,sys
text=open(sys.argv[1],encoding="utf-8").read()
labels=re.findall(r'\.name\s*=\s*"(eva_klee_alarm_\d{4})"',text)
expected=int(sys.argv[2])
if len(labels)!=len(set(labels)) or len(labels)!=expected:
    raise SystemExit(f"generated selection mismatch: sites={len(labels)}, unique={len(set(labels))}, expected={expected}")
print(f"selection validated: {len(labels)} unique target-check sites")
PY
}

eacsl_latest_build() {
  local pointer="$EACSL_PHASE_DIR/work/LATEST_BUILD"
  [[ -f $pointer ]] || { printf 'no build exists; run build_scenarios.sh first\n' >&2; return 1; }
  local directory
  directory=$(<"$pointer")
  [[ -d $directory ]] || { printf 'stale build pointer: %s\n' "$directory" >&2; return 1; }
  printf '%s\n' "$directory"
}
