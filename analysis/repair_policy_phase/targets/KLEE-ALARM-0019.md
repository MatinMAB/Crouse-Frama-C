# Target

- KLEE Alarm ID: `KLEE-ALARM-0019`
- Function / physical function: `root_u32_mul_u32_s32_fac_less1`
- Original occurrence: `src_analysis/sources/mul_Ccode.c:5372` occurrence `1`
- Current repaired-tree assertion: `src_repaired/sources/mul_Ccode.c:5532`
- Exact current statement after the assertion: `u32Temp2 = u32Temp2 >> (count-32);`
- Affected callers: u32_mul_u32_s32_fac05 (fixed count 32); direct root API/harness calls
- Shift direction: `right`
- Operand: unsigned 32-bit product word (`u32`)
- Shift-count type: `u32`
- Known caller/domain: `u32_mul_u32_s32_fac05 (fixed count 32); direct root API/harness calls`

# Eva Alarm

- Kind: `invalid shift`
- Original expression: `u32Temp2 >> (count-32)`
- Raw predicate: `0 <= (u32)(count - 32) && (u32)(count - 32) < 32`

# KLEE Counterexample

- Concrete values: `value=65528 (0x0000FFF8); factor=53761 (0x0000D201); count=0 (0x00000000)`
- Target assertion: `KLEE-ALARM-0019: invalid RHS operand for shift. assert 0 <= (u32)(count - 32) < 32;`
- KTest: `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019/build/klee-out-alarm-0019/test000002.ktest`
- Target error: `analysis/klee_phase_c/root_u32_mul_u32_s32_fac_less1/alarm_0019/build/klee-out-alarm-0019/test000002.klee-alarm-0019.err`
- Timeout after witness: `NO`

The witness reaches this occurrence and falsifies the selected Eva safety predicate under the frozen KLEE model.

# Existing Code

`u32Temp2 >> (count-32)` occurs in `root_u32_mul_u32_s32_fac_less1`. The current executable statement is
`u32Temp2 = u32Temp2 >> (count-32);`. `src_original` and `src_analysis` retain the frozen pre-repair operation.

# Safety Property

- ACSL label: `eva_klee_alarm_0019`
- Inserted property: `0 <= (u32)(count - 32) && (u32)(count - 32) < 32`
- Preservation rule: the label and predicate meaning must remain unchanged.

# Semantic Evidence

The operation is a right shift of a 32-bit `u32` product word by a `u32` count. Repository caller `u32_mul_u32_s32_fac05` supplies the fixed bit count 32, which is inside the operation's 32..63 decomposition domain. The surrounding code combines `MulHighWord` with the low product word to implement the documented fixed-point product shift. All source-tree callers use their documented fixed counts; no test, comment, contract, caller, sibling, or historical implementation defines behavior for a direct root call outside that domain. The KLEE witness instead supplies count 0 (0x00000000).

# Candidate Repairs

Reject invalid direct calls; extend the full-width mathematical shift; clamp; mask/modulo; or return a limited value. Each produces observably different behavior outside known callers.

# Rejected Repair Alternatives

Masking/modulo would impose target-instruction semantics absent from the C API; clamping would change the scale; returning zero or saturation would invent an exceptional-value policy; adding an ACSL precondition would evade rather than repair the selected assertion; and a generalized 64-bit shift would still invent the result/limitation policy outside the documented caller domain.

# Selected Repair

NONE — no implementation change

# Why Selected Repair Preserves Intended Semantics

The fixed-count callers establish the intended normal domain but do not establish exceptional behavior. Preserving the implementation is scientifically preferable to choosing among unsupported policies.

# Shared-Occurrence Effects

Shared repair group SHIFT_ROOT_U32_S32_0019; no runtime-only alarm shares this exact statement

# Runtime-Only Cross-Effects

NONE_IDENTIFIED

# Final Decision Confidence

- Classification: `SEMANTICS_AMBIGUOUS`
- Confidence: Repository evidence insufficient
- Application status: `SEMANTICS_AMBIGUOUS`
- Repair commit: `NOT_APPLICABLE`
- Parser check: `NOT_RUN`
- Future WP status: `NOT_ELIGIBLE`
