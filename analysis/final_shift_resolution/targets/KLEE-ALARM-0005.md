# KLEE-ALARM-0005 final shift resolution

## Previous ambiguity

The C wrapper passed bit count 8 while the delivered public macro embedded scaling divisor 256.

## Selected final semantics

The helper parameter is an internal bit count constrained by `1 <= count && count < 32`. The public two-argument fixed-point macro preserves its mathematical divide-by-256 meaning through the exact static mapping `256 == 2^8`, passing count 8. Invalid direct helper counts are outside the thesis-defined contract.

- Final resolution: `THESIS_INTERFACE_POLICY`
- Evidence origin: `THESIS_POLICY_SELECTED`
- Requires clause: `requires 1 <= count && count < 32;`
- Interface conversion: `256 -> 8`
- Original assertion: `eva_klee_alarm_0005: 0 <= count && count < 32` (unchanged)
- KLEE witness: `value=-2130706432; factor=1; count=4294967295`
- Production callers: C wrapper 8; normalized macro 8; both valid
- Resolution commit: recorded in the finalized matrix after this group commit

The legacy comment says shift 8/divide by 256, the C wrapper passes 8, the macro passed exactly `2^8`, and 256 remains as its commented historical alternative. The normalization boundary is an explicit thesis policy, not claimed as an original contract.
