# Scenarios

| Scenario | ID | Properties | Purpose |
|---|---|---:|---|
| control | S0 | 0 | Uninstrumented runtime/control |
| full | S1 | 149 | تمام assertionهای High-Precision |
| selective | S2 | 101 | فقط unresolved-after-KLEE/WP |

FULL و SELECTIVE از یک source revision، compiler، optimization و workload استفاده می‌کنند. تنها متغیر طراحی‌شده property selection است. هیچ property به‌خاطر overhead حذف نشده است.
