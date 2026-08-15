# Repository and Experiment Architecture

## Scope of this evidence package

This package documents the frozen Frama-C Eva phase. It does not execute Eva, KLEE, a compiler, or a runner. All evidence is read from committed or intentionally ignored repository artifacts. New files are confined to `reports/eva_report_source_package/`.

## DIRECT REPOSITORY EVIDENCE

### Frozen starting point

The package branch was created from commit `6b6a565a4fb01eadb593437f1b1617e13b92d486` on `analysis/eva-precision-study-final`. The worktree was clean before branch creation. The documentation branch is `docs/eva-report-evidence-package`.

### Stage chain

| Stage | Commit | Repository role |
| --- | --- | --- |
| High Precision scaffold | `f2901e9` | environment capture, 46-function manifest, profile documentation |
| High Precision runners | `4a2eaa1` | common-profile function-specific runners |
| High Precision execution | 46 independent commits | four result artifacts per function |
| Comparison tooling | `e7d2fb7` | log-only canonical multiset comparator |
| Comparison results | `ed34fdc` | 46-row, category, alarm-diff, per-function, and global outputs |
| Removed-alarm analysis | `51bc816` | 22-row source/evidence/mechanism dataset and ten detailed function reports |
| Final Eva report | `6b6a565` | frozen report, reproducibility guide, and compact summary |

The Baseline history precedes the High Precision scaffold and supplies per-function harness, runner, result, and alarm-detail commits. Full file-to-commit mapping is in `data/git_traceability.tsv`.

### Directory roles

| Path | Role | Mutability in this package phase |
| --- | --- | --- |
| `src_original/` | preserved original source snapshot | read-only |
| `src_analysis/` | source/header tree analyzed by Eva | read-only |
| `harnesses/` | 46 selected abstract entry-point harnesses | read-only |
| `scripts/` | Baseline, High Precision, and comparison tooling | read-only |
| `results/baseline/` | 184 Baseline artifacts | read-only |
| `results/high_precision/` | 184 High Precision artifacts | read-only |
| `reports/alarm_details/` | 46 concise Baseline reports | read-only |
| `reports/work_notes/` | 46 detailed local notes, ignored by Git | read-only |
| `analysis/high_precision/` | manifest, environment, profile | read-only |
| `analysis/high_precision_comparison/` | canonical comparison dataset | read-only |
| `analysis/eva_precision_study_final/` | final causal-analysis dataset | read-only |
| `reports/eva_precision_study/` | frozen final Eva reports | read-only |
| `reports/eva_report_source_package/` | newly created evidence package | writable output |

### Per-function experiment model

Each selected function has:

1. one project declaration and definition;
2. one abstract harness with `eva_main`;
3. one Baseline runner and one High Precision runner;
4. exact source/helper lists in both runners;
5. four Baseline artifacts and four High Precision artifacts;
6. a concise alarm-detail report;
7. a work note on disk;
8. comparison and final-study table rows;
9. Git provenance for tracked artifacts.

The four artifacts per execution mode are:

```text
<FUNCTION>_parse.log
<FUNCTION>_parse.sav
<FUNCTION>_eva.log
<FUNCTION>_eva.sav
```

The repository contains exactly 184 Baseline and 184 High Precision files across the selected 46 directories; every selected directory contains exactly four files.

### Experimental flow

```text
Frozen source + exact harness
          |
          +--> Baseline parse --> Baseline Eva --> 4 artifacts
          |
          +--> identical parse --> High Precision Eva --> 4 artifacts
                                                    |
                                                    v
                                    canonical multiset comparison
                                                    |
                                  22 removed / 149 remaining / 0 new
                                                    |
                                  source-level causal interpretation
```

### Evidence hierarchy

Primary numerical sources are Eva logs and generated comparison TSVs. Source/header/harness/runner files establish program and configuration facts. Parse logs establish program-construction consistency. Git establishes chronology and artifact ownership. Narrative reports are explanatory cross-checks rather than substitutes for log-derived counts.

## TECHNICAL INTERPRETATION

The architecture makes the target function the experimental unit. This controls irrelevant call-graph expansion, allows exact source/helper reuse, and makes a result traceable to a single commit. Separating parse from Eva is especially important: byte-identical parse logs for all 46 pairs provide evidence that alarm changes are associated with the Eva profile rather than a different parsed program.

The full-domain harness strategy intentionally avoids undocumented caller constraints. It therefore measures what Eva can establish over the complete modeled type domains. This improves reproducibility but may cover input combinations not exercised by a deployed caller; that boundary is recorded rather than silently narrowed.
