# Target

- KLEE Alarm ID: `KLEE-ALARM-0066`
- Function / physical function: `s16_hip1_s16_u8_u8_u16_fac1`
- Original occurrence: `src_analysis/sources/hip_Ccode.c:53` occurrence `1`
- Current repaired-tree assertion: `src_repaired/sources/hip_Ccode.c:71`
- Exact current statement after the assertion: `s32Temp2 = s32Temp2 << 1;`
- Affected callers: s16_hip1_s16_u8_u8_u16_fac1; no distinct repository caller changes the local formula

# Eva Alarm

- Kind: `invalid shift`
- Original expression: `s32Temp2 << 1`
- Raw predicate: `s32Temp2 >= 0`

# KLEE Counterexample

- Concrete values: `yold=-137 (0xFF77); u=0 (0x00); uold=0 (0x00); m=32768 (0x8000)`
- Target assertion: `KLEE-ALARM-0066: invalid LHS operand for left shift. assert 0 <= s32Temp2;`
- KTest: `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066/build/klee-out-alarm-0066/test000002.ktest`
- Target error: `analysis/klee_phase_c/s16_hip1_s16_u8_u8_u16_fac1/alarm_0066/build/klee-out-alarm-0066/test000002.klee-alarm-0066.err`
- Timeout after witness: `NO`

The witness reaches this occurrence and falsifies the selected Eva safety predicate under the frozen KLEE model.

# Existing Code

`s32Temp2 << 1` occurs in `s16_hip1_s16_u8_u8_u16_fac1`. The current executable statement is
`s32Temp2 = s32Temp2 << 1;`. `src_original` and `src_analysis` retain the frozen pre-repair operation.

# Safety Property

- ACSL label: `eva_klee_alarm_0066`
- Inserted property: `s32Temp2 >= 0`
- Preservation rule: the label and predicate meaning must remain unchanged.

# Semantic Evidence

The function comment gives `result = yold - (m*yold/65536) + (u-uold)*128`. The selected statement doubles the signed remainder left after removing the truncated 65536 multiple. For the witness, `yold*m = -4489216`, truncating division gives `-68`, and the remainder is `-32768`; left-shifting it is undefined, while multiplication by 2 gives the intended `-65536` exactly and remains within `s32`. The signed and unsigned-input sibling functions use the identical algorithm. Commit 57864b4 previously implemented this exact branch; 76fb867 reverted it solely to preserve the prior runtime-only phase boundary, not because the numerical semantics were disputed.

# Candidate Repairs

Guarded equivalent multiplication; unconditional multiplication; clamp/saturate; or skip the update.

# Rejected Repair Alternatives

Unconditional multiplication needlessly removes the original verified operation; clamp, saturation, skipping, or an early return changes the filter equation. The guarded equivalent preserves every already-defined value and defines only the formerly undefined negative shift.

# Selected Repair

If the remainder is nonnegative, retain the original ACSL assertions and `<< 1`; if it is negative, compute the same documented doubling with range-safe `* 2`.

# Why Selected Repair Preserves Intended Semantics

Both branches compute mathematical doubling. The negative remainder magnitude is below 65536, so doubling is representable. The original assertion remains unchanged immediately before the original shift on the path where it is true.

# Shared-Occurrence Effects

The same physical shift also carries runtime-only KLEE-ALARM-0067

# Runtime-Only Cross-Effects

KLEE-ALARM-0067: move its unchanged upper-bound assertion into the nonnegative shift branch. The negative branch no longer executes a shift; the runtime-only alarm is not reclassified or added to WP.

# Final Decision Confidence

- Classification: `SEMANTICS_CONFIRMED_REPAIRABLE`
- Confidence: Confirmed by formula, range, sibling, and Git history
- Application status: `REPAIRED`
- Repair commit: `PENDING_THIS_COMMIT`
- Parser check: `PASS: gcc -std=c11 -fsyntax-only -Isrc_repaired/headers src_repaired/sources/hip_Ccode.c`
- Future WP status: `NOT_RUN`
