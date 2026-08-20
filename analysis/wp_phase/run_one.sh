#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
if [[ $# -ne 2 ]]; then
  printf 'usage: %s KLEE-ALARM-XXXX terminal|gui\n' "$0" >&2
  exit 2
fi
alarm_id=$1
mode=$2
if [[ ! $alarm_id =~ ^KLEE-ALARM-[0-9]{4}$ ]]; then
  printf 'invalid alarm ID: %s\n' "$alarm_id" >&2
  exit 2
fi
case "$mode" in
  terminal) launcher=run_terminal.sh ;;
  gui) launcher=run_gui.sh ;;
  *) printf 'invalid mode: %s (expected terminal or gui)\n' "$mode" >&2; exit 2 ;;
esac
target="$SCRIPT_DIR/targets/$alarm_id/$launcher"
if [[ ! -x $target ]]; then
  printf 'target launcher not found or not executable: %s\n' "$target" >&2
  exit 2
fi
exec "$target"
