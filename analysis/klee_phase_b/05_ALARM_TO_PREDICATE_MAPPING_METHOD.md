# Alarm-to-Predicate Mapping Method

## Direct repository evidence

For every frozen row, the generator retains the Eva function, canonical signature, occurrence index, exact normalized message, source file/line, source statement, caller harness metadata, and log reference. Helper locations retain the outer Eva function as identity.

## Derived semantic mapping

1. Parse the assertion text without changing identity.
2. Locate the exact source statement and containing function.
3. Classify the source operation, including lower/upper occurrences separately.
4. resolve declared object types from signatures/local declarations and apply ppc_32 promotions/conversions;
5. express the safety predicate in UB-free mathematical normal form;
6. record direct source guards separately from conservative input dependency;
7. classify semantic sensitivity and future check placement;
8. assign confidence/status and an explanation for every non-HIGH mapping.

No solver reasoning is performed. `TRANSITIVE_CONSERVATIVE` input dependencies mean the listed entry parameters bound the future experiment; they are not a proof that every parameter influences the target.
