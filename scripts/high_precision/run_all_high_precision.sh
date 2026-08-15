#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../.."

while IFS= read -r func
do
  echo "run high precision $func"
  "./scripts/high_precision/run_${func}_high_precision.sh"
done < analysis/high_precision/functions.txt
