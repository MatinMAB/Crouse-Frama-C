# Input Dataset and Provenance

ورودی authoritative با intersection یا count حدسی ساخته نشده است. validator exact set equality زیر را اعمال می‌کند:

```text
48 KLEE CONFIRMED_COUNTEREXAMPLE IDs
= 48 semantic-resolution IDs
= 48 WP input IDs
= 48 frozen final-result IDs
= 48 normalized target IDs
```

Provenance commitها در `data/git_provenance.tsv`، mapping کامل در `data/wp_targets.tsv` و hashها در `SHA256SUMS` آمده‌اند. base آمادهٔ campaign `9307d7b68ea4c9b1496cfd0160e337f739827edd` و commit frozen final analysis برابر `09e759283a6f1f9483cb560873e0b97d544fa714` است.

