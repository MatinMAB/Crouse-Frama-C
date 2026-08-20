# KLEE-ALARM-0020 shift specification analysis

## Decision

**INPUT_DOMAIN_CONTRACT_JUSTIFIED** (confidence: HIGH). Semantic group: `U32_S8_TWO_WORD_SHIFT`.

The generated root helper's two-word composition structurally requires 1..31, and both the C wrapper and delivered public macro pass documented bit count 8. No production caller contradicts that domain.

## Target reconstruction

| Field | Evidence |
|---|---|
| KLEE entry function | `root_u32_mul_u32_s8_fac_less1` |
| Production public facade | `u32_mul_u32_s8_fac05` |
| Physical source function | `root_u32_mul_u32_s8_fac_less1` |
| Function role | `GENERATED_INTERNAL_FUNCTION`: grouped as a `ROOT FUNCTION`, but declared `extern` in delivered headers |
| Frozen source occurrence | `src_analysis/sources/mul_Ccode.c:5451`, occurrence 1 |
| Current assertion occurrence | `src_repaired/sources/mul_Ccode.c:5614` |
| Exact shift expression | `u32Temp2 >> count` |
| Direction | right shift |
| Left operand | `u32Temp2`, type `u32`, unsigned, 32 bits under `ppc_32` |
| Shift-count expression/type | `count`, type `u32` (unsigned long, 32 bits under `ppc_32`) |
| Eva property | `0 <= count && count < 32` |
| ACSL label/property | `eva_klee_alarm_0020` / `0 <= count && count < 32` |
| KLEE counterexample | `value=0 (0x00000000); factor=0 (0x00); count=4294967295 (0xFFFFFFFF)` |
| Target-specific evidence | `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0020/build/klee-out-alarm-0020/test000001.klee-alarm-0020.err`; `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0020/build/klee-out-alarm-0020/test000001.ktest` |

The KLEE witness violates the property because count is UINT32_MAX (4294967295), which is not less than the 32-bit operand width. The witness proves violability under the configured KLEE model; it does not establish that the witness is an intended API input.

## C type and algorithm analysis

`Platform_Types.h` defines `u32` as `unsigned long`; under the campaign's `ppc_32` machine model it is 32 bits. The shifted temporary is already `u32`, so integer promotions do not widen it. ISO C therefore requires the evaluated right operand of each individual shift to be in 0..31.

This root helper reconstructs a shifted 64-bit product from 32-bit low/high words. For the paired `count` and `32-count` operations, both shifts are defined exactly when `1 <= count && count < 32`. For the high-word-only `count-32` form, the corresponding safe domain is `32 <= count && count < 64`.

## All repository callers

| Category | Caller/interface | Count argument | In candidate safe domain? | Evidence |
|---|---|---:|---|---|
| Compiled C wrapper | `u32_mul_u32_s8_fac05` | `8` | YES | `src_original/sources/mul_Ccode.c:4753` |
| Delivered public macro | `u32_mul_u32_s8_fac05` | `8` | YES | `src_original/headers/ecmath.h:9830` |
| KLEE analysis harness | `KLEE-ALARM-0020` harness | symbolic `count` | NOT GUARANTEED | `analysis/klee_phase_c/root_u32_mul_u32_s8_fac_less1/alarm_0020/klee_harness.c:18` |

The KLEE harness is an analysis adapter and is excluded from the production-caller conclusion. Direct external calls remain technically possible because the root helper has exported declarations in both `mul_Ccode.h` and `ecmath.h`; this is a limitation of the inferred helper boundary.

## Specification evidence

- `ecmath.h` labels the function as a `ROOT FUNCTION` and exposes the named facade as the `FAC <1` interface.
- The neighboring legacy comment states: shift 8 bits right.
- The compiled C wrapper and the delivered public macro are independent imported interface evidence; both are retained in the audit above.
- Repository Git history contains only the import commit `d53fa88` for these delivered files, so no earlier in-repository revision resolves inconsistencies.
- No repository tests, Matlab/Simulink models, separate design specification, or older implementation revision was found for these functions. `docs/Readme_Frama-c.md` says the Doxygen text was prepared from delivered comments, so it is not treated as an independent design authority.

## Resolution and future action

The proposed future clause is `/*@ requires 1 <= count && count < 32; */`. Every production caller/interface found in the repository satisfies it. The KLEE harness is not a production caller; its deliberately unconstrained count is what demonstrates the absent contract can be violated.

Next action: **ADD_PRECONDITION_AND_WP**. Implementation handling is **not** justified by current evidence. This phase made no source or ACSL change and ran no Eva, KLEE, or WP analysis.
