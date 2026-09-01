#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

MODE="${1:?usage: generate_eva_timing_summary.sh MODE FUNCTION...}"
shift
RESULT_ROOT="results/timing/$MODE"
OUTPUT="$RESULT_ROOT/timing_summary.tsv"
TEMP_OUTPUT=$(mktemp "$RESULT_ROOT/.timing_summary.XXXXXX")
trap 'rm -f -- "$TEMP_OUTPUT"' EXIT

printf '%s\n' $'function\tparse_run1_s\tparse_run2_s\tparse_run3_s\tparse_median_s\tparse_mean_s\teva_run1_s\teva_run2_s\teva_run3_s\teva_median_s\teva_mean_s\ttotal_run1_s\ttotal_run2_s\ttotal_run3_s\ttotal_median_s\ttotal_mean_s\teva_max_rss_median_kib\tall_runs_valid' > "$TEMP_OUTPUT"

for function_name in "$@"; do
  runs_file="$RESULT_ROOT/$function_name/timing_runs.tsv"
  LC_ALL=C awk -F '\t' -v OFS='\t' -v function_name="$function_name" '
    function median(values, count,    i, j, temporary) {
      if (count == 0) return "NA"
      for (i = 1; i <= count; i++)
        for (j = i + 1; j <= count; j++)
          if (values[i] > values[j]) {
            temporary = values[i]; values[i] = values[j]; values[j] = temporary
          }
      if (count % 2) return sprintf("%.2f", values[(count + 1) / 2])
      return sprintf("%.2f", (values[count / 2] + values[count / 2 + 1]) / 2)
    }
    NR > 1 {
      rows++
      run_id = $1
      parse_run[run_id] = $2
      eva_run[run_id] = $7
      total_run[run_id] = $12
      if ($13 == "VALID") {
        valid++
        parse_valid[valid] = $2 + 0; parse_sum += $2
        eva_valid[valid] = $7 + 0; eva_sum += $7
        total_valid[valid] = $12 + 0; total_sum += $12
        rss_valid[valid] = $10 + 0
      }
    }
    END {
      parse_median = median(parse_valid, valid)
      eva_median = median(eva_valid, valid)
      total_median = median(total_valid, valid)
      rss_median = median(rss_valid, valid)
      parse_mean = valid ? sprintf("%.2f", parse_sum / valid) : "NA"
      eva_mean = valid ? sprintf("%.2f", eva_sum / valid) : "NA"
      total_mean = valid ? sprintf("%.2f", total_sum / valid) : "NA"
      all_valid = (rows == 3 && valid == 3) ? "true" : "false"
      for (i = 1; i <= 3; i++) {
        if (!(i in parse_run)) parse_run[i] = "NA"
        if (!(i in eva_run)) eva_run[i] = "NA"
        if (!(i in total_run)) total_run[i] = "NA"
      }
      print function_name,
        parse_run[1], parse_run[2], parse_run[3], parse_median, parse_mean,
        eva_run[1], eva_run[2], eva_run[3], eva_median, eva_mean,
        total_run[1], total_run[2], total_run[3], total_median, total_mean,
        rss_median, all_valid
    }
  ' "$runs_file" >> "$TEMP_OUTPUT"
done

mv "$TEMP_OUTPUT" "$OUTPUT"
trap - EXIT
