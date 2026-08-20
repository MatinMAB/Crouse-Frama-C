# Final Shift Policy versus Proof Analysis

WP used the documented function preconditions as assumptions. These are conditional proofs of the original Eva-derived assertions, not proofs for arbitrary direct calls.

| Origin | Targets | Valid | Unresolved | Proof rate | Semantic basis | Interpretation |
|---|---:|---:|---:|---:|---|---|
| REPOSITORY_INFERRED | 5 | 5 | 0 | 100.00% | Existing wrappers/macros consistently establish the inferred helper count domains. | Valid under repository-inferred input-domain semantics. |
| THESIS_POLICY_SELECTED | 8 | 8 | 0 | 100.00% | The thesis defines `1 <= count < 32` and statically normalizes legacy power-of-two divisors to bit counts. | Valid under the adopted thesis interface/domain policy; not evidence that the legacy repository originally specified it. |

## Contracts and normalization

- **KLEE-ALARM-0002** — `1 <= count && count < 32`; normalization `65536 -> 16 (static public-macro adapter)`; **VALID_AUTOMATIC**.
- **KLEE-ALARM-0003** — `1 <= count && count < 32`; normalization `65536 -> 16 (static public-macro adapter)`; **VALID_AUTOMATIC**.
- **KLEE-ALARM-0005** — `1 <= count && count < 32`; normalization `256 -> 8 (static public-macro adapter)`; **VALID_AUTOMATIC**.
- **KLEE-ALARM-0006** — `1 <= count && count < 32`; normalization `256 -> 8 (static public-macro adapter)`; **VALID_AUTOMATIC**.
- **KLEE-ALARM-0009** — `1 <= count && count < 32`; normalization `131072 -> 17 (static public-macro adapter)`; **VALID_AUTOMATIC**.
- **KLEE-ALARM-0010** — `1 <= count && count < 32`; normalization `131072 -> 17 (static public-macro adapter)`; **VALID_AUTOMATIC**.
- **KLEE-ALARM-0012** — `1 <= count && count < 32`; normalization `512 -> 9 (static public-macro adapter)`; **VALID_AUTOMATIC**.
- **KLEE-ALARM-0013** — `1 <= count && count < 32`; normalization `512 -> 9 (static public-macro adapter)`; **VALID_AUTOMATIC**.
- **KLEE-ALARM-0014** — `1 <= count && count < 32`; normalization `NONE`; **VALID_AUTOMATIC**.
- **KLEE-ALARM-0015** — `1 <= count && count < 32`; normalization `NONE`; **VALID_AUTOMATIC**.
- **KLEE-ALARM-0019** — `32 <= count && count < 64`; normalization `NONE`; **VALID_AUTOMATIC**.
- **KLEE-ALARM-0020** — `1 <= count && count < 32`; normalization `NONE`; **VALID_AUTOMATIC**.
- **KLEE-ALARM-0021** — `1 <= count && count < 32`; normalization `NONE`; **VALID_AUTOMATIC**.
