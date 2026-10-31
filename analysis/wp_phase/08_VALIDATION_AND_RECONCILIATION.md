# Validation and Reconciliation

```bash
python3 analysis/wp_phase/scripts/normalize_wp_results.py
python3 analysis/wp_phase/scripts/validate_wp_phase.py
sha256sum -c analysis/wp_phase/SHA256SUMS
```

validator row uniqueness، exact set equality، property/label identity، حضور source و raw evidence، passed goal، command configuration، عدم `-wp-rte`، تقسیم ۳۵+۱۳، total time، checksum و syntax shell را بررسی می‌کند. equationها در `validation/WP_NUMERIC_RECONCILIATION.md` ثبت می‌شوند.

