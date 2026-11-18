#!/usr/bin/env bash
set -euo pipefail
ulimit -c 0
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
source "$SCRIPT_DIR/common.sh"
usage() { printf 'Usage: %s <control|full|selective> <performance|observation> [VALUE]\n' "$0"; }
[[ $# -ge 2 ]] || { usage >&2; exit 2; }
scenario=$1 mode=$2 value=${3:-}
eacsl_selected_count "$scenario" >/dev/null
build_dir=$(eacsl_latest_build)
binary="$build_dir/$scenario"
[[ -x $binary ]] || { printf 'missing executable: %s\n' "$binary" >&2; exit 1; }
stamp=$(date -u +%Y%m%d-%H%M%S-%NZ)
result_dir="$EACSL_PHASE_DIR/work/runs/$stamp/$scenario-$mode"
mkdir -p "$result_dir"
expected_label=NOT_APPLICABLE
case "$mode" in
  performance)
    iterations=${value:-100000}
    [[ $iterations =~ ^[1-9][0-9]*$ ]] || { printf 'iterations must be positive\n' >&2; exit 2; }
    args=(p "$iterations")
    ;;
  observation)
    [[ $scenario == selective ]] || { printf 'property observation is defined for selective only\n' >&2; exit 2; }
    [[ -n $value ]] || { printf 'observation requires OBS-NNN\n' >&2; exit 2; }
    row=$(awk -F '\t' -v id="$value" 'NR>1 && $1==id {print $0}' "$EACSL_PHASE_DIR/evidence/historical/observation_cases.tsv")
    [[ -n $row ]] || { printf 'unknown observation case: %s\n' "$value" >&2; exit 2; }
    expected_label=$(printf '%s\n' "$row" | cut -f2)
    function_id=$(printf '%s\n' "$row" | cut -f5)
    profile=$(printf '%s\n' "$row" | cut -f6)
    args=(o "$function_id" "$profile")
    ;;
  *) usage >&2; exit 2 ;;
esac
start_utc=$(date --iso-8601=seconds --utc)
start=$(date +%s%N)
set +e
"$TIME_BIN" -v -o "$result_dir/time.txt" "$TASKSET" -c "$EACSL_CPU_ID" \
  "$binary" "${args[@]}" >"$result_dir/stdout.txt" 2>"$result_dir/stderr.txt"
code=$?
set -e
end=$(date +%s%N)
end_utc=$(date --iso-8601=seconds --utc)
printf '%s\n' "$code" > "$result_dir/exit_code.txt"
printf '%s\n' "$((end-start))" > "$result_dir/wall_nanoseconds.txt"
observed=$(grep -Eo 'eva_klee_alarm_[0-9]{4}' "$result_dir/stderr.txt" | head -1 || true)
if [[ $mode == performance ]]; then
  if [[ $code == 0 && -z $observed ]]; then status=NO_VIOLATION_OBSERVED
  else status=EXECUTION_FAILED
  fi
elif [[ $code == 0 ]]; then status=NO_VIOLATION_OBSERVED
elif [[ $observed == "$expected_label" ]]; then status=RUNTIME_VIOLATION
elif [[ -n $observed ]]; then status=NOT_REACHED
else status=AMBIGUOUS_OUTPUT
fi
printf '%s\n' "$status" > "$result_dir/status.txt"
{
  printf 'START_UTC=%s\n' "$start_utc"
  printf 'END_UTC=%s\n' "$end_utc"
  printf 'SCENARIO=%s\n' "$scenario"
  printf 'MODE=%s\n' "$mode"
  printf 'INPUT=%s\n' "${value:-DEFAULT}"
  printf 'EXPECTED_LABEL=%s\n' "$expected_label"
  printf 'OBSERVED_LABEL=%s\n' "${observed:-NONE}"
  printf 'CPU_ID=%s\n' "$EACSL_CPU_ID"
  printf 'COMMAND=%q -c %q %q' "$TASKSET" "$EACSL_CPU_ID" "$binary"
  printf ' %q' "${args[@]}"
  printf '\n'
} > "$result_dir/metadata.txt"
printf 'Result: %s (%s)\n' "$result_dir" "$status"
if [[ $mode == performance ]]; then
  [[ $status == NO_VIOLATION_OBSERVED ]]
else
  [[ $status == NO_VIOLATION_OBSERVED || $status == RUNTIME_VIOLATION || $status == NOT_REACHED || $status == AMBIGUOUS_OUTPUT ]]
fi
