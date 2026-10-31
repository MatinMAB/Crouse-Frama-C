# Input Dataset and Provenance

ورودی authoritative با intersection یا count حدسی ساخته نشده است. validator exact set equality زیر را اعمال می‌کند:

```text
48 KLEE CONFIRMED_COUNTEREXAMPLE IDs
= 48 semantic-resolution IDs
= 48 WP input IDs
= 48 frozen final-result IDs
= 48 normalized target IDs
```

Provenance commitها در `data/git_provenance.tsv`، mapping کامل در `data/wp_targets.tsv` و hashها در `SHA256SUMS` آمده‌اند.

```text
base_branch = analysis/eva-klee-final-shift-resolution
base_commit = 9307d7b68ea4c9b1496cfd0160e337f739827edd
base_relation = analysis/eva-klee-final-shift-resolution~1
frozen_final_analysis_commit = 09e759283a6f1f9483cb560873e0b97d544fa714
```

هیچ branch ref اکنون مستقیماً روی `9307d7b...` قرار ندارد؛ این commit والد مستقیم tip تاریخی `analysis/eva-klee-final-shift-resolution` در `09e7592...` است و دو tag `thesis/all-klee-confirmed-targets-semantically-resolved` و `thesis/final-13-shift-wp-campaign-ready` روی آن قرار دارند.

