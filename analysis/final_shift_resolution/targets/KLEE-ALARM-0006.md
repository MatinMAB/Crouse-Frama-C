# KLEE-ALARM-0006 final shift resolution

## Previous ambiguity

This complementary `32-count` shift shares the signed-s8 helper and macro mismatch with KLEE-ALARM-0005.

## Selected final semantics

The helper accepts `1 <= count && count < 32`; the public macro maps fixed scale divisor 256 to bit count 8. The contract excludes zero, making the original `(32-count) < 32` assertion meaningful without adding fallback behavior.

- Final resolution: `THESIS_INTERFACE_POLICY`
- Evidence origin: `THESIS_POLICY_SELECTED`
- Requires clause: `requires 1 <= count && count < 32;`
- Interface conversion: `256 -> 8`
- Original assertion: `eva_klee_alarm_0006: 0 <= (u32)(32 - count) && (u32)(32 - count) < 32` (unchanged)
- KLEE witness: `value=-2130706432; factor=1; count=0`
- Production callers: C wrapper 8; normalized macro 8; both valid
- Resolution commit: recorded in the finalized matrix after this group commit

No clamping, masking, modulo, or exceptional return policy was introduced.
