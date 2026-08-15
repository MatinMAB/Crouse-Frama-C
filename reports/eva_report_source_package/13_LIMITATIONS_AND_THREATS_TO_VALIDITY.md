# Limitations and Threats to Validity

## Evidence/interpretation boundary

Every numerical claim in this package is derived from logs or TSVs. Explanations of why an abstract condition disappears are labeled TECHNICAL INTERPRETATION. The distinction matters because the logs show outcomes, not a per-option causal proof trace.

## 1. No ablation study

DIRECT REPOSITORY EVIDENCE: High Precision simultaneously enables precision 11, six domains, through-call relational settings, interprocedural splits/history, full return splitting, nonlinear subdivision 500, and ilevel 1024.

TECHNICAL INTERPRETATION: observed changes measure the combined profile. They cannot uniquely identify the marginal effect of equality, octagon, subdivision, partition history, slevel, or any other single setting. The mechanism taxonomy records the most plausible primary information pattern and explicitly permits secondary contributors.

## 2. Multiple precision features changed simultaneously

The profile is intentionally standardized for all 46 functions. This improves between-function comparability but increases interaction among domains and budgets. A relational domain may make a branch partition useful; subdivision may only succeed after another domain narrows an operand. Counts should therefore be interpreted as profile-level results.

## 3. Static-analysis abstraction

Eva computes an abstract interpretation over sets of states. Intervals, finite sets, relations, partitions, joins, reductions, and widening summarize concrete executions. A reported condition can reflect the limits of the current abstraction, while a discharged condition reflects a proof in the selected abstract semantics. Neither category is a substitute for a concrete execution trace.

## 4. Full-domain harness versus deployed caller constraints

The harnesses model full typedef domains unless a tracked contract states otherwise. DIRECT REPOSITORY EVIDENCE confirms full ranges such as all `s32`, `u32`, `s16`, and `u16` values.

TECHNICAL INTERPRETATION: a deployed application may call a function with a narrower operational range. Those constraints are `NOT RECORDED` unless present in tracked source/contracts and are not introduced merely to reduce counts. Conversely, the full-domain study can expose conditions beyond common operational usage.

## 5. No dynamic witness in the Eva phase

No KLEE run, native replay, or other dynamic witness generation is part of this package. The 149 remaining occurrences are analysis outputs, not automatically confirmed executions. The 22 removed occurrences are not assigned runtime classes either.

## 6. Remaining occurrence does not establish a runtime violation

Persistence under High Precision means Eva still emits the canonical condition under the chosen configuration. It does not, by itself, supply a concrete input or execution trace. Later witness analysis must retain this distinction.

## 7. Removed occurrence is not a runtime classification

Removal means the canonical Baseline occurrence is absent in High Precision. The experiment explains plausible precision mechanisms but does not infer what a concrete runtime campaign would observe. The absence is an analysis transition, not a dynamic label.

## 8. Machine-model dependence

Both modes use `-machdep ppc_32`. Integer width, `long` representation, promotions, literal types, shift width, and overflow predicates depend on that model. Results should not be generalized to LP64 or another ABI without a separate controlled analysis.

## 9. Documentation and caller constraints

Source Doxygen provides stated ranges and fixed-point intent, but application-level requirements outside the repository are `NOT AVAILABLE IN TRACKED ARTIFACTS`. A name or comment is not used to invent a precondition. Potential discrepancies between documentation and actual callers remain outside this isolated function study.

## 10. Function-specific versus whole-application analysis

The `eva_main` harness intentionally analyzes one target with exact helper sources. This improves isolation and traceability, but global initializations, caller-established relationships, or whole-program call contexts not included in the harness are absent. That trade-off is controlled and consistent across Baseline and High Precision.

## 11. Kernel diagnostics are separate from Eva alarms

The primary count uses `[eva:alarm]` markers. Parser/kernel fall-through warnings, normalization messages, and internal properties such as `missing_return` are recorded elsewhere but not merged into 171/149. Mixing these classes would invalidate the comparator's stated unit.

Zero canonical alarms therefore does not mean every tool message is absent. In particular, empty non-void trigonometric bodies can produce kernel/property evidence separately from the numerical alarm summary.

## 12. Canonical textual matching

The comparator normalizes path, source line, message whitespace, and Unicode/ASCII operators and preserves multiplicity. This is reproducible and substantially stronger than count-only comparison. However, it cannot identify semantic equivalence when source line/message genuinely changes wording, nor does it compare internal proof objects.

## 13. Source-line stability

The two result modes share the same source revision and have byte-identical parse logs, so source-line comparison is well-controlled here. If future source edits shift lines, this dataset must remain frozen rather than being compared naively against new logs.

## 14. Final-state textual representation

Three target final-state blocks change and 43 are identical. The printed block is only an observable projection. An intermediate equality or path partition can prove a predicate and disappear before function end; conversely, identical text does not prove identical internal relational states throughout analysis.

## 15. Coverage summaries

Reached-statement counts help rule out alarm disappearance caused by lost reachability. They do not fully enumerate path equivalence or expose every partition. For all ten reduced functions coverage is unchanged, but this remains a coarse control metric.

## 16. Timing dataset not fully persisted

Timing was observed during execution but was not persisted as a complete tracked dataset, therefore no complete quantitative performance comparison is claimed. `/usr/bin/time -v` output was transient for many runs. Any repository-wide runtime, CPU, or maximum-RSS table would be unsupported. Performance values absent from tracked artifacts are recorded as `NOT AVAILABLE IN TRACKED ARTIFACTS`.

## 17. Version dependence

The profile is verified for Frama-C 33.0 Arsenic. Meta-option behavior, domain implementations, defaults, output formatting, or option availability can change in other versions. A cross-version reproduction must record its version and treat differences as another experimental variable.

## 18. Fixed profile versus per-function tuning

The profile is uniform rather than optimized separately for each target. This strengthens scientific comparison but may leave function-specific precision opportunities unused. Per-function tuning would create a different study and must not be retroactively folded into this dataset.

## 19. Empty/incomplete active implementations

Some selected trigonometric interfaces contain empty or commented-out active bodies. Their Baseline/High Precision alarm count may be zero while a separate missing-return property stops propagation. The package describes active source as found and does not insert placeholder behavior.

## 20. Causal confidence

One copied-divisor equality case is assigned HIGH confidence because assignment, guard, and divisor line up directly. The other 21 removals are MEDIUM because several profile components can plausibly cooperate. No mechanism count should be presented as a measured option contribution.

## 21. Transition to KLEE

The next phase may attempt concrete witness generation for 149 remaining Eva occurrences. Its conceptual pipeline is:

```text
remaining Eva occurrence
  -> targeted safety predicate
  -> symbolic harness
  -> KLEE exploration
  -> candidate concrete testcase
  -> native replay
  -> confirmed witness, if replay succeeds
```

Failure to find a KLEE testcase does not prove safety. Search bounds, solver limits, environment modeling, undefined behavior, and path explosion can prevent a witness even when a path exists.

## Freeze requirement

Baseline results, High Precision results, comparison tables, causal analysis, and final Eva reports are a fixed phase-one dataset. Future witness artifacts must live outside these directories and must not rewrite the frozen evidence.
