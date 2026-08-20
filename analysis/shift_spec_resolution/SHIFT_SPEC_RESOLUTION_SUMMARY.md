# Shift specification resolution summary

## Outcome

The 13 KLEE-confirmed invalid-shift alarms reduce to **7 distinct specification decisions**. Repository evidence justifies future input-domain contracts for **5 alarms** in three helper groups. **8 alarms** in four helper groups remain unresolved because the compiled C wrappers pass valid bit counts while the delivered public `ecmath.h` macros pass invalid power-of-two scale values. No target has evidence that justifies implementation fallback behavior.

| Accounting | Count |
|---|---:|
| Total ambiguous targets analyzed | 13 |
| Distinct semantic groups | 7 |
| `INPUT_DOMAIN_CONTRACT_JUSTIFIED` | 5 |
| `IMPLEMENTATION_HANDLING_REQUIRED` | 0 |
| `SPECIFICATION_UNRESOLVED` | 8 |
| Reconciled total | 13 |

## Methodology

The analysis joined the frozen 149-property map and 48-counterexample manifest, inspected each exact source occurrence and preserved assertion, derived promoted operand widths for `ppc_32`, audited tracked production callers in `mul_Ccode.c`, audited the delivered `ecmath.h` macro interfaces, listed the deliberately symbolic KLEE harnesses separately, searched repository documentation/tests/models, and inspected Git history. KLEE evidence was used only to establish violability, never to justify a precondition.

All seven functions are classified as **generated internal functions with externally visible declarations**: `ecmath.h` groups them under `ROOT FUNCTIONS`, while fixed-scaling facade functions/macros are the production interfaces. The exported root declarations mean the inferred helper boundary should be made explicit if contracts are later applied.

## Semantic groups

| Group | Alarm IDs | Root helper | Resolution | Future proposed clause |
|---|---|---|---|---|
| `S32_S16_TWO_WORD_SHIFT` | KLEE-ALARM-0002, KLEE-ALARM-0003 | `root_s32_mul_s32_s16_fac_less1` | SPECIFICATION_UNRESOLVED | `NOT_PROPOSED` |
| `S32_S8_TWO_WORD_SHIFT` | KLEE-ALARM-0005, KLEE-ALARM-0006 | `root_s32_mul_s32_s8_fac_less1` | SPECIFICATION_UNRESOLVED | `NOT_PROPOSED` |
| `S32_U16_TWO_WORD_SHIFT` | KLEE-ALARM-0009, KLEE-ALARM-0010 | `root_s32_mul_s32_u16_fac_less1` | SPECIFICATION_UNRESOLVED | `NOT_PROPOSED` |
| `S32_U8_TWO_WORD_SHIFT` | KLEE-ALARM-0012, KLEE-ALARM-0013 | `root_s32_mul_s32_u8_fac_less1` | SPECIFICATION_UNRESOLVED | `NOT_PROPOSED` |
| `U32_S16_TWO_WORD_SHIFT` | KLEE-ALARM-0014, KLEE-ALARM-0015 | `root_u32_mul_u32_s16_fac_less1` | INPUT_DOMAIN_CONTRACT_JUSTIFIED | `/*@ requires 1 <= count && count < 32; */` |
| `U32_S32_HIGH_WORD_SHIFT` | KLEE-ALARM-0019 | `root_u32_mul_u32_s32_fac_less1` | INPUT_DOMAIN_CONTRACT_JUSTIFIED | `/*@ requires 32 <= count && count < 64; */` |
| `U32_S8_TWO_WORD_SHIFT` | KLEE-ALARM-0020, KLEE-ALARM-0021 | `root_u32_mul_u32_s8_fac_less1` | INPUT_DOMAIN_CONTRACT_JUSTIFIED | `/*@ requires 1 <= count && count < 32; */` |

## Target decisions

