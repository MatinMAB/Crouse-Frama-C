# KLEE-ALARM-0021 final shift resolution

## Previous classification

This complementary `32-count` shift shares the repository-supported count domain with KLEE-ALARM-0020.

## Selected final semantics

The helper contract is `1 <= count && count < 32`; consequently `(u32)(32-count)` is also in 1..31. The caller supplies a valid count and the implementation remains unchanged.

- Final resolution: `REPOSITORY_CONTRACT`
- Evidence origin: `REPOSITORY_INFERRED`
- Requires clause: `requires 1 <= count && count < 32;`
- Interface conversion: none
- Original assertion: `eva_klee_alarm_0021: 0 <= (u32)(32 - count) && (u32)(32 - count) < 32` (unchanged)
- KLEE witness: `value=0; factor=0; count=0`
- Production callers: C wrapper 8; public macro 8; both satisfy the contract
- Resolution commit: recorded in the finalized matrix after this group commit

No implementation fallback behavior was introduced.
