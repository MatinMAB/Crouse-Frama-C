# Eva High-Precision Profile

## Evidence and meta-option expansion

The active installation reports Frama-C `33.0 (Arsenic)`. Availability was checked with `frama-c -eva-help` and `frama-c -eva-domains help`. The complete raw outputs are stored beside this document.

The standard CLI exposes the `precision-settings` Eva message category. It prints the meta-option expansion when a real Eva analysis starts. No analysis was run during scaffold creation, so the expansion was instead verified from the installed Arsenic source for Eva parameters. For precision level 11, the relevant computed settings are:

| Setting | Precision-11 value |
| --- | ---: |
| `-eva-slevel` | 5000 |
| `-eva-ilevel` | 256 |
| `-eva-plevel` | 2000 |
| `-eva-subdivide-non-linear` | 220 |
| `-eva-partition-history` | 2 |
| `-eva-auto-loop-unroll` | 1024 |
| `-eva-min-loop-unroll` | 4 |
| `-eva-widening-delay` | 6 |
| `-eva-split-return` | `auto` |
| `-eva-equality-through-calls` | `formals` |
| `-eva-octagon-through-calls` | enabled |
| domains | `cvalue,symbolic-locations,equality,gauges,octagon` |

Arsenic does not overwrite an option explicitly set by the user. Runners still place `-eva-precision 11` first and all intentional explicit choices afterward so the override policy remains obvious during review.

## Final uniform profile

| Option | Final value | Set by precision 11 or explicit | Reason | Expected precision benefit | Potential cost |
| --- | --- | --- | --- | --- | --- |
| `-eva` | enabled | explicit | Starts Eva after loading the unchanged parse project. | Performs the value analysis. | Analysis time and memory. |
| `-eva-precision` | 11 | explicit meta-option | Highest supported standard precision level. | Raises state separation, loop treatment, relational domains, array precision, and non-linear evaluation together. | Potentially slow. |
| `-eva-slevel` | 5000 | precision 11 | Higher than the Baseline value 1000. | Delays joins across branches and unrolled control flow. | More states and memory. |
| `-eva-plevel` | 2000 | precision 11 | High array-index precision; no larger repository-wide override is justified by the mostly scalar study. | More precise bounded table/array accesses when present. | Cost on wide index intervals. |
| `-eva-partition-history` | 2 | precision 11 | Keeps two recent branch decisions distinct without an unbounded history. | Reduces premature merges after nested guards. | State multiplication. |
| `-eva-auto-loop-unroll` | 1024 | precision 11 | Maximum meta-profile value for easily bounded loops. | Avoids widening and joins for many small bounded loops. | Large loops may be expensive. |
| `-eva-min-loop-unroll` | 4 | precision 11 | Gives every loop an initial precise prefix. | Improves early-iteration and boundary reasoning. | Extra states per loop. |
| `-eva-widening-delay` | 6 | precision 11 | Delays widening beyond the default. | Preserves loop invariants longer. | Slower convergence. |
| `-eva-domains` | `cvalue,equality,symbolic-locations,gauges,octagon,bitwise` | explicit override | Retains all level-11 domains and adds the supported non-experimental `bitwise` domain. | Combines scalar/memory values, equalities, symbolic lvalues, loop relations, pairwise integer relations, and bit information. | Reduced product and domain transfer cost. |
| `-eva-equality-through-calls` | `all` | explicit override of `formals` | Preserve equalities beyond only formal/concrete argument pairs. | Retains temporary/guard/arithmetic relationships through helper calls. | Larger equality states and call transfer cost. |
| `-eva-octagon-through-calls` | enabled | explicit confirmation of precision 11 | Preserve octagonal relations across helpers. | Improves relational integer bounds at and after calls such as `MulHighWord`. | Interprocedural relational cost. |
| `-eva-interprocedural-splits` | enabled | explicit | Keep partition splits through returns. | Avoids joining caller-relevant cases at helper boundaries. | More return states. |
| `-eva-interprocedural-history` | enabled | explicit | Keep the two-step partition history through returns. | Retains branch provenance across helpers. | More distinct states. |
| `-eva-split-return` | `full` | explicit override of `auto` | Each benchmark is small and isolated, so all separated return states are useful. | Maximum preservation of caller-visible return cases. | Potentially significant return-state growth. |
| `-eva-subdivide-non-linear` | 500 | explicit override of 220 | The corpus is multiplication-heavy; 500 is a high but bounded subdivision budget. | More precise repeated-variable and non-linear expression evaluation. | Increased expression-evaluation time. |
| `-eva-ilevel` | 1024 | explicit override of 256 | Preserve larger finite integer sets before interval/congruence fallback. | Better precision for discrete fixed-point values, branch results, and shifts. | Larger value sets and memory. |

## Available options not specialized per function

- `-eva-slevel-function`, `-eva-subdivide-non-linear-function`, and `-eva-partition-history-function` are supported but intentionally unused. All 46 analyses use one common profile.
- No explicit `-eva-plevel` is added because precision 11 already raises it to 2000 and the corpus is primarily scalar.
- No alarm suppression, `-eva-use-spec`, input restriction, precondition, or source transformation is used.

## Domain exclusions

- `multidim`, `taint`, `numerors`, and `traces` are marked experimental by the installed domain help and are excluded.
- `printer` is a developer/debug domain and is excluded.
- `mthread` and `inout` do not match this single-threaded scalar benchmark.
- APRON domains are not listed by the installed build and are therefore unavailable for this profile.

## Exact Eva option block

```bash
  -eva \
  -eva-precision 11 \
  -eva-domains cvalue,equality,symbolic-locations,gauges,octagon,bitwise \
  -eva-equality-through-calls all \
  -eva-octagon-through-calls \
  -eva-interprocedural-splits \
  -eva-interprocedural-history \
  -eva-split-return full \
  -eva-subdivide-non-linear 500 \
  -eva-ilevel 1024 \
```

This exact block is shared by all 46 individual runners.
