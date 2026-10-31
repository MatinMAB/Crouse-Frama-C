# Limitations and Claim Boundaries

- ۴۸/۴۸ به معنی اثبات ۴۸ selected assertion است، نه کل برنامه یا تابع.
- `-wp-rte` استفاده نشده؛ سایر runtime errors goal این campaign نیستند.
- proof به source/specification revision و مدل‌های `ppc_32` و `Typed+int` وابسته است.
- هشت specification case بر thesis policy صریح تکیه دارند و legacy intent را ثابت نمی‌کنند.
- wall time retained شامل startup و orchestration است و solver time نیست.
- نسخه‌های دیگر prover یا hardware ممکن است timing یا automation متفاوتی داشته باشند.
- ۴۸ witness شامل division-by-zero نیست؛ ساخت case study آن بدون evidence ممنوع است.
- JSON proof status و attemptها retained هستند، اما certificate مستقل از toolchain نگهداری نشده است.
