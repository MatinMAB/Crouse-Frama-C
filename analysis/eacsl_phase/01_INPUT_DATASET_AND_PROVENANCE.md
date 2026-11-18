# Input Dataset and Provenance

- Upstream branch: `analysis/wp-verification`
- Upstream commit: `e79f62404a280add6f5bc63610a9fe1803e37c16`
- Historical source/experiment base: `09e759283a6f1f9483cb560873e0b97d544fa714`
- `src_repaired` بین این دو revision بدون diff است.
- Static experiment: `3c307992ec1f8ee1839b1ef675e9d6c63519146e`
- Dynamic experiment: `4f31f893a17c71af197d186dedb9341842279699`
- Final correlation: `66169432bfcc381ed5c2ad97079e5ffc69a1b085`

ابزار تاریخی stock E-ACSL همراه Frama-C 33.0 بود. checkoutهای `/home/matin/eacsl2/...` وجود دارند اما source/build/provenance آزمایش هیچ استفاده‌ای از آن‌ها نشان نمی‌دهد؛ بنابراین E-ACSL2 بخشی از claim این phase نیست.

raw logهای هفت violation از Git objectهای commit `1adf3521b1faf5f56fde5e7348e49be59be3f812` بازیابی شده‌اند. این commit branch رسمی E-ACSL نیست، اما artifactهای همان campaign timestamp و متن‌هایی مطابق normalized historical table را retain کرده است؛ این provenance غیرعادی صریحاً حفظ شده است.
