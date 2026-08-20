# KLEE-ALARM-0019 final shift resolution

## Previous classification

`INPUT_DOMAIN_CONTRACT_JUSTIFIED`: the implementation shifts a 32-bit high word by `count-32`, and every production interface passes count 32.

## Selected final semantics

`count` is the total right-shift distance represented in the high-word-only helper. Its accepted domain is `32 <= count && count < 64`, so the actual C shift count `count-32` is in 0..31. Count 32 is valid and produces a zero-bit shift of the high word; values below 32 or at least 64 are outside the helper contract.

- Final resolution: `REPOSITORY_CONTRACT`
- Evidence origin: `REPOSITORY_INFERRED`
- Requires clause: `requires 32 <= count && count < 64;`
- Interface conversion: none
- Original assertion: `eva_klee_alarm_0019: 0 <= (u32)(count - 32) && (u32)(count - 32) < 32` (unchanged)
- KLEE witness: `value=65528; factor=53761; count=0`
- Production callers: C wrapper count 32; public macro count 32; both satisfy the contract
- Resolution commit: recorded in the finalized matrix after this group commit

No implementation behavior or public interface was changed.
