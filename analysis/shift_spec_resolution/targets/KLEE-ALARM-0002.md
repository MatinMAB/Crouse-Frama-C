# KLEE-ALARM-0002 shift specification analysis

## Decision

**SPECIFICATION_UNRESOLVED** (confidence: HIGH). Semantic group: `S32_S16_TWO_WORD_SHIFT`.

The compiled C wrapper passes the documented bit count 16, but the delivered public ecmath.h macro passes 65536. The repository does not establish whether the macro is stale or whether another historical count encoding was intended.

## Target reconstruction

| Field | Evidence |
|---|---|
| KLEE entry function | `root_s32_mul_s32_s16_fac_less1` |
| Production public facade | `s32_mul_s32_s16_fac05` |
| Physical source function | `root_s32_mul_s32_s16_fac_less1` |
| Function role | `GENERATED_INTERNAL_FUNCTION`: grouped as a `ROOT FUNCTION`, but declared `extern` in delivered headers |
| Frozen source occurrence | `src_analysis/sources/mul_Ccode.c:5089`, occurrence 1 |
| Current assertion occurrence | `src_repaired/sources/mul_Ccode.c:5195` |
| Exact shift expression | `u32Temp3 >> count` |
| Direction | right shift |
| Left operand | `u32Temp3`, type `u32`, unsigned, 32 bits under `ppc_32` |
| Shift-count expression/type | `count`, type `u32` (unsigned long, 32 bits under `ppc_32`) |
| Eva property | `0 <= count && count < 32` |
| ACSL label/property | `eva_klee_alarm_0002` / `0 <= count && count < 32` |
| KLEE counterexample | `value=-2130706432 (0x81000000); factor=1 (0x0001); count=4294967295 (0xFFFFFFFF)` |
| Target-specific evidence | `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0002/build/klee-out-alarm-0002/test000003.klee-alarm-0002.err`; `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0002/build/klee-out-alarm-0002/test000003.ktest` |

The KLEE witness violates the property because count is UINT32_MAX (4294967295), which is not less than the 32-bit operand width. The witness proves violability under the configured KLEE model; it does not establish that the witness is an intended API input.

## C type and algorithm analysis

`Platform_Types.h` defines `u32` as `unsigned long`; under the campaign's `ppc_32` machine model it is 32 bits. The shifted temporary is already `u32`, so integer promotions do not widen it. ISO C therefore requires the evaluated right operand of each individual shift to be in 0..31.

This root helper reconstructs a shifted 64-bit product from 32-bit low/high words. For the paired `count` and `32-count` operations, both shifts are defined exactly when `1 <= count && count < 32`. For the high-word-only `count-32` form, the corresponding safe domain is `32 <= count && count < 64`.

## All repository callers

| Category | Caller/interface | Count argument | In candidate safe domain? | Evidence |
|---|---|---:|---|---|
| Compiled C wrapper | `s32_mul_s32_s16_fac05` | `16` | YES | `src_original/sources/mul_Ccode.c:3861` |
| Delivered public macro | `s32_mul_s32_s16_fac05` | `65536` | NO | `src_original/headers/ecmath.h:9329` |
| KLEE analysis harness | `KLEE-ALARM-0002` harness | symbolic `count` | NOT GUARANTEED | `analysis/klee_phase_c/root_s32_mul_s32_s16_fac_less1/alarm_0002/klee_harness.c:18` |

The KLEE harness is an analysis adapter and is excluded from the production-caller conclusion. Direct external calls remain technically possible because the root helper has exported declarations in both `mul_Ccode.h` and `ecmath.h`; this is a limitation of the inferred helper boundary.

## Specification evidence

- `ecmath.h` labels the function as a `ROOT FUNCTION` and exposes the named facade as the `FAC <1` interface.
- The neighboring legacy comment states: shift 16 bits right; the C wrapper retains 65536 only as a commented historical alternative.
- The compiled C wrapper and the delivered public macro are independent imported interface evidence; both are retained in the audit above.
- Repository Git history contains only the import commit `d53fa88` for these delivered files, so no earlier in-repository revision resolves inconsistencies.
- No repository tests, Matlab/Simulink models, separate design specification, or older implementation revision was found for these functions. `docs/Readme_Frama-c.md` says the Doxygen text was prepared from delivered comments, so it is not treated as an independent design authority.

## Resolution and future action

No contract is proposed. `1 <= count && count < 32` is the mechanical safe domain for these two C shifts, but the delivered public macro passes `65536` and therefore contradicts it. Treating the compiled wrapper as authoritative would silently choose between two imported interfaces.

Next action: **DOMAIN_EXPERT_REQUIRED**. Implementation handling is **not** justified by current evidence. This phase made no source or ACSL change and ran no Eva, KLEE, or WP analysis.
