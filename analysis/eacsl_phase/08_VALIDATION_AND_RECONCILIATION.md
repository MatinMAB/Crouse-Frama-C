# Validation and Reconciliation

```bash
python3 analysis/eacsl_phase/scripts/normalize_eacsl_evidence.py
python3 analysis/eacsl_phase/scripts/validate_eacsl_phase.py
sha256sum -c analysis/eacsl_phase/SHA256SUMS
git diff --check
```

Validator set equality، duplicateها، ۱۰۱ label mapping در source فعلی، ۱۴۹/۱۰۱ historical generated-check audit، subset بودن violationها، raw label/exit evidence، ۱۲۰ performance row، scenario taxonomy و checksumها را بررسی می‌کند.

Historical result و current representative rerun در artifactهای جدا ثبت شده‌اند و timing آن‌ها ادغام نمی‌شود.
