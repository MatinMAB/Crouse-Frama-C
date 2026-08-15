#!/usr/bin/env bash
set -uo pipefail

cd "$(dirname "$0")"

CLANG13="/home/matin/opt/clang13/bin/clang"
LLVM_DIS13="/home/matin/opt/clang13/bin/llvm-dis"
CLANG18="/usr/bin/clang-18"
LLVM_DIS18="/usr/bin/llvm-dis-18"
KLEE="/snap/bin/klee"
OUT="generated/compatibility_probe"

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

run_and_record clang18_bitcode \
    "$CLANG18" \
    -target x86_64-pc-linux-gnu \
    -O0 \
    -g \
    -emit-llvm \
    -c basic_replay.c \
    -o "$OUT/basic_replay_llvm18.bc"

run_and_record llvm18_disassemble_llvm18 \
    "$LLVM_DIS18" \
    "$OUT/basic_replay_llvm18.bc" \
    -o "$OUT/basic_replay_llvm18.ll"

run_and_record llvm13_disassemble_llvm18 \
    "$LLVM_DIS13" \
    "$OUT/basic_replay_llvm18.bc" \
    -o "$OUT/basic_replay_llvm18_by_llvm13.ll"

run_and_record klee_llvm18_bitcode \
    "$KLEE" \
    --output-dir="$OUT/klee-llvm18-bitcode" \
    --solver-backend=stp \
    --max-time=10s \
    --watchdog \
    "$OUT/basic_replay_llvm18.bc"

run_and_record clang13_i386_native_link \
    "$CLANG13" \
    -m32 \
    -O0 \
    target_probe.c \
    -o "$OUT/target_probe_i386_native"

run_and_record clang18_i386_native_link \
    "$CLANG18" \
    -m32 \
    -O0 \
    target_probe.c \
    -o "$OUT/target_probe_i386_native_llvm18"

run_and_record clang13_powerpc_object \
    "$CLANG13" \
    -target powerpc-unknown-linux-gnu \
    -O0 \
    -c target_probe.c \
    -o "$OUT/target_probe_powerpc.o"

run_and_record clang13_powerpc_native_link \
    "$CLANG13" \
    -target powerpc-unknown-linux-gnu \
    -O0 \
    target_probe.c \
    -o "$OUT/target_probe_powerpc_native"

run_and_record file_powerpc_object \
    file "$OUT/target_probe_powerpc.o"

run_and_record file_i386_bitcode \
    file generated/build/target_probe_i386.bc

run_and_record file_powerpc_bitcode \
    file generated/build/target_probe_powerpc.bc
