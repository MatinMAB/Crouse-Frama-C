# KLEE-ALARM-0014 final shift resolution

## Previous classification

`INPUT_DOMAIN_CONTRACT_JUSTIFIED`: both production interfaces already supplied legal counts and the helper's two-word algorithm structurally requires 1..31.

## Selected final semantics

`count` is an internal bit count with accepted domain `1 <= count && count < 32`. Zero and values at least 32 are invalid helper inputs; the caller owns the obligation. No interface conversion or implementation fallback is needed.

- Final resolution: `REPOSITORY_CONTRACT`
- Evidence origin: `REPOSITORY_INFERRED`
- Requires clause: `requires 1 <= count && count < 32;`
- Interface conversion: none
- Original assertion: `eva_klee_alarm_0014: 0 <= count && count < 32` (unchanged)
- KLEE witness: `value=0; factor=0; count=4294967295`
- Production callers: C wrapper count 15; public macro count 16; both satisfy the contract
- Resolution commit: recorded in the finalized matrix after this group commit

The different production constants indicate scale-variant use of the helper but do not contradict its safety domain.
