# WP Alarm-to-Repair Traceability Validation

Status: **PASS WITH DOCUMENTED LIMITATIONS**

- Targets traced: **48/48**
- Code Repair: **35**
- Specification Completion: **13**
- Exact source before/after recovered from Git: **35/35 Code Repair targets**
- Shared-repair target references: **45**
- Unique resolution diffs: **13** (6 implementation repairs; 7 specification completions)
- Specification before/after recovered: **13/13**
- Witness KTest and target error retained: **48/48**
- Separate human-readable testcase files retained: **0/48**
- Property identity preserved: **48/48**
- WP VALID: **48/48**

## Evidence limitations

- `klee_testcase_path` is marked `NOT_AVAILABLE_IN_RETAINED_EVIDENCE` because no separate extracted testcase text files are retained; the `.ktest`, target-specific `.err`, and normalized concrete-input field are retained.
- For internal temporary values not represented as symbolic inputs, no value is reconstructed beyond the retained KLEE evidence.
- A commit-level hunk is shared by every target mapped to that resolution commit; `repair_id` and `other_alarms_affected_by_same_change` make this explicit.
- The eight `THESIS_POLICY_SELECTED` contracts are not described as developer-confirmed requirements.
- `KLEE-ALARM-0017` successful attribution is Z3 4.8.12 from selected JSON/log evidence; legacy matrix fields are not used as successful-prover evidence.
