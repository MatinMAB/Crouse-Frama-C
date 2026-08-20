# KLEE-ALARM-0009 final shift resolution

## Previous ambiguity

The C wrapper passed count 17, the public macro embedded 131072, and one legacy formula line said shift 19 despite the surrounding description saying 17.

## Selected final semantics

The helper accepts internal bit counts `1 <= count && count < 32`. The public macro's embedded divisor is normalized by the exact identity `131072 == 2^17`, matching both the wrapper's 17 and the primary “shift 17” comment. The isolated “>> 19” text is retained as a documented legacy inconsistency, not used to invent a third policy.

- Final resolution: `THESIS_INTERFACE_POLICY`
- Evidence origin: `THESIS_POLICY_SELECTED`
- Requires clause: `requires 1 <= count && count < 32;`
- Interface conversion: `131072 -> 17`
- Original assertion: `eva_klee_alarm_0009: 0 <= count && count < 32` (unchanged)
- KLEE witness: `value=61696; factor=65394; count=4294967295`
- Production callers: C wrapper 17; normalized macro 17; both valid
- Current assertion location: `src_repaired/sources/mul_Ccode.c:5293`
- Resolution commit: `9b0ac88fd7411c6469360b76c329546c9f12a0ff`

This deterministic static mapping preserves the fixed-point facade and does not introduce floating-point logarithms or runtime conversion failure modes.
