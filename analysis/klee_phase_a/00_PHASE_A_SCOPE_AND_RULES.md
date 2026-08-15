# KLEE Phase A — Scope, Rules, and Verdict Boundary

## Purpose

This phase answers a feasibility question before any project-wide symbolic execution:

> Can the frozen 149-alarm Eva dataset be studied with KLEE using a reproducible
> toolchain while controlling the semantic difference between Frama-C
> `ppc_32` and LLVM/KLEE?

Phase A is discovery and characterization, not alarm adjudication. It inventories
the installed toolchain, exercises only synthetic programs, records the C/LLVM
machine-model gap, and recommends an architecture for later phases.

## Starting repository state

**DIRECT REPOSITORY EVIDENCE**

- Repository: `/home/matin/frama-work/frama-eva-analysis`
- Starting branch: `docs/eva-report-evidence-package`
- Starting commit: `4e9ecee2708419276eb944bbc535f21397606b45`
- Required ancestor check for `4e9ecee`: exit status `0`
- Starting tracked/staged/untracked status: empty.
- The previously mentioned `reports/eva_report_source_package.zip` was not present
  in the actual initial `git status --short`; it was neither created nor touched.
- Phase-A branch: `analysis/klee-phase-a-environment`

Exact output is preserved in `raw/git_initial_state.txt` and
`raw/git_state_at_collection.txt`.

## Frozen Eva dataset

The following existing trees were treated as read-only:

```text
src_original/
src_analysis/
harnesses/
scripts/
results/baseline/
results/high_precision/
analysis/high_precision/
analysis/high_precision_comparison/
analysis/eva_precision_study_final/
reports/alarm_details/
reports/high_precision_comparison/
reports/eva_precision_study/
reports/eva_report_source_package/
```

No Frama-C analysis was executed. No project source, Eva harness, Eva runner,
parse state, Eva state, or existing report was edited.

## Dataset validation used by this phase

**DIRECT REPOSITORY EVIDENCE**

The committed evidence-package TSV files were read without modification:

- `functions.tsv`: 46 data rows;
- `high_precision_alarm_inventory.tsv`: 149 data rows;
- all 149 High Precision rows have comparison status `REMAINING`;
- categories: 100 integer overflow, 16 division by zero, 33 invalid shift;
- `alarm_comparison.tsv`: 171 rows, comprising 149 `REMAINING` and 22
  `REMOVED` entries.

The commands and results are preserved in `raw/frozen_dataset_validation.txt`.

## Actions allowed and performed

- Read-only OS, package, binary, Snap, source, Git, and Docker discovery.
- Compilation of synthetic, project-independent C microtests.
- Execution of those synthetic microtests with KLEE.
- Preservation of their commands, status codes, LLVM IR, KTest files, KLEE
  logs, and replay evidence under `microtests/generated/`.
- Creation of new documentation under `analysis/klee_phase_a/` and
  `reports/klee_phase_a/` only.

## Actions explicitly not performed

- No package install, removal, update, source build, Docker pull, Docker build,
  container run, or system configuration change.
- No project function was compiled for KLEE.
- No Eva harness was translated.
- No mapping of all 149 alarms to KLEE predicates was generated.
- No project POC, mass harness generation, witness campaign, replay campaign,
  or alarm classification was started.

## Evidence vocabulary

### DIRECT ENVIRONMENT / REPOSITORY EVIDENCE

A fact observable in a command output, source file, emitted LLVM IR, KLEE log,
KTest file, frozen TSV, or Git object.

### TECHNICAL INTERPRETATION

An engineering inference about compatibility, semantic fidelity, expected
behavior, architecture, or research validity. Interpretations are not stated as
facts and must remain revisable after Phase-B mapping or Phase-C POCs.

## Scientific non-implication

This phase does not use either of the following implications:

```text
no KLEE testcase => safe
KLEE testcase alone => confirmed native violation
```

A later campaign must distinguish symbolic testcase generation from controlled
replay and must retain outcomes such as `NO_WITNESS_WITHIN_BUDGET` and
`UNSUPPORTED` without converting them into safety claims.

## Phase-A verdict

```text
READY_FOR_PHASE_B_WITH_TOOLCHAIN_SETUP
```

**DIRECT EVIDENCE:** Phase B is a deterministic data-modeling task over the
already committed 149-row dataset and does not require project execution.
KLEE 3.2 with LLVM 13 successfully ran x86-64 synthetic tests, generated KTests,
and supported STP, Z3, KLEE libc, uClibc, POSIX runtime, and native replay.

**DIRECT EVIDENCE:** The installed Snap has only `*64*.bca` KLEE runtimes.
i386 bitcode failed because `libkleeRuntimeFreestanding32_Release+Debug.bca`
was absent. PowerPC bitcode produced a target-selection warning followed by an
assertion failure. Host LP64 makes project `signed long`/`unsigned long` 64-bit,
unlike Eva `ppc_32`.

**TECHNICAL INTERPRETATION:** Phase B can proceed now, but a defensible Phase C
must first pin LLVM/KLEE 13-compatible tooling and implement an explicit-width
semantic adapter plus safety predicates, preferably in a reproducible container.
Direct PowerPC symbolic execution is not supported by the current installation.
