# Input Dataset Validation

## Direct repository evidence

```text
remaining=149
integer overflow=100
division by zero=16
invalid shift=33
functions_manifest=46
alarm_bearing_functions=33
zero_alarm_functions_without_targets=13
identity_duplicates=0
function_order_monotonic=YES
input_inventory_sha256=493effbda44b6668a0dbb64cf875b9ecc18c87231ac40673fd662b7148b36d51
```

Every inventory row has `analysis_mode=HIGH_PRECISION` and `comparison_status=REMAINING`. The 149 canonical source/message entries were cross-checked against the corresponding committed High Precision Eva logs. `alarm_comparison.tsv` independently contains 149 `REMAINING` rows.

## Interpretation boundary

The frozen `occurrence` field is preserved exactly. Phase B does not reconstruct or renumber Eva properties from source syntax and does not deduplicate equivalent predicates.
