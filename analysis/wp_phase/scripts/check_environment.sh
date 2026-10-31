#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
REPO_ROOT=$(cd -- "$SCRIPT_DIR/../../.." && pwd -P)

FRAMAC=${FRAMAC:-frama-c}
WHY3=${WHY3:-why3}
ALT_ERGO=${ALT_ERGO:-alt-ergo}
Z3=${Z3:-z3}
CVC5=${CVC5:-cvc5}
record_path=

usage() {
  printf 'usage: %s [--record FILE]\n' "$0"
}

while (($#)); do
  case $1 in
    --record)
      (($# >= 2)) || { printf '%s\n' '--record requires a path' >&2; exit 2; }
      record_path=$2
      shift 2
      ;;
    -h|--help) usage; exit 0 ;;
    *) printf 'unknown argument: %s\n' "$1" >&2; usage >&2; exit 2 ;;
  esac
done

check() {
  command -v "$1" >/dev/null 2>&1 || {
    printf 'missing required tool: %s\n' "$1" >&2
    return 1
  }
}

for tool in "$FRAMAC" "$WHY3" "$ALT_ERGO" "$Z3" "$CVC5" git python3; do
  check "$tool"
done

wp_help=$($FRAMAC -wp-help 2>&1)
grep -q 'Plug-in name: WP' <<<"$wp_help" || {
  printf 'Frama-C WP plugin is unavailable\n' >&2
  exit 1
}
for option in wp-fct wp-prop wp-model wp-prover wp-report-json wp-session; do
  grep -q -- "-$option" <<<"$wp_help" || {
    printf 'required WP option is unavailable: -%s\n' "$option" >&2
    exit 1
  }
done

machine_help=$($FRAMAC -machdep help 2>&1)
grep -qw ppc_32 <<<"$machine_help" || {
  printf 'Frama-C machine model ppc_32 is unavailable\n' >&2
  exit 1
}

for path in \
  analysis/wp_phase/data/wp_targets.tsv \
  analysis/wp_phase/FINAL_WP_RESULTS_48.tsv \
  analysis/repair_phase/48_CONFIRMED_REPAIR_TARGETS.tsv \
  src_repaired/sources/mul_Ccode.c \
  src_repaired/headers; do
  [[ -e $REPO_ROOT/$path ]] || {
    printf 'required repository input missing: %s\n' "$path" >&2
    exit 1
  }
done

capture() {
  printf 'captured_at=%s\n' "$(date --iso-8601=seconds)"
  printf 'git_branch=%s\n' "$(git -C "$REPO_ROOT" branch --show-current)"
  printf 'git_commit=%s\n' "$(git -C "$REPO_ROOT" rev-parse HEAD)"
  printf 'hostname=%s\n' "$(hostname)"
  printf 'uname=%s\n' "$(uname -a)"
  printf 'frama_c_path=%s\n' "$(command -v "$FRAMAC")"
  printf 'frama_c_version=%s\n' "$($FRAMAC -version 2>&1 | head -n1)"
  printf 'why3_path=%s\n' "$(command -v "$WHY3")"
  printf 'why3_version=%s\n' "$($WHY3 --version 2>&1 | head -n1)"
  printf 'alt_ergo_path=%s\n' "$(command -v "$ALT_ERGO")"
  printf 'alt_ergo_version=%s\n' "$($ALT_ERGO --version 2>&1 | head -n1)"
  printf 'z3_path=%s\n' "$(command -v "$Z3")"
  printf 'z3_version=%s\n' "$($Z3 --version 2>&1 | head -n1)"
  printf 'cvc5_path=%s\n' "$(command -v "$CVC5")"
  printf 'cvc5_version=%s\n' "$($CVC5 --version 2>&1 | head -n1)"
  printf 'wp_plugin=available\n'
  printf 'machine_model_ppc_32=available\n'
  printf 'configured_wp_model=Typed+int\n'
  printf 'configured_wp_timeout_seconds=120\n'
  printf 'configured_wp_memlimit_mib=2000\n'
  printf 'configured_wp_parallelism=1\n'
  printf 'wp_rte_used=NO\n'
}

if [[ -n $record_path ]]; then
  mkdir -p "$(dirname -- "$record_path")"
  capture | tee "$record_path"
else
  capture
fi

printf 'ENVIRONMENT: PASS\n'
