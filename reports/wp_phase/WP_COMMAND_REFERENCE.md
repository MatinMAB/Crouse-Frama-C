# WP Command Reference

## Environment

```bash
./analysis/wp_phase/scripts/check_environment.sh
./analysis/wp_phase/scripts/check_environment.sh --record analysis/wp_phase/results/environment.txt
```

## One target

```bash
./analysis/wp_phase/scripts/run_one.sh KLEE-ALARM-0001
./analysis/wp_phase/scripts/run_one.sh KLEE-ALARM-0003 --timeout 120 --memlimit 2000
```

GUI inspection is optional and not the official reproducibility path:

```bash
./analysis/wp_phase/scripts/run_one.sh KLEE-ALARM-0001 --gui
```

## Full sequential campaign

```bash
./analysis/wp_phase/scripts/run_all.sh
./analysis/wp_phase/scripts/run_all.sh --resume
./analysis/wp_phase/scripts/run_all.sh --timeout 120 --memlimit 2000
```

Each execution creates a new UTC timestamped result directory; frozen directories are never overwritten. `--resume` skips an ID if any retained `wp-report.json` for it contains only passed goals.

## Normalize and validate frozen evidence

```bash
python3 analysis/wp_phase/scripts/normalize_wp_results.py
python3 analysis/wp_phase/scripts/validate_wp_phase.py
column -s $'\t' -t analysis/wp_phase/results/summary.tsv | less -S
sha256sum -c analysis/wp_phase/SHA256SUMS
```

## Important boundary

The campaign selects one ACSL label with `-wp-prop`; it does not use `-wp-rte`. Do not interpret a valid selected property as whole-function safety.
