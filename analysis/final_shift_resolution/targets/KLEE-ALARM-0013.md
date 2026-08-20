# KLEE-ALARM-0013 final shift resolution

## Previous ambiguity

This is the complementary high-word shift in the same signed-u8 helper/interface group as KLEE-ALARM-0012.

## Selected final semantics

The helper domain is `1 <= count && count < 32`, and the fixed public macro maps divisor 512 to count 9. Zero is outside the helper API contract, so `(u32)(32-count)` is always a defined 1..31 shift count.

- Final resolution: `THESIS_INTERFACE_POLICY`
- Evidence origin: `THESIS_POLICY_SELECTED`
- Requires clause: `requires 1 <= count && count < 32;`
- Interface conversion: `512 -> 9`
- Original assertion: `eva_klee_alarm_0013: 0 <= (u32)(32 - count) && (u32)(32 - count) < 32` (unchanged)
- KLEE witness: `value=0; factor=0; count=0`
- Production callers: C wrapper 9; normalized macro 9; both valid
- Current assertion location: `src_repaired/sources/mul_Ccode.c:5748`
- Resolution commit: `f4b910ba1e64a01f4bd3ae9056eb5321af5296a6`

No runtime conversion, masking, clamping, or fallback behavior was added.
