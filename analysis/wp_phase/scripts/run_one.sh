#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
WP_ROOT=$(cd -- "$SCRIPT_DIR/.." && pwd -P)

usage() {
  printf 'usage: %s KLEE-ALARM-NNNN [--timeout SECONDS] [--memlimit MIB] [--gui]\n' "$0"
}

(($# >= 1)) || { usage >&2; exit 2; }
alarm_id=$1
shift
[[ $alarm_id =~ ^KLEE-ALARM-[0-9]{4}$ ]] || {
  printf 'invalid alarm ID: %s\n' "$alarm_id" >&2
  exit 2
}
mode=terminal
timeout=${WP_TIMEOUT:-}
memlimit=${WP_MEMLIMIT:-}
while (($#)); do
  case $1 in
    --timeout) (($# >= 2)) || exit 2; timeout=$2; shift 2 ;;
    --memlimit) (($# >= 2)) || exit 2; memlimit=$2; shift 2 ;;
    --gui) mode=gui; shift ;;
    -h|--help) usage; exit 0 ;;
    *) printf 'unknown argument: %s\n' "$1" >&2; usage >&2; exit 2 ;;
  esac
done
[[ -z $timeout || $timeout =~ ^[1-9][0-9]*$ ]] || { printf 'invalid timeout: %s\n' "$timeout" >&2; exit 2; }
[[ -z $memlimit || $memlimit =~ ^[1-9][0-9]*$ ]] || { printf 'invalid memlimit: %s\n' "$memlimit" >&2; exit 2; }

row=$(awk -F '\t' -v id="$alarm_id" 'NR>1 && $1==id {print; n++} END{if(n!=1) exit 1}' \
  "$WP_ROOT/data/wp_targets.tsv") || {
  printf 'target absent or duplicated in normalized dataset: %s\n' "$alarm_id" >&2
  exit 2
}

args=("$WP_ROOT/run_one.sh" "$alarm_id" "$mode")
if [[ -n $timeout && -n $memlimit ]]; then
  WP_TIMEOUT=$timeout WP_MEMLIMIT=$memlimit exec "${args[@]}"
elif [[ -n $timeout ]]; then
  WP_TIMEOUT=$timeout exec "${args[@]}"
elif [[ -n $memlimit ]]; then
  WP_MEMLIMIT=$memlimit exec "${args[@]}"
else
  exec "${args[@]}"
fi
