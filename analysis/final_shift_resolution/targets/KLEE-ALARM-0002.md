# KLEE-ALARM-0002 final shift resolution

## Previous ambiguity

The C wrapper passed bit count 16 while the delivered `ecmath.h` macro embedded 65536. The repository did not establish which third-argument representation was authoritative.

## Selected final semantics

`count` in `root_s32_mul_s32_s16_fac_less1` is an internal bit count with accepted domain `1 <= count && count < 32`. The two-argument public macro retains its fixed-point meaning, but its embedded power-of-two divisor `65536 == 2^16` is statically normalized to bit count 16 before calling the helper. Zero and values at least 32 are outside the helper contract; no clamp, mask, modulo, or fallback is introduced.

- Final resolution: `THESIS_INTERFACE_POLICY`
- Evidence origin: `THESIS_POLICY_SELECTED`
- Requires clause: `requires 1 <= count && count < 32;`
- Interface conversion: `65536 -> 16`
- Source changes: helper contract plus public macro adapter constant
- Original assertion: `eva_klee_alarm_0002: 0 <= count && count < 32` (unchanged)
- KLEE witness: `value=-2130706432; factor=1; count=4294967295`
- Production callers after normalization: C wrapper 16; public macro 16; both satisfy the contract
- Resolution commit: recorded in the finalized matrix after this group commit

The repository evidence for the mathematical pairing is strong: the legacy comment specifies a 16-bit right shift, the C wrapper uses 16, the macro used exactly `2^16`, and the historical divisor remains commented beside the wrapper. What is thesis-selected is the decision that the current helper API is count-based and the public macro is the normalization boundary.
