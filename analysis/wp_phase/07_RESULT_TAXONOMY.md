# Result Taxonomy

- `VALID_QED`: selected goal در JSON passed و Qed موفق است.
- `VALID_EXTERNAL_PROVER`: selected goal passed و یک prover خارجی موفق است.
- `TIMEOUT`: goal معتبر بسته نشده و timeout ثبت شده است.
- `UNKNOWN`: proof verdict نهایی معتبر نیست و timeout/failure اختصاصی ثبت نشده است.
- `PROVER_FAILURE`: prover invocation شکست خورده است.
- `BUILD_OR_PARSE_FAILURE`: Frama-C نتوانسته ورودی را parse/prepare کند.
- `MISSING_TARGET`: ID یا ACSL label قابل بازیابی نیست.
- `CONFIGURATION_ERROR`: ابزار یا configuration لازم در دسترس نیست.

Frozen summary فقط شامل ۳۵ `VALID_QED` و ۱۳ `VALID_EXTERNAL_PROVER` است.

