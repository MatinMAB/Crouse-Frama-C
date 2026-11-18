#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
source "$SCRIPT_DIR/common.sh"

usage() {
  cat <<'EOF'
Usage: run_all.sh (--observations | --performance) [options]
  --observations          run the 101 selective property-observation cases
  --performance           run control/full/selective performance rounds
  --runs N                measured performance rounds (default: 30)
  --warmups N             warm-up rounds (default: 5)
  --iterations N          workload iterations per performance run (default: 100000)
  --seed N                deterministic ordering seed (default: 20260821)
  --cpu N                 CPU used with taskset (default: 0)
  --resume                reuse the latest matching campaign and skip completed entries
EOF
}

mode= runs=30 warmups=5 iterations=100000 seed=20260821 cpu=$EACSL_CPU_ID resume=0
while (( $# )); do
  case "$1" in
    --observations) mode=observations; shift ;;
    --performance) mode=performance; shift ;;
    --runs) [[ $# -ge 2 ]] || { usage >&2; exit 2; }; runs=$2; shift 2 ;;
    --warmups) [[ $# -ge 2 ]] || { usage >&2; exit 2; }; warmups=$2; shift 2 ;;
    --iterations) [[ $# -ge 2 ]] || { usage >&2; exit 2; }; iterations=$2; shift 2 ;;
    --seed) [[ $# -ge 2 ]] || { usage >&2; exit 2; }; seed=$2; shift 2 ;;
    --cpu) [[ $# -ge 2 ]] || { usage >&2; exit 2; }; cpu=$2; shift 2 ;;
    --resume) resume=1; shift ;;
    --help|-h) usage; exit 0 ;;
    *) printf 'unknown option: %s\n' "$1" >&2; usage >&2; exit 2 ;;
  esac
done
[[ -n $mode ]] || { usage >&2; exit 2; }
[[ $runs =~ ^[1-9][0-9]*$ && $warmups =~ ^[0-9]+$ && $iterations =~ ^[1-9][0-9]*$ && $seed =~ ^[0-9]+$ && $cpu =~ ^[0-9]+$ ]] || {
  printf 'invalid numeric option\n' >&2; exit 2;
}
export EACSL_CPU_ID=$cpu

"$SCRIPT_DIR/check_environment.sh"
if ! eacsl_latest_build >/dev/null 2>&1; then "$SCRIPT_DIR/build_scenarios.sh"; fi
pointer="$EACSL_PHASE_DIR/work/LATEST_${mode^^}_CAMPAIGN"
if (( resume )); then
  [[ -f $pointer ]] || { printf 'no campaign to resume: %s\n' "$mode" >&2; exit 1; }
  campaign=$(<"$pointer")
  [[ -d $campaign ]] || { printf 'stale campaign pointer: %s\n' "$campaign" >&2; exit 1; }
else
  stamp=$(date -u +%Y%m%d-%H%M%S-%NZ)
  campaign="$EACSL_PHASE_DIR/work/campaigns/$mode/$stamp"
  mkdir -p "$campaign"
  printf '%s\n' "$campaign" > "$pointer"
fi
protocol="mode=$mode;runs=$runs;warmups=$warmups;iterations=$iterations;seed=$seed;cpu=$cpu"
if (( resume )); then
  [[ -f $campaign/protocol.txt ]] || { printf 'campaign has no resumable protocol metadata: %s\n' "$campaign" >&2; exit 1; }
  [[ $(<"$campaign/protocol.txt") == "$protocol" ]] || {
    printf 'resume options differ from frozen campaign protocol\nexpected: %s\nactual:   %s\n' "$(<"$campaign/protocol.txt")" "$protocol" >&2
    exit 1
  }
else
  printf '%s\n' "$protocol" > "$campaign/protocol.txt"
fi
summary="$campaign/summary.tsv"
if [[ ! -f $summary ]]; then printf 'item\tscenario\tstatus\tresult_dir\n' > "$summary"; fi

permutation() {
  case $(( (seed + $1) % 6 )) in
    0) printf 'control full selective\n' ;;
    1) printf 'control selective full\n' ;;
    2) printf 'full control selective\n' ;;
    3) printf 'full selective control\n' ;;
    4) printf 'selective control full\n' ;;
    5) printf 'selective full control\n' ;;
  esac
}

