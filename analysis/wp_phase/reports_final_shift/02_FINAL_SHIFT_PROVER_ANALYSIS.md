# Final Shift Prover Analysis

| Prover | Invoked targets | Valid contributions | Timeout/Unknown/Failed |
|---|---:|---:|---:|
| Qed | 13 | 6 complete discharges | 0 |
| Alt-Ergo 2.6.2 | 7 | 7 | 0 |
| Z3 4.8.12 | 0 | 0 | 0 |
| CVC5 1.1.2 | 0 | 0 | 0 |

Qed alone closed alarms 0002, 0005, 0009, 0012, 0014, and 0020. Qed simplified but did not
finish alarms 0003, 0006, 0010, 0013, 0015, 0019, and 0021; Alt-Ergo then proved each. Z3 and
CVC5 were configured but not invoked and therefore receive no proof credit.

## Combined 48-target contribution

- Qed-only targets: **35**.
- Targets requiring an external prover: **13**.
- Alt-Ergo valid: **12**; timeout: **1**.
- Z3 valid: **6**.
- CVC5 valid: **6**.
- Multiple external-prover agreement: **6** targets.
- Exactly one external prover succeeded: **7** targets.
