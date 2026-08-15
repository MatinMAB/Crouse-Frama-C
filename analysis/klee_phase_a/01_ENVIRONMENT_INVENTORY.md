# Environment Inventory

## Host platform

**DIRECT ENVIRONMENT EVIDENCE**

| Property | Observed value | Evidence |
|---|---|---|
| OS | Ubuntu 24.04.3 LTS (`noble`) | `raw/os_environment.txt` |
| Kernel | Linux `7.0.0-28-generic` | `raw/os_environment.txt` |
| Host architecture | `x86_64` | `raw/cpu_architecture.txt` |
| Host word size | 64 | `getconf LONG_BIT` |
| libc | glibc 2.39 | `raw/os_environment.txt` |
| CPU | Intel Core i9-14900HX; x86-64 | `raw/cpu_architecture.txt` |
| Native byte order | little endian | CPU and Clang macro evidence |
| Dpkg architecture | `amd64`; no foreign architecture configured | `raw/package_inventory.txt` |

## KLEE installation

**DIRECT ENVIRONMENT EVIDENCE**

| Property | Observed value |
|---|---|
| Invocation | `/snap/bin/klee` |
| Packaging | strict-confined Snap, revision 20 |
| Release | KLEE 3.2 |
| Build revision | `92ee8201a050184aacaaeef645ade491f5c93c41` |
| Build mode | `RelWithDebInfo`, assertions enabled |
| Linked LLVM | Ubuntu LLVM 13.0.1 |
| KLEE default target | `x86_64-pc-linux-gnu` |
| Host CPU reported by KLEE | `skylake` |
| Snap base | `core22` |
| Snap architecture | `amd64` |
| KLEE source tag | `v3.2` |
| KLEE-uClibc tag | `klee_uclibc_v1.4` |
| STP source tag | `2.3.4` |

The Snap build manifest records `ENABLE_POSIX_RUNTIME=ON`,
`ENABLE_TCMALLOC=ON`, `ENABLE_ZLIB=ON`, and
`KLEE_RUNTIME_BUILD_TYPE=Release+Debug`. It also records LLVM/Clang 13 build
packages and both STP and Z3-related dependencies. See
`raw/klee_build_metadata.txt`.

## Compiler and LLVM installations

| Toolchain | Path | Version | KLEE compatibility finding |
|---|---|---:|---|
| Clang 13 | `/home/matin/opt/clang13/bin/clang` | 13.0.0 | Compatible; all x86-64 microtests compiled and executed |
| LLVM 13 tools | `/home/matin/opt/clang13/bin/` | 13.0.0 | Compatible with emitted LLVM 13 bitcode |
| Clang 18 | `/usr/bin/clang-18` | 18.1.3 | Emits bitcode rejected by LLVM/KLEE 13 |
| LLVM 18 tools | `/usr/bin/*-18` | 18.1.3 | Available, but not a producer for this KLEE build |

The LLVM 13 installation includes `llvm-config`, `llvm-link`, `llvm-dis`,
`llvm-as`, `opt`, `lli`, `llc`, and `llvm-bcanalyzer`. The corresponding LLVM
18 tools also exist. Both builds include X86 and PowerPC backends, among many
others. Presence of an LLVM code-generation backend does not imply that the
installed KLEE executor can execute that target.

## KTest tooling

The generic `ktest-tool` name is not in `PATH`. The Snap application is
available as:

```text
/snap/bin/klee.ktest-tool
```

It decoded every x86-64 synthetic `.ktest` used in this study, including signed
and unsigned four-byte interpretations.

## Solvers

**DIRECT ENVIRONMENT EVIDENCE**

- KLEE's CLI advertises `stp`, `metasmt`, `dummy`, and `z3` backend choices.
- STP is not exposed as a standalone shell command, but the Snap contains
  `libstp.a` and STP 2.3.4 build metadata.
- STP was exercised successfully by the primary microtests. Logs state
  `Using STP solver backend` and `SAT solver: MiniSat`.
- `/usr/bin/z3` is version 4.8.12.
- A Z3-backed KLEE smoke test completed two paths and generated two tests.

Therefore STP and Z3 are not merely discoverable options; both were executed
successfully by this KLEE installation.

## KLEE runtime inventory

The Snap contains:

- Freestanding runtime archives;
- Intrinsic runtime archives;
- KLEE libc runtime archives;
- POSIX runtime archives;
- Fortify runtime archives;
- UBSan runtime archives;
- `klee-uclibc.bca`;
- 64-bit `libkleeRuntest.so.1.0` for native replay.

Every architecture-specific runtime filename has `64` in its name. No
`libkleeRuntime*32*.bca` was found. This absence was confirmed operationally:
KLEE selected a 32-bit Freestanding archive for i386 bitcode and failed because
the file did not exist.

## Package-manager state

**DIRECT ENVIRONMENT EVIDENCE**

- System LLVM/Clang 18 packages are installed.
- Z3 and `libz3-dev` are installed.
- `lib32gcc-s1` and `lib32stdc++6` are installed.
- `gcc-multilib`, `libc6-dev-i386`, libc++ development packages, and a system
  Clang 13 package are not installed.
- Clang/LLVM 13 nevertheless exists as a separate unpacked toolchain under
  `/home/matin/opt/clang13`.
- KLEE is a Snap rather than a dpkg package.

No package action was performed.

## Docker

The Docker 29.1.3 client, Buildx, and Compose plugins are installed. Both normal
and elevated read-only attempts to query the daemon returned permission denied
for `/var/run/docker.sock`. Local image inventory therefore remains unavailable.
No Dockerfile, Compose file, or devcontainer definition exists in this
repository. No image was pulled, built, run, or removed.

**Status:** `AVAILABLE_UNVERIFIED` for the daemon; client-side support is present.

## Frozen alarm dataset relevant to architecture

All 46 target signatures are scalar: no target signature contains a pointer or
array parameter. The 149 remaining alarms are distributed among:

| Source | Alarms |
|---|---:|
| `div_Ccode.c` | 102 |
| `mul_Ccode.c` | 29 |
| `hip_Ccode.c` | 10 |
| `MulHword.c` | 6 |
| `rotatefunc.c` | 1 |
| `avrg_Ccode.c` | 1 |

This does not prove layout independence for every internal operation, but it is
strong evidence that Phase B should focus first on scalar integer expressions,
guards, and helper-call relations rather than symbolic heap modeling.
