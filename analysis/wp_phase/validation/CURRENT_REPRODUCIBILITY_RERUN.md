# Current Reproducibility Rerun

Date: 2026-10-31 (Asia/Tehran)

Only two representative targets were rerun; the full 48-target campaign was not repeated. New timestamped directories were used and no frozen result was overwritten.

| Target | Role | Frozen result | Current result | Current wall time |
| --- | --- | --- | --- | ---: |
| KLEE-ALARM-0001 | integer overflow, code repair, Qed-only | VALID/Qed | VALID/Qed | 0.888381851 s |
| KLEE-ALARM-0003 | invalid shift, specification completion, external prover | VALID/Alt-Ergo | VALID/Alt-Ergo 2.6.2 | 1.568453587 s |

Current successful rerun total: **2.456835438 s**. This is not a replacement for the historical total of 183.910237408 s.

An initial external-prover attempt inside the restricted execution sandbox could not open Why3's local Unix-domain solver socket (`Operation not permitted`). That environment failure was not classified as a proof result and is excluded from the table. The representative external proof was then rerun in the normal local environment and matched the frozen result. No division-by-zero representative was run because the 48-target WP subset contains no such target.
