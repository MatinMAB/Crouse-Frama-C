#!/usr/bin/env bash
set -euo pipefail

WP_COMMON_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
REPO_ROOT=$(cd -- "$WP_COMMON_DIR/../../.." && pwd -P)
FRAMAC=${FRAMAC:-frama-c}
FRAMAC_GUI=${FRAMAC_GUI:-frama-c-gui}
WHY3=${WHY3:-why3}
ALT_ERGO=${ALT_ERGO:-alt-ergo}
Z3=${Z3:-z3}
CVC5=${CVC5:-cvc5}

wp_require_ready() {
  if [[ ${SCRIPT_STATUS:?} != WP_READY ]]; then
    printf '%s: REPAIR_POLICY_REQUIRED; WP execution is intentionally blocked.\n' "$KLEE_ALARM_ID" >&2
    printf 'Resolve and freeze the repair policy, then regenerate this launcher.\n' >&2
    exit 3
  fi
}

wp_require_tools() {
  local tool
  for tool in "$@"; do
    if ! command -v "$tool" >/dev/null 2>&1; then
      printf 'required tool not found: %s\n' "$tool" >&2
      exit 127
    fi
  done
}

wp_build_command() {
  local report_json=$1
  local wp_out=$2
  local session_dir=$3
  local -a inputs
  read -r -a inputs <<< "$TRANSLATION_UNIT_INPUTS"
  WP_COMMAND=(
    "$FRAMAC"
    -machdep "$MACHINE_MODEL"
    "-cpp-extra-args=$CPP_EXTRA_ARGS"
  )
  WP_COMMAND+=("${inputs[@]}")
  WP_COMMAND+=(
    -wp
    -wp-fct "$WP_FUNCTION"
    -wp-prop "$ACSL_LABEL"
    -wp-model "$WP_MODEL"
    -wp-prover "$EXTERNAL_PROVERS"
    -wp-run-all-provers
    -wp-par 1
    -wp-timeout "$WP_TIMEOUT"
    -wp-memlimit "$WP_MEMLIMIT"
    -wp-cache rebuild
    -wp-session "$session_dir"
    -wp-out "$wp_out"
    -wp-report-json "$report_json"
    -wp-proof-trace
    -wp-status
  )
}

wp_capture_versions() {
  local destination=$1
  {
    "$FRAMAC" -version 2>&1
    "$WHY3" --version 2>&1 || true
    "$ALT_ERGO" --version 2>&1 || true
    "$Z3" --version 2>&1 || true
    "$CVC5" --version 2>&1 | sed -n '1p' || true
  } > "$destination"
}

wp_new_result_dir() {
  local base="$REPO_ROOT/analysis/wp_phase/results/$KLEE_ALARM_ID"
  local stamp candidate suffix=0
  mkdir -p "$base"
  stamp=$(date -u +%Y%m%d-%H%M%SZ)
  candidate="$base/$stamp"
  while ! mkdir "$candidate" 2>/dev/null; do
    suffix=$((suffix + 1))
    candidate="$base/$stamp-$suffix"
  done
  WP_RESULT_DIR=$candidate
}

wp_write_command() {
  local directory=$1
  {
    printf '#!/usr/bin/env bash\nset -euo pipefail\ncd %q\nexec' "$REPO_ROOT"
    printf ' %q' "${WP_COMMAND[@]}"
    printf '\n'
  } > "$directory/command.sh"
  chmod 755 "$directory/command.sh"
  {
    printf 'cd %q\n' "$REPO_ROOT"
    printf '%q ' "${WP_COMMAND[@]}"
    printf '\n'
  } > "$directory/command.txt"
}

wp_run_terminal() {
  wp_require_ready
  wp_require_tools "$FRAMAC" "$WHY3" "$ALT_ERGO" "$Z3" "$CVC5" git tee
  cd "$REPO_ROOT"
  WP_TIMEOUT=${WP_TIMEOUT:-$DEFAULT_WP_TIMEOUT}
  WP_MEMLIMIT=${WP_MEMLIMIT:-$DEFAULT_WP_MEMLIMIT}
  local session_dir="$REPO_ROOT/analysis/wp_phase/sessions/$KLEE_ALARM_ID"
  mkdir -p "$session_dir"
  wp_new_result_dir
  mkdir -p "$WP_RESULT_DIR/wp-out"
  wp_build_command "$WP_RESULT_DIR/wp-report.json" "$WP_RESULT_DIR/wp-out" "$session_dir"
  wp_write_command "$WP_RESULT_DIR"
  cp "$SCRIPT_DIR/metadata.env" "$WP_RESULT_DIR/metadata.txt"
  {
    git rev-parse HEAD
    git branch --show-current
    git describe --always --dirty --tags
    git status --short --branch --untracked-files=no
  } > "$WP_RESULT_DIR/git_state.txt"
  "$FRAMAC" -version > "$WP_RESULT_DIR/frama_c_version.txt" 2>&1
  wp_capture_versions "$WP_RESULT_DIR/prover_versions.txt"
  local started finished elapsed_ns exit_code
  started=$(date +%s%N)
  set +e
  "${WP_COMMAND[@]}" 2>&1 | tee "$WP_RESULT_DIR/stdout_stderr.log"
  exit_code=${PIPESTATUS[0]}
  set -e
  finished=$(date +%s%N)
  elapsed_ns=$((finished - started))
  printf '%s\n' "$exit_code" > "$WP_RESULT_DIR/exit_code.txt"
  printf '%d.%09d seconds\n' "$((elapsed_ns / 1000000000))" "$((elapsed_ns % 1000000000))" > "$WP_RESULT_DIR/elapsed_time.txt"
  printf 'Frama-C process exit code: %s\n' "$exit_code"
  printf 'Evidence directory: %s\n' "$WP_RESULT_DIR"
  printf 'Proof classification is NOT inferred from the process exit code. Inspect wp-report.json.\n'
  return "$exit_code"
}

wp_run_gui() {
  wp_require_ready
  wp_require_tools "$FRAMAC_GUI"
  cd "$REPO_ROOT"
  WP_TIMEOUT=${WP_TIMEOUT:-$DEFAULT_WP_TIMEOUT}
  WP_MEMLIMIT=${WP_MEMLIMIT:-$DEFAULT_WP_MEMLIMIT}
  local session_dir="$REPO_ROOT/analysis/wp_phase/sessions/$KLEE_ALARM_ID"
  local gui_out="$session_dir/gui-wp-out"
  mkdir -p "$session_dir" "$gui_out"
  wp_build_command "$session_dir/gui-wp-report.json" "$gui_out" "$session_dir"
  WP_COMMAND[0]=$FRAMAC_GUI
  exec "${WP_COMMAND[@]}"
}
