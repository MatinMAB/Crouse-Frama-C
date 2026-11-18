# E-ACSL Final Freeze Audit

## FINAL VERDICT

**PASS WITH DOCUMENTED LIMITATIONS**

The normalized property sets, runtime classifications, seven direct violations,
and 120 measured performance rows reconcile with primary Git evidence. The
principal scientific limitation is that property definition/static
instrumentation used `ppc_32`, whereas executable monitoring used native
`x86_64` LP64. In particular, project aliases `s32/u32` are `long` and therefore
were 64-bit in the native runtime campaign. A second limitation is the split
raw-evidence retention described below.

## Git provenance

```text
Base branch: analysis/wp-verification
Base commit: e79f62404a280add6f5bc63610a9fe1803e37c16
E-ACSL branch: analysis/eacsl-runtime-monitoring
Audited pre-freeze HEAD: ed4760d33b574200857e420a6209263895a23e85
Final HEAD: the commit containing this document (resolve with git rev-parse HEAD)
```

Historical experiment lineage:

```text
09e759283a6f1f9483cb560873e0b97d544fa714  canonical repaired source
3c307992ec1f8ee1839b1ef675e9d6c63519146e  static instrumentation campaign
4f31f893a17c71af197d186dedb9341842279699  runtime/property-observation campaign
66169432bfcc381ed5c2ad97079e5ffc69a1b085  final historical correlation
```

## E-ACSL versus E-ACSL2

| Component | Historical experiment implementation | Evidence |
|---|---|---|
| ACSL instrumentation | Stock Frama-C E-ACSL 33.0: `frama-c -e-acsl -e-acsl-valid` | Historical commands, captured `/home/matin/.opam/4.14.1/bin/frama-c`, plugin help, generated C |
| Runtime assertion detection | Stock E-ACSL generated checks and stock runtime library | `e-acsl-gcc -C`, generated C and historical build scripts |
| Violation reporting | Stock blocking-assert diagnostic, including ACSL label and contributing values | Seven retained raw `stderr.txt` files |
| Reaction handling | Stock diagnostic followed by `abort`; no policy engine | Seven exit statuses equal 134; no reaction-framework flags/logs/runtime sources |
| Performance experiment | Stock E-ACSL FULL and SELECTIVE executables compiled with GCC 13.3.0 | Static/dynamic raw tables, campaign metadata, checksums |

Custom E-ACSL2 was **not used** by any component of this campaign. The separate
checkout `/home/matin/eacsl2/matin/frama-c` has inspected HEAD
`736903e3c3d4a55a642d063ece092ae5e4832370` and an opt-in reaction subsystem
covering `STOP`, `CONTINUE`, `SAFE_STATE`, `RECOVERY`, and `REEXECUTE`. Those
features have their own `tests/eacsl2_validation` artifacts. None of their CLI
flags (`--reaction-framework`, metadata/reaction-log options), runtime source
paths, or event logs occurs in the 149/101 historical scripts or artifacts.
They belong to a different experiment and were not a hidden event/reaction
layer for the evidence frozen here.

## Exact property selection

```text
High Precision: 149
WP proved: 48
E-ACSL selected: 101

WP ∩ EACSL: empty
WP ∪ EACSL: exact High-Precision set (149/149)

KLEE completed without witness: 15
KLEE timeout/inconclusive: 86
E-ACSL selected = no-witness ∪ timeout: exact ID-set equality
```

No WP-proved ID is selected for selective runtime instrumentation and no
WP-proved ID has a retained runtime-violation event.

## Instrumentation identity

```text
CONTROL unique target properties/check sites: 0
FULL unique target properties/check sites: 149
SELECTIVE unique target properties/check sites: 101
```

These figures count unique `eva_klee_alarm_NNNN` target labels at generated
target-check sites. They are not total helper checks inserted by E-ACSL. Actual
generated C retained in Git objects has 149/149 and 101/101 site/unique-label
counts; historical `target_check_count.txt` records 0 for CONTROL.

## Runtime classifications

| Classification | Count | Scientific meaning |
|---|---:|---|
| `RUNTIME_VIOLATION` | 7 | Target label directly failed in its concrete execution |
| `NO_VIOLATION_OBSERVED` | 48 | No violation in that retained execution; not proof |
| `NOT_REACHED` | 42 | A different earlier check aborted; inconclusive |
| `AMBIGUOUS_OUTPUT` | 4 | Failure could not be attributed to a target label; inconclusive |

The partition is exact: `7 + 48 + 42 + 4 = 101`. The scientifically correct
summary is: **94 targets had no direct target-matched violation, but only 48
were classified `NO_VIOLATION_OBSERVED`; 42 were `NOT_REACHED` and 4 were
`AMBIGUOUS_OUTPUT`.**

## Seven direct violations

