# KLEE-ALARM-0015 final shift resolution

## Previous classification

This complementary `32-count` shift was already classified as an input-domain contract obligation with KLEE-ALARM-0014.

## Selected final semantics

The helper contract is `1 <= count && count < 32`, which makes both the low-word `count` and high-word `32-count` shifts valid. The caller is responsible for the domain.

- Final resolution: `REPOSITORY_CONTRACT`
- Evidence origin: `REPOSITORY_INFERRED`
- Requires clause: `requires 1 <= count && count < 32;`
- Interface conversion: none
- Original assertion: `eva_klee_alarm_0015: 0 <= (u32)(32 - count) && (u32)(32 - count) < 32` (unchanged)
- KLEE witness: `value=0; factor=0; count=0`
- Production callers: C wrapper count 15; public macro count 16; both satisfy the contract
- Resolution commit: recorded in the finalized matrix after this group commit

No implementation behavior was altered.
