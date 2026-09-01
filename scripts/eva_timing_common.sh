#!/usr/bin/env bash

# Shared TIMING_ONLY instrumentation. This file is sourced by the per-function
# runners after FUNC and the canonical DIR have been set.

_eva_timing_parse_diagnostics() {
  local log_file="$1"
  LC_ALL=C grep -Ei '(^|[^[:alpha:]])(warning|error|fatal)([^[:alpha:]]|$)' "$log_file" 2>/dev/null \
    | LC_ALL=C sed -E 's/[[:space:]]+/ /g; s/^ //; s/ $//' || true
}

_eva_timing_alarm_signatures() {
  local log_file="$1"
  LC_ALL=C awk '
    index($0, "[eva:alarm]") {
      signature = $0
      if ((getline continuation) > 0 && continuation !~ /^\[/) {
        signature = signature " " continuation
      }
      gsub(/[[:space:]]+/, " ", signature)
      sub(/^ /, "", signature)
      sub(/ $/, "", signature)
      print signature
    }
  ' "$log_file" 2>/dev/null
}

_eva_timing_read_metrics() {
  local metrics_file="$1"
  local prefix="$2"
  local elapsed="NA" user="NA" system="NA" max_rss="NA" exit_status="NA"

  if [[ -s "$metrics_file" ]]; then
    IFS=$'\t' read -r elapsed user system max_rss exit_status < "$metrics_file" || true
  fi

  printf -v "${prefix}_elapsed" '%s' "$elapsed"
  printf -v "${prefix}_user" '%s' "$user"
  printf -v "${prefix}_system" '%s' "$system"
  printf -v "${prefix}_max_rss" '%s' "$max_rss"
  printf -v "${prefix}_exit_status" '%s' "$exit_status"
}

_eva_timing_finalize() {
  local runner_exit_status="$1"
  local validation_status="VALID"
  local total_elapsed="NA"
  local canonical_parse_log="$TIMING_CANONICAL_DIR/${FUNC}_parse.log"
  local canonical_eva_log="$TIMING_CANONICAL_DIR/${FUNC}_eva.log"
  local temporary_parse_log="$TIMING_TMP_DIR/${FUNC}_parse.log"
  local temporary_eva_log="$TIMING_TMP_DIR/${FUNC}_eva.log"
  local canonical_alarm_count temporary_alarm_count

  trap - EXIT
  set +e

  _eva_timing_read_metrics "$TIMING_TMP_DIR/parse.time" parse
  _eva_timing_read_metrics "$TIMING_TMP_DIR/eva.time" eva

  if [[ "$parse_elapsed" != "NA" && "$eva_elapsed" != "NA" ]]; then
    total_elapsed=$(LC_ALL=C awk -v parse="$parse_elapsed" -v eva="$eva_elapsed" \
      'BEGIN { printf "%.2f", parse + eva }')
  fi

  if [[ "$runner_exit_status" -ne 0 || "$parse_exit_status" != "0" || "$eva_exit_status" != "0" ]]; then
    validation_status="INVALID"
  fi

  if [[ ! -s "$temporary_parse_log" || ! -s "$TIMING_TMP_DIR/${FUNC}_parse.sav" || \
        ! -s "$canonical_parse_log" ]]; then
    validation_status="INVALID"
  elif LC_ALL=C grep -Eqi 'fatal[[:space:]]+error' "$temporary_parse_log"; then
    validation_status="INVALID"
  elif ! diff -q \
      <(_eva_timing_parse_diagnostics "$temporary_parse_log") \
      <(_eva_timing_parse_diagnostics "$canonical_parse_log") >/dev/null; then
    validation_status="INVALID"
  fi

  if [[ ! -s "$temporary_eva_log" || ! -s "$TIMING_TMP_DIR/${FUNC}_eva.sav" || \
        ! -s "$canonical_eva_log" ]]; then
    validation_status="INVALID"
  elif ! LC_ALL=C grep -Fq 'ANALYSIS SUMMARY' "$temporary_eva_log"; then
    validation_status="INVALID"
  else
    canonical_alarm_count=$(LC_ALL=C awk 'index($0, "[eva:alarm]") { count++ } END { print count + 0 }' "$canonical_eva_log")
    temporary_alarm_count=$(LC_ALL=C awk 'index($0, "[eva:alarm]") { count++ } END { print count + 0 }' "$temporary_eva_log")
    if [[ "$canonical_alarm_count" -ne "$temporary_alarm_count" ]]; then
      validation_status="INVALID"
    elif ! diff -q \
        <(_eva_timing_alarm_signatures "$temporary_eva_log") \
        <(_eva_timing_alarm_signatures "$canonical_eva_log") >/dev/null; then
      validation_status="INVALID"
    fi
  fi

  if [[ ! -e "$TIMING_RUNS_FILE" ]]; then
    printf '%s\n' $'run_id\tparse_elapsed_s\tparse_user_s\tparse_system_s\tparse_max_rss_kib\tparse_exit_status\teva_elapsed_s\teva_user_s\teva_system_s\teva_max_rss_kib\teva_exit_status\ttotal_elapsed_s\tvalidation_status' \
      > "$TIMING_RUNS_FILE"
  fi

  printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
    "$TIMING_RUN_ID" \
    "$parse_elapsed" "$parse_user" "$parse_system" "$parse_max_rss" "$parse_exit_status" \
    "$eva_elapsed" "$eva_user" "$eva_system" "$eva_max_rss" "$eva_exit_status" \
    "$total_elapsed" "$validation_status" >> "$TIMING_RUNS_FILE"

  LC_ALL=C sort -t $'\t' -k1,1n "$TIMING_RUNS_FILE" -o "$TIMING_RUNS_FILE"
  # Restore the header after sorting numeric run ids.
  if [[ "$(head -n 1 "$TIMING_RUNS_FILE")" != run_id$'\t'* ]]; then
    LC_ALL=C sed -i '/^run_id\t/d' "$TIMING_RUNS_FILE"
    LC_ALL=C sed -i '1i run_id\tparse_elapsed_s\tparse_user_s\tparse_system_s\tparse_max_rss_kib\tparse_exit_status\teva_elapsed_s\teva_user_s\teva_system_s\teva_max_rss_kib\teva_exit_status\ttotal_elapsed_s\tvalidation_status' "$TIMING_RUNS_FILE"
  fi

  rm -rf -- "$TIMING_TMP_DIR"

  if [[ "$validation_status" != "VALID" ]]; then
    printf 'timing validation failed: mode=%s function=%s run=%s\n' \
      "$TIMING_MODE" "$FUNC" "$TIMING_RUN_ID" >&2
    return 1
  fi
  return "$runner_exit_status"
}

eva_timing_setup() {
  : "${FUNC:?FUNC must be set by the runner}"
  : "${TIMING_MODE:?TIMING_MODE must be baseline or high_precision}"
  : "${TIMING_CANONICAL_DIR:?TIMING_CANONICAL_DIR must identify frozen results}"
  : "${TIMING_RUN_ID:?TIMING_RUN_ID must be 1, 2, or 3}"

  if [[ ! "$TIMING_RUN_ID" =~ ^[123]$ ]]; then
    printf 'invalid TIMING_RUN_ID: %s\n' "$TIMING_RUN_ID" >&2
    exit 2
  fi
  if [[ ! -x /usr/bin/time ]]; then
    printf '/usr/bin/time is unavailable\n' >&2
    exit 2
  fi

  TIMING_FRAMAC_BIN=$(type -P frama-c)
  if [[ -z "$TIMING_FRAMAC_BIN" ]]; then
    printf 'frama-c is unavailable\n' >&2
    exit 2
  fi

  TIMING_CANONICAL_DIR="$PWD/$TIMING_CANONICAL_DIR"
  TIMING_RESULT_DIR="$PWD/results/timing/$TIMING_MODE/$FUNC"
  TIMING_RUNS_FILE="$TIMING_RESULT_DIR/timing_runs.tsv"
  mkdir -p "$TIMING_RESULT_DIR"

  if [[ -e "$TIMING_RUNS_FILE" ]] && \
     LC_ALL=C awk -F '\t' -v run_id="$TIMING_RUN_ID" 'NR > 1 && $1 == run_id { found=1 } END { exit !found }' "$TIMING_RUNS_FILE"; then
    if [[ "${FORCE_TIMING:-0}" != "1" ]]; then
      printf 'timing row already exists; preserving: mode=%s function=%s run=%s\n' \
        "$TIMING_MODE" "$FUNC" "$TIMING_RUN_ID"
      exit 0
    fi
    local replacement_file
    replacement_file=$(mktemp "${TMPDIR:-/tmp}/eva-timing-row.XXXXXX")
    LC_ALL=C awk -F '\t' -v run_id="$TIMING_RUN_ID" 'NR == 1 || $1 != run_id' "$TIMING_RUNS_FILE" > "$replacement_file"
    mv "$replacement_file" "$TIMING_RUNS_FILE"
  fi

  TIMING_TMP_DIR=$(mktemp -d "${TMPDIR:-/tmp}/eva-timing.${TIMING_MODE}.${FUNC}.XXXXXX")
  TIMING_INVOCATION=0
  DIR="$TIMING_TMP_DIR"
  trap '_eva_timing_finalize $?' EXIT
}

frama-c() {
  local phase
  TIMING_INVOCATION=$((TIMING_INVOCATION + 1))
  case "$TIMING_INVOCATION" in
    1) phase="parse" ;;
    2) phase="eva" ;;
    *)
      printf 'unexpected frama-c invocation %s in timing mode\n' "$TIMING_INVOCATION" >&2
      return 2
      ;;
  esac

  LC_ALL=C /usr/bin/time \
    -o "$TIMING_TMP_DIR/${phase}.time" \
    -f '%e\t%U\t%S\t%M\t%x' \
    "$TIMING_FRAMAC_BIN" "$@"
}