```text
KLEE-ALARM-0024
KLEE-ALARM-0046
KLEE-ALARM-0084
KLEE-ALARM-0089
KLEE-ALARM-0120
KLEE-ALARM-0127
KLEE-ALARM-0135
```

For all seven: prior KLEE status is `INCONCLUSIVE_TIMEOUT`; selection in the
101-set is confirmed; membership in the WP 48-set is false; expected and
observed assertion labels match exactly; concrete inputs are retained; exit
status is 134; raw stderr/stdout/exit paths exist; and the diagnostic followed
by process abort is directly evidenced. There are seven rows/events and seven
distinct property IDs, so **7 unique violated properties** and **7 direct
violation events** are both true for this dataset. Their equality is an
observed dataset property, not a general assumption that one property can only
fail once.

## Observation workload

The corpus has 101 unique case IDs, 101 unique alarm IDs, and exact equality
with the selected 101-set. Each case is one isolated process invocation and
retains alarm ID, function, concrete input values, an expected-violation/
reachability field, and the resulting classification. Earlier assertions can
abort a process before the target, which explains the `NOT_REACHED` class.

## Performance measurements

```text
Static measurements: 10 CONTROL + 10 FULL + 10 SELECTIVE = 30
Dynamic measured:    30 CONTROL + 30 FULL + 30 SELECTIVE = 90
Normalized measured rows: 120

Warm-up executions: 5 CONTROL + 5 FULL + 5 SELECTIVE = 15
Functional-sanity executions: 3
```

The previously suggested total of **45 warm-up executions is not supported by
primary evidence**. Historical script and `PERFORMANCE_RUN_ORDER.tsv` show five
warm-ups per scenario, hence 15 total. Warm-ups and sanity executions are not
part of the 120 measurement rows.

```text
FULL instrumentation median:      6.710000 s
SELECTIVE instrumentation median: 6.010000 s
Reduction of scenario medians:    10.432191%

FULL runtime median:              5.939651870 s
SELECTIVE runtime median:         4.867204497 s
Reduction of scenario medians:    18.055728%
```

Both reductions use `(median(FULL)-median(SELECTIVE))/median(FULL)*100`.
They are reductions of aggregate scenario medians, not medians of per-run
percentage reductions.

The deterministic performance harness invokes 33 functions once per inner
iteration and performs 100000 iterations: 3.3 million target-function calls
per scenario execution. CONTROL, FULL, and SELECTIVE use the same harness,
input profile, source revision, GCC `-O2` configuration, CPU pinning, and run
ordering policy. All 90 measured executions exit zero and report checksum
`5272412154435795075`; the three sanity executions report the same checksum.

## Static/native model boundary

```text
Property definition and static instrumentation model: ppc_32
Executable monitoring model: native x86_64 LP64
```

`src_repaired/headers/Platform_Types.h` defines `s8/u8` with `char`, `s16/u16`
with `short`, and `s32/u32` with `long`. The historical host has 8-bit char,
16-bit short and 64-bit long. Consequently, the 8/16-bit aliases retain the
expected widths but `s32/u32` do not retain PPC32 width. No `-m32`, `stdint.h`
compatibility layer, or compile-time width assertion was used. This can affect
overflow, cast, promotion and other width-sensitive behavior. Runtime outcomes
are therefore claims about the recorded native executable, not PPC32 runtime
equivalence. The FULL-versus-SELECTIVE performance comparison remains internally
controlled because both use the same native data model and workload.

## Historical/raw evidence limitations

- Current frozen tree: normalized rows for 101/101 cases.
- Current frozen tree: complete raw stdout/stderr/exit files for 7/7 direct
  violations only.
- For the 48 `NO_VIOLATION_OBSERVED`, 42 `NOT_REACHED`, and 4
  `AMBIGUOUS_OUTPUT` cases, the current tree retains normalized exit code,
  observed label, excerpt and historical path—not standalone raw files.
- Commit `1adf3521b1faf5f56fde5e7348e49be59be3f812` retains all 101 raw
  stdout/stderr/exit triplets. It is on `analysis/klee-witness`, not the E-ACSL
  lineage, and added 1432 E-ACSL generated/work files while nominally fixing a
  KLEE timeout script. This accidental cross-phase retention explains the
  unusual provenance.
- Git object identity makes the retained blobs immutable. SHA-256 values for
  all seven copied violation stderr files match the corresponding blobs in
  that commit byte-for-byte and are recorded in `SHA256SUMS`.
- The installed OPAM Frama-C binary provides a precise version but no uniquely
  attributable source commit for the E-ACSL binary.

## Claim boundary

The strongest supported positive claim is:

> Seven concrete runtime violations were observed for seven selected
> properties under the retained concrete workload.

`NO_VIOLATION_OBSERVED` is not a proof of safety. `NOT_REACHED` and
`AMBIGUOUS_OUTPUT` are inconclusive. No whole-program safety, production
coverage, PPC32 runtime equivalence, or general absence-of-violation claim is
made.
