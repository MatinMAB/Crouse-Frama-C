# Final shift resolution summary

## Outcome

All 13 remaining KLEE-confirmed shift targets are semantically resolved and prepared for a separate target-only WP campaign. The seven physical helper groups use explicit function-level input contracts while retaining every original Eva-derived assertion as the selected WP goal.

| Accounting | Count |
|---|---:|
| Previously repaired and WP-valid confirmed targets | 35 |
| Newly resolved shift targets | 13 |
| Total semantically resolved confirmed targets | 48 |
| Repository-derived target resolutions | 5 |
| Thesis-policy-selected target resolutions | 8 |
| Remaining unresolved | 0 |
| Final shift targets currently WP-ready / not run | 13 |

## Seven semantic decisions

| Group | Alarms | Final policy | Origin | Contract / normalization | Commit |
|---|---|---|---|---|---|
| Signed s16 two-word | 0002, 0003 | `THESIS_INTERFACE_POLICY` | `THESIS_POLICY_SELECTED` | helper `1 <= count < 32`; public `65536 -> 16` | `371c2e3ca2202f31d0ed9c3be90d7bf028dab514` |
| Signed s8 two-word | 0005, 0006 | `THESIS_INTERFACE_POLICY` | `THESIS_POLICY_SELECTED` | helper `1 <= count < 32`; public `256 -> 8` | `830f84d2f53e7c49f66359a75abd9a7f30a0d188` |
| Signed u16 two-word | 0009, 0010 | `THESIS_INTERFACE_POLICY` | `THESIS_POLICY_SELECTED` | helper `1 <= count < 32`; public `131072 -> 17` | `9b0ac88fd7411c6469360b76c329546c9f12a0ff` |
| Signed u8 two-word | 0012, 0013 | `THESIS_INTERFACE_POLICY` | `THESIS_POLICY_SELECTED` | helper `1 <= count < 32`; public `512 -> 9` | `f4b910ba1e64a01f4bd3ae9056eb5321af5296a6` |
| Unsigned s16 two-word | 0014, 0015 | `REPOSITORY_CONTRACT` | `REPOSITORY_INFERRED` | `1 <= count && count < 32` | `220e3e2e674ac5edc39acbc59cd30311c12c6436` |
| Unsigned s32 high-word | 0019 | `REPOSITORY_CONTRACT` | `REPOSITORY_INFERRED` | `32 <= count && count < 64` | `12c3299c286e364dd0cb18c5f8582452381150b1` |
| Unsigned s8 two-word | 0020, 0021 | `REPOSITORY_CONTRACT` | `REPOSITORY_INFERRED` | `1 <= count && count < 32` | `41d79fffb2cc054e3ac5c86eacc611ab7a46b489` |

## Thesis-policy boundary

The legacy source does not uniquely specify whether four public macro constants are divisors or literal helper counts. This thesis selects a coherent interface boundary: the two-argument public macros retain their documented fixed-point semantics, their embedded exact powers of two are statically translated to bit counts, and the current low-level helpers accept bit counts only. The mappings are exact integer constants, not runtime logarithms. Direct helper calls outside the declared count domains are outside the thesis-defined helper API. This is not presented as an original repository contract.

No count masking, modulo, clamping, saturation, arbitrary return, or runtime fallback was added. Function bodies are unchanged. Four public macro expansion constants and seven ACSL requires clauses are the complete source/specification change.

## Caller validation

`CALLER_VALIDATION.tsv` audits 14 production interface rows: the C wrapper and public macro for each group. After normalization, all 14 pass the relevant helper contract; violations are zero. The symbolic KLEE harnesses remain counterexample evidence rather than production callers.

## Structural and parser validation

- Original shift assertions discovered: 13.
- Preserved unique labels: 13.
- Changed assertion predicates: 0.
- Missing labels: 0.
- C syntax command: `gcc -fsyntax-only -Isrc_repaired/headers src_repaired/sources/mul_Ccode.c src_repaired/sources/MulHword.c` — passed.
- Frama-C parsing/ACSL command: `frama-c -no-autoload-plugins -machdep ppc_32 -cpp-extra-args=-Isrc_repaired/headers src_repaired/sources/mul_Ccode.c src_repaired/sources/MulHword.c` — passed with the pre-existing `s16_mul_s16_u16_fac025` fall-through warning.
- WP, Eva, KLEE, and GUI were not run.
- The prior 35 WP result directories and reports were not modified.

## WP preparation

All 13 metadata records now say `WP_READY`, retain `ppc_32` and `Typed+int`, select only their own `eva_klee_alarm_XXXX` label, and contain no `-wp-rte`. `WP_FINAL_SHIFT_CAMPAIGN_MANIFEST.tsv` records `NOT_RUN` for every target. The user-run entry point is `./analysis/wp_phase/run_final_shift_campaign.sh`.
