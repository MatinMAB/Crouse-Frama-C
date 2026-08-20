# KLEE-ALARM-0003 final shift resolution

## Previous ambiguity

This is the complementary high-word shift in the same helper/interface group as KLEE-ALARM-0002.

## Selected final semantics

`root_s32_mul_s32_s16_fac_less1` accepts internal bit counts `1 <= count && count < 32`; the public macro's embedded divisor 65536 is normalized statically to 16. This simultaneously guarantees `(u32)(32-count)` lies in 1..31. Invalid direct helper calls are outside the thesis-defined contract.

- Final resolution: `THESIS_INTERFACE_POLICY`
- Evidence origin: `THESIS_POLICY_SELECTED`
- Requires clause: `requires 1 <= count && count < 32;`
- Interface conversion: `65536 -> 16`
- Original assertion: `eva_klee_alarm_0003: 0 <= (u32)(32 - count) && (u32)(32 - count) < 32` (unchanged)
- KLEE witness: `value=0; factor=-32768; count=0`
- Production callers after normalization: C wrapper 16; public macro 16; both satisfy the contract
- Resolution commit: recorded in the finalized matrix after this group commit

No implementation fallback behavior was added. The same interface evidence and thesis-policy boundary documented for 0002 applies occurrence-aware to this second shift.