| Alarm | Function | Group | Resolution | Proposed clause | Next action |
|---|---|---|---|---|---|
| KLEE-ALARM-0002 | `root_s32_mul_s32_s16_fac_less1` | `S32_S16_TWO_WORD_SHIFT` | SPECIFICATION_UNRESOLVED | `NOT_PROPOSED` | DOMAIN_EXPERT_REQUIRED |
| KLEE-ALARM-0003 | `root_s32_mul_s32_s16_fac_less1` | `S32_S16_TWO_WORD_SHIFT` | SPECIFICATION_UNRESOLVED | `NOT_PROPOSED` | DOMAIN_EXPERT_REQUIRED |
| KLEE-ALARM-0005 | `root_s32_mul_s32_s8_fac_less1` | `S32_S8_TWO_WORD_SHIFT` | SPECIFICATION_UNRESOLVED | `NOT_PROPOSED` | DOMAIN_EXPERT_REQUIRED |
| KLEE-ALARM-0006 | `root_s32_mul_s32_s8_fac_less1` | `S32_S8_TWO_WORD_SHIFT` | SPECIFICATION_UNRESOLVED | `NOT_PROPOSED` | DOMAIN_EXPERT_REQUIRED |
| KLEE-ALARM-0009 | `root_s32_mul_s32_u16_fac_less1` | `S32_U16_TWO_WORD_SHIFT` | SPECIFICATION_UNRESOLVED | `NOT_PROPOSED` | DOMAIN_EXPERT_REQUIRED |
| KLEE-ALARM-0010 | `root_s32_mul_s32_u16_fac_less1` | `S32_U16_TWO_WORD_SHIFT` | SPECIFICATION_UNRESOLVED | `NOT_PROPOSED` | DOMAIN_EXPERT_REQUIRED |
| KLEE-ALARM-0012 | `root_s32_mul_s32_u8_fac_less1` | `S32_U8_TWO_WORD_SHIFT` | SPECIFICATION_UNRESOLVED | `NOT_PROPOSED` | DOMAIN_EXPERT_REQUIRED |
| KLEE-ALARM-0013 | `root_s32_mul_s32_u8_fac_less1` | `S32_U8_TWO_WORD_SHIFT` | SPECIFICATION_UNRESOLVED | `NOT_PROPOSED` | DOMAIN_EXPERT_REQUIRED |
| KLEE-ALARM-0014 | `root_u32_mul_u32_s16_fac_less1` | `U32_S16_TWO_WORD_SHIFT` | INPUT_DOMAIN_CONTRACT_JUSTIFIED | `/*@ requires 1 <= count && count < 32; */` | ADD_PRECONDITION_AND_WP |
| KLEE-ALARM-0015 | `root_u32_mul_u32_s16_fac_less1` | `U32_S16_TWO_WORD_SHIFT` | INPUT_DOMAIN_CONTRACT_JUSTIFIED | `/*@ requires 1 <= count && count < 32; */` | ADD_PRECONDITION_AND_WP |
| KLEE-ALARM-0019 | `root_u32_mul_u32_s32_fac_less1` | `U32_S32_HIGH_WORD_SHIFT` | INPUT_DOMAIN_CONTRACT_JUSTIFIED | `/*@ requires 32 <= count && count < 64; */` | ADD_PRECONDITION_AND_WP |
| KLEE-ALARM-0020 | `root_u32_mul_u32_s8_fac_less1` | `U32_S8_TWO_WORD_SHIFT` | INPUT_DOMAIN_CONTRACT_JUSTIFIED | `/*@ requires 1 <= count && count < 32; */` | ADD_PRECONDITION_AND_WP |
| KLEE-ALARM-0021 | `root_u32_mul_u32_s8_fac_less1` | `U32_S8_TWO_WORD_SHIFT` | INPUT_DOMAIN_CONTRACT_JUSTIFIED | `/*@ requires 1 <= count && count < 32; */` | ADD_PRECONDITION_AND_WP |

## Contract-justified targets

- `KLEE-ALARM-0014` and `KLEE-ALARM-0015`: propose `/*@ requires 1 <= count && count < 32; */`. The compiled wrapper passes 15 and the delivered public macro passes 16; both satisfy the two-word shift domain.
- `KLEE-ALARM-0019`: propose `/*@ requires 32 <= count && count < 64; */`. Both production interfaces pass 32, matching the documented high-word scaling.
- `KLEE-ALARM-0020` and `KLEE-ALARM-0021`: propose `/*@ requires 1 <= count && count < 32; */`. Both production interfaces pass 8.

The analysis harnesses intentionally leave `count` symbolic and therefore do not satisfy these proposed contracts by construction. They are not application callers; their role was to expose missing assumptions.

## Unresolved interface contradictions

| Root helper | Compiled C wrapper | Delivered public macro | Candidate safe domain | Consequence |
|---|---:|---:|---|---|
| `root_s32_mul_s32_s16_fac_less1` | 16 | 65536 | 1..31 | unresolved encoding |
| `root_s32_mul_s32_s8_fac_less1` | 8 | 256 | 1..31 | unresolved encoding |
| `root_s32_mul_s32_u16_fac_less1` | 17 | 131072 | 1..31 | unresolved encoding; nearby legacy formula also says 19 |
| `root_s32_mul_s32_u8_fac_less1` | 9 | 512 | 1..31 | unresolved encoding |

These macro arguments are not legal C shift counts in the current root implementations. The same power-of-two values appear as commented historical alternatives beside the corrected-looking bit counts in `mul_Ccode.c`. The repository contains no pre-import history or external baseline that establishes whether `ecmath.h` is stale or whether another implementation once accepted divisors. Accordingly, no requires clause and no implementation repair is proposed for these eight alarms.

## Caller audit and limitations

The complete per-alarm caller table is in `CALLER_CONTRACT_AUDIT.tsv`. No production caller contradicts the clauses proposed for alarms 0014, 0015, 0019, 0020, or 0021. The four legacy macros above contradict the candidate safe domain for the eight unresolved alarms. No independent unit tests, Matlab/Simulink artifacts, or design specifications were found.

The proposed clauses have **not** been inserted. A future phase should add them only to the five contract-justified target functions, preserve all existing Eva-derived assertions, update only those targets to WP-ready, and run a separately frozen target-only WP campaign. The eight unresolved alarms require a domain expert or the original MATH/SP_MATH baseline to decide whether the macro encoding is erroneous.

## Phase integrity

- Starting commit/tag: `a73db0ccf72cdbf361a026589cf27f1bc867c905` / `thesis/wp-repaired-targets-campaign-analyzed`.
- Source changes: none.
- ACSL changes: none.
- Eva executions: none.
- KLEE executions: none.
- WP executions: none.
- Only specification-analysis documents are intended for the phase commit.
