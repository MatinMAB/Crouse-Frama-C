# KLEE-ALARM-0010 final shift resolution

## Previous ambiguity

This complementary high-word shift belongs to the same signed-u16 helper and 131072-versus-17 interface conflict as KLEE-ALARM-0009.

## Selected final semantics

The helper count domain is `1 <= count && count < 32`; the public macro maps `2^17` to 17. This excludes zero and makes `(u32)(32-count)` a valid 1..31 shift count.

- Final resolution: `THESIS_INTERFACE_POLICY`
- Evidence origin: `THESIS_POLICY_SELECTED`
- Requires clause: `requires 1 <= count && count < 32;`
- Interface conversion: `131072 -> 17`
- Original assertion: `eva_klee_alarm_0010: 0 <= (u32)(32 - count) && (u32)(32 - count) < 32` (unchanged)
- KLEE witness: `value=61696; factor=65394; count=0`
- Production callers: C wrapper 17; normalized macro 17; both valid
- Resolution commit: recorded in the finalized matrix after this group commit

No invalid-count implementation fallback was selected.
