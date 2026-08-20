# WP Unresolved Targets

Eligible unresolved terminal targets: **0**.

No WP-ready target is Unknown, timed out as a target, failed, missing a goal, or not run.

## Not yet eligible for WP

These 16 confirmed alarms are `REPAIR_POLICY_REQUIRED`, not WP failures:

| Alarm | Function | Reason |
|---|---|---|
| KLEE-ALARM-0002 | `root_s32_mul_s32_s16_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0003 | `root_s32_mul_s32_s16_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0005 | `root_s32_mul_s32_s8_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0006 | `root_s32_mul_s32_s8_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0009 | `root_s32_mul_s32_u16_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0010 | `root_s32_mul_s32_u16_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0012 | `root_s32_mul_s32_u8_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0013 | `root_s32_mul_s32_u8_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0014 | `root_u32_mul_u32_s16_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0015 | `root_u32_mul_u32_s16_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0019 | `root_u32_mul_u32_s32_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0020 | `root_u32_mul_u32_s8_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0021 | `root_u32_mul_u32_s8_fac_less1` | The public count domain admits invalid C shift counts, but frozen repository evidence does not define whether out-of-range counts should be rejected, reduced, clamped, or handled otherwise; no policy was invented. |
| KLEE-ALARM-0061 | `s16_hip1_s16_s8_s8_u16_fac1` | The same shift statement carries runtime-only alarm KLEE-ALARM-0062; changing the operation would modify a runtime-only target occurrence, so a phase-separation policy is required. |
| KLEE-ALARM-0066 | `s16_hip1_s16_u8_u8_u16_fac1` | The same shift statement carries runtime-only alarm KLEE-ALARM-0067; changing the operation would modify a runtime-only target occurrence, so a phase-separation policy is required. |
| KLEE-ALARM-0144 | `u32_div_s32_s32` | The witness also violates runtime-only denominator and downstream properties in the same path; defining an unsigned-magnitude quotient path would change implementation behavior associated with those inconclusive targets, so a phase-separation and quotient-policy decision is required. |
