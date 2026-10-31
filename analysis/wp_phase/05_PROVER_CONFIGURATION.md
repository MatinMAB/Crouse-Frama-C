# Prover Configuration

Qed simplifier داخلی WP پیش از prover خارجی عمل می‌کند. ۳۵ goal با Qed بسته شد. ۱۳ goal نیازمند external prover بود: Alt-Ergo 2.6.2 برای ۱۲ و Z3 4.8.12 برای یک هدف prover موفق ثبت‌شده است. CVC5 1.1.2 در configuration حضور داشت، ولی در retained JSON نخستین prover موفق هیچ target نیست.

`-wp-run-all-provers` بخشی از command تاریخی است؛ JSON هر goal فقط attemptهای واقعاً ثبت‌شده را نشان می‌دهد. فیلد timing خالی به معنی «attempt ثبت نشده» است، نه زمان صفر.

