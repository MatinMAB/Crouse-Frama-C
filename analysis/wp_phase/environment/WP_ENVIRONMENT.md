# Frama-C/WP Environment

- Frama-C: `33.0 (Arsenic)`
- Frama-C executable: `/home/matin/.opam/4.14.1/bin/frama-c`
- GUI launcher: `/home/matin/.opam/4.14.1/bin/frama-c-gui`
- Machine model: `ppc_32`
- WP model: `Typed+int`
- External prover aliases: `alt-ergo,z3,cvc5`
- Internal simplifier: `Qed` (part of WP, not an external prover)

## Tool versions

- Why3: `Why3 platform, version 1.8.2`
- Alt-Ergo: `v2.6.2`
- Z3: `Z3 version 4.8.12 - 64 bit`
- CVC5: `This is cvc5 version 1.1.2`
- C preprocessor: `cpp (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0`

## GUI availability

`frama-c-gui` is installed, but the installed launcher currently requires Node.js 24 or later.
No `node` or `yarn` executable was detected, so GUI launchers are prepared but cannot start
until that external prerequisite is supplied by the user. No software was installed or configured.

## Machine-readable reporting

Frama-C 33.0 supports `-wp-report-json`; terminal launchers write `wp-report.json`.
The Report plug-in CSV facility was discovered but is not enabled because WP JSON directly
records the isolated target goal without adding a broad property-reporting surface.
