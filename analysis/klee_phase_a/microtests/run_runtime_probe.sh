#!/usr/bin/env bash
set -uo pipefail

cd "$(dirname "$0")"

CLANG13="/home/matin/opt/clang13/bin/clang"
KLEE="/snap/bin/klee"
OUT="generated/runtime_probe"

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

run_and_record compile \
    "$CLANG13" \
    -target x86_64-pc-linux-gnu \
    -O0 \
    -g \
    -fno-discard-value-names \
    -Xclang -disable-O0-optnone \
    -emit-llvm \
    -c runtime_probe.c \
    -o "$OUT/runtime_probe.bc"

run_and_record klee_libc \
    "$KLEE" \
    --output-dir="$OUT/klee-libc" \
    --libc=klee \
    --solver-backend=stp \
    --max-time=10s \
    --watchdog \
    "$OUT/runtime_probe.bc"

run_and_record uclibc \
    "$KLEE" \
    --output-dir="$OUT/uclibc" \
    --libc=uclibc \
    --solver-backend=stp \
    --max-time=10s \
    --watchdog \
    "$OUT/runtime_probe.bc"

run_and_record uclibc_posix \
    "$KLEE" \
    --output-dir="$OUT/uclibc-posix" \
    --libc=uclibc \
    --posix-runtime \
    --solver-backend=stp \
    --max-time=10s \
    --watchdog \
    "$OUT/runtime_probe.bc"
