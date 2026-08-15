# Limitations

1. The High Precision profile changes several Eva options and abstract domains simultaneously. It therefore measures the combined profile, not isolated option effects.
2. The experiment is not an ablation study and cannot establish a unique causal contribution for equality, octagon, partitioning, nonlinear subdivision, slevel, or integer-set precision. Mechanism labels are evidence-based candidates.
3. A condition that remains reported is not, by that fact alone, established as a runtime violation.
4. A condition removed by the stronger profile is not assigned a runtime classification in this phase.
5. Eva is a static abstract-interpretation analysis. Its results reflect sound abstract semantics, selected domains, joins, widenings, and configured precision.
6. Textual equality of final-state blocks does not expose all relational information held internally during transfer and reduction.
7. Timing information was collected during execution but was not persisted as a tracked experimental artifact for every function; therefore it is not used as a complete quantitative dataset in the final comparison.
8. No testcase or witness generation was performed here. KLEE is an independent next phase, and failure to obtain a testcase there will not by itself prove unreachability.
9. The source-level explanation uses the committed source and logs; it does not replay internal domain reductions or expose a per-option proof trace.
