#!/usr/bin/env bash
set -euo pipefail
cd /home/matin/frama-work/frama-eva-analysis
exec frama-c -machdep ppc_32 -cpp-extra-args=-Isrc_repaired/headers src_repaired/sources/hip_Ccode.c -wp -wp-fct s16_hip1_s16_u8_u8_u16_fac1 -wp-prop eva_klee_alarm_0066 -wp-model Typed+int -wp-prover alt-ergo\,z3\,cvc5 -wp-run-all-provers -wp-par 1 -wp-timeout 120 -wp-memlimit 2000 -wp-cache rebuild -wp-session /home/matin/frama-work/frama-eva-analysis/analysis/wp_phase/sessions/KLEE-ALARM-0066 -wp-out /home/matin/frama-work/frama-eva-analysis/analysis/wp_phase/results/KLEE-ALARM-0066/20260820-194527Z/wp-out -wp-report-json /home/matin/frama-work/frama-eva-analysis/analysis/wp_phase/results/KLEE-ALARM-0066/20260820-194527Z/wp-report.json -wp-proof-trace -wp-status
