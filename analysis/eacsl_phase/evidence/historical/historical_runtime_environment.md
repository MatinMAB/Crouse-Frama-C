# Runtime Environment

- Workload: `THESIS_CONTROLLED_WORKLOAD`
- Runtime classification: `HOST_NATIVE_RUNTIME_WITH_PPC32_ANALYSIS_MODEL`
- Host: `Linux Matin-Ubuntu-24.04 7.0.0-28-generic #28~24.04.1-Ubuntu SMP PREEMPT_DYNAMIC Wed Jul  1 15:50:57 UTC 2 x86_64 x86_64 x86_64 GNU/Linux`
- Architecture: `x86_64`
- GCC: `gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0`
- Clang: `clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)`
- PPC compiler: not installed
- QEMU PPC: not installed
- Optimization: `-O2` for all headline executables
- CPU pinning: CPU 0 via `taskset`
- Seed: 20260821
- Iterations: 100000
- Warmups: 5 per scenario
- Measurements: 30 per scenario

The frozen property sets originate from PPC32 analysis, while executable E-ACSL translation used the matching x86_64 host model because E-ACSL refuses a 4-byte/8-byte pointer-size mismatch.
