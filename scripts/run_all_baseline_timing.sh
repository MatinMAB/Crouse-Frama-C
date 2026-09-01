#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
export LC_ALL=C

RESULT_ROOT="results/timing/baseline"
mkdir -p "$RESULT_ROOT"

mapfile -t FUNCTIONS < <(
  find scripts -maxdepth 1 -type f -name 'run_*_baseline.sh' -printf '%f\n' \
    | sed -E 's/^run_(.*)_baseline\.sh$/\1/' \
    | sort
)

if [[ "${#FUNCTIONS[@]}" -ne 46 ]]; then
  printf 'expected 46 baseline runners, found %s\n' "${#FUNCTIONS[@]}" >&2
  exit 2
fi

if [[ ! -e "$RESULT_ROOT/environment.txt" || "${FORCE_TIMING:-0}" == "1" ]]; then
  {
    printf 'date\n'
    date
    printf '\nhostname\n'
    hostname
    printf '\nuname -a\n'
    uname -a
    printf '\nlscpu\n'
    lscpu
    printf '\nnproc\n'
    nproc
    printf '\nfree -h\n'
    free -h
    printf '\nframa-c -version\n'
    frama-c -version
    printf '\n/usr/bin/time --version\n'
    /usr/bin/time --version
    printf '\ngit branch --show-current\n'
    git branch --show-current
    printf '\ngit rev-parse HEAD\n'
    git rev-parse HEAD
  } > "$RESULT_ROOT/environment.txt"
fi

failures=0
for function_name in "${FUNCTIONS[@]}"; do
  runs_file="$RESULT_ROOT/$function_name/timing_runs.tsv"
  valid_count=0
  row_count=0
  if [[ -e "$runs_file" ]]; then
    valid_count=$(awk -F '\t' 'NR > 1 && $13 == "VALID" { count++ } END { print count + 0 }' "$runs_file")
    row_count=$(awk 'NR > 1 { count++ } END { print count + 0 }' "$runs_file")
  fi
  if [[ "$valid_count" -eq 3 && "$row_count" -eq 3 && "${FORCE_TIMING:-0}" != "1" ]]; then
    printf 'resume: preserving 3 VALID runs for %s\n' "$function_name"
    continue
  fi

  for run_id in 1 2 3; do
    if [[ "${FORCE_TIMING:-0}" != "1" && -e "$runs_file" ]] && \
       awk -F '\t' -v run_id="$run_id" 'NR > 1 && $1 == run_id { found=1 } END { exit !found }' "$runs_file"; then
      printf 'resume: preserving existing row for %s run %s\n' "$function_name" "$run_id"
      continue
    fi
    printf 'baseline timing: function=%s run=%s/3\n' "$function_name" "$run_id"
    if ! TIMING_ONLY=1 TIMING_RUN_ID="$run_id" \
      "scripts/run_${function_name}_baseline.sh"; then
      printf 'FAILED: baseline function=%s run=%s\n' "$function_name" "$run_id" >&2
      failures=$((failures + 1))
    fi
  done
done

scripts/generate_eva_timing_summary.sh baseline "${FUNCTIONS[@]}"

if [[ "$failures" -ne 0 ]]; then
  printf 'baseline timing completed with %s failed run(s)\n' "$failures" >&2
  exit 1
fi
printf 'baseline timing completed with all runs valid\n'
