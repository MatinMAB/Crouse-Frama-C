# Machine Semantic Sensitivity

| semantic_sensitivity | count |
|---|---|
| SCALAR_WIDTH_SEMANTICS | 149 |

| layout_sensitive | count |
|---|---|
| NO | 149 |

| endianness_sensitive | count |
|---|---|
| NO | 149 |

| abi_sensitive | count |
|---|---|
| NO | 149 |

All current alarms concern scalar arithmetic/shift semantics. None directly accesses pointers, structs, arrays, object representation, or byte order at the mapped operation. Consequently every row is `SCALAR_WIDTH_SEMANTICS`, while `ppc32_relevant=YES` records that widths, signedness, integer promotions, and `long` data-model semantics remain mandatory. This is an occurrence-level statement, not a claim that the entire containing function is ABI-independent.
