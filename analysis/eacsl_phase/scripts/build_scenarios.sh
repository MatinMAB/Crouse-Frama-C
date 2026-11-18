#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
source "$SCRIPT_DIR/common.sh"
"$SCRIPT_DIR/check_environment.sh"
python3 "$SCRIPT_DIR/prepare_scenarios.py"
stamp=$(date -u +%Y%m%d-%H%M%S-%NZ)
build_dir="$EACSL_PHASE_DIR/work/build/$stamp"
mkdir -p "$build_dir"
mapfile -t control_sources < <(eacsl_source_args control)
"$TIME_BIN" -f '%e\t%U\t%S\t%M\t%x' -o "$build_dir/control.build.time.tsv" \
  "$CC" -std=c99 -O2 -g -fno-builtin -fno-merge-constants -Wno-attributes \
  "-I$EACSL_PHASE_DIR/work/generated/control/headers" "${control_sources[@]}" \
  "$EACSL_PHASE_DIR/scenarios/harness/thesis_runtime_harness.c" -o "$build_dir/control" \
  >"$build_dir/control.build.stdout.log" 2>"$build_dir/control.build.stderr.log"
for scenario in full selective; do
  instrument_dir="$build_dir/$scenario-instrumentation"
  "$SCRIPT_DIR/instrument_scenario.sh" "$scenario" --runtime --output "$instrument_dir" >/dev/null
  "$TIME_BIN" -f '%e\t%U\t%S\t%M\t%x' -o "$build_dir/$scenario.build.time.tsv" \
    "$EACSL_GCC" -C -q -G "$CC" --oexec-e-acsl "$build_dir/$scenario" "$instrument_dir/instrumented.c" \
    >"$build_dir/$scenario.build.stdout.log" 2>"$build_dir/$scenario.build.stderr.log"
done
printf '%s\n' "$build_dir" > "$EACSL_PHASE_DIR/work/LATEST_BUILD"
printf 'Build complete: %s\n' "$build_dir"
