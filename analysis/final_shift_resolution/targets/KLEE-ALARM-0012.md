# KLEE-ALARM-0012 final shift resolution

## Previous ambiguity

The C wrapper passed bit count 9 while the delivered public macro embedded fixed-point divisor 512.

## Selected final semantics

The helper accepts internal counts `1 <= count && count < 32`. The public macro preserves its divide-by-512 facade semantics through the exact static mapping `512 == 2^9`, passing count 9. Direct calls outside the helper domain are contract violations.

- Final resolution: `THESIS_INTERFACE_POLICY`
- Evidence origin: `THESIS_POLICY_SELECTED`
- Requires clause: `requires 1 <= count && count < 32;`
- Interface conversion: `512 -> 9`
- Original assertion: `eva_klee_alarm_0012: 0 <= count && count < 32` (unchanged)
- KLEE witness: `value=0; factor=0; count=4294967295`
- Production callers: C wrapper 9; normalized macro 9; both valid
- Current assertion location: `src_repaired/sources/mul_Ccode.c:5744`
- Resolution commit: `f4b910ba1e64a01f4bd3ae9056eb5321af5296a6`

The legacy comment explicitly pairs shift 9 with division by 512, while the wrapper and historical commented alternative show both encodings. Selecting the macro as the static normalization boundary is explicitly thesis policy.
