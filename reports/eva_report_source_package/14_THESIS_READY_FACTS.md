# Thesis-Ready Facts

Only artifact-supported statements appear here. Mechanism facts describe dataset assignments, not exclusive option causality.

## FACT-001
**Statement:** The frozen experiment population contains 46 functions.
**Evidence:** `functions.txt` has 46 lines and `function_summary.tsv` has 46 data rows.
**Source:** `analysis/high_precision/functions.txt`; `analysis/high_precision_comparison/function_summary.tsv`.
**Confidence:** HIGH — direct repository evidence.

## FACT-002
**Statement:** The population contains 21 P0 and 25 P1 functions.
**Evidence:** Counts recomputed from the manifest priority column.
**Source:** `analysis/high_precision/manifest.tsv`.
**Confidence:** HIGH.

## FACT-003
**Statement:** Exactly 46 Baseline Eva logs exist for the population.
**Evidence:** One `<FUNCTION>_eva.log` exists under each selected Baseline directory.
**Source:** `results/baseline/`; `functions.txt`.
**Confidence:** HIGH.

## FACT-004
**Statement:** Exactly 46 High Precision Eva logs exist for the population.
**Evidence:** One `<FUNCTION>_eva.log` exists under each selected High Precision directory.
**Source:** `results/high_precision/`; `functions.txt`.
**Confidence:** HIGH.

## FACT-005
**Statement:** Baseline contains 184 artifacts: four for each of 46 functions.
**Evidence:** Filesystem count and per-directory exact-four audit.
**Source:** `results/baseline/`.
**Confidence:** HIGH.

## FACT-006
**Statement:** High Precision contains 184 artifacts: four for each of 46 functions.
**Evidence:** Filesystem count and per-directory exact-four audit.
**Source:** `results/high_precision/`.
**Confidence:** HIGH.

## FACT-007
**Statement:** Each execution mode stores a parse log, parse save, Eva log, and Eva save for every function.
**Evidence:** Artifact naming and directory audit.
**Source:** Baseline/High Precision result directories and runners.
**Confidence:** HIGH.

## FACT-008
**Statement:** Baseline produced 171 canonical Eva alarm occurrences.
**Evidence:** 171 rows in the generated Baseline inventory, reconciled with comparison totals.
**Source:** Eva logs; `data/baseline_alarm_inventory.tsv`.
**Confidence:** HIGH.

## FACT-009
**Statement:** High Precision produced 149 canonical Eva alarm occurrences.
**Evidence:** 149 rows in the generated High Precision inventory.
**Source:** Eva logs; `data/high_precision_alarm_inventory.tsv`.
**Confidence:** HIGH.

## FACT-010
**Statement:** Canonical multiset comparison identifies 22 removed occurrences.
**Evidence:** 22 `REMOVED` rows.
**Source:** `analysis/high_precision_comparison/alarm_diff.tsv`.
**Confidence:** HIGH.

## FACT-011
**Statement:** Canonical multiset comparison identifies 149 remaining occurrences.
**Evidence:** 149 `REMAINING` rows.
**Source:** `alarm_diff.tsv`.
**Confidence:** HIGH.

## FACT-012
**Statement:** No new High Precision occurrence was observed.
**Evidence:** Zero `NEW` rows.
**Source:** `alarm_diff.tsv`.
**Confidence:** HIGH.

## FACT-013
**Statement:** The net count reduction is 22, equal to 12.87% of Baseline.
**Evidence:** `(171-149)/171*100`, rounded to two decimals.
**Source:** comparison TSV totals.
**Confidence:** HIGH.

## FACT-014
**Statement:** Ten functions have reduced alarm counts.
**Evidence:** Ten `REDUCED` rows.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-015
**Statement:** Thirty-six functions have unchanged alarm counts.
**Evidence:** Thirty-six `UNCHANGED` rows.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-016
**Statement:** No function has an increased alarm count.
**Evidence:** Zero `INCREASED` rows.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-017
**Statement:** Thirteen functions have zero Baseline canonical alarms.
**Evidence:** Thirteen rows with `baseline_alarms=0`.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-018
**Statement:** Thirteen functions have zero High Precision canonical alarms.
**Evidence:** Thirteen rows with `high_precision_alarms=0`.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-019
**Statement:** Baseline category totals are 118 integer overflow, 20 division by zero, and 33 invalid shift.
**Evidence:** Category summary and log-derived inventory counts.
**Source:** `category_summary.tsv`; Baseline inventory.
**Confidence:** HIGH.

## FACT-020
**Statement:** High Precision category totals are 100 integer overflow, 16 division by zero, and 33 invalid shift.
**Evidence:** Category summary and High Precision inventory.
**Source:** `category_summary.tsv`; High Precision inventory.
**Confidence:** HIGH.

