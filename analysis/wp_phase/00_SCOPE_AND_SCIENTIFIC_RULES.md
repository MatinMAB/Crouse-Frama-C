# Scope and Scientific Rules

دامنه فقط ۴۸ property دارای `CONFIRMED_COUNTEREXAMPLE` در KLEE است. هدف proof همان predicate اولیهٔ Eva/KLEE است؛ تغییر implementation یا specification مجاز است، حذف یا تضعیف target مجاز نیست. `CODE_REPAIR` رفتار implementation را اصلاح می‌کند. `SPECIFICATION_COMPLETION` constraint معتبر interface/domain را صریح می‌کند و نباید خود نتیجه را assume کند.

`VALID` فقط در محدودهٔ function، source revision، contract، `ppc_32`، `Typed+int` و toolchain ثبت‌شده معنا دارد. عدم استفاده از `-wp-rte` مانع هر ادعای whole-function runtime safety است.