failures=0
if [[ $mode == observations ]]; then
  while IFS=$'\t' read -r case_id _; do
    [[ $case_id == "Case ID" ]] && continue
    marker="$campaign/$case_id.status"
    if (( resume )) && [[ -f $marker ]]; then continue; fi
    set +e
    output=$("$SCRIPT_DIR/run_scenario.sh" selective observation "$case_id" 2>&1)
    code=$?
    set -e
    result_dir=$(printf '%s\n' "$output" | sed -n 's/^Result: \(.*\) ([^()]*)$/\1/p')
    status=$(printf '%s\n' "$output" | sed -n 's/^Result: .* (\([^()]*\))$/\1/p')
    [[ -n $status ]] || status=EXECUTION_FAILED
    printf '%s\n' "$status" > "$marker"
    printf '%s\tselective\t%s\t%s\n' "$case_id" "$status" "${result_dir:-NOT_AVAILABLE}" >> "$summary"
    (( code == 0 || status == RUNTIME_VIOLATION )) || failures=$((failures + 1))
  done < "$EACSL_PHASE_DIR/evidence/historical/observation_cases.tsv"
else
  if (( ! resume )); then
    reference_checksum=
    for scenario in control full selective; do
      output=$("$SCRIPT_DIR/run_scenario.sh" "$scenario" performance "$iterations")
      result_dir=$(printf '%s\n' "$output" | sed -n 's/^Result: \(.*\) ([^()]*)$/\1/p')
      checksum=$(sed -n 's/^RESULT_CHECKSUM=//p' "$result_dir/stdout.txt")
      [[ -n $checksum ]] || { printf 'missing functional checksum: %s\n' "$scenario" >&2; exit 1; }
      if [[ -z $reference_checksum ]]; then reference_checksum=$checksum; fi
      [[ $checksum == "$reference_checksum" ]] || { printf 'functional checksum mismatch: %s\n' "$scenario" >&2; exit 1; }
      printf 'sanity-%s\t%s\tPASS\t%s\n' "$scenario" "$scenario" "$result_dir" >> "$summary"
    done
    for ((round=1; round<=warmups; round++)); do
      read -r -a order <<< "$(permutation "$round")"
      for scenario in "${order[@]}"; do
        output=$("$SCRIPT_DIR/run_scenario.sh" "$scenario" performance "$iterations")
        result_dir=$(printf '%s\n' "$output" | sed -n 's/^Result: \(.*\) ([^()]*)$/\1/p')
        printf 'warmup-%03d-%s\t%s\tPASS\t%s\n' "$round" "$scenario" "$scenario" "$result_dir" >> "$summary"
      done
    done
  else
    sanity_dir=$(awk -F '\t' '$1=="sanity-control" {print $4; exit}' "$summary")
    [[ -n $sanity_dir && -f $sanity_dir/stdout.txt ]] || { printf 'resume campaign lacks control sanity evidence\n' >&2; exit 1; }
    reference_checksum=$(sed -n 's/^RESULT_CHECKSUM=//p' "$sanity_dir/stdout.txt")
    [[ -n $reference_checksum ]] || { printf 'resume campaign lacks reference checksum\n' >&2; exit 1; }
  fi
  for ((round=1; round<=runs; round++)); do
    read -r -a order <<< "$(permutation "$((round + warmups))")"
    for scenario in "${order[@]}"; do
      item=$(printf 'round-%03d-%s' "$round" "$scenario")
      marker="$campaign/$item.status"
      if (( resume )) && [[ -f $marker ]]; then continue; fi
      set +e
      output=$("$SCRIPT_DIR/run_scenario.sh" "$scenario" performance "$iterations" 2>&1)
      code=$?
      set -e
      result_dir=$(printf '%s\n' "$output" | sed -n 's/^Result: \(.*\) ([^()]*)$/\1/p')
      status=$(printf '%s\n' "$output" | sed -n 's/^Result: .* (\([^()]*\))$/\1/p')
      [[ -n $status ]] || status=EXECUTION_FAILED
      checksum=$(sed -n 's/^RESULT_CHECKSUM=//p' "$result_dir/stdout.txt")
      if [[ -z $checksum ]]; then
        status=EXECUTION_FAILED
      elif [[ -n ${reference_checksum:-} && $checksum != "$reference_checksum" ]]; then
        status=EXECUTION_FAILED
      fi
      printf '%s\n' "$status" > "$marker"
      printf '%s\t%s\t%s\t%s\n' "$item" "$scenario" "$status" "${result_dir:-NOT_AVAILABLE}" >> "$summary"
      (( code == 0 )) && [[ $status == NO_VIOLATION_OBSERVED ]] || failures=$((failures + 1))
    done
  done
fi
printf 'Campaign: %s\nFailures: %d\n' "$campaign" "$failures"
(( failures == 0 ))