## FACT-021
**Statement:** Eighteen removed occurrences are integer-overflow conditions.
**Evidence:** Removed-category count.
**Source:** `removed_alarm_analysis.tsv`.
**Confidence:** HIGH.

## FACT-022
**Statement:** Four removed occurrences are division-by-zero conditions.
**Evidence:** Removed-category count.
**Source:** `removed_alarm_analysis.tsv`.
**Confidence:** HIGH.

## FACT-023
**Statement:** No invalid-shift occurrence was removed.
**Evidence:** Invalid shift is 33/33 with zero removed.
**Source:** final category summary.
**Confidence:** HIGH.

## FACT-024
**Statement:** The final causal dataset assigns one occurrence to `EQUALITY_RELATION`.
**Evidence:** Primary-mechanism count.
**Source:** `removed_alarm_feature_summary.tsv`.
**Confidence:** HIGH for the dataset statement.

## FACT-025
**Statement:** The final causal dataset assigns six occurrences to `BRANCH_PARTITIONING`.
**Evidence:** Primary-mechanism count.
**Source:** `removed_alarm_feature_summary.tsv`.
**Confidence:** HIGH for the dataset statement.

## FACT-026
**Statement:** The final causal dataset assigns 15 occurrences to `NONLINEAR_SUBDIVISION`.
**Evidence:** Primary-mechanism count.
**Source:** `removed_alarm_feature_summary.tsv`.
**Confidence:** HIGH for the dataset statement.

## FACT-027
**Statement:** One mechanism attribution is graded HIGH and 21 are graded MEDIUM.
**Evidence:** Confidence counts across 22 rows.
**Source:** `removed_alarm_analysis.tsv`.
**Confidence:** HIGH for the count statement.

## FACT-028
**Statement:** All 46 Baseline/High Precision parse-log pairs are byte-identical.
**Evidence:** Comparison audit reports zero parse mismatches.
**Source:** comparison global summary and parse logs.
**Confidence:** HIGH.

## FACT-029
**Statement:** Forty-three target final-state comparisons are `IDENTICAL`.
**Evidence:** Final-state status count.
**Source:** `final_function_summary.tsv`.
**Confidence:** HIGH.

## FACT-030
**Statement:** Three target final-state comparisons are `CHANGED`.
**Evidence:** Final-state status count.
**Source:** `final_function_summary.tsv`.
**Confidence:** HIGH.

## FACT-031
**Statement:** The changed target final states are for `s16_hip1_s16_s8_s8_u16_fac1`, `s16_hip1_s16_u8_u8_u16_fac1`, and `u16_sin_u16`.
**Evidence:** Three `CHANGED` rows.
**Source:** `final_function_summary.tsv`.
**Confidence:** HIGH.

## FACT-032
**Statement:** `s16_div_s32_s16` has the largest count reduction, from 25 to 20.
**Evidence:** Five removed rows, the largest function total.
**Source:** function and reduced-function summaries.
**Confidence:** HIGH.

## FACT-033
**Statement:** `s16_mul_s16_s16_div_s16` changes from 11 to 8.
**Evidence:** Function comparison row.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-034
**Statement:** `s16_mul_s16_u16_div_s16` changes from 11 to 8.
**Evidence:** Function comparison row.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-035
**Statement:** `s16_fac05_div_s16_s16` changes from 11 to 9.
**Evidence:** Function comparison row.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-036
**Statement:** `s16_mul_s16_s16_div_u16` changes from 7 to 5.
**Evidence:** Function comparison row.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-037
**Statement:** `u16_div_s32_u16` changes from 7 to 5.
**Evidence:** Function comparison row.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-038
**Statement:** `u16_mul_s16_u16_div_s16` changes from 11 to 9.
**Evidence:** Function comparison row.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-039
**Statement:** `s16_mul_u16_s16_div_u16` changes from 7 to 6.
**Evidence:** Function comparison row.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-040
**Statement:** `s32_mul_s32_u16` changes from 3 to 2.
**Evidence:** Function comparison row.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-041
**Statement:** `u16_mul_s16_u16_div_u16` changes from 7 to 6.
**Evidence:** Function comparison row.
**Source:** `function_summary.tsv`.
**Confidence:** HIGH.

## FACT-042
**Statement:** The removed `s32_mul_s32_u16` occurrence is at `mul_Ccode.c:760` and concerns divisor `s32Factor`.
**Evidence:** Baseline marker and removed row.
**Source:** Baseline Eva log; `removed_alarm_analysis.tsv`.
**Confidence:** HIGH.

## FACT-043
**Statement:** Source assigns `s32Factor = factor` before guarding `factor != 0`.
**Evidence:** Source lines 755–756.
**Source:** `src_analysis/sources/mul_Ccode.c`.
**Confidence:** HIGH.

