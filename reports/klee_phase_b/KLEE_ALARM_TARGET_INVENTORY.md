# KLEE Alarm Target Inventory

This document renders all 149 machine-readable target rows for human audit. `DIRECT REPOSITORY EVIDENCE` fields come from the frozen Eva inventory, logs, source, function metadata, and harness metadata. `DERIVED SEMANTIC MAPPING` fields describe the ppc_32 operation and future safety check. No witness or validity conclusion is present.

## KLEE-ALARM-0001 — `root_s32_mul_s32_s16_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5071`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -value <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5071|signed overflow. assert -value <= 2147483647;`
- Source statement: `u32Temp1 = -value;`
- Input parameters: `value:s32; factor:s16; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_short_interval(-32768, 32767); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_s16_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_s16_fac_less1/root_s32_mul_s32_s16_fac_less1_eva.log`
- Control-flow context: `value < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row2; results/high_precision/root_s32_mul_s32_s16_fac_less1/root_s32_mul_s32_s16_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5071; harnesses/P0/eva_main_root_s32_mul_s32_s16_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_s32_mul_s32_s16_fac_less1` / `root_s32_mul_s32_s16_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-value`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `value != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,value)`
- Violation condition: `NOT(value != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `value`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0002 — `root_s32_mul_s32_s16_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5089`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= count < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5089|invalid RHS operand for shift. assert 0 <= count < 32;`
- Source statement: `u32Temp3 = u32Temp3 >> count;`
- Input parameters: `value:s32; factor:s16; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_short_interval(-32768, 32767); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_s16_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_s16_fac_less1/root_s32_mul_s32_s16_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row3; results/high_precision/root_s32_mul_s32_s16_fac_less1/root_s32_mul_s32_s16_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5089; harnesses/P0/eva_main_root_s32_mul_s32_s16_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_s32_mul_s32_s16_fac_less1` / `root_s32_mul_s32_s16_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp3 >> count`
- Operation kind: `RIGHT_SHIFT`
- Safety predicate: `0 <= count && count < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,count)`
- Violation condition: `NOT(0 <= count && count < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp3`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `count`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0003 — `root_s32_mul_s32_s16_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5090`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5090|invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- Source statement: `u32Temp3 |= u32Temp4 << (32-count);`
- Input parameters: `value:s32; factor:s16; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_short_interval(-32768, 32767); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_s16_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_s16_fac_less1/root_s32_mul_s32_s16_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row4; results/high_precision/root_s32_mul_s32_s16_fac_less1/root_s32_mul_s32_s16_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5090; harnesses/P0/eva_main_root_s32_mul_s32_s16_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_s32_mul_s32_s16_fac_less1` / `root_s32_mul_s32_s16_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp4 << (32-count)`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,(u32)(32 - count))`
- Violation condition: `NOT(0 <= (u32)(32 - count) && (u32)(32 - count) < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp4`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `(u32)(32 - count)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0004 — `root_s32_mul_s32_s8_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5223`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -value <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5223|signed overflow. assert -value <= 2147483647;`
- Source statement: `u32Temp1 = -value;`
- Input parameters: `value:s32; factor:s8; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=(s8) Frama_C_int_interval(-128, 127); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_s8_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_s8_fac_less1/root_s32_mul_s32_s8_fac_less1_eva.log`
- Control-flow context: `value < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row5; results/high_precision/root_s32_mul_s32_s8_fac_less1/root_s32_mul_s32_s8_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5223; harnesses/P0/eva_main_root_s32_mul_s32_s8_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_s32_mul_s32_s8_fac_less1` / `root_s32_mul_s32_s8_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-value`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `value != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,value)`
- Violation condition: `NOT(value != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `value`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0005 — `root_s32_mul_s32_s8_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5241`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= count < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5241|invalid RHS operand for shift. assert 0 <= count < 32;`
- Source statement: `u32Temp3 = u32Temp3 >> count;`
- Input parameters: `value:s32; factor:s8; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=(s8) Frama_C_int_interval(-128, 127); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_s8_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_s8_fac_less1/root_s32_mul_s32_s8_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row6; results/high_precision/root_s32_mul_s32_s8_fac_less1/root_s32_mul_s32_s8_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5241; harnesses/P0/eva_main_root_s32_mul_s32_s8_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_s32_mul_s32_s8_fac_less1` / `root_s32_mul_s32_s8_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp3 >> count`
- Operation kind: `RIGHT_SHIFT`
- Safety predicate: `0 <= count && count < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,count)`
- Violation condition: `NOT(0 <= count && count < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp3`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `count`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0006 — `root_s32_mul_s32_s8_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5242`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5242|invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- Source statement: `u32Temp3 |= u32Temp4 << (32-count);`
- Input parameters: `value:s32; factor:s8; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=(s8) Frama_C_int_interval(-128, 127); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_s8_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_s8_fac_less1/root_s32_mul_s32_s8_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row7; results/high_precision/root_s32_mul_s32_s8_fac_less1/root_s32_mul_s32_s8_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5242; harnesses/P0/eva_main_root_s32_mul_s32_s8_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_s32_mul_s32_s8_fac_less1` / `root_s32_mul_s32_s8_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp4 << (32-count)`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,(u32)(32 - count))`
- Violation condition: `NOT(0 <= (u32)(32 - count) && (u32)(32 - count) < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp4`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `(u32)(32 - count)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0007 — `root_s32_mul_s32_u16_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/MulHword.c:47`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;`
- Canonical signature: `src_analysis/sources/MulHword.c|47|signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;`
- Source statement: `MulTemp1 = arg1_LW * arg2_LW;`
- Input parameters: `value:s32; factor:u16; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_short_interval(0, 65535); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_u16_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_u16_fac_less1/root_s32_mul_s32_u16_fac_less1_eva.log`
- Control-flow context: `NO_DIRECT_GUARD_IN_HELPER; caller magnitude/sign preparation precedes call`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row8; results/high_precision/root_s32_mul_s32_u16_fac_less1/root_s32_mul_s32_u16_fac_less1_eva.log; src_analysis/sources/MulHword.c:47; harnesses/P0/eva_main_root_s32_mul_s32_u16_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `MulHighWord` / `root_s32_mul_s32_u16_fac_less1 -> MulHighWord`
- Helper argument mapping: `MulHighWord.arg1 <- u32Temp1; MulHighWord.arg2 <- u32Temp2`
- Source operation: `(int)arg1_LW * (int)arg2_LW`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(int)arg1_LW,(int)arg2_LW)`
- Violation condition: `NOT(MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(int)arg1_LW`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `(int)arg2_LW`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION_IN_HELPER_WITH_CALLER_CONTEXT`
- Confidence/status: `MEDIUM` / `MAPPED_WITH_SEMANTIC_NOTE`
- Notes: Helper source location is shared; the frozen caller function and harness remain part of target identity. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0008 — `root_s32_mul_s32_u16_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5147`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -value <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5147|signed overflow. assert -value <= 2147483647;`
- Source statement: `u32Temp1 = -value;`
- Input parameters: `value:s32; factor:u16; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_short_interval(0, 65535); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_u16_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_u16_fac_less1/root_s32_mul_s32_u16_fac_less1_eva.log`
- Control-flow context: `value < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row9; results/high_precision/root_s32_mul_s32_u16_fac_less1/root_s32_mul_s32_u16_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5147; harnesses/P0/eva_main_root_s32_mul_s32_u16_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_s32_mul_s32_u16_fac_less1` / `root_s32_mul_s32_u16_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-value`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `value != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,value)`
- Violation condition: `NOT(value != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `value`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0009 — `root_s32_mul_s32_u16_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5165`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= count < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5165|invalid RHS operand for shift. assert 0 <= count < 32;`
- Source statement: `u32Temp3 = u32Temp3 >> count;`
- Input parameters: `value:s32; factor:u16; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_short_interval(0, 65535); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_u16_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_u16_fac_less1/root_s32_mul_s32_u16_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row10; results/high_precision/root_s32_mul_s32_u16_fac_less1/root_s32_mul_s32_u16_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5165; harnesses/P0/eva_main_root_s32_mul_s32_u16_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_s32_mul_s32_u16_fac_less1` / `root_s32_mul_s32_u16_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp3 >> count`
- Operation kind: `RIGHT_SHIFT`
- Safety predicate: `0 <= count && count < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,count)`
- Violation condition: `NOT(0 <= count && count < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp3`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `count`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0010 — `root_s32_mul_s32_u16_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5166`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5166|invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- Source statement: `u32Temp3 |= u32Temp4 << (32-count);`
- Input parameters: `value:s32; factor:u16; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_short_interval(0, 65535); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_u16_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_u16_fac_less1/root_s32_mul_s32_u16_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row11; results/high_precision/root_s32_mul_s32_u16_fac_less1/root_s32_mul_s32_u16_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5166; harnesses/P0/eva_main_root_s32_mul_s32_u16_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_s32_mul_s32_u16_fac_less1` / `root_s32_mul_s32_u16_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp4 << (32-count)`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,(u32)(32 - count))`
- Violation condition: `NOT(0 <= (u32)(32 - count) && (u32)(32 - count) < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp4`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `(u32)(32 - count)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0011 — `root_s32_mul_s32_u8_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5534`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -value <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5534|signed overflow. assert -value <= 2147483647;`
- Source statement: `u32Temp1 = -value;`
- Input parameters: `value:s32; factor:u8; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_char_interval(0, 255); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_u8_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_u8_fac_less1/root_s32_mul_s32_u8_fac_less1_eva.log`
- Control-flow context: `value < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row12; results/high_precision/root_s32_mul_s32_u8_fac_less1/root_s32_mul_s32_u8_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5534; harnesses/P0/eva_main_root_s32_mul_s32_u8_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_s32_mul_s32_u8_fac_less1` / `root_s32_mul_s32_u8_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-value`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `value != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,value)`
- Violation condition: `NOT(value != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `value`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0012 — `root_s32_mul_s32_u8_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5544`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= count < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5544|invalid RHS operand for shift. assert 0 <= count < 32;`
- Source statement: `u32Temp2 = u32Temp2 >> count;`
- Input parameters: `value:s32; factor:u8; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_char_interval(0, 255); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_u8_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_u8_fac_less1/root_s32_mul_s32_u8_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row13; results/high_precision/root_s32_mul_s32_u8_fac_less1/root_s32_mul_s32_u8_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5544; harnesses/P0/eva_main_root_s32_mul_s32_u8_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_s32_mul_s32_u8_fac_less1` / `root_s32_mul_s32_u8_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp2 >> count`
- Operation kind: `RIGHT_SHIFT`
- Safety predicate: `0 <= count && count < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,count)`
- Violation condition: `NOT(0 <= count && count < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp2`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `count`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0013 — `root_s32_mul_s32_u8_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5545`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5545|invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- Source statement: `u32Temp2 |= u32Temp3 << (32-count);`
- Input parameters: `value:s32; factor:u8; count:u32`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_char_interval(0, 255); count=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_root_s32_mul_s32_u8_fac_less1.c`
- High Precision log: `results/high_precision/root_s32_mul_s32_u8_fac_less1/root_s32_mul_s32_u8_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row14; results/high_precision/root_s32_mul_s32_u8_fac_less1/root_s32_mul_s32_u8_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5545; harnesses/P0/eva_main_root_s32_mul_s32_u8_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_s32_mul_s32_u8_fac_less1` / `root_s32_mul_s32_u8_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp3 << (32-count)`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,(u32)(32 - count))`
- Violation condition: `NOT(0 <= (u32)(32 - count) && (u32)(32 - count) < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp3`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `(u32)(32 - count)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0014 — `root_u32_mul_u32_s16_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5309`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= count < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5309|invalid RHS operand for shift. assert 0 <= count < 32;`
- Source statement: `u32Temp2 = u32Temp2 >> count;`
- Input parameters: `value:u32; factor:s16; count:u32`
- Input domains: `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=Frama_C_short_interval( -32768, 32767); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P1/eva_main_root_u32_mul_u32_s16_fac_less1.c`
- High Precision log: `results/high_precision/root_u32_mul_u32_s16_fac_less1/root_u32_mul_u32_s16_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row15; results/high_precision/root_u32_mul_u32_s16_fac_less1/root_u32_mul_u32_s16_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5309; harnesses/P1/eva_main_root_u32_mul_u32_s16_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_u32_mul_u32_s16_fac_less1` / `root_u32_mul_u32_s16_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp2 >> count`
- Operation kind: `RIGHT_SHIFT`
- Safety predicate: `0 <= count && count < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,count)`
- Violation condition: `NOT(0 <= count && count < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp2`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `count`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0015 — `root_u32_mul_u32_s16_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5310`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5310|invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- Source statement: `u32Temp2 |= u32Temp3 << (32-count);`
- Input parameters: `value:u32; factor:s16; count:u32`
- Input domains: `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=Frama_C_short_interval( -32768, 32767); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P1/eva_main_root_u32_mul_u32_s16_fac_less1.c`
- High Precision log: `results/high_precision/root_u32_mul_u32_s16_fac_less1/root_u32_mul_u32_s16_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row16; results/high_precision/root_u32_mul_u32_s16_fac_less1/root_u32_mul_u32_s16_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5310; harnesses/P1/eva_main_root_u32_mul_u32_s16_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_u32_mul_u32_s16_fac_less1` / `root_u32_mul_u32_s16_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp3 << (32-count)`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,(u32)(32 - count))`
- Violation condition: `NOT(0 <= (u32)(32 - count) && (u32)(32 - count) < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp3`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `(u32)(32 - count)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0016 — `root_u32_mul_u32_s32_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/MulHword.c:47`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;`
- Canonical signature: `src_analysis/sources/MulHword.c|47|signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;`
- Source statement: `MulTemp1 = arg1_LW * arg2_LW;`
- Input parameters: `value:u32; factor:s32; count:u32`
- Input domains: `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P1/eva_main_root_u32_mul_u32_s32_fac_less1.c`
- High Precision log: `results/high_precision/root_u32_mul_u32_s32_fac_less1/root_u32_mul_u32_s32_fac_less1_eva.log`
- Control-flow context: `NO_DIRECT_GUARD_IN_HELPER; caller magnitude/sign preparation precedes call`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row17; results/high_precision/root_u32_mul_u32_s32_fac_less1/root_u32_mul_u32_s32_fac_less1_eva.log; src_analysis/sources/MulHword.c:47; harnesses/P1/eva_main_root_u32_mul_u32_s32_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `MulHighWord` / `root_u32_mul_u32_s32_fac_less1 -> MulHighWord`
- Helper argument mapping: `MulHighWord.arg1 <- value; MulHighWord.arg2 <- u32Temp1`
- Source operation: `(int)arg1_LW * (int)arg2_LW`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(int)arg1_LW,(int)arg2_LW)`
- Violation condition: `NOT(MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(int)arg1_LW`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `(int)arg2_LW`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION_IN_HELPER_WITH_CALLER_CONTEXT`
- Confidence/status: `MEDIUM` / `MAPPED_WITH_SEMANTIC_NOTE`
- Notes: Helper source location is shared; the frozen caller function and harness remain part of target identity. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0017 — `root_u32_mul_u32_s32_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/MulHword.c:49`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (int)arg1_HW * (int)arg2_LW <= 2147483647;`
- Canonical signature: `src_analysis/sources/MulHword.c|49|signed overflow. assert (int)arg1_HW * (int)arg2_LW <= 2147483647;`
- Source statement: `MulTemp3 = arg1_HW * arg2_LW;`
- Input parameters: `value:u32; factor:s32; count:u32`
- Input domains: `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P1/eva_main_root_u32_mul_u32_s32_fac_less1.c`
- High Precision log: `results/high_precision/root_u32_mul_u32_s32_fac_less1/root_u32_mul_u32_s32_fac_less1_eva.log`
- Control-flow context: `NO_DIRECT_GUARD_IN_HELPER; caller magnitude/sign preparation precedes call`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row18; results/high_precision/root_u32_mul_u32_s32_fac_less1/root_u32_mul_u32_s32_fac_less1_eva.log; src_analysis/sources/MulHword.c:49; harnesses/P1/eva_main_root_u32_mul_u32_s32_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `MulHighWord` / `root_u32_mul_u32_s32_fac_less1 -> MulHighWord`
- Helper argument mapping: `MulHighWord.arg1 <- value; MulHighWord.arg2 <- u32Temp1`
- Source operation: `(int)arg1_HW * (int)arg2_LW`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((int)arg1_HW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(int)arg1_HW,(int)arg2_LW)`
- Violation condition: `NOT(MATHEMATICAL((int)arg1_HW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(int)arg1_HW`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `(int)arg2_LW`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION_IN_HELPER_WITH_CALLER_CONTEXT`
- Confidence/status: `MEDIUM` / `MAPPED_WITH_SEMANTIC_NOTE`
- Notes: Helper source location is shared; the frozen caller function and harness remain part of target identity. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0018 — `root_u32_mul_u32_s32_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5364`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -factor <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5364|signed overflow. assert -factor <= 2147483647;`
- Source statement: `u32Temp1 = -factor;`
- Input parameters: `value:u32; factor:s32; count:u32`
- Input domains: `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P1/eva_main_root_u32_mul_u32_s32_fac_less1.c`
- High Precision log: `results/high_precision/root_u32_mul_u32_s32_fac_less1/root_u32_mul_u32_s32_fac_less1_eva.log`
- Control-flow context: `factor < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row19; results/high_precision/root_u32_mul_u32_s32_fac_less1/root_u32_mul_u32_s32_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5364; harnesses/P1/eva_main_root_u32_mul_u32_s32_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_u32_mul_u32_s32_fac_less1` / `root_u32_mul_u32_s32_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-factor`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `factor != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,factor)`
- Violation condition: `NOT(factor != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `factor`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0019 — `root_u32_mul_u32_s32_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5372`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= (u32)(count - 32) < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5372|invalid RHS operand for shift. assert 0 <= (u32)(count - 32) < 32;`
- Source statement: `u32Temp2 = u32Temp2 >> (count-32);`
- Input parameters: `value:u32; factor:s32; count:u32`
- Input domains: `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P1/eva_main_root_u32_mul_u32_s32_fac_less1.c`
- High Precision log: `results/high_precision/root_u32_mul_u32_s32_fac_less1/root_u32_mul_u32_s32_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row20; results/high_precision/root_u32_mul_u32_s32_fac_less1/root_u32_mul_u32_s32_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5372; harnesses/P1/eva_main_root_u32_mul_u32_s32_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_u32_mul_u32_s32_fac_less1` / `root_u32_mul_u32_s32_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp2 >> (count-32)`
- Operation kind: `RIGHT_SHIFT`
- Safety predicate: `0 <= (u32)(count - 32) && (u32)(count - 32) < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,(u32)(count - 32))`
- Violation condition: `NOT(0 <= (u32)(count - 32) && (u32)(count - 32) < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp2`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `(u32)(count - 32)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0020 — `root_u32_mul_u32_s8_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5451`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= count < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5451|invalid RHS operand for shift. assert 0 <= count < 32;`
- Source statement: `u32Temp2 = u32Temp2 >> count;`
- Input parameters: `value:u32; factor:s8; count:u32`
- Input domains: `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=(s8) Frama_C_int_interval( -128, 127); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P1/eva_main_root_u32_mul_u32_s8_fac_less1.c`
- High Precision log: `results/high_precision/root_u32_mul_u32_s8_fac_less1/root_u32_mul_u32_s8_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row21; results/high_precision/root_u32_mul_u32_s8_fac_less1/root_u32_mul_u32_s8_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5451; harnesses/P1/eva_main_root_u32_mul_u32_s8_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_u32_mul_u32_s8_fac_less1` / `root_u32_mul_u32_s8_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp2 >> count`
- Operation kind: `RIGHT_SHIFT`
- Safety predicate: `0 <= count && count < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,count)`
- Violation condition: `NOT(0 <= count && count < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp2`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `count`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0021 — `root_u32_mul_u32_s8_fac_less1`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:5452`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|5452|invalid RHS operand for shift. assert 0 <= (u32)(32 - count) < 32;`
- Source statement: `u32Temp2 |= u32Temp3 << (32-count);`
- Input parameters: `value:u32; factor:s8; count:u32`
- Input domains: `value=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); factor=(s8) Frama_C_int_interval( -128, 127); count=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P1/eva_main_root_u32_mul_u32_s8_fac_less1.c`
- High Precision log: `results/high_precision/root_u32_mul_u32_s8_fac_less1/root_u32_mul_u32_s8_fac_less1_eva.log`
- Control-flow context: `NONE_BEFORE_SHIFT_COUNT_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row22; results/high_precision/root_u32_mul_u32_s8_fac_less1/root_u32_mul_u32_s8_fac_less1_eva.log; src_analysis/sources/mul_Ccode.c:5452; harnesses/P1/eva_main_root_u32_mul_u32_s8_fac_less1.c`

### Derived semantic mapping

- Containing function/call chain: `root_u32_mul_u32_s8_fac_less1` / `root_u32_mul_u32_s8_fac_less1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `u32Temp3 << (32-count)`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `0 <= (u32)(32 - count) && (u32)(32 - count) < 32`
- Predicate normal form: `SHIFT_COUNT_VALID(32,(u32)(32 - count))`
- Violation condition: `NOT(0 <= (u32)(32 - count) && (u32)(32 - count) < 32)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `u32Temp3`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Operand 2: `(u32)(32 - count)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0022 — `rotateRight`

### Direct repository evidence

- Source: `src_analysis/sources/rotatefunc.c:119`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert 1 << INT_BITS <= 2147483647;`
- Canonical signature: `src_analysis/sources/rotatefunc.c|119|signed overflow. assert 1 << INT_BITS <= 2147483647;`
- Source statement: `num = (num >> 1) & (~(1 << INT_BITS));`
- Input parameters: `num:u32; rotation:u32`
- Input domains: `num=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL); rotation=Frama_C_unsigned_long_interval( 0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_rotateRight.c`
- High Precision log: `results/high_precision/rotateRight/rotateRight_eva.log`
- Control-flow context: `rotation %= INT_BITS; while (rotation--)`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row23; results/high_precision/rotateRight/rotateRight_eva.log; src_analysis/sources/rotatefunc.c:119; harnesses/P0/eva_main_rotateRight.c`

### Derived semantic mapping

- Containing function/call chain: `rotateRight` / `rotateRight`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `1 << INT_BITS`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT(1,INT_BITS) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,1,INT_BITS)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT(1,INT_BITS) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `INT_BITS`; declared `u32`; effective `unsigned long (u32, 32-bit unsigned under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0023 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:274`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert (s32)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|274|division by zero. assert (s32)denominator != 0;`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row24; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:274; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)denominator)`
- Violation condition: `NOT((s32)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; SOURCE_GUARD_EXCLUDES_INPUT_NUMERATOR_INT32_MIN`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0024 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:274`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|274|invalid LHS operand for left shift. assert 0 <= (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator));`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row25; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:274; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)))`
- Violation condition: `NOT((s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0025 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:274`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|274|signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row26; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:274; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT((s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)),1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT((s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0026 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:274`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|274|signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator <= 2147483647;`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row27; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:274; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(s32Temp1 / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0027 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:274`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= (s32)(s32Temp1 / (s32)denominator) * (s32)denominator;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|274|signed overflow. assert -2147483648 <= (s32)(s32Temp1 / (s32)denominator) * (s32)denominator;`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row28; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:274; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `INT32_MIN <= MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) * MATHEMATICAL((s32)denominator)`
- Predicate normal form: `SIGNED_MUL_LOWER_BOUND(32,(s32)(s32Temp1 / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) * MATHEMATICAL((s32)denominator))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0028 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:275`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert (s32)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|275|division by zero. assert (s32)denominator != 0;`
- Source statement: `s32Temp1 = s32Temp2/denominator;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row29; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:275; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp2 / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)denominator)`
- Violation condition: `NOT((s32)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; NOT_EXCLUDED_BY_RECORDED_DIRECT_GUARD`
- Operand 1: `s32Temp2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0029 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:276`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert (s32)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|276|division by zero. assert (s32)denominator != 0;`
- Source statement: `s32Temp1 = s32Temp1 +((numerator)/denominator);`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row30; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:276; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(numerator) / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)denominator)`
- Violation condition: `NOT((s32)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; SOURCE_GUARD_EXCLUDES_INPUT_NUMERATOR_INT32_MIN`
- Operand 1: `(numerator)`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0030 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:276`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= s32Temp1 + (s32)(numerator / (s32)denominator);`
- Canonical signature: `src_analysis/sources/div_Ccode.c|276|signed overflow. assert -2147483648 <= s32Temp1 + (s32)(numerator / (s32)denominator);`
- Source statement: `s32Temp1 = s32Temp1 +((numerator)/denominator);`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row31; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:276; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 + (s32)(numerator / (s32)denominator)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `INT32_MIN <= MATHEMATICAL(s32Temp1) + MATHEMATICAL((s32)(numerator / (s32)denominator))`
- Predicate normal form: `SIGNED_ADD_LOWER_BOUND(32,s32Temp1,(s32)(numerator / (s32)denominator))`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL(s32Temp1) + MATHEMATICAL((s32)(numerator / (s32)denominator)))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(numerator / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0031 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:276`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert s32Temp1 + (s32)(numerator / (s32)denominator) <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|276|signed overflow. assert s32Temp1 + (s32)(numerator / (s32)denominator) <= 2147483647;`
- Source statement: `s32Temp1 = s32Temp1 +((numerator)/denominator);`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row32; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:276; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 + (s32)(numerator / (s32)denominator)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL(s32Temp1) + MATHEMATICAL((s32)(numerator / (s32)denominator)) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,s32Temp1,(s32)(numerator / (s32)denominator))`
- Violation condition: `NOT(MATHEMATICAL(s32Temp1) + MATHEMATICAL((s32)(numerator / (s32)denominator)) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(numerator / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0032 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:297`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert (s32)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|297|division by zero. assert (s32)denominator != 0;`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator == 0x80000000; denominator != -1`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row33; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:297; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)denominator)`
- Violation condition: `NOT((s32)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; SOURCE_GUARD_EXCLUDES_DENOMINATOR_MINUS_ONE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0033 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:297`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|297|invalid LHS operand for left shift. assert 0 <= (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator));`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator == 0x80000000; denominator != -1`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row34; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:297; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)))`
- Violation condition: `NOT((s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0034 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:297`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|297|signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator == 0x80000000; denominator != -1`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row35; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:297; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT((s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)),1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT((s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0035 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:297`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|297|signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator <= 2147483647;`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator == 0x80000000; denominator != -1`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row36; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:297; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(s32Temp1 / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0036 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:297`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= (s32)(s32Temp1 / (s32)denominator) * (s32)denominator;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|297|signed overflow. assert -2147483648 <= (s32)(s32Temp1 / (s32)denominator) * (s32)denominator;`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator == 0x80000000; denominator != -1`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row37; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:297; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `INT32_MIN <= MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) * MATHEMATICAL((s32)denominator)`
- Predicate normal form: `SIGNED_MUL_LOWER_BOUND(32,(s32)(s32Temp1 / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) * MATHEMATICAL((s32)denominator))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0037 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:297`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert s32Temp1 / (s32)denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|297|signed overflow. assert s32Temp1 / (s32)denominator <= 2147483647;`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator == 0x80000000; denominator != -1`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row38; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:297; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 / (s32)denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `!(s32Temp1 == INT32_MIN && (s32)denominator == -1)`
- Predicate normal form: `SIGNED_DIV_REPRESENTABLE(32,s32Temp1,(s32)denominator)`
- Violation condition: `NOT(!(s32Temp1 == INT32_MIN && (s32)denominator == -1))`
- Signed-division companion: `THIS_TARGET_IS_SIGNED_DIVISION_REPRESENTABILITY`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0038 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:298`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert (s32)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|298|division by zero. assert (s32)denominator != 0;`
- Source statement: `s32Temp1 = s32Temp2/denominator;`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator == 0x80000000; denominator != -1`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row39; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:298; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp2 / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)denominator)`
- Violation condition: `NOT((s32)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; SOURCE_GUARD_EXCLUDES_DENOMINATOR_MINUS_ONE`
- Operand 1: `s32Temp2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0039 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:299`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert (s32)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|299|division by zero. assert (s32)denominator != 0;`
- Source statement: `s32Temp1 = s32Temp1 +((numerator)/denominator);`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator == 0x80000000; denominator != -1`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row40; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:299; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(numerator) / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)denominator)`
- Violation condition: `NOT((s32)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; SOURCE_GUARD_EXCLUDES_DENOMINATOR_MINUS_ONE`
- Operand 1: `(numerator)`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0040 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:299`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= s32Temp1 + (s32)(numerator / (s32)denominator);`
- Canonical signature: `src_analysis/sources/div_Ccode.c|299|signed overflow. assert -2147483648 <= s32Temp1 + (s32)(numerator / (s32)denominator);`
- Source statement: `s32Temp1 = s32Temp1 +((numerator)/denominator);`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator == 0x80000000; denominator != -1`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row41; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:299; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 + (s32)(numerator / (s32)denominator)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `INT32_MIN <= MATHEMATICAL(s32Temp1) + MATHEMATICAL((s32)(numerator / (s32)denominator))`
- Predicate normal form: `SIGNED_ADD_LOWER_BOUND(32,s32Temp1,(s32)(numerator / (s32)denominator))`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL(s32Temp1) + MATHEMATICAL((s32)(numerator / (s32)denominator)))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(numerator / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0041 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:299`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert numerator / (s32)denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|299|signed overflow. assert numerator / (s32)denominator <= 2147483647;`
- Source statement: `s32Temp1 = s32Temp1 +((numerator)/denominator);`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator == 0x80000000; denominator != -1`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row42; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:299; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `numerator / (s32)denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `!(numerator == INT32_MIN && (s32)denominator == -1)`
- Predicate normal form: `SIGNED_DIV_REPRESENTABLE(32,numerator,(s32)denominator)`
- Violation condition: `NOT(!(numerator == INT32_MIN && (s32)denominator == -1))`
- Signed-division companion: `THIS_TARGET_IS_SIGNED_DIVISION_REPRESENTABILITY`
- Operand 1: `numerator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0042 — `s16_div_s32_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:299`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert s32Temp1 + (s32)(numerator / (s32)denominator) <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|299|signed overflow. assert s32Temp1 + (s32)(numerator / (s32)denominator) <= 2147483647;`
- Source statement: `s32Temp1 = s32Temp1 +((numerator)/denominator);`
- Input parameters: `numerator:s32; denominator:s16`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_div_s32_s16.c`
- High Precision log: `results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log`
- Control-flow context: `denominator != 0; numerator == 0x80000000; denominator != -1`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row43; results/high_precision/s16_div_s32_s16/s16_div_s32_s16_eva.log; src_analysis/sources/div_Ccode.c:299; harnesses/P1/eva_main_s16_div_s32_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_s16` / `s16_div_s32_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 + (s32)(numerator / (s32)denominator)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL(s32Temp1) + MATHEMATICAL((s32)(numerator / (s32)denominator)) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,s32Temp1,(s32)(numerator / (s32)denominator))`
- Violation condition: `NOT(MATHEMATICAL(s32Temp1) + MATHEMATICAL((s32)(numerator / (s32)denominator)) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(numerator / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0043 — `s16_div_s32_u32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1477`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -numerator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1477|signed overflow. assert -numerator <= 2147483647;`
- Source statement: `numerator_prime = -numerator;`
- Input parameters: `numerator:s32; denominator:u32`
- Input domains: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_s16_div_s32_u32.c`
- High Precision log: `results/high_precision/s16_div_s32_u32/s16_div_s32_u32_eva.log`
- Control-flow context: `denominator != 0; numerator < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row44; results/high_precision/s16_div_s32_u32/s16_div_s32_u32_eva.log; src_analysis/sources/div_Ccode.c:1477; harnesses/P0/eva_main_s16_div_s32_u32.c`

### Derived semantic mapping

- Containing function/call chain: `s16_div_s32_u32` / `s16_div_s32_u32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-numerator`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `numerator != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,numerator)`
- Violation condition: `NOT(numerator != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `numerator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0044 — `s16_fac05_div_s16_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:173`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (int)numerator;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|173|invalid LHS operand for left shift. assert 0 <= (int)numerator;`
- Source statement: `s32Temp1 = numerator<<16;`
- Input parameters: `numerator:s16; denominator:s16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log`
- Control-flow context: `NONE_BEFORE_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row45; results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log; src_analysis/sources/div_Ccode.c:173; harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_s16` / `s16_fac05_div_s16_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(int)numerator << 16`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(int)numerator >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(int)numerator)`
- Violation condition: `NOT((int)numerator >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(int)numerator`; declared `s16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `16`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0045 — `s16_fac05_div_s16_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:190`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert (s32)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|190|division by zero. assert (s32)denominator != 0;`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s16; denominator:s16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log`
- Control-flow context: `denominator != 0; s32Temp1 != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row46; results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log; src_analysis/sources/div_Ccode.c:190; harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_s16` / `s16_fac05_div_s16_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)denominator)`
- Violation condition: `NOT((s32)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; SOURCE_RELATION_GUARDS_SCALED_NUMERATOR_FROM_INT32_MIN`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0046 — `s16_fac05_div_s16_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:190`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|190|invalid LHS operand for left shift. assert 0 <= (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator));`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s16; denominator:s16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log`
- Control-flow context: `denominator != 0; s32Temp1 != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row47; results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log; src_analysis/sources/div_Ccode.c:190; harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_s16` / `s16_fac05_div_s16_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)))`
- Violation condition: `NOT((s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0047 — `s16_fac05_div_s16_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:190`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|190|signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s16; denominator:s16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log`
- Control-flow context: `denominator != 0; s32Temp1 != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row48; results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log; src_analysis/sources/div_Ccode.c:190; harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_s16` / `s16_fac05_div_s16_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT((s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)),1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT((s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0048 — `s16_fac05_div_s16_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:190`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|190|signed overflow. assert (s32)(s32Temp1 / (s32)denominator) * (s32)denominator <= 2147483647;`
- Source statement: `s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;`
- Input parameters: `numerator:s16; denominator:s16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log`
- Control-flow context: `denominator != 0; s32Temp1 != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row49; results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log; src_analysis/sources/div_Ccode.c:190; harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_s16` / `s16_fac05_div_s16_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(s32Temp1 / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0049 — `s16_fac05_div_s16_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:191`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert (s32)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|191|division by zero. assert (s32)denominator != 0;`
- Source statement: `s32Temp1 = s32Temp2/denominator;`
- Input parameters: `numerator:s16; denominator:s16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log`
- Control-flow context: `denominator != 0; s32Temp1 != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row50; results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log; src_analysis/sources/div_Ccode.c:191; harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_s16` / `s16_fac05_div_s16_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp2 / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)denominator)`
- Violation condition: `NOT((s32)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; NOT_EXCLUDED_BY_RECORDED_DIRECT_GUARD`
- Operand 1: `s32Temp2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0050 — `s16_fac05_div_s16_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:192`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert (int)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|192|division by zero. assert (int)denominator != 0;`
- Source statement: `s32Temp1 = s32Temp1 +((numerator<<16)/denominator);`
- Input parameters: `numerator:s16; denominator:s16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log`
- Control-flow context: `denominator != 0; s32Temp1 != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row51; results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log; src_analysis/sources/div_Ccode.c:192; harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_s16` / `s16_fac05_div_s16_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(numerator<<16) / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(int)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(int)denominator)`
- Violation condition: `NOT((int)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; SOURCE_RELATION_GUARDS_SCALED_NUMERATOR_FROM_INT32_MIN`
- Operand 1: `(numerator<<16)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0051 — `s16_fac05_div_s16_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:192`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|192|signed overflow. assert -2147483648 <= s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator));`
- Source statement: `s32Temp1 = s32Temp1 +((numerator<<16)/denominator);`
- Input parameters: `numerator:s16; denominator:s16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log`
- Control-flow context: `denominator != 0; s32Temp1 != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row52; results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log; src_analysis/sources/div_Ccode.c:192; harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_s16` / `s16_fac05_div_s16_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator))`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `INT32_MIN <= MATHEMATICAL(s32Temp1) + MATHEMATICAL((s32)((int)((int)((int)numerator << 16) / (int)denominator)))`
- Predicate normal form: `SIGNED_ADD_LOWER_BOUND(32,s32Temp1,(s32)((int)((int)((int)numerator << 16) / (int)denominator)))`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL(s32Temp1) + MATHEMATICAL((s32)((int)((int)((int)numerator << 16) / (int)denominator))))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)((int)((int)((int)numerator << 16) / (int)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0052 — `s16_fac05_div_s16_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:192`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator)) <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|192|signed overflow. assert s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator)) <= 2147483647;`
- Source statement: `s32Temp1 = s32Temp1 +((numerator<<16)/denominator);`
- Input parameters: `numerator:s16; denominator:s16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log`
- Control-flow context: `denominator != 0; s32Temp1 != 0x80000000`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row53; results/high_precision/s16_fac05_div_s16_s16/s16_fac05_div_s16_s16_eva.log; src_analysis/sources/div_Ccode.c:192; harnesses/P1/eva_main_s16_fac05_div_s16_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_s16` / `s16_fac05_div_s16_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator))`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL(s32Temp1) + MATHEMATICAL((s32)((int)((int)((int)numerator << 16) / (int)denominator))) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,s32Temp1,(s32)((int)((int)((int)numerator << 16) / (int)denominator)))`
- Violation condition: `NOT(MATHEMATICAL(s32Temp1) + MATHEMATICAL((s32)((int)((int)((int)numerator << 16) / (int)denominator))) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)((int)((int)((int)numerator << 16) / (int)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0053 — `s16_fac05_div_s16_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:348`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (int)numerator;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|348|invalid LHS operand for left shift. assert 0 <= (int)numerator;`
- Source statement: `s32Temp1 = numerator<<16;`
- Input parameters: `numerator:s16; denominator:u16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_u16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_u16/s16_fac05_div_s16_u16_eva.log`
- Control-flow context: `NONE_BEFORE_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row54; results/high_precision/s16_fac05_div_s16_u16/s16_fac05_div_s16_u16_eva.log; src_analysis/sources/div_Ccode.c:348; harnesses/P1/eva_main_s16_fac05_div_s16_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_u16` / `s16_fac05_div_s16_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(int)numerator << 16`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(int)numerator >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(int)numerator)`
- Violation condition: `NOT((int)numerator >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(int)numerator`; declared `s16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `16`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0054 — `s16_fac05_div_s16_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:362`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (int)((int)((int)numerator << 16) / (int)u16Temp1) * (int)u16Temp1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|362|signed overflow. assert (int)((int)((int)numerator << 16) / (int)u16Temp1) * (int)u16Temp1 <= 2147483647;`
- Source statement: `s32Temp1 = (numerator<<16)-((numerator<<16)/u16Temp1)*u16Temp1;`
- Input parameters: `numerator:s16; denominator:u16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_u16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_u16/s16_fac05_div_s16_u16_eva.log`
- Control-flow context: `u16Temp1 != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row55; results/high_precision/s16_fac05_div_s16_u16/s16_fac05_div_s16_u16_eva.log; src_analysis/sources/div_Ccode.c:362; harnesses/P1/eva_main_s16_fac05_div_s16_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_u16` / `s16_fac05_div_s16_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(int)((int)((int)numerator << 16) / (int)u16Temp1) * (int)u16Temp1`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((int)((int)((int)numerator << 16) / (int)u16Temp1)) * MATHEMATICAL((int)u16Temp1) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(int)((int)((int)numerator << 16) / (int)u16Temp1),(int)u16Temp1)`
- Violation condition: `NOT(MATHEMATICAL((int)((int)((int)numerator << 16) / (int)u16Temp1)) * MATHEMATICAL((int)u16Temp1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(int)((int)((int)numerator << 16) / (int)u16Temp1)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `(int)u16Temp1`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0055 — `s16_fac05_div_s16_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:363`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= s32Temp1;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|363|invalid LHS operand for left shift. assert 0 <= s32Temp1;`
- Source statement: `s32Temp2 = s32Temp1<<1;`
- Input parameters: `numerator:s16; denominator:u16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_u16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_u16/s16_fac05_div_s16_u16_eva.log`
- Control-flow context: `u16Temp1 != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row56; results/high_precision/s16_fac05_div_s16_u16/s16_fac05_div_s16_u16_eva.log; src_analysis/sources/div_Ccode.c:363; harnesses/P1/eva_main_s16_fac05_div_s16_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_u16` / `s16_fac05_div_s16_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `s32Temp1 >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,s32Temp1)`
- Violation condition: `NOT(s32Temp1 >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0056 — `s16_fac05_div_s16_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:363`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert s32Temp1 << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|363|signed overflow. assert s32Temp1 << 1 <= 2147483647;`
- Source statement: `s32Temp2 = s32Temp1<<1;`
- Input parameters: `numerator:s16; denominator:u16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_u16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_u16/s16_fac05_div_s16_u16_eva.log`
- Control-flow context: `u16Temp1 != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row57; results/high_precision/s16_fac05_div_s16_u16/s16_fac05_div_s16_u16_eva.log; src_analysis/sources/div_Ccode.c:363; harnesses/P1/eva_main_s16_fac05_div_s16_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_u16` / `s16_fac05_div_s16_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT(s32Temp1,1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,s32Temp1,1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT(s32Temp1,1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0057 — `s16_fac05_div_s16_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:365`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)((int)((int)((int)numerator << 16) / (int)u16Temp1)) + s32Temp1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|365|signed overflow. assert (s32)((int)((int)((int)numerator << 16) / (int)u16Temp1)) + s32Temp1 <= 2147483647;`
- Source statement: `s32Temp1 = ((numerator<<16)/u16Temp1) + s32Temp1;`
- Input parameters: `numerator:s16; denominator:u16`
- Input domains: `numerator=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_fac05_div_s16_u16.c`
- High Precision log: `results/high_precision/s16_fac05_div_s16_u16/s16_fac05_div_s16_u16_eva.log`
- Control-flow context: `u16Temp1 != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row58; results/high_precision/s16_fac05_div_s16_u16/s16_fac05_div_s16_u16_eva.log; src_analysis/sources/div_Ccode.c:365; harnesses/P1/eva_main_s16_fac05_div_s16_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_fac05_div_s16_u16` / `s16_fac05_div_s16_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)((int)((int)((int)numerator << 16) / (int)u16Temp1)) + s32Temp1`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL((s32)((int)((int)((int)numerator << 16) / (int)u16Temp1))) + MATHEMATICAL(s32Temp1) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,(s32)((int)((int)((int)numerator << 16) / (int)u16Temp1)),s32Temp1)`
- Violation condition: `NOT(MATHEMATICAL((s32)((int)((int)((int)numerator << 16) / (int)u16Temp1))) + MATHEMATICAL(s32Temp1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)((int)((int)((int)numerator << 16) / (int)u16Temp1))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0058 — `s16_hip1_s16_s8_s8_u16_fac1`

### Direct repository evidence

- Source: `src_analysis/sources/hip_Ccode.c:163`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (int)((int)u - (int)uold);`
- Canonical signature: `src_analysis/sources/hip_Ccode.c|163|invalid LHS operand for left shift. assert 0 <= (int)((int)u - (int)uold);`
- Source statement: `s16uold = (u - uold) << 7;`
- Input parameters: `yold:s16; u:s8; uold:s8; m:u16`
- Input domains: `yold=Frama_C_short_interval( -32768, 32767); u=(s8) Frama_C_int_interval( -128, 127); uold=(s8) Frama_C_int_interval( -128, 127); m=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c`
- High Precision log: `results/high_precision/s16_hip1_s16_s8_s8_u16_fac1/s16_hip1_s16_s8_s8_u16_fac1_eva.log`
- Control-flow context: `NONE_BEFORE_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row59; results/high_precision/s16_hip1_s16_s8_s8_u16_fac1/s16_hip1_s16_s8_s8_u16_fac1_eva.log; src_analysis/sources/hip_Ccode.c:163; harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c`

### Derived semantic mapping

- Containing function/call chain: `s16_hip1_s16_s8_s8_u16_fac1` / `s16_hip1_s16_s8_s8_u16_fac1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(int)((int)u - (int)uold) << 7`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(int)((int)u - (int)uold) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(int)((int)u - (int)uold))`
- Violation condition: `NOT((int)((int)u - (int)uold) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(int)((int)u - (int)uold)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `7`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0059 — `s16_hip1_s16_s8_s8_u16_fac1`

### Direct repository evidence

- Source: `src_analysis/sources/hip_Ccode.c:166`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= s32Temp1 - s32Temp2;`
- Canonical signature: `src_analysis/sources/hip_Ccode.c|166|signed overflow. assert -2147483648 <= s32Temp1 - s32Temp2;`
- Source statement: `s32Temp2 = s32Temp1 - s32Temp2;`
- Input parameters: `yold:s16; u:s8; uold:s8; m:u16`
- Input domains: `yold=Frama_C_short_interval( -32768, 32767); u=(s8) Frama_C_int_interval( -128, 127); uold=(s8) Frama_C_int_interval( -128, 127); m=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c`
- High Precision log: `results/high_precision/s16_hip1_s16_s8_s8_u16_fac1/s16_hip1_s16_s8_s8_u16_fac1_eva.log`
- Control-flow context: `NONE_BEFORE_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row60; results/high_precision/s16_hip1_s16_s8_s8_u16_fac1/s16_hip1_s16_s8_s8_u16_fac1_eva.log; src_analysis/sources/hip_Ccode.c:166; harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c`

### Derived semantic mapping

- Containing function/call chain: `s16_hip1_s16_s8_s8_u16_fac1` / `s16_hip1_s16_s8_s8_u16_fac1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 - s32Temp2`
- Operation kind: `SIGNED_SUB`
- Safety predicate: `INT32_MIN <= MATHEMATICAL(s32Temp1) - MATHEMATICAL(s32Temp2)`
- Predicate normal form: `SIGNED_SUB_LOWER_BOUND(32,s32Temp1,s32Temp2)`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL(s32Temp1) - MATHEMATICAL(s32Temp2))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `s32Temp2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0060 — `s16_hip1_s16_s8_s8_u16_fac1`

### Direct repository evidence

- Source: `src_analysis/sources/hip_Ccode.c:166`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert s32Temp1 - s32Temp2 <= 2147483647;`
- Canonical signature: `src_analysis/sources/hip_Ccode.c|166|signed overflow. assert s32Temp1 - s32Temp2 <= 2147483647;`
- Source statement: `s32Temp2 = s32Temp1 - s32Temp2;`
- Input parameters: `yold:s16; u:s8; uold:s8; m:u16`
- Input domains: `yold=Frama_C_short_interval( -32768, 32767); u=(s8) Frama_C_int_interval( -128, 127); uold=(s8) Frama_C_int_interval( -128, 127); m=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c`
- High Precision log: `results/high_precision/s16_hip1_s16_s8_s8_u16_fac1/s16_hip1_s16_s8_s8_u16_fac1_eva.log`
- Control-flow context: `NONE_BEFORE_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row61; results/high_precision/s16_hip1_s16_s8_s8_u16_fac1/s16_hip1_s16_s8_s8_u16_fac1_eva.log; src_analysis/sources/hip_Ccode.c:166; harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c`

### Derived semantic mapping

- Containing function/call chain: `s16_hip1_s16_s8_s8_u16_fac1` / `s16_hip1_s16_s8_s8_u16_fac1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 - s32Temp2`
- Operation kind: `SIGNED_SUB`
- Safety predicate: `MATHEMATICAL(s32Temp1) - MATHEMATICAL(s32Temp2) <= INT32_MAX`
- Predicate normal form: `SIGNED_SUB_UPPER_BOUND(32,s32Temp1,s32Temp2)`
- Violation condition: `NOT(MATHEMATICAL(s32Temp1) - MATHEMATICAL(s32Temp2) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `s32Temp2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0061 — `s16_hip1_s16_s8_s8_u16_fac1`

### Direct repository evidence

- Source: `src_analysis/sources/hip_Ccode.c:167`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= s32Temp2;`
- Canonical signature: `src_analysis/sources/hip_Ccode.c|167|invalid LHS operand for left shift. assert 0 <= s32Temp2;`
- Source statement: `s32Temp2 = s32Temp2 << 1;`
- Input parameters: `yold:s16; u:s8; uold:s8; m:u16`
- Input domains: `yold=Frama_C_short_interval( -32768, 32767); u=(s8) Frama_C_int_interval( -128, 127); uold=(s8) Frama_C_int_interval( -128, 127); m=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c`
- High Precision log: `results/high_precision/s16_hip1_s16_s8_s8_u16_fac1/s16_hip1_s16_s8_s8_u16_fac1_eva.log`
- Control-flow context: `NONE_BEFORE_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row62; results/high_precision/s16_hip1_s16_s8_s8_u16_fac1/s16_hip1_s16_s8_s8_u16_fac1_eva.log; src_analysis/sources/hip_Ccode.c:167; harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c`

### Derived semantic mapping

- Containing function/call chain: `s16_hip1_s16_s8_s8_u16_fac1` / `s16_hip1_s16_s8_s8_u16_fac1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp2 << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `s32Temp2 >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,s32Temp2)`
- Violation condition: `NOT(s32Temp2 >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0062 — `s16_hip1_s16_s8_s8_u16_fac1`

### Direct repository evidence

- Source: `src_analysis/sources/hip_Ccode.c:167`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert s32Temp2 << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/hip_Ccode.c|167|signed overflow. assert s32Temp2 << 1 <= 2147483647;`
- Source statement: `s32Temp2 = s32Temp2 << 1;`
- Input parameters: `yold:s16; u:s8; uold:s8; m:u16`
- Input domains: `yold=Frama_C_short_interval( -32768, 32767); u=(s8) Frama_C_int_interval( -128, 127); uold=(s8) Frama_C_int_interval( -128, 127); m=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c`
- High Precision log: `results/high_precision/s16_hip1_s16_s8_s8_u16_fac1/s16_hip1_s16_s8_s8_u16_fac1_eva.log`
- Control-flow context: `NONE_BEFORE_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row63; results/high_precision/s16_hip1_s16_s8_s8_u16_fac1/s16_hip1_s16_s8_s8_u16_fac1_eva.log; src_analysis/sources/hip_Ccode.c:167; harnesses/P1/eva_main_s16_hip1_s16_s8_s8_u16_fac1.c`

### Derived semantic mapping

- Containing function/call chain: `s16_hip1_s16_s8_s8_u16_fac1` / `s16_hip1_s16_s8_s8_u16_fac1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp2 << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT(s32Temp2,1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,s32Temp2,1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT(s32Temp2,1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0063 — `s16_hip1_s16_u8_u8_u16_fac1`

### Direct repository evidence

- Source: `src_analysis/sources/hip_Ccode.c:49`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (int)((int)u - (int)uold);`
- Canonical signature: `src_analysis/sources/hip_Ccode.c|49|invalid LHS operand for left shift. assert 0 <= (int)((int)u - (int)uold);`
- Source statement: `u16uold = (u - uold) << 7;`
- Input parameters: `yold:s16; u:u8; uold:u8; m:u16`
- Input domains: `yold=Frama_C_short_interval( -32768, 32767); u=Frama_C_unsigned_char_interval( 0, 255); uold=Frama_C_unsigned_char_interval( 0, 255); m=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c`
- High Precision log: `results/high_precision/s16_hip1_s16_u8_u8_u16_fac1/s16_hip1_s16_u8_u8_u16_fac1_eva.log`
- Control-flow context: `NONE_BEFORE_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row64; results/high_precision/s16_hip1_s16_u8_u8_u16_fac1/s16_hip1_s16_u8_u8_u16_fac1_eva.log; src_analysis/sources/hip_Ccode.c:49; harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c`

### Derived semantic mapping

- Containing function/call chain: `s16_hip1_s16_u8_u8_u16_fac1` / `s16_hip1_s16_u8_u8_u16_fac1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(int)((int)u - (int)uold) << 7`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(int)((int)u - (int)uold) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(int)((int)u - (int)uold))`
- Violation condition: `NOT((int)((int)u - (int)uold) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(int)((int)u - (int)uold)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `7`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0064 — `s16_hip1_s16_u8_u8_u16_fac1`

### Direct repository evidence

- Source: `src_analysis/sources/hip_Ccode.c:52`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= s32Temp1 - s32Temp2;`
- Canonical signature: `src_analysis/sources/hip_Ccode.c|52|signed overflow. assert -2147483648 <= s32Temp1 - s32Temp2;`
- Source statement: `s32Temp2 = s32Temp1 - s32Temp2;`
- Input parameters: `yold:s16; u:u8; uold:u8; m:u16`
- Input domains: `yold=Frama_C_short_interval( -32768, 32767); u=Frama_C_unsigned_char_interval( 0, 255); uold=Frama_C_unsigned_char_interval( 0, 255); m=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c`
- High Precision log: `results/high_precision/s16_hip1_s16_u8_u8_u16_fac1/s16_hip1_s16_u8_u8_u16_fac1_eva.log`
- Control-flow context: `NONE_BEFORE_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row65; results/high_precision/s16_hip1_s16_u8_u8_u16_fac1/s16_hip1_s16_u8_u8_u16_fac1_eva.log; src_analysis/sources/hip_Ccode.c:52; harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c`

### Derived semantic mapping

- Containing function/call chain: `s16_hip1_s16_u8_u8_u16_fac1` / `s16_hip1_s16_u8_u8_u16_fac1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 - s32Temp2`
- Operation kind: `SIGNED_SUB`
- Safety predicate: `INT32_MIN <= MATHEMATICAL(s32Temp1) - MATHEMATICAL(s32Temp2)`
- Predicate normal form: `SIGNED_SUB_LOWER_BOUND(32,s32Temp1,s32Temp2)`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL(s32Temp1) - MATHEMATICAL(s32Temp2))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `s32Temp2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0065 — `s16_hip1_s16_u8_u8_u16_fac1`

### Direct repository evidence

- Source: `src_analysis/sources/hip_Ccode.c:52`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert s32Temp1 - s32Temp2 <= 2147483647;`
- Canonical signature: `src_analysis/sources/hip_Ccode.c|52|signed overflow. assert s32Temp1 - s32Temp2 <= 2147483647;`
- Source statement: `s32Temp2 = s32Temp1 - s32Temp2;`
- Input parameters: `yold:s16; u:u8; uold:u8; m:u16`
- Input domains: `yold=Frama_C_short_interval( -32768, 32767); u=Frama_C_unsigned_char_interval( 0, 255); uold=Frama_C_unsigned_char_interval( 0, 255); m=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c`
- High Precision log: `results/high_precision/s16_hip1_s16_u8_u8_u16_fac1/s16_hip1_s16_u8_u8_u16_fac1_eva.log`
- Control-flow context: `NONE_BEFORE_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row66; results/high_precision/s16_hip1_s16_u8_u8_u16_fac1/s16_hip1_s16_u8_u8_u16_fac1_eva.log; src_analysis/sources/hip_Ccode.c:52; harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c`

### Derived semantic mapping

- Containing function/call chain: `s16_hip1_s16_u8_u8_u16_fac1` / `s16_hip1_s16_u8_u8_u16_fac1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 - s32Temp2`
- Operation kind: `SIGNED_SUB`
- Safety predicate: `MATHEMATICAL(s32Temp1) - MATHEMATICAL(s32Temp2) <= INT32_MAX`
- Predicate normal form: `SIGNED_SUB_UPPER_BOUND(32,s32Temp1,s32Temp2)`
- Violation condition: `NOT(MATHEMATICAL(s32Temp1) - MATHEMATICAL(s32Temp2) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `s32Temp2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0066 — `s16_hip1_s16_u8_u8_u16_fac1`

### Direct repository evidence

- Source: `src_analysis/sources/hip_Ccode.c:53`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= s32Temp2;`
- Canonical signature: `src_analysis/sources/hip_Ccode.c|53|invalid LHS operand for left shift. assert 0 <= s32Temp2;`
- Source statement: `s32Temp2 = s32Temp2 << 1;`
- Input parameters: `yold:s16; u:u8; uold:u8; m:u16`
- Input domains: `yold=Frama_C_short_interval( -32768, 32767); u=Frama_C_unsigned_char_interval( 0, 255); uold=Frama_C_unsigned_char_interval( 0, 255); m=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c`
- High Precision log: `results/high_precision/s16_hip1_s16_u8_u8_u16_fac1/s16_hip1_s16_u8_u8_u16_fac1_eva.log`
- Control-flow context: `NONE_BEFORE_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row67; results/high_precision/s16_hip1_s16_u8_u8_u16_fac1/s16_hip1_s16_u8_u8_u16_fac1_eva.log; src_analysis/sources/hip_Ccode.c:53; harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c`

### Derived semantic mapping

- Containing function/call chain: `s16_hip1_s16_u8_u8_u16_fac1` / `s16_hip1_s16_u8_u8_u16_fac1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp2 << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `s32Temp2 >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,s32Temp2)`
- Violation condition: `NOT(s32Temp2 >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0067 — `s16_hip1_s16_u8_u8_u16_fac1`

### Direct repository evidence

- Source: `src_analysis/sources/hip_Ccode.c:53`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert s32Temp2 << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/hip_Ccode.c|53|signed overflow. assert s32Temp2 << 1 <= 2147483647;`
- Source statement: `s32Temp2 = s32Temp2 << 1;`
- Input parameters: `yold:s16; u:u8; uold:u8; m:u16`
- Input domains: `yold=Frama_C_short_interval( -32768, 32767); u=Frama_C_unsigned_char_interval( 0, 255); uold=Frama_C_unsigned_char_interval( 0, 255); m=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c`
- High Precision log: `results/high_precision/s16_hip1_s16_u8_u8_u16_fac1/s16_hip1_s16_u8_u8_u16_fac1_eva.log`
- Control-flow context: `NONE_BEFORE_OPERATION`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row68; results/high_precision/s16_hip1_s16_u8_u8_u16_fac1/s16_hip1_s16_u8_u8_u16_fac1_eva.log; src_analysis/sources/hip_Ccode.c:53; harnesses/P1/eva_main_s16_hip1_s16_u8_u8_u16_fac1.c`

### Derived semantic mapping

- Containing function/call chain: `s16_hip1_s16_u8_u8_u16_fac1` / `s16_hip1_s16_u8_u8_u16_fac1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp2 << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT(s32Temp2,1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,s32Temp2,1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT(s32Temp2,1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0068 — `s16_mul_s16_s16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:964`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert (s32)div != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|964|division by zero. assert (s32)div != 0;`
- Source statement: `s32Temp2 = (s32Temp1 - ((s32Temp1 / div) * div)) << 1;`
- Input parameters: `fak1:s16; fak2:s16; div:s16`
- Input domains: `fak1<-data1=Frama_C_short_interval(-32768, 32767); fak2<-data2=Frama_C_short_interval(-32768, 32767); div<-denominator=Frama_C_short_interval(-32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log`
- Control-flow context: `div != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row69; results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:964; harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_s16` / `s16_mul_s16_s16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 / div`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)div != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)div)`
- Violation condition: `NOT((s32)div != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; NOT_EXCLUDED_BY_RECORDED_DIRECT_GUARD`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `div`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0069 — `s16_mul_s16_s16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:964`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|964|invalid LHS operand for left shift. assert 0 <= (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div));`
- Source statement: `s32Temp2 = (s32Temp1 - ((s32Temp1 / div) * div)) << 1;`
- Input parameters: `fak1:s16; fak2:s16; div:s16`
- Input domains: `fak1<-data1=Frama_C_short_interval(-32768, 32767); fak2<-data2=Frama_C_short_interval(-32768, 32767); div<-denominator=Frama_C_short_interval(-32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log`
- Control-flow context: `div != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row70; results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:964; harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_s16` / `s16_mul_s16_s16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)) << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)))`
- Violation condition: `NOT((s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0070 — `s16_mul_s16_s16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:964`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)) << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|964|signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)) << 1 <= 2147483647;`
- Source statement: `s32Temp2 = (s32Temp1 - ((s32Temp1 / div) * div)) << 1;`
- Input parameters: `fak1:s16; fak2:s16; div:s16`
- Input domains: `fak1<-data1=Frama_C_short_interval(-32768, 32767); fak2<-data2=Frama_C_short_interval(-32768, 32767); div<-denominator=Frama_C_short_interval(-32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log`
- Control-flow context: `div != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row71; results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:964; harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_s16` / `s16_mul_s16_s16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)) << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT((s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)),1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)),1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT((s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div)),1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)div) * (s32)div))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0071 — `s16_mul_s16_s16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:964`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 / (s32)div) * (s32)div <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|964|signed overflow. assert (s32)(s32Temp1 / (s32)div) * (s32)div <= 2147483647;`
- Source statement: `s32Temp2 = (s32Temp1 - ((s32Temp1 / div) * div)) << 1;`
- Input parameters: `fak1:s16; fak2:s16; div:s16`
- Input domains: `fak1<-data1=Frama_C_short_interval(-32768, 32767); fak2<-data2=Frama_C_short_interval(-32768, 32767); div<-denominator=Frama_C_short_interval(-32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log`
- Control-flow context: `div != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row72; results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:964; harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_s16` / `s16_mul_s16_s16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)div) * (s32)div`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(s32Temp1 / (s32)div)) * MATHEMATICAL((s32)div) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(s32Temp1 / (s32)div),(s32)div)`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Temp1 / (s32)div)) * MATHEMATICAL((s32)div) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)div)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)div`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0072 — `s16_mul_s16_s16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:964`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= (s32)(s32Temp1 / (s32)div) * (s32)div;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|964|signed overflow. assert -2147483648 <= (s32)(s32Temp1 / (s32)div) * (s32)div;`
- Source statement: `s32Temp2 = (s32Temp1 - ((s32Temp1 / div) * div)) << 1;`
- Input parameters: `fak1:s16; fak2:s16; div:s16`
- Input domains: `fak1<-data1=Frama_C_short_interval(-32768, 32767); fak2<-data2=Frama_C_short_interval(-32768, 32767); div<-denominator=Frama_C_short_interval(-32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log`
- Control-flow context: `div != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row73; results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:964; harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_s16` / `s16_mul_s16_s16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)div) * (s32)div`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `INT32_MIN <= MATHEMATICAL((s32)(s32Temp1 / (s32)div)) * MATHEMATICAL((s32)div)`
- Predicate normal form: `SIGNED_MUL_LOWER_BOUND(32,(s32)(s32Temp1 / (s32)div),(s32)div)`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL((s32)(s32Temp1 / (s32)div)) * MATHEMATICAL((s32)div))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)div)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)div`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0073 — `s16_mul_s16_s16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:965`
- Category: `division by zero`
- Frozen occurrence: `2`
- Eva message: `division by zero. assert (s32)div != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|965|division by zero. assert (s32)div != 0;`
- Source statement: `s32Temp3 = (s32Temp2/div) + (s32Temp1/div);`
- Input parameters: `fak1:s16; fak2:s16; div:s16`
- Input domains: `fak1<-data1=Frama_C_short_interval(-32768, 32767); fak2<-data2=Frama_C_short_interval(-32768, 32767); div<-denominator=Frama_C_short_interval(-32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log`
- Control-flow context: `div != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row74; results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:965; harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_s16` / `s16_mul_s16_s16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 / div`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)div != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)div)`
- Violation condition: `NOT((s32)div != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; NOT_EXCLUDED_BY_RECORDED_DIRECT_GUARD`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `div`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `MEDIUM` / `MAPPED_WITH_SEMANTIC_NOTE`
- Notes: Frozen occurrence index >1 is preserved and resolves to the second matching division expression in source order; the same-divisor safety predicate remains unchanged. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0074 — `s16_mul_s16_s16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:965`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div) <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|965|signed overflow. assert (s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div) <= 2147483647;`
- Source statement: `s32Temp3 = (s32Temp2/div) + (s32Temp1/div);`
- Input parameters: `fak1:s16; fak2:s16; div:s16`
- Input domains: `fak1<-data1=Frama_C_short_interval(-32768, 32767); fak2<-data2=Frama_C_short_interval(-32768, 32767); div<-denominator=Frama_C_short_interval(-32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log`
- Control-flow context: `div != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row75; results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:965; harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_s16` / `s16_mul_s16_s16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL((s32)(s32Temp2 / (s32)div)) + MATHEMATICAL((s32)(s32Temp1 / (s32)div)) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,(s32)(s32Temp2 / (s32)div),(s32)(s32Temp1 / (s32)div))`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Temp2 / (s32)div)) + MATHEMATICAL((s32)(s32Temp1 / (s32)div)) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp2 / (s32)div)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(s32Temp1 / (s32)div)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0075 — `s16_mul_s16_s16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:965`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= (s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div);`
- Canonical signature: `src_analysis/sources/div_Ccode.c|965|signed overflow. assert -2147483648 <= (s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div);`
- Source statement: `s32Temp3 = (s32Temp2/div) + (s32Temp1/div);`
- Input parameters: `fak1:s16; fak2:s16; div:s16`
- Input domains: `fak1<-data1=Frama_C_short_interval(-32768, 32767); fak2<-data2=Frama_C_short_interval(-32768, 32767); div<-denominator=Frama_C_short_interval(-32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log`
- Control-flow context: `div != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row76; results/high_precision/s16_mul_s16_s16_div_s16/s16_mul_s16_s16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:965; harnesses/P1/eva_main_s16_mul_s16_s16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_s16` / `s16_mul_s16_s16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp2 / (s32)div) + (s32)(s32Temp1 / (s32)div)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `INT32_MIN <= MATHEMATICAL((s32)(s32Temp2 / (s32)div)) + MATHEMATICAL((s32)(s32Temp1 / (s32)div))`
- Predicate normal form: `SIGNED_ADD_LOWER_BOUND(32,(s32)(s32Temp2 / (s32)div),(s32)(s32Temp1 / (s32)div))`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL((s32)(s32Temp2 / (s32)div)) + MATHEMATICAL((s32)(s32Temp1 / (s32)div)))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp2 / (s32)div)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(s32Temp1 / (s32)div)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0076 — `s16_mul_s16_s16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1022`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1022|invalid LHS operand for left shift. assert 0 <= (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));`
- Source statement: `s32Temp1 = (s32Result - (s32Result/denominator)*denominator) << 1;`
- Input parameters: `data1:s16; data2:s16; denominator:u16`
- Input domains: `data1=Frama_C_short_interval( -32768, 32767); data2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_u16/s16_mul_s16_s16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row77; results/high_precision/s16_mul_s16_s16_div_u16/s16_mul_s16_s16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:1022; harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_u16` / `s16_mul_s16_s16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)))`
- Violation condition: `NOT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0077 — `s16_mul_s16_s16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1022`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1022|signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Source statement: `s32Temp1 = (s32Result - (s32Result/denominator)*denominator) << 1;`
- Input parameters: `data1:s16; data2:s16; denominator:u16`
- Input domains: `data1=Frama_C_short_interval( -32768, 32767); data2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_u16/s16_mul_s16_s16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row78; results/high_precision/s16_mul_s16_s16_div_u16/s16_mul_s16_s16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:1022; harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_u16` / `s16_mul_s16_s16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)),1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0078 — `s16_mul_s16_s16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1022`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1022|signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator <= 2147483647;`
- Source statement: `s32Temp1 = (s32Result - (s32Result/denominator)*denominator) << 1;`
- Input parameters: `data1:s16; data2:s16; denominator:u16`
- Input domains: `data1=Frama_C_short_interval( -32768, 32767); data2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_u16/s16_mul_s16_s16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row79; results/high_precision/s16_mul_s16_s16_div_u16/s16_mul_s16_s16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:1022; harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_u16` / `s16_mul_s16_s16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(s32Result / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `u16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0079 — `s16_mul_s16_s16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1022`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= (s32)(s32Result / (s32)denominator) * (s32)denominator;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1022|signed overflow. assert -2147483648 <= (s32)(s32Result / (s32)denominator) * (s32)denominator;`
- Source statement: `s32Temp1 = (s32Result - (s32Result/denominator)*denominator) << 1;`
- Input parameters: `data1:s16; data2:s16; denominator:u16`
- Input domains: `data1=Frama_C_short_interval( -32768, 32767); data2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_u16/s16_mul_s16_s16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row80; results/high_precision/s16_mul_s16_s16_div_u16/s16_mul_s16_s16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:1022; harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_u16` / `s16_mul_s16_s16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `INT32_MIN <= MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator)`
- Predicate normal form: `SIGNED_MUL_LOWER_BOUND(32,(s32)(s32Result / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `u16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0080 — `s16_mul_s16_s16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1023`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1023|signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;`
- Source statement: `s32Result = (s32Temp1/denominator) + (s32Result/denominator);`
- Input parameters: `data1:s16; data2:s16; denominator:u16`
- Input domains: `data1=Frama_C_short_interval( -32768, 32767); data2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c`
- High Precision log: `results/high_precision/s16_mul_s16_s16_div_u16/s16_mul_s16_s16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row81; results/high_precision/s16_mul_s16_s16_div_u16/s16_mul_s16_s16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:1023; harnesses/P1/eva_main_s16_mul_s16_s16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_s16_div_u16` / `s16_mul_s16_s16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator)) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,(s32)(s32Temp1 / (s32)denominator),(s32)(s32Result / (s32)denominator))`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator)) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0081 — `s16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:628`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert (s32)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|628|division by zero. assert (s32)denominator != 0;`
- Source statement: `s32Temp1 = s32Result -((s32Result/denominator)*denominator);`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row82; results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:628; harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_u16_div_s16` / `s16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Result / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)denominator)`
- Violation condition: `NOT((s32)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; NOT_EXCLUDED_BY_RECORDED_DIRECT_GUARD`
- Operand 1: `s32Result`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0082 — `s16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:628`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|628|signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator <= 2147483647;`
- Source statement: `s32Temp1 = s32Result -((s32Result/denominator)*denominator);`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row83; results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:628; harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_u16_div_s16` / `s16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(s32Result / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0083 — `s16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:628`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= (s32)(s32Result / (s32)denominator) * (s32)denominator;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|628|signed overflow. assert -2147483648 <= (s32)(s32Result / (s32)denominator) * (s32)denominator;`
- Source statement: `s32Temp1 = s32Result -((s32Result/denominator)*denominator);`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row84; results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:628; harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_u16_div_s16` / `s16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `INT32_MIN <= MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator)`
- Predicate normal form: `SIGNED_MUL_LOWER_BOUND(32,(s32)(s32Result / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0084 — `s16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:629`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= s32Temp1;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|629|invalid LHS operand for left shift. assert 0 <= s32Temp1;`
- Source statement: `s32Temp1 = s32Temp1 << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row85; results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:629; harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_u16_div_s16` / `s16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `s32Temp1 >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,s32Temp1)`
- Violation condition: `NOT(s32Temp1 >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0085 — `s16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:629`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert s32Temp1 << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|629|signed overflow. assert s32Temp1 << 1 <= 2147483647;`
- Source statement: `s32Temp1 = s32Temp1 << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row86; results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:629; harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_u16_div_s16` / `s16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Temp1 << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT(s32Temp1,1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,s32Temp1,1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT(s32Temp1,1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Temp1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0086 — `s16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:630`
- Category: `division by zero`
- Frozen occurrence: `2`
- Eva message: `division by zero. assert (s32)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|630|division by zero. assert (s32)denominator != 0;`
- Source statement: `s32Result = (s32Temp1/denominator) + (s32Result/denominator);`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row87; results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:630; harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_u16_div_s16` / `s16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Result / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)denominator)`
- Violation condition: `NOT((s32)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; NOT_EXCLUDED_BY_RECORDED_DIRECT_GUARD`
- Operand 1: `s32Result`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `MEDIUM` / `MAPPED_WITH_SEMANTIC_NOTE`
- Notes: Frozen occurrence index >1 is preserved and resolves to the second matching division expression in source order; the same-divisor safety predicate remains unchanged. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0087 — `s16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:630`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|630|signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;`
- Source statement: `s32Result = (s32Temp1/denominator) + (s32Result/denominator);`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row88; results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:630; harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_u16_div_s16` / `s16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator)) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,(s32)(s32Temp1 / (s32)denominator),(s32)(s32Result / (s32)denominator))`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator)) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0088 — `s16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:630`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator);`
- Canonical signature: `src_analysis/sources/div_Ccode.c|630|signed overflow. assert -2147483648 <= (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator);`
- Source statement: `s32Result = (s32Temp1/denominator) + (s32Result/denominator);`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row89; results/high_precision/s16_mul_s16_u16_div_s16/s16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:630; harnesses/P1/eva_main_s16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_s16_u16_div_s16` / `s16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `INT32_MIN <= MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator))`
- Predicate normal form: `SIGNED_ADD_LOWER_BOUND(32,(s32)(s32Temp1 / (s32)denominator),(s32)(s32Result / (s32)denominator))`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator)))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0089 — `s16_mul_u16_s16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:684`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|684|invalid LHS operand for left shift. assert 0 <= (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));`
- Source statement: `s32Temp1 = s32Result - ((s32Result/denominator) * denominator) << 1;`
- Input parameters: `factor1:u16; factor2:s16; denominator:u16`
- Input domains: `factor1=Frama_C_unsigned_short_interval( 0, 65535); factor2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`
- High Precision log: `results/high_precision/s16_mul_u16_s16_div_u16/s16_mul_u16_s16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row90; results/high_precision/s16_mul_u16_s16_div_u16/s16_mul_u16_s16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:684; harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_u16_s16_div_u16` / `s16_mul_u16_s16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)))`
- Violation condition: `NOT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0090 — `s16_mul_u16_s16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:684`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|684|signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Source statement: `s32Temp1 = s32Result - ((s32Result/denominator) * denominator) << 1;`
- Input parameters: `factor1:u16; factor2:s16; denominator:u16`
- Input domains: `factor1=Frama_C_unsigned_short_interval( 0, 65535); factor2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`
- High Precision log: `results/high_precision/s16_mul_u16_s16_div_u16/s16_mul_u16_s16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row91; results/high_precision/s16_mul_u16_s16_div_u16/s16_mul_u16_s16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:684; harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_u16_s16_div_u16` / `s16_mul_u16_s16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)),1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0091 — `s16_mul_u16_s16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:684`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|684|signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator <= 2147483647;`
- Source statement: `s32Temp1 = s32Result - ((s32Result/denominator) * denominator) << 1;`
- Input parameters: `factor1:u16; factor2:s16; denominator:u16`
- Input domains: `factor1=Frama_C_unsigned_short_interval( 0, 65535); factor2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`
- High Precision log: `results/high_precision/s16_mul_u16_s16_div_u16/s16_mul_u16_s16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row92; results/high_precision/s16_mul_u16_s16_div_u16/s16_mul_u16_s16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:684; harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_u16_s16_div_u16` / `s16_mul_u16_s16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(s32Result / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `u16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0092 — `s16_mul_u16_s16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:684`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= (s32)(s32Result / (s32)denominator) * (s32)denominator;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|684|signed overflow. assert -2147483648 <= (s32)(s32Result / (s32)denominator) * (s32)denominator;`
- Source statement: `s32Temp1 = s32Result - ((s32Result/denominator) * denominator) << 1;`
- Input parameters: `factor1:u16; factor2:s16; denominator:u16`
- Input domains: `factor1=Frama_C_unsigned_short_interval( 0, 65535); factor2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`
- High Precision log: `results/high_precision/s16_mul_u16_s16_div_u16/s16_mul_u16_s16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row93; results/high_precision/s16_mul_u16_s16_div_u16/s16_mul_u16_s16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:684; harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_u16_s16_div_u16` / `s16_mul_u16_s16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `INT32_MIN <= MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator)`
- Predicate normal form: `SIGNED_MUL_LOWER_BOUND(32,(s32)(s32Result / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `u16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0093 — `s16_mul_u16_s16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:684`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);`
- Canonical signature: `src_analysis/sources/div_Ccode.c|684|signed overflow. assert -2147483648 <= s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);`
- Source statement: `s32Temp1 = s32Result - ((s32Result/denominator) * denominator) << 1;`
- Input parameters: `factor1:u16; factor2:s16; denominator:u16`
- Input domains: `factor1=Frama_C_unsigned_short_interval( 0, 65535); factor2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`
- High Precision log: `results/high_precision/s16_mul_u16_s16_div_u16/s16_mul_u16_s16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row94; results/high_precision/s16_mul_u16_s16_div_u16/s16_mul_u16_s16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:684; harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_u16_s16_div_u16` / `s16_mul_u16_s16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)`
- Operation kind: `SIGNED_SUB`
- Safety predicate: `INT32_MIN <= MATHEMATICAL(s32Result) - MATHEMATICAL((s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`
- Predicate normal form: `SIGNED_SUB_LOWER_BOUND(32,s32Result,(s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL(s32Result) - MATHEMATICAL((s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Result`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0094 — `s16_mul_u16_s16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:685`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|685|signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;`
- Source statement: `s32Result = (s32Temp1/denominator) + (s32Result/denominator);`
- Input parameters: `factor1:u16; factor2:s16; denominator:u16`
- Input domains: `factor1=Frama_C_unsigned_short_interval( 0, 65535); factor2=Frama_C_short_interval( -32768, 32767); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`
- High Precision log: `results/high_precision/s16_mul_u16_s16_div_u16/s16_mul_u16_s16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row95; results/high_precision/s16_mul_u16_s16_div_u16/s16_mul_u16_s16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:685; harnesses/P1/eva_main_s16_mul_u16_s16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s16_mul_u16_s16_div_u16` / `s16_mul_u16_s16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator)) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,(s32)(s32Temp1 / (s32)denominator),(s32)(s32Result / (s32)denominator))`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator)) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0095 — `s32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1394`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -numerator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1394|signed overflow. assert -numerator <= 2147483647;`
- Source statement: `u32numerator = -numerator;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P0/eva_main_s32_div_s32_s32.c`
- High Precision log: `results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log`
- Control-flow context: `numerator < 0; denominator < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row96; results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1394; harnesses/P0/eva_main_s32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_div_s32_s32` / `s32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-numerator`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `numerator != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,numerator)`
- Violation condition: `NOT(numerator != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `numerator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0096 — `s32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1395`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1395|signed overflow. assert -denominator <= 2147483647;`
- Source statement: `u32denominator = -denominator;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P0/eva_main_s32_div_s32_s32.c`
- High Precision log: `results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log`
- Control-flow context: `numerator < 0; denominator < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row97; results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1395; harnesses/P0/eva_main_s32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_div_s32_s32` / `s32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-denominator`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `denominator != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,denominator)`
- Violation condition: `NOT(denominator != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `denominator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0097 — `s32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1410`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(~numerator) + 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1410|signed overflow. assert (s32)(~numerator) + 1 <= 2147483647;`
- Source statement: `u32numerator = ~numerator+1;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P0/eva_main_s32_div_s32_s32.c`
- High Precision log: `results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log`
- Control-flow context: `numerator < 0; denominator > 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row98; results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1410; harnesses/P0/eva_main_s32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_div_s32_s32` / `s32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(~numerator) + 1`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL((s32)(~numerator)) + MATHEMATICAL(1) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,(s32)(~numerator),1)`
- Violation condition: `NOT(MATHEMATICAL((s32)(~numerator)) + MATHEMATICAL(1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(~numerator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0098 — `s32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1413`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(~s32Temp2) + 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1413|signed overflow. assert (s32)(~s32Temp2) + 1 <= 2147483647;`
- Source statement: `return (~s32Temp2 + 1);`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P0/eva_main_s32_div_s32_s32.c`
- High Precision log: `results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log`
- Control-flow context: `numerator < 0; denominator > 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row99; results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1413; harnesses/P0/eva_main_s32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_div_s32_s32` / `s32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(~s32Temp2) + 1`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL((s32)(~s32Temp2)) + MATHEMATICAL(1) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,(s32)(~s32Temp2),1)`
- Violation condition: `NOT(MATHEMATICAL((s32)(~s32Temp2)) + MATHEMATICAL(1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(~s32Temp2)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0099 — `s32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1426`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(~denominator) + 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1426|signed overflow. assert (s32)(~denominator) + 1 <= 2147483647;`
- Source statement: `u32denominator = ~denominator + 1;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P0/eva_main_s32_div_s32_s32.c`
- High Precision log: `results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log`
- Control-flow context: `numerator >= 0; denominator < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row100; results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1426; harnesses/P0/eva_main_s32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_div_s32_s32` / `s32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(~denominator) + 1`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL((s32)(~denominator)) + MATHEMATICAL(1) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,(s32)(~denominator),1)`
- Violation condition: `NOT(MATHEMATICAL((s32)(~denominator)) + MATHEMATICAL(1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(~denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0100 — `s32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1429`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(~s32Temp2) + 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1429|signed overflow. assert (s32)(~s32Temp2) + 1 <= 2147483647;`
- Source statement: `return (~s32Temp2 + 1);`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P0/eva_main_s32_div_s32_s32.c`
- High Precision log: `results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log`
- Control-flow context: `numerator >= 0; denominator < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row101; results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1429; harnesses/P0/eva_main_s32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_div_s32_s32` / `s32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(~s32Temp2) + 1`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL((s32)(~s32Temp2)) + MATHEMATICAL(1) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,(s32)(~s32Temp2),1)`
- Violation condition: `NOT(MATHEMATICAL((s32)(~s32Temp2)) + MATHEMATICAL(1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(~s32Temp2)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0101 — `s32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1434`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1434|invalid LHS operand for left shift. assert 0 <= (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator));`
- Source statement: `u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P0/eva_main_s32_div_s32_s32.c`
- High Precision log: `results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log`
- Control-flow context: `numerator >= 0; denominator > 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row102; results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1434; harnesses/P0/eva_main_s32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_div_s32_s32` / `s32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)))`
- Violation condition: `NOT((s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0102 — `s32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1434`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1434|signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 <= 2147483647;`
- Source statement: `u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P0/eva_main_s32_div_s32_s32.c`
- High Precision log: `results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log`
- Control-flow context: `numerator >= 0; denominator > 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row103; results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1434; harnesses/P0/eva_main_s32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_div_s32_s32` / `s32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT((s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)),1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)),1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT((s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)),1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0103 — `s32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1434`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(numerator / denominator) * denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1434|signed overflow. assert (s32)(numerator / denominator) * denominator <= 2147483647;`
- Source statement: `u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P0/eva_main_s32_div_s32_s32.c`
- High Precision log: `results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log`
- Control-flow context: `numerator >= 0; denominator > 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row104; results/high_precision/s32_div_s32_s32/s32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1434; harnesses/P0/eva_main_s32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_div_s32_s32` / `s32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(numerator / denominator) * denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(numerator / denominator)) * MATHEMATICAL(denominator) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(numerator / denominator),denominator)`
- Violation condition: `NOT(MATHEMATICAL((s32)(numerator / denominator)) * MATHEMATICAL(denominator) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(numerator / denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0104 — `s32_div_s32_u32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1330`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -numerator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1330|signed overflow. assert -numerator <= 2147483647;`
- Source statement: `u32Temp1 = -numerator;`
- Input parameters: `numerator:s32; denominator:u32`
- Input domains: `numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); denominator=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL)`
- Eva harness: `harnesses/P0/eva_main_s32_div_s32_u32.c`
- High Precision log: `results/high_precision/s32_div_s32_u32/s32_div_s32_u32_eva.log`
- Control-flow context: `denominator != 0; numerator <= 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row105; results/high_precision/s32_div_s32_u32/s32_div_s32_u32_eva.log; src_analysis/sources/div_Ccode.c:1330; harnesses/P0/eva_main_s32_div_s32_u32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_div_s32_u32` / `s32_div_s32_u32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-numerator`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `numerator != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,numerator)`
- Violation condition: `NOT(numerator != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `numerator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0105 — `s32_div_u32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1267`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1267|signed overflow. assert -denominator <= 2147483647;`
- Source statement: `denominator = -denominator;`
- Input parameters: `numerator:u32; denominator:s32`
- Input domains: `numerator=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL); denominator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P0/eva_main_s32_div_u32_s32.c`
- High Precision log: `results/high_precision/s32_div_u32_s32/s32_div_u32_s32_eva.log`
- Control-flow context: `denominator < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row106; results/high_precision/s32_div_u32_s32/s32_div_u32_s32_eva.log; src_analysis/sources/div_Ccode.c:1267; harnesses/P0/eva_main_s32_div_u32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_div_u32_s32` / `s32_div_u32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-denominator`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `denominator != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,denominator)`
- Violation condition: `NOT(denominator != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `denominator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0106 — `s32_mul_s32_s16_fac2`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:1993`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -val1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|1993|signed overflow. assert -val1 <= 2147483647;`
- Source statement: `u32Temp1 = -val1;`
- Input parameters: `val1:s32; val2:s16`
- Input domains: `val1=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); val2=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_s32_mul_s32_s16_fac2.c`
- High Precision log: `results/high_precision/s32_mul_s32_s16_fac2/s32_mul_s32_s16_fac2_eva.log`
- Control-flow context: `val1 < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row107; results/high_precision/s32_mul_s32_s16_fac2/s32_mul_s32_s16_fac2_eva.log; src_analysis/sources/mul_Ccode.c:1993; harnesses/P1/eva_main_s32_mul_s32_s16_fac2.c`

### Derived semantic mapping

- Containing function/call chain: `s32_mul_s32_s16_fac2` / `s32_mul_s32_s16_fac2`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-val1`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `val1 != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,val1)`
- Violation condition: `NOT(val1 != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `val1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0107 — `s32_mul_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/MulHword.c:47`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;`
- Canonical signature: `src_analysis/sources/MulHword.c|47|signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;`
- Source statement: `MulTemp1 = arg1_LW * arg2_LW;`
- Input parameters: `val1:s32; val2:s32`
- Input domains: `val1=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); val2=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_s32_mul_s32_s32.c`
- High Precision log: `results/high_precision/s32_mul_s32_s32/s32_mul_s32_s32_eva.log`
- Control-flow context: `NO_DIRECT_GUARD_IN_HELPER; caller magnitude/sign preparation precedes call`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row108; results/high_precision/s32_mul_s32_s32/s32_mul_s32_s32_eva.log; src_analysis/sources/MulHword.c:47; harnesses/P1/eva_main_s32_mul_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `MulHighWord` / `s32_mul_s32_s32 -> MulHighWord`
- Helper argument mapping: `MulHighWord.arg1 <- u32Temp1; MulHighWord.arg2 <- u32Temp2`
- Source operation: `(int)arg1_LW * (int)arg2_LW`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(int)arg1_LW,(int)arg2_LW)`
- Violation condition: `NOT(MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(int)arg1_LW`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `(int)arg2_LW`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION_IN_HELPER_WITH_CALLER_CONTEXT`
- Confidence/status: `MEDIUM` / `MAPPED_WITH_SEMANTIC_NOTE`
- Notes: Helper source location is shared; the frozen caller function and harness remain part of target identity. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0108 — `s32_mul_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:2672`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -val1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|2672|signed overflow. assert -val1 <= 2147483647;`
- Source statement: `u32Temp1 = -val1;`
- Input parameters: `val1:s32; val2:s32`
- Input domains: `val1=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); val2=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_s32_mul_s32_s32.c`
- High Precision log: `results/high_precision/s32_mul_s32_s32/s32_mul_s32_s32_eva.log`
- Control-flow context: `val1 < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row109; results/high_precision/s32_mul_s32_s32/s32_mul_s32_s32_eva.log; src_analysis/sources/mul_Ccode.c:2672; harnesses/P1/eva_main_s32_mul_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_mul_s32_s32` / `s32_mul_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-val1`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `val1 != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,val1)`
- Violation condition: `NOT(val1 != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `val1`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0109 — `s32_mul_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:2681`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -val2 <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|2681|signed overflow. assert -val2 <= 2147483647;`
- Source statement: `u32Temp2 = -val2;`
- Input parameters: `val1:s32; val2:s32`
- Input domains: `val1=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); val2=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_s32_mul_s32_s32.c`
- High Precision log: `results/high_precision/s32_mul_s32_s32/s32_mul_s32_s32_eva.log`
- Control-flow context: `val2 < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row110; results/high_precision/s32_mul_s32_s32/s32_mul_s32_s32_eva.log; src_analysis/sources/mul_Ccode.c:2681; harnesses/P1/eva_main_s32_mul_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_mul_s32_s32` / `s32_mul_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-val2`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `val2 != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,val2)`
- Violation condition: `NOT(val2 != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `val2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0110 — `s32_mul_s32_s32_fac2`

### Direct repository evidence

- Source: `src_analysis/sources/MulHword.c:47`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;`
- Canonical signature: `src_analysis/sources/MulHword.c|47|signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;`
- Source statement: `MulTemp1 = arg1_LW * arg2_LW;`
- Input parameters: `value:s32; factor:s32`
- Input domains: `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_s32_mul_s32_s32_fac2.c`
- High Precision log: `results/high_precision/s32_mul_s32_s32_fac2/s32_mul_s32_s32_fac2_eva.log`
- Control-flow context: `NO_DIRECT_GUARD_IN_HELPER; caller magnitude/sign preparation precedes call`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row111; results/high_precision/s32_mul_s32_s32_fac2/s32_mul_s32_s32_fac2_eva.log; src_analysis/sources/MulHword.c:47; harnesses/P1/eva_main_s32_mul_s32_s32_fac2.c`

### Derived semantic mapping

- Containing function/call chain: `MulHighWord` / `s32_mul_s32_s32_fac2 -> MulHighWord`
- Helper argument mapping: `MulHighWord.arg1 <- u32Temp1; MulHighWord.arg2 <- u32Temp2`
- Source operation: `(int)arg1_LW * (int)arg2_LW`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(int)arg1_LW,(int)arg2_LW)`
- Violation condition: `NOT(MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(int)arg1_LW`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `(int)arg2_LW`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION_IN_HELPER_WITH_CALLER_CONTEXT`
- Confidence/status: `MEDIUM` / `MAPPED_WITH_SEMANTIC_NOTE`
- Notes: Helper source location is shared; the frozen caller function and harness remain part of target identity. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0111 — `s32_mul_s32_s32_fac2`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:2223`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -value <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|2223|signed overflow. assert -value <= 2147483647;`
- Source statement: `u32Temp1 = -value;`
- Input parameters: `value:s32; factor:s32`
- Input domains: `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_s32_mul_s32_s32_fac2.c`
- High Precision log: `results/high_precision/s32_mul_s32_s32_fac2/s32_mul_s32_s32_fac2_eva.log`
- Control-flow context: `value < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row112; results/high_precision/s32_mul_s32_s32_fac2/s32_mul_s32_s32_fac2_eva.log; src_analysis/sources/mul_Ccode.c:2223; harnesses/P1/eva_main_s32_mul_s32_s32_fac2.c`

### Derived semantic mapping

- Containing function/call chain: `s32_mul_s32_s32_fac2` / `s32_mul_s32_s32_fac2`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-value`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `value != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,value)`
- Violation condition: `NOT(value != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `value`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0112 — `s32_mul_s32_s32_fac2`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:2232`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -factor <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|2232|signed overflow. assert -factor <= 2147483647;`
- Source statement: `u32Temp2 = -factor;`
- Input parameters: `value:s32; factor:s32`
- Input domains: `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_s32_mul_s32_s32_fac2.c`
- High Precision log: `results/high_precision/s32_mul_s32_s32_fac2/s32_mul_s32_s32_fac2_eva.log`
- Control-flow context: `factor < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row113; results/high_precision/s32_mul_s32_s32_fac2/s32_mul_s32_s32_fac2_eva.log; src_analysis/sources/mul_Ccode.c:2232; harnesses/P1/eva_main_s32_mul_s32_s32_fac2.c`

### Derived semantic mapping

- Containing function/call chain: `s32_mul_s32_s32_fac2` / `s32_mul_s32_s32_fac2`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-factor`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `factor != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,factor)`
- Violation condition: `NOT(factor != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `factor`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0113 — `s32_mul_s32_s32_fac_twopow_u8`

### Direct repository evidence

- Source: `src_analysis/sources/MulHword.c:47`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;`
- Canonical signature: `src_analysis/sources/MulHword.c|47|signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;`
- Source statement: `MulTemp1 = arg1_LW * arg2_LW;`
- Input parameters: `value:s32; factor:s32; power:u8`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); power=Frama_C_unsigned_char_interval(0, 255)`
- Eva harness: `harnesses/P0/eva_main_s32_mul_s32_s32_fac_twopow_u8.c`
- High Precision log: `results/high_precision/s32_mul_s32_s32_fac_twopow_u8/s32_mul_s32_s32_fac_twopow_u8_eva.log`
- Control-flow context: `NO_DIRECT_GUARD_IN_HELPER; caller magnitude/sign preparation precedes call`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row114; results/high_precision/s32_mul_s32_s32_fac_twopow_u8/s32_mul_s32_s32_fac_twopow_u8_eva.log; src_analysis/sources/MulHword.c:47; harnesses/P0/eva_main_s32_mul_s32_s32_fac_twopow_u8.c`

### Derived semantic mapping

- Containing function/call chain: `MulHighWord` / `s32_mul_s32_s32_fac_twopow_u8 -> MulHighWord`
- Helper argument mapping: `MulHighWord.arg1 <- u32Temp1; MulHighWord.arg2 <- u32Temp2`
- Source operation: `(int)arg1_LW * (int)arg2_LW`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(int)arg1_LW,(int)arg2_LW)`
- Violation condition: `NOT(MATHEMATICAL((int)arg1_LW) * MATHEMATICAL((int)arg2_LW) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(int)arg1_LW`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Operand 2: `(int)arg2_LW`; declared `u16 (source object; explicit cast to int)`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed int (int, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION_IN_HELPER_WITH_CALLER_CONTEXT`
- Confidence/status: `MEDIUM` / `MAPPED_WITH_SEMANTIC_NOTE`
- Notes: Helper source location is shared; the frozen caller function and harness remain part of target identity. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0114 — `s32_mul_s32_s32_fac_twopow_u8`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:2454`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -value <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|2454|signed overflow. assert -value <= 2147483647;`
- Source statement: `u32Temp1 = -value;`
- Input parameters: `value:s32; factor:s32; power:u8`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); power=Frama_C_unsigned_char_interval(0, 255)`
- Eva harness: `harnesses/P0/eva_main_s32_mul_s32_s32_fac_twopow_u8.c`
- High Precision log: `results/high_precision/s32_mul_s32_s32_fac_twopow_u8/s32_mul_s32_s32_fac_twopow_u8_eva.log`
- Control-flow context: `value < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row115; results/high_precision/s32_mul_s32_s32_fac_twopow_u8/s32_mul_s32_s32_fac_twopow_u8_eva.log; src_analysis/sources/mul_Ccode.c:2454; harnesses/P0/eva_main_s32_mul_s32_s32_fac_twopow_u8.c`

### Derived semantic mapping

- Containing function/call chain: `s32_mul_s32_s32_fac_twopow_u8` / `s32_mul_s32_s32_fac_twopow_u8`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-value`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `value != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,value)`
- Violation condition: `NOT(value != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `value`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0115 — `s32_mul_s32_s32_fac_twopow_u8`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:2463`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -factor <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|2463|signed overflow. assert -factor <= 2147483647;`
- Source statement: `u32Temp2 = -factor;`
- Input parameters: `value:s32; factor:s32; power:u8`
- Input domains: `value=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); factor=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); power=Frama_C_unsigned_char_interval(0, 255)`
- Eva harness: `harnesses/P0/eva_main_s32_mul_s32_s32_fac_twopow_u8.c`
- High Precision log: `results/high_precision/s32_mul_s32_s32_fac_twopow_u8/s32_mul_s32_s32_fac_twopow_u8_eva.log`
- Control-flow context: `factor < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row116; results/high_precision/s32_mul_s32_s32_fac_twopow_u8/s32_mul_s32_s32_fac_twopow_u8_eva.log; src_analysis/sources/mul_Ccode.c:2463; harnesses/P0/eva_main_s32_mul_s32_s32_fac_twopow_u8.c`

### Derived semantic mapping

- Containing function/call chain: `s32_mul_s32_s32_fac_twopow_u8` / `s32_mul_s32_s32_fac_twopow_u8`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-factor`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `factor != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,factor)`
- Violation condition: `NOT(factor != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `factor`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0116 — `s32_mul_s32_s8_fac2`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:2600`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -value <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|2600|signed overflow. assert -value <= 2147483647;`
- Source statement: `u32Temp1 = -value;`
- Input parameters: `value:s32; factor:s8`
- Input domains: `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=(s8) Frama_C_int_interval( -128, 127)`
- Eva harness: `harnesses/P1/eva_main_s32_mul_s32_s8_fac2.c`
- High Precision log: `results/high_precision/s32_mul_s32_s8_fac2/s32_mul_s32_s8_fac2_eva.log`
- Control-flow context: `value < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row117; results/high_precision/s32_mul_s32_s8_fac2/s32_mul_s32_s8_fac2_eva.log; src_analysis/sources/mul_Ccode.c:2600; harnesses/P1/eva_main_s32_mul_s32_s8_fac2.c`

### Derived semantic mapping

- Containing function/call chain: `s32_mul_s32_s8_fac2` / `s32_mul_s32_s8_fac2`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-value`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `value != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,value)`
- Violation condition: `NOT(value != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `value`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0117 — `s32_mul_s32_u16`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:767`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= value * (s32)factor;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|767|signed overflow. assert -2147483648 <= value * (s32)factor;`
- Source statement: `return (value*factor);`
- Input parameters: `value:s32; factor:u16`
- Input domains: `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s32_mul_s32_u16.c`
- High Precision log: `results/high_precision/s32_mul_s32_u16/s32_mul_s32_u16_eva.log`
- Control-flow context: `factor != 0; value < 0; s32Temp2 / s32Factor < value`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row118; results/high_precision/s32_mul_s32_u16/s32_mul_s32_u16_eva.log; src_analysis/sources/mul_Ccode.c:767; harnesses/P1/eva_main_s32_mul_s32_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s32_mul_s32_u16` / `s32_mul_s32_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `value * (s32)factor`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `INT32_MIN <= MATHEMATICAL(value) * MATHEMATICAL((s32)factor)`
- Predicate normal form: `SIGNED_MUL_LOWER_BOUND(32,value,(s32)factor)`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL(value) * MATHEMATICAL((s32)factor))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `value`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)factor`; declared `u16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0118 — `s32_mul_s32_u16`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:778`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert value * (s32)factor <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|778|signed overflow. assert value * (s32)factor <= 2147483647;`
- Source statement: `return (value*factor);`
- Input parameters: `value:s32; factor:u16`
- Input domains: `value=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); factor=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_s32_mul_s32_u16.c`
- High Precision log: `results/high_precision/s32_mul_s32_u16/s32_mul_s32_u16_eva.log`
- Control-flow context: `factor != 0; value >= 0; 0x7FFFFFFFU / factor > value`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row119; results/high_precision/s32_mul_s32_u16/s32_mul_s32_u16_eva.log; src_analysis/sources/mul_Ccode.c:778; harnesses/P1/eva_main_s32_mul_s32_u16.c`

### Derived semantic mapping

- Containing function/call chain: `s32_mul_s32_u16` / `s32_mul_s32_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `value * (s32)factor`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL(value) * MATHEMATICAL((s32)factor) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,value,(s32)factor)`
- Violation condition: `NOT(MATHEMATICAL(value) * MATHEMATICAL((s32)factor) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `value`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)factor`; declared `u16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0119 — `s32_mul_u32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/mul_Ccode.c:1762`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -val2 <= 2147483647;`
- Canonical signature: `src_analysis/sources/mul_Ccode.c|1762|signed overflow. assert -val2 <= 2147483647;`
- Source statement: `s32Val2prime = -val2;`
- Input parameters: `val1:u32; val2:s32`
- Input domains: `val1=Frama_C_unsigned_long_interval(0UL, 0xFFFFFFFFUL); val2=Frama_C_long_interval(-2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P0/eva_main_s32_mul_u32_s32.c`
- High Precision log: `results/high_precision/s32_mul_u32_s32/s32_mul_u32_s32_eva.log`
- Control-flow context: `val2 < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row120; results/high_precision/s32_mul_u32_s32/s32_mul_u32_s32_eva.log; src_analysis/sources/mul_Ccode.c:1762; harnesses/P0/eva_main_s32_mul_u32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `s32_mul_u32_s32` / `s32_mul_u32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-val2`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `val2 != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,val2)`
- Violation condition: `NOT(val2 != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `val2`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0120 — `u16_div_s32_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:495`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|495|invalid LHS operand for left shift. assert 0 <= (s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value));`
- Source statement: `s32Temp1 = (x_value - ((x_value/y_value) * y_value)) << 1;`
- Input parameters: `x_value:s32; y_value:u16`
- Input domains: `x_value<-numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); y_value<-denominator=Frama_C_unsigned_short_interval(0, 65535)`
- Eva harness: `harnesses/P1/eva_main_u16_div_s32_u16.c`
- High Precision log: `results/high_precision/u16_div_s32_u16/u16_div_s32_u16_eva.log`
- Control-flow context: `(y_value & 0xFFFF) != 0 after y_value mask`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row121; results/high_precision/u16_div_s32_u16/u16_div_s32_u16_eva.log; src_analysis/sources/div_Ccode.c:495; harnesses/P1/eva_main_u16_div_s32_u16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_div_s32_u16` / `u16_div_s32_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)) << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)))`
- Violation condition: `NOT((s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0121 — `u16_div_s32_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:495`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)) << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|495|signed overflow. assert (s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)) << 1 <= 2147483647;`
- Source statement: `s32Temp1 = (x_value - ((x_value/y_value) * y_value)) << 1;`
- Input parameters: `x_value:s32; y_value:u16`
- Input domains: `x_value<-numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); y_value<-denominator=Frama_C_unsigned_short_interval(0, 65535)`
- Eva harness: `harnesses/P1/eva_main_u16_div_s32_u16.c`
- High Precision log: `results/high_precision/u16_div_s32_u16/u16_div_s32_u16_eva.log`
- Control-flow context: `(y_value & 0xFFFF) != 0 after y_value mask`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row122; results/high_precision/u16_div_s32_u16/u16_div_s32_u16_eva.log; src_analysis/sources/div_Ccode.c:495; harnesses/P1/eva_main_u16_div_s32_u16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_div_s32_u16` / `u16_div_s32_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)) << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT((s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)),1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,(s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)),1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT((s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value)),1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(x_value - (s32)((s32)(x_value / (s32)y_value) * (s32)y_value))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0122 — `u16_div_s32_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:495`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(x_value / (s32)y_value) * (s32)y_value <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|495|signed overflow. assert (s32)(x_value / (s32)y_value) * (s32)y_value <= 2147483647;`
- Source statement: `s32Temp1 = (x_value - ((x_value/y_value) * y_value)) << 1;`
- Input parameters: `x_value:s32; y_value:u16`
- Input domains: `x_value<-numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); y_value<-denominator=Frama_C_unsigned_short_interval(0, 65535)`
- Eva harness: `harnesses/P1/eva_main_u16_div_s32_u16.c`
- High Precision log: `results/high_precision/u16_div_s32_u16/u16_div_s32_u16_eva.log`
- Control-flow context: `(y_value & 0xFFFF) != 0 after y_value mask`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row123; results/high_precision/u16_div_s32_u16/u16_div_s32_u16_eva.log; src_analysis/sources/div_Ccode.c:495; harnesses/P1/eva_main_u16_div_s32_u16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_div_s32_u16` / `u16_div_s32_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(x_value / (s32)y_value) * (s32)y_value`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(x_value / (s32)y_value)) * MATHEMATICAL((s32)y_value) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(x_value / (s32)y_value),(s32)y_value)`
- Violation condition: `NOT(MATHEMATICAL((s32)(x_value / (s32)y_value)) * MATHEMATICAL((s32)y_value) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(x_value / (s32)y_value)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)y_value`; declared `u16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0123 — `u16_div_s32_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:495`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= (s32)(x_value / (s32)y_value) * (s32)y_value;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|495|signed overflow. assert -2147483648 <= (s32)(x_value / (s32)y_value) * (s32)y_value;`
- Source statement: `s32Temp1 = (x_value - ((x_value/y_value) * y_value)) << 1;`
- Input parameters: `x_value:s32; y_value:u16`
- Input domains: `x_value<-numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); y_value<-denominator=Frama_C_unsigned_short_interval(0, 65535)`
- Eva harness: `harnesses/P1/eva_main_u16_div_s32_u16.c`
- High Precision log: `results/high_precision/u16_div_s32_u16/u16_div_s32_u16_eva.log`
- Control-flow context: `(y_value & 0xFFFF) != 0 after y_value mask`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row124; results/high_precision/u16_div_s32_u16/u16_div_s32_u16_eva.log; src_analysis/sources/div_Ccode.c:495; harnesses/P1/eva_main_u16_div_s32_u16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_div_s32_u16` / `u16_div_s32_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(x_value / (s32)y_value) * (s32)y_value`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `INT32_MIN <= MATHEMATICAL((s32)(x_value / (s32)y_value)) * MATHEMATICAL((s32)y_value)`
- Predicate normal form: `SIGNED_MUL_LOWER_BOUND(32,(s32)(x_value / (s32)y_value),(s32)y_value)`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL((s32)(x_value / (s32)y_value)) * MATHEMATICAL((s32)y_value))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(x_value / (s32)y_value)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)y_value`; declared `u16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0124 — `u16_div_s32_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:496`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 / (s32)y_value) + (s32)(x_value / (s32)y_value) <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|496|signed overflow. assert (s32)(s32Temp1 / (s32)y_value) + (s32)(x_value / (s32)y_value) <= 2147483647;`
- Source statement: `s32Temp1 = (s32Temp1/y_value) + (x_value/y_value);`
- Input parameters: `x_value:s32; y_value:u16`
- Input domains: `x_value<-numerator=Frama_C_long_interval(-2147483647L - 1L, 2147483647L); y_value<-denominator=Frama_C_unsigned_short_interval(0, 65535)`
- Eva harness: `harnesses/P1/eva_main_u16_div_s32_u16.c`
- High Precision log: `results/high_precision/u16_div_s32_u16/u16_div_s32_u16_eva.log`
- Control-flow context: `(y_value & 0xFFFF) != 0 after y_value mask`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row125; results/high_precision/u16_div_s32_u16/u16_div_s32_u16_eva.log; src_analysis/sources/div_Ccode.c:496; harnesses/P1/eva_main_u16_div_s32_u16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_div_s32_u16` / `u16_div_s32_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)y_value) + (s32)(x_value / (s32)y_value)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL((s32)(s32Temp1 / (s32)y_value)) + MATHEMATICAL((s32)(x_value / (s32)y_value)) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,(s32)(s32Temp1 / (s32)y_value),(s32)(x_value / (s32)y_value))`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Temp1 / (s32)y_value)) + MATHEMATICAL((s32)(x_value / (s32)y_value)) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)y_value)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(x_value / (s32)y_value)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0125 — `u16_mmv_u16_u16_s16_fac1`

### Direct repository evidence

- Source: `src_analysis/sources/avrg_Ccode.c:249`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -s32mmv <= 2147483647;`
- Canonical signature: `src_analysis/sources/avrg_Ccode.c|249|signed overflow. assert -s32mmv <= 2147483647;`
- Source statement: `s32mmv = -s32mmv;`
- Input parameters: `mmv:u16; measure:u16; crlc:s16`
- Input domains: `mmv=Frama_C_unsigned_short_interval(0, 65535); measure=Frama_C_unsigned_short_interval(0, 65535); crlc=Frama_C_short_interval(-32768, 32767)`
- Eva harness: `harnesses/P0/eva_main_u16_mmv_u16_u16_s16_fac1.c`
- High Precision log: `results/high_precision/u16_mmv_u16_u16_s16_fac1/u16_mmv_u16_u16_s16_fac1_eva.log`
- Control-flow context: `s32mmv <= 0; s32mmv < 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row126; results/high_precision/u16_mmv_u16_u16_s16_fac1/u16_mmv_u16_u16_s16_fac1_eva.log; src_analysis/sources/avrg_Ccode.c:249; harnesses/P0/eva_main_u16_mmv_u16_u16_s16_fac1.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mmv_u16_u16_s16_fac1` / `u16_mmv_u16_u16_s16_fac1`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-s32mmv`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `s32mmv != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,s32mmv)`
- Violation condition: `NOT(s32mmv != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32mmv`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0126 — `u16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:740`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert (s32)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|740|division by zero. assert (s32)denominator != 0;`
- Source statement: `s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row127; results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:740; harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_s16` / `u16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Result / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)denominator)`
- Violation condition: `NOT((s32)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; NOT_EXCLUDED_BY_RECORDED_DIRECT_GUARD`
- Operand 1: `s32Result`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0127 — `u16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:740`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|740|invalid LHS operand for left shift. assert 0 <= (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));`
- Source statement: `s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row128; results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:740; harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_s16` / `u16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)))`
- Violation condition: `NOT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0128 — `u16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:740`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|740|signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Source statement: `s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row129; results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:740; harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_s16` / `u16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)),1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0129 — `u16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:740`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|740|signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator <= 2147483647;`
- Source statement: `s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row130; results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:740; harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_s16` / `u16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(s32Result / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0130 — `u16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:740`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= (s32)(s32Result / (s32)denominator) * (s32)denominator;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|740|signed overflow. assert -2147483648 <= (s32)(s32Result / (s32)denominator) * (s32)denominator;`
- Source statement: `s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row131; results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:740; harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_s16` / `u16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `INT32_MIN <= MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator)`
- Predicate normal form: `SIGNED_MUL_LOWER_BOUND(32,(s32)(s32Result / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `s16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0131 — `u16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:740`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);`
- Canonical signature: `src_analysis/sources/div_Ccode.c|740|signed overflow. assert -2147483648 <= s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);`
- Source statement: `s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row132; results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:740; harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_s16` / `u16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)`
- Operation kind: `SIGNED_SUB`
- Safety predicate: `INT32_MIN <= MATHEMATICAL(s32Result) - MATHEMATICAL((s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`
- Predicate normal form: `SIGNED_SUB_LOWER_BOUND(32,s32Result,(s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL(s32Result) - MATHEMATICAL((s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Result`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0132 — `u16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:741`
- Category: `division by zero`
- Frozen occurrence: `2`
- Eva message: `division by zero. assert (s32)denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|741|division by zero. assert (s32)denominator != 0;`
- Source statement: `s32Result = (s32Temp1/denominator) + (s32Result/denominator);`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row133; results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:741; harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_s16` / `u16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Result / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `(s32)denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,(s32)denominator)`
- Violation condition: `NOT((s32)denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; NOT_EXCLUDED_BY_RECORDED_DIRECT_GUARD`
- Operand 1: `s32Result`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s16`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `MEDIUM` / `MAPPED_WITH_SEMANTIC_NOTE`
- Notes: Frozen occurrence index >1 is preserved and resolves to the second matching division expression in source order; the same-divisor safety predicate remains unchanged. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0133 — `u16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:741`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|741|signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;`
- Source statement: `s32Result = (s32Temp1/denominator) + (s32Result/denominator);`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row134; results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:741; harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_s16` / `u16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator)) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,(s32)(s32Temp1 / (s32)denominator),(s32)(s32Result / (s32)denominator))`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator)) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0134 — `u16_mul_s16_u16_div_s16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:741`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator);`
- Canonical signature: `src_analysis/sources/div_Ccode.c|741|signed overflow. assert -2147483648 <= (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator);`
- Source statement: `s32Result = (s32Temp1/denominator) + (s32Result/denominator);`
- Input parameters: `factor1:s16; factor2:u16; denominator:s16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_short_interval( -32768, 32767)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row135; results/high_precision/u16_mul_s16_u16_div_s16/u16_mul_s16_u16_div_s16_eva.log; src_analysis/sources/div_Ccode.c:741; harnesses/P1/eva_main_u16_mul_s16_u16_div_s16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_s16` / `u16_mul_s16_u16_div_s16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `INT32_MIN <= MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator))`
- Predicate normal form: `SIGNED_ADD_LOWER_BOUND(32,(s32)(s32Temp1 / (s32)denominator),(s32)(s32Result / (s32)denominator))`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator)))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0135 — `u16_mul_s16_u16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:795`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|795|invalid LHS operand for left shift. assert 0 <= (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator));`
- Source statement: `s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:u16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_u16/u16_mul_s16_u16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row136; results/high_precision/u16_mul_s16_u16_div_u16/u16_mul_s16_u16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:795; harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_u16` / `u16_mul_s16_u16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)))`
- Violation condition: `NOT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0136 — `u16_mul_s16_u16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:795`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|795|signed overflow. assert (s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;`
- Source statement: `s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:u16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_u16/u16_mul_s16_u16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row137; results/high_precision/u16_mul_s16_u16_div_u16/u16_mul_s16_u16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:795; harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_u16` / `u16_mul_s16_u16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)) << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)),1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT((s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)),1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0137 — `u16_mul_s16_u16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:795`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|795|signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator <= 2147483647;`
- Source statement: `s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:u16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_u16/u16_mul_s16_u16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row138; results/high_precision/u16_mul_s16_u16_div_u16/u16_mul_s16_u16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:795; harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_u16` / `u16_mul_s16_u16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(s32Result / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `u16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0138 — `u16_mul_s16_u16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:795`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= (s32)(s32Result / (s32)denominator) * (s32)denominator;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|795|signed overflow. assert -2147483648 <= (s32)(s32Result / (s32)denominator) * (s32)denominator;`
- Source statement: `s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:u16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_u16/u16_mul_s16_u16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row139; results/high_precision/u16_mul_s16_u16_div_u16/u16_mul_s16_u16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:795; harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_u16` / `u16_mul_s16_u16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Result / (s32)denominator) * (s32)denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `INT32_MIN <= MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator)`
- Predicate normal form: `SIGNED_MUL_LOWER_BOUND(32,(s32)(s32Result / (s32)denominator),(s32)denominator)`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL((s32)(s32Result / (s32)denominator)) * MATHEMATICAL((s32)denominator))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)denominator`; declared `u16 (source object; explicit cast to s32)`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0139 — `u16_mul_s16_u16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:795`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -2147483648 <= s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);`
- Canonical signature: `src_analysis/sources/div_Ccode.c|795|signed overflow. assert -2147483648 <= s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);`
- Source statement: `s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;`
- Input parameters: `factor1:s16; factor2:u16; denominator:u16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_u16/u16_mul_s16_u16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row140; results/high_precision/u16_mul_s16_u16_div_u16/u16_mul_s16_u16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:795; harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_u16` / `u16_mul_s16_u16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)`
- Operation kind: `SIGNED_SUB`
- Safety predicate: `INT32_MIN <= MATHEMATICAL(s32Result) - MATHEMATICAL((s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`
- Predicate normal form: `SIGNED_SUB_LOWER_BOUND(32,s32Result,(s32)((s32)(s32Result / (s32)denominator) * (s32)denominator))`
- Violation condition: `NOT(INT32_MIN <= MATHEMATICAL(s32Result) - MATHEMATICAL((s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)))`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `s32Result`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)((s32)(s32Result / (s32)denominator) * (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0140 — `u16_mul_s16_u16_div_u16`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:796`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|796|signed overflow. assert (s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator) <= 2147483647;`
- Source statement: `s32Result = (s32Temp1/denominator) + (s32Result/denominator);`
- Input parameters: `factor1:s16; factor2:u16; denominator:u16`
- Input domains: `factor1=Frama_C_short_interval( -32768, 32767); factor2=Frama_C_unsigned_short_interval( 0, 65535); denominator=Frama_C_unsigned_short_interval( 0, 65535)`
- Eva harness: `harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`
- High Precision log: `results/high_precision/u16_mul_s16_u16_div_u16/u16_mul_s16_u16_div_u16_eva.log`
- Control-flow context: `denominator != 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row141; results/high_precision/u16_mul_s16_u16_div_u16/u16_mul_s16_u16_div_u16_eva.log; src_analysis/sources/div_Ccode.c:796; harnesses/P1/eva_main_u16_mul_s16_u16_div_u16.c`

### Derived semantic mapping

- Containing function/call chain: `u16_mul_s16_u16_div_u16` / `u16_mul_s16_u16_div_u16`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(s32Temp1 / (s32)denominator) + (s32)(s32Result / (s32)denominator)`
- Operation kind: `SIGNED_ADD`
- Safety predicate: `MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator)) <= INT32_MAX`
- Predicate normal form: `SIGNED_ADD_UPPER_BOUND(32,(s32)(s32Temp1 / (s32)denominator),(s32)(s32Result / (s32)denominator))`
- Violation condition: `NOT(MATHEMATICAL((s32)(s32Temp1 / (s32)denominator)) + MATHEMATICAL((s32)(s32Result / (s32)denominator)) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(s32Temp1 / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `(s32)(s32Result / (s32)denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0141 — `u32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1168`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1168|invalid LHS operand for left shift. assert 0 <= (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator));`
- Source statement: `u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_u32_div_s32_s32.c`
- High Precision log: `results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log`
- Control-flow context: `denominator != 0; numerator > 0; denominator > 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row142; results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1168; harnesses/P1/eva_main_u32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `u32_div_s32_s32` / `u32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)))`
- Violation condition: `NOT((s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0142 — `u32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1168`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1168|signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 <= 2147483647;`
- Source statement: `u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_u32_div_s32_s32.c`
- High Precision log: `results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log`
- Control-flow context: `denominator != 0; numerator > 0; denominator > 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row143; results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1168; harnesses/P1/eva_main_u32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `u32_div_s32_s32` / `u32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT((s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)),1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)),1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT((s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)),1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0143 — `u32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1168`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(numerator / denominator) * denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1168|signed overflow. assert (s32)(numerator / denominator) * denominator <= 2147483647;`
- Source statement: `u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_u32_div_s32_s32.c`
- High Precision log: `results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log`
- Control-flow context: `denominator != 0; numerator > 0; denominator > 0`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row144; results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1168; harnesses/P1/eva_main_u32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `u32_div_s32_s32` / `u32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(numerator / denominator) * denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(numerator / denominator)) * MATHEMATICAL(denominator) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(numerator / denominator),denominator)`
- Violation condition: `NOT(MATHEMATICAL((s32)(numerator / denominator)) * MATHEMATICAL(denominator) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(numerator / denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0144 — `u32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1182`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -numerator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1182|signed overflow. assert -numerator <= 2147483647;`
- Source statement: `numerator = -numerator;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_u32_div_s32_s32.c`
- High Precision log: `results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log`
- Control-flow context: `denominator != 0; numerator < 0; denominator <= 0 (therefore denominator < 0)`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row145; results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1182; harnesses/P1/eva_main_u32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `u32_div_s32_s32` / `u32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-numerator`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `numerator != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,numerator)`
- Violation condition: `NOT(numerator != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `numerator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0145 — `u32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1183`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert -denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1183|signed overflow. assert -denominator <= 2147483647;`
- Source statement: `denominator = -denominator;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_u32_div_s32_s32.c`
- High Precision log: `results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log`
- Control-flow context: `denominator != 0; numerator < 0; denominator <= 0 (therefore denominator < 0)`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row146; results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1183; harnesses/P1/eva_main_u32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `u32_div_s32_s32` / `u32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `-denominator`
- Operation kind: `SIGNED_NEG`
- Safety predicate: `denominator != INT32_MIN`
- Predicate normal form: `SIGNED_NEG_VALID(32,denominator)`
- Violation condition: `NOT(denominator != INT32_MIN)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `denominator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `NOT_APPLICABLE`; declared `NOT_APPLICABLE`; effective `NOT_APPLICABLE`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0146 — `u32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1184`
- Category: `division by zero`
- Frozen occurrence: `1`
- Eva message: `division by zero. assert denominator != 0;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1184|division by zero. assert denominator != 0;`
- Source statement: `u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_u32_div_s32_s32.c`
- High Precision log: `results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log`
- Control-flow context: `denominator != 0; numerator < 0; denominator <= 0 (therefore denominator < 0)`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row147; results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1184; harnesses/P1/eva_main_u32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `u32_div_s32_s32` / `u32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `numerator / denominator`
- Operation kind: `SIGNED_DIV`
- Safety predicate: `denominator != 0`
- Predicate normal form: `DIVISOR_NONZERO(32,denominator)`
- Violation condition: `NOT(denominator != 0)`
- Signed-division companion: `SEPARATE_MIN_DIV_MINUS_ONE_CASE; NOT_EXCLUDED_BY_RECORDED_DIRECT_GUARD`
- Operand 1: `numerator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0147 — `u32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1184`
- Category: `invalid shift`
- Frozen occurrence: `1`
- Eva message: `invalid LHS operand for left shift. assert 0 <= (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator));`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1184|invalid LHS operand for left shift. assert 0 <= (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator));`
- Source statement: `u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_u32_div_s32_s32.c`
- High Precision log: `results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log`
- Control-flow context: `denominator != 0; numerator < 0; denominator <= 0 (therefore denominator < 0)`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row148; results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1184; harnesses/P1/eva_main_u32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `u32_div_s32_s32` / `u32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1`
- Operation kind: `LEFT_SHIFT`
- Safety predicate: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) >= 0`
- Predicate normal form: `SIGNED_LEFT_SHIFT_LHS_NONNEGATIVE(32,(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)))`
- Violation condition: `NOT((s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) >= 0)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0148 — `u32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1184`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1184|signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 <= 2147483647;`
- Source statement: `u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_u32_div_s32_s32.c`
- High Precision log: `results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log`
- Control-flow context: `denominator != 0; numerator < 0; denominator <= 0 (therefore denominator < 0)`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row149; results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1184; harnesses/P1/eva_main_u32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `u32_div_s32_s32` / `u32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1`
- Operation kind: `SIGNED_LEFT_SHIFT`
- Safety predicate: `MATHEMATICAL_LEFT_SHIFT((s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)),1) <= INT32_MAX`
- Predicate normal form: `SIGNED_LEFT_SHIFT_RESULT_UPPER_BOUND(32,(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)),1)`
- Violation condition: `NOT(MATHEMATICAL_LEFT_SHIFT((s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)),1) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(numerator - (s32)((s32)(numerator / denominator) * denominator))`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `1`; declared `integer literal`; effective `signed int (int, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_SHIFT`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.

## KLEE-ALARM-0149 — `u32_div_s32_s32`

### Direct repository evidence

- Source: `src_analysis/sources/div_Ccode.c:1184`
- Category: `integer overflow`
- Frozen occurrence: `1`
- Eva message: `signed overflow. assert (s32)(numerator / denominator) * denominator <= 2147483647;`
- Canonical signature: `src_analysis/sources/div_Ccode.c|1184|signed overflow. assert (s32)(numerator / denominator) * denominator <= 2147483647;`
- Source statement: `u32Temp1 = (numerator - ((numerator/denominator) * denominator)) << 1;`
- Input parameters: `numerator:s32; denominator:s32`
- Input domains: `numerator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L); denominator=Frama_C_long_interval( -2147483647L - 1L, 2147483647L)`
- Eva harness: `harnesses/P1/eva_main_u32_div_s32_s32.c`
- High Precision log: `results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log`
- Control-flow context: `denominator != 0; numerator < 0; denominator <= 0 (therefore denominator < 0)`
- Evidence: `reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv:row150; results/high_precision/u32_div_s32_s32/u32_div_s32_s32_eva.log; src_analysis/sources/div_Ccode.c:1184; harnesses/P1/eva_main_u32_div_s32_s32.c`

### Derived semantic mapping

- Containing function/call chain: `u32_div_s32_s32` / `u32_div_s32_s32`
- Helper argument mapping: `NOT_APPLICABLE`
- Source operation: `(s32)(numerator / denominator) * denominator`
- Operation kind: `SIGNED_MUL`
- Safety predicate: `MATHEMATICAL((s32)(numerator / denominator)) * MATHEMATICAL(denominator) <= INT32_MAX`
- Predicate normal form: `SIGNED_MUL_UPPER_BOUND(32,(s32)(numerator / denominator),denominator)`
- Violation condition: `NOT(MATHEMATICAL((s32)(numerator / denominator)) * MATHEMATICAL(denominator) <= INT32_MAX)`
- Signed-division companion: `NOT_APPLICABLE`
- Operand 1: `(s32)(numerator / denominator)`; declared `NOT_APPLICABLE_COMPOSITE_EXPRESSION`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Operand 2: `denominator`; declared `s32`; effective `signed long (s32, 32-bit signed under ppc_32)`
- Result: `signed long (s32, 32-bit signed under ppc_32)`
- Semantic sensitivity: `SCALAR_WIDTH_SEMANTICS`; layout `NO`; endian `NO`; ABI `NO`
- Future check position: `BEFORE_OPERATION`
- Confidence/status: `HIGH` / `MAPPED`
- Notes: Direct source/message/type match. The operation is scalar; ppc_32 typedef widths/promotions must be preserved by a future adapter.
