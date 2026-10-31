#!/usr/bin/env bash
set -uo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
WP_ROOT=$(cd -- "$SCRIPT_DIR/.." && pwd -P)
resume=0
timeout=${WP_TIMEOUT:-}
memlimit=${WP_MEMLIMIT:-}

usage() {
  printf 'usage: %s [--resume] [--timeout SECONDS] [--memlimit MIB]\n' "$0"
}

while (($#)); do
  case $1 in
    --resume) resume=1; shift ;;
    --timeout) (($# >= 2)) || exit 2; timeout=$2; shift 2 ;;
    --memlimit) (($# >= 2)) || exit 2; memlimit=$2; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) printf 'unknown argument: %s\n' "$1" >&2; usage >&2; exit 2 ;;
  esac
done
[[ -z $timeout || $timeout =~ ^[1-9][0-9]*$ ]] || { printf 'invalid timeout: %s\n' "$timeout" >&2; exit 2; }
[[ -z $memlimit || $memlimit =~ ^[1-9][0-9]*$ ]] || { printf 'invalid memlimit: %s\n' "$memlimit" >&2; exit 2; }

"$SCRIPT_DIR/check_environment.sh"
total=0
skipped=0
failures=0
while IFS=$'\t' read -r alarm_id _; do
  [[ $alarm_id == klee_target_id ]] && continue
  total=$((total + 1))
  if ((resume)); then
    if python3 - "$WP_ROOT/results/$alarm_id" <<'PY'
import json, pathlib, sys
root=pathlib.Path(sys.argv[1])
for report in root.glob('*/wp-report.json'):
    try: goals=json.loads(report.read_text())
    except Exception: continue
    if goals and all(goal.get('passed') is True for goal in goals): raise SystemExit(0)
raise SystemExit(1)
PY
    then
      printf '%s: resume skip (retained VALID proof exists)\n' "$alarm_id"
      skipped=$((skipped + 1))
      continue
    fi
  fi
  args=("$SCRIPT_DIR/run_one.sh" "$alarm_id")
  [[ -z $timeout ]] || args+=(--timeout "$timeout")
  [[ -z $memlimit ]] || args+=(--memlimit "$memlimit")
  "${args[@]}" || failures=$((failures + 1))
done < "$WP_ROOT/data/wp_targets.tsv"

python3 "$SCRIPT_DIR/summarize_current_results.py"
printf 'Total targets: %d\nResume-skipped: %d\nLauncher failures: %d\n' "$total" "$skipped" "$failures"
((failures == 0))
