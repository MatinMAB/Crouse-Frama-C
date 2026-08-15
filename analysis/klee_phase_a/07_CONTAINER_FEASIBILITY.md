# Reproducible Container Feasibility

## Direct findings

- Docker client: 29.1.3.
- Buildx plugin: 0.30.1.
- Compose plugin: 5.0.0.
- Docker daemon access: permission denied, including a read-only elevated probe.
- Local Docker image list: not available because daemon access failed.
- Repository Dockerfile/Compose/devcontainer definitions: none.
- No image pull, build, run, or deletion was performed.

The current Docker status is therefore:

```text
AVAILABLE_UNVERIFIED
```

for the client, and:

```text
BLOCKED
```

for daemon-backed work in this user context.

## Why a container is attractive

**TECHNICAL INTERPRETATION**

A pinned environment would prevent ambient `clang` selection from drifting
between the installed LLVM 13 and LLVM 18 toolchains. It can also capture:

- KLEE 3.2 source/build revision;
- LLVM/Clang 13 versions;
- STP and Z3 versions;
- runtime build type;
- compile flags controlling optimization and sanitization;
- an explicit-width semantic adapter;
- scripts that validate emitted data layout and target triple;
- KTest extraction and controlled replay dependencies.

This is stronger thesis evidence than relying on a strict-confined Snap plus an
untracked local Clang tarball, even though that native pair passed the Phase-A
x86-64 probes.

## Container limitations

A container does not automatically solve the research semantics:

- official or prebuilt x86-64 images still use LP64;
- a container cannot make direct PowerPC KLEE execution valid when the executor
  rejects the target;
- a containerized 32-bit module still needs matching KLEE runtime bitcode;
- native replay target and host kernel architecture must be stated;
- Docker image tags alone are insufficient; a digest or reproducible build
  inputs should be recorded.

## Proposed future container acceptance tests

Before Phase C, a separately authorized setup should require all of the
following:

1. `klee --version` and `clang --version` show the pinned versions.
2. LLVM 13 reads every generated module; LLVM 18 is not accidentally used.
3. The explicit-width target probe records 8/16/32/64 scalar widths as intended.
4. Basic symbolic, div-zero, overshift, signed-overflow predicate, and UBSan
   microtests match this Phase-A characterization.
5. A generated KTest is decoded and replayed successfully.
6. The container build recipe and image identity are committed.
7. If i386 execution is pursued, the required 32-bit KLEE runtime archives are
   present and the i386 smoke test actually completes.

## Recommendation

Use a reproducible container for Phase C and later campaigns, but do not block
Phase B on Docker availability. Phase B can construct the alarm/predicate model
read-only. If Docker daemon access remains unavailable, a dedicated native
toolchain prefix with the same pinned versions is an acceptable fallback,
provided every binary path and checksum is recorded.
