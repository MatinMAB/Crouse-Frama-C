#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
source "$SCRIPT_DIR/common.sh"

usage() { printf 'Usage: %s <control|full|selective> [--runtime] [--output DIRECTORY]\n' "$0"; }
[[ $# -ge 1 ]] || { usage >&2; exit 2; }
scenario=$1; shift
runtime=0
output=
while (( $# )); do
  case "$1" in
    --runtime) runtime=1; shift ;;
    --output) [[ $# -ge 2 ]] || { usage >&2; exit 2; }; output=$2; shift 2 ;;
    --help|-h) usage; exit 0 ;;
    *) printf 'unknown option: %s\n' "$1" >&2; usage >&2; exit 2 ;;
  esac
done
eacsl_selected_count "$scenario" >/dev/null
python3 "$SCRIPT_DIR/prepare_scenarios.py"
if [[ -z $output ]]; then
  stamp=$(date -u +%Y%m%d-%H%M%S-%NZ)
  output="$EACSL_PHASE_DIR/work/instrumentation/$stamp/$scenario-$([[ $runtime == 1 ]] && printf runtime || printf static)"
fi
[[ ! -e $output ]] || { printf 'refusing existing output: %s\n' "$output" >&2; exit 1; }
mkdir -p "$output"
mapfile -t sources < <(eacsl_source_args "$scenario")
generated="$output/instrumented.c"
machdep=ppc_32
inputs=("${sources[@]}")
if (( runtime )); then
  machdep=x86_64
  inputs+=("$EACSL_PHASE_DIR/scenarios/harness/thesis_runtime_harness.c")
fi
set +e
"$TIME_BIN" -f '%e\t%U\t%S\t%M\t%x' -o "$output/instrumentation.time.tsv" \
  "$FRAMAC" -kernel-warn-key too-large-array=inactive -machdep "$machdep" \
  "-cpp-extra-args=-I$EACSL_PHASE_DIR/work/generated/$scenario/headers" \
  "${inputs[@]}" -e-acsl -e-acsl-valid -then-last -print -ocode "$generated" \
  >"$output/stdout.log" 2>"$output/stderr.log"
code=$?
set -e
printf '%s\n' "$code" > "$output/exit_code.txt"
if (( code != 0 )); then printf 'INSTRUMENTATION_FAILED\n' > "$output/status.txt"; exit "$code"; fi
eacsl_assert_generated_selection "$generated" "$scenario" > "$output/selection_audit.txt"
printf 'PASS\n' > "$output/status.txt"
printf '%s\n' "$output"
