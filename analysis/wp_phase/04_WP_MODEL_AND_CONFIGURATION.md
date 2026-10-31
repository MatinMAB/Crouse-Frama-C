# WP Model and Configuration

Configuration frozen از `command.txt` هر ۴۸ result بازیابی و programmatically بررسی شده است:

```text
Frama-C 33.0 (Arsenic)
-machdep ppc_32
-wp
-wp-fct <owner function>
-wp-prop <eva_klee_alarm_NNNN>
-wp-model Typed+int
-wp-prover alt-ergo,z3,cvc5
-wp-run-all-provers
-wp-par 1
-wp-timeout 120
-wp-memlimit 2000
-wp-cache rebuild
-wp-report-json ...
-wp-proof-trace
-wp-status
```

`-wp-rte` در هیچ command frozen وجود ندارد.