## FACT-044
**Statement:** The line-760 division uses `s32Factor`, not `factor`, as divisor.
**Evidence:** Source line 760.
**Source:** `mul_Ccode.c`.
**Confidence:** HIGH.

## FACT-045
**Statement:** `s16_div_s32_s16` has three removed occurrences at line 274 and two at line 297.
**Evidence:** Removed rows RA-001 through RA-005.
**Source:** `removed_alarm_analysis.tsv`.
**Confidence:** HIGH.

## FACT-046
**Statement:** Both `s16_div_s32_s16` runs reach 51 of 51 normalized statements.
**Evidence:** Baseline and High Precision analysis summaries.
**Source:** corresponding Eva logs/per-function comparison.
**Confidence:** HIGH.

## FACT-047
**Statement:** `root_u32_mul_u32_s16_fac_less1` retains two invalid-shift occurrences in both modes.
**Evidence:** Lines 5309 and 5310 appear as `REMAINING`.
**Source:** alarm inventories.
**Confidence:** HIGH.

## FACT-048
**Statement:** `u16_sin_u16` has zero canonical alarms in both modes but a changed target final-state block.
**Evidence:** Function comparison and final-state status.
**Source:** final function summary/per-function comparison.
**Confidence:** HIGH.

## FACT-049
**Statement:** `s32_mul_s32_s32` retains three integer-overflow occurrences in both modes.
**Evidence:** Three `REMAINING` rows.
**Source:** alarm comparison.
**Confidence:** HIGH.

## FACT-050
**Statement:** Baseline explicitly uses `-eva-slevel 1000` and `-eva-ilevel 256`.
**Evidence:** Baseline runner commands.
**Source:** `scripts/run_*_baseline.sh`.
**Confidence:** HIGH.

## FACT-051
**Statement:** Every High Precision runner explicitly uses `-eva-precision 11` and `-eva-ilevel 1024`.
**Evidence:** 46-runner option audit.
**Source:** `scripts/high_precision/`.
**Confidence:** HIGH.

## FACT-052
**Statement:** Every High Precision runner enables `cvalue,equality,symbolic-locations,gauges,octagon,bitwise`.
**Evidence:** Runner option audit.
**Source:** `scripts/high_precision/`.
**Confidence:** HIGH.

## FACT-053
**Statement:** Every High Precision runner requests nonlinear subdivision value 500.
**Evidence:** Runner option audit.
**Source:** `scripts/high_precision/`.
**Confidence:** HIGH.

## FACT-054
**Statement:** All High Precision logs record slevel 5000 and plevel 2000 from the precision profile.
**Evidence:** 46-log setting audit.
**Source:** High Precision Eva logs.
**Confidence:** HIGH.

## FACT-055
**Statement:** All High Precision logs record partition history 2, auto loop unroll 1024, minimum loop unroll 4, and widening delay 6.
**Evidence:** 46-log setting audit.
**Source:** High Precision Eva logs.
**Confidence:** HIGH.

## FACT-056
**Statement:** The experiment uses the `ppc_32` machine model in both parse modes.
**Evidence:** Baseline and High Precision runner parse commands.
**Source:** runners.
**Confidence:** HIGH.

## FACT-057
**Statement:** High Precision reuses the same harness path and source/helper list as Baseline for every function.
**Evidence:** Manifest and runner comparison.
**Source:** `analysis/high_precision/manifest.tsv`; runners.
**Confidence:** HIGH.

## FACT-058
**Statement:** The repository contains 46 tracked alarm-detail reports for the selected functions.
**Evidence:** Path and Git tracking audit.
**Source:** `reports/alarm_details/`; manifest.
**Confidence:** HIGH.

## FACT-059
**Statement:** The repository contains 46 matching work notes on disk, and zero are tracked because `reports/work_notes/` is ignored.
**Evidence:** filesystem count, `git ls-files`, and `git check-ignore`.
**Source:** work-note directory and `.gitignore`.
**Confidence:** HIGH.

## FACT-060
**Statement:** The High Precision result history contains 46 independent function-result commits after runner commit `4a2eaa1`.
**Evidence:** commit-subject count and per-path Git history.
**Source:** Git log; `data/git_traceability.tsv`.
**Confidence:** HIGH.

## FACT-061
**Statement:** Comparison invariants fail for zero functions.
**Evidence:** all 46 rows satisfy both multiset equations and delta equality.
**Source:** function comparison TSV.
**Confidence:** HIGH.

## FACT-062
**Statement:** Timing is not available as a complete tracked 46-function dataset.
**Evidence:** final limitations/reproducibility records and absence of a tracked complete timing table.
**Source:** frozen final study reports and repository tree.
**Confidence:** HIGH.

## FACT-063
**Statement:** No KLEE artifact is part of the frozen Eva dataset or this evidence package.
**Evidence:** declared phase scope and package file inventory.
**Source:** final Eva report and current package audit.
**Confidence:** HIGH.
