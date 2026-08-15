#!/usr/bin/env bash
set -uo pipefail

cd "$(dirname "$0")"

CLANG13="/home/matin/opt/clang13/bin/clang"
LLVM_DIS13="/home/matin/opt/clang13/bin/llvm-dis"
KLEE="/snap/bin/klee"
KTEST_TOOL="/snap/bin/klee.ktest-tool"
OUT="generated/ubsan_and_solver_probe"

if [[ -e "$OUT" ]]; then
    echo "refusing to overwrite existing $OUT" >&2
    exit 2
fi

mkdir -p "$OUT"

run_and_record()
{
    local label="$1"
    shift
    printf '%q ' "$@" > "$OUT/${label}.command.txt"
    printf '\n' >> "$OUT/${label}.command.txt"
    "$@" > "$OUT/${label}.stdout.txt" 2> "$OUT/${label}.stderr.txt"
    printf '%s\n' "$?" > "$OUT/${label}.status.txt"
}

run_and_record compile_ubsan \
    "$CLANG13" \
    -target x86_64-pc-linux-gnu \
    -O0 \
    -g \
    -fno-discard-value-names \
    -Xclang -disable-O0-optnone \
    -fsanitize=signed-integer-overflow \
    -fno-sanitize-recover=signed-integer-overflow \
    -emit-llvm \
    -c signed_overflow_ubsan.c \
    -o "$OUT/signed_overflow_ubsan.bc"

run_and_record disassemble_ubsan \
    "$LLVM_DIS13" \
    "$OUT/signed_overflow_ubsan.bc" \
    -o "$OUT/signed_overflow_ubsan.ll"

run_and_record klee_ubsan \
    "$KLEE" \
    --output-dir="$OUT/klee-ubsan" \
    --solver-backend=stp \
    --ubsan-runtime \
    --max-time=10s \
    --watchdog \
    "$OUT/signed_overflow_ubsan.bc"

run_and_record klee_z3 \
    "$KLEE" \
    --output-dir="$OUT/klee-z3" \
    --solver-backend=z3 \
    --max-time=10s \
    --watchdog \
    generated/native_replay_probe/basic_replay.bc

for opt_level in O0 O2; do
    extra=()
    if [[ "$opt_level" == "O0" ]]; then
        extra=(-Xclang -disable-O0-optnone)
    fi

    run_and_record "compile_optimization_${opt_level}" \
        "$CLANG13" \
        -target x86_64-pc-linux-gnu \
        -"$opt_level" \
        -g \
        -fno-discard-value-names \
        "${extra[@]}" \
        -emit-llvm \
        -c optimization_ub_probe.c \
        -o "$OUT/optimization_${opt_level}.bc"

    run_and_record "disassemble_optimization_${opt_level}" \
        "$LLVM_DIS13" \
        "$OUT/optimization_${opt_level}.bc" \
        -o "$OUT/optimization_${opt_level}.ll"

    run_and_record "klee_optimization_${opt_level}" \
        "$KLEE" \
        --output-dir="$OUT/klee-optimization-${opt_level}" \
        --solver-backend=stp \
        --max-time=10s \
        --watchdog \
        "$OUT/optimization_${opt_level}.bc"
done

: > "$OUT/ktest_summary.txt"
while IFS= read -r testcase; do
    printf '=== %s ===\n' "$testcase" >> "$OUT/ktest_summary.txt"
    "$KTEST_TOOL" "$testcase" >> "$OUT/ktest_summary.txt" 2>&1
    printf '\n' >> "$OUT/ktest_summary.txt"
done < <(find "$OUT" -type f -name '*.ktest' | sort)
