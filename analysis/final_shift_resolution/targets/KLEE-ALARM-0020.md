# KLEE-ALARM-0020 final shift resolution

## Previous classification

`INPUT_DOMAIN_CONTRACT_JUSTIFIED`: both production interfaces pass the documented shift count 8 to a generated two-word helper.

## Selected final semantics

The helper accepts internal bit counts `1 <= count && count < 32`; callers own this obligation. Zero and counts at least 32 are outside the helper domain. No normalization or fallback is needed.

- Final resolution: `REPOSITORY_CONTRACT`
- Evidence origin: `REPOSITORY_INFERRED`
- Requires clause: `requires 1 <= count && count < 32;`
- Interface conversion: none
- Original assertion: `eva_klee_alarm_0020: 0 <= count && count < 32` (unchanged)
- KLEE witness: `value=0; factor=0; count=4294967295`
- Production callers: C wrapper 8; public macro 8; both satisfy the contract
- Current assertion location: `src_repaired/sources/mul_Ccode.c:5632`
- Resolution commit: `41d79fffb2cc054e3ac5c86eacc611ab7a46b489`

The repository's function comment, wrapper, macro, and two-word implementation agree on count semantics.
