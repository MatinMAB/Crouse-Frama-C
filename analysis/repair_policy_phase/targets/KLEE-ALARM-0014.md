# Target

- KLEE Alarm ID: `KLEE-ALARM-0014`
- Function / physical function: `root_u32_mul_u32_s16_fac_less1`
- Original occurrence: `src_analysis/sources/mul_Ccode.c:5309` occurrence `1`
- Current repaired-tree assertion: `src_repaired/sources/mul_Ccode.c:5453`
- Exact current statement after the assertion: `u32Temp2 = u32Temp2 >> count;`
- Affected callers: u32_mul_u32_s16_fac05 (fixed count 15); direct root API/harness calls
- Shift direction: `right`
- Operand: unsigned 32-bit product word (`u32`)
- Shift-count type: `u32`
- Known caller/domain: `u32_mul_u32_s16_fac05 (fixed count 15); direct root API/harness calls`

# Eva Alarm

- Kind: `invalid shift`
- Original expression: `u32Temp2 >> count`
- Raw predicate: `0 <= count && count < 32`

# KLEE Counterexample

- Concrete values: `value=0 (0x00000000); factor=0 (0x0000); count=4294967295 (0xFFFFFFFF)`
- Target assertion: `KLEE-ALARM-0014: invalid RHS operand for shift. assert 0 <= count < 32;`
- KTest: `analysis/klee_phase_c/root_u32_mul_u32_s16_fac_less1/alarm_0014/build/klee-out-alarm-0014/test000001.ktest`
- Target error: `analysis/klee_phase_c/root_u32_mul_u32_s16_fac_less1/alarm_0014/build/klee-out-alarm-0014/test000001.klee-alarm-0014.err`
- Timeout after witness: `NO`

The witness reaches this occurrence and falsifies the selected Eva safety predicate under the frozen KLEE model.

# Existing Code

`u32Temp2 >> count` occurs in `root_u32_mul_u32_s16_fac_less1`. The current executable statement is
`u32Temp2 = u32Temp2 >> count;`. `src_original` and `src_analysis` retain the frozen pre-repair operation.

# Safety Property

- ACSL label: `eva_klee_alarm_0014`
- Inserted property: `0 <= count && count < 32`
- Preservation rule: the label and predicate meaning must remain unchanged.

# Semantic Evidence

The operation is a right shift of a 32-bit `u32` product word by a `u32` count. Repository caller `u32_mul_u32_s16_fac05` supplies the fixed bit count 15, which is inside the operation's 1..31 decomposition domain. The surrounding code combines `MulHighWord` with the low product word to implement the documented fixed-point product shift. All source-tree callers use their documented fixed counts; no test, comment, contract, caller, sibling, or historical implementation defines behavior for a direct root call outside that domain. The KLEE witness instead supplies count 4294967295 (0xFFFFFFFF).

# Candidate Repairs

Reject invalid direct calls; extend the full-width mathematical shift; clamp; mask/modulo; or return a limited value. Each produces observably different behavior outside known callers.

# Rejected Repair Alternatives

Masking/modulo would impose target-instruction semantics absent from the C API; clamping would change the scale; returning zero or saturation would invent an exceptional-value policy; adding an ACSL precondition would evade rather than repair the selected assertion; and a generalized 64-bit shift would still invent the result/limitation policy outside the documented caller domain.

# Selected Repair

NONE — no implementation change

# Why Selected Repair Preserves Intended Semantics

The fixed-count callers establish the intended normal domain but do not establish exceptional behavior. Preserving the implementation is scientifically preferable to choosing among unsupported policies.

# Shared-Occurrence Effects

Shared repair group SHIFT_ROOT_U32_S16_0014_0015; no runtime-only alarm shares this exact statement

# Runtime-Only Cross-Effects

NONE_IDENTIFIED

# Final Decision Confidence

- Classification: `SEMANTICS_AMBIGUOUS`
- Confidence: Repository evidence insufficient
- Application status: `SEMANTICS_AMBIGUOUS`
- Repair commit: `NOT_APPLICABLE`
- Parser check: `NOT_RUN`
- Future WP status: `NOT_ELIGIBLE`
