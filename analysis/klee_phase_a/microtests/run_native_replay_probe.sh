#!/usr/bin/env bash
set -uo pipefail

cd "$(dirname "$0")"

CLANG13="/home/matin/opt/clang13/bin/clang"
KLEE="/snap/bin/klee"
KTEST_TOOL="/snap/bin/klee.ktest-tool"
SNAP_KLEE_LIB="/snap/klee/20/usr/local/lib"
OUT="generated/native_replay_probe"

if [[ -e "$OUT" ]]; then
    echo "refusing to overwrite existing $OUT" >&2
    exit 2
fi

mkdir -p "$OUT"

"$CLANG13" \
    -target x86_64-pc-linux-gnu \
    -O0 \
    -g \
    -fno-discard-value-names \
    -Xclang -disable-O0-optnone \
    -emit-llvm \
    -c basic_replay.c \
    -o "$OUT/basic_replay.bc" \
    > "$OUT/compile_bitcode.stdout.txt" \
    2> "$OUT/compile_bitcode.stderr.txt"
printf '%s\n' "$?" > "$OUT/compile_bitcode.status.txt"

"$KLEE" \
    --output-dir="$OUT/klee-out" \
    --solver-backend=stp \
    --max-time=10s \
    --watchdog \
    "$OUT/basic_replay.bc" \
    > "$OUT/klee.stdout.txt" \
    2> "$OUT/klee.stderr.txt"
printf '%s\n' "$?" > "$OUT/klee.status.txt"

"$CLANG13" \
    -O0 \
    -g \
    basic_replay.c \
    -L "$SNAP_KLEE_LIB" \
    -Wl,-rpath,"$SNAP_KLEE_LIB" \
    -lkleeRuntest \
    -o "$OUT/basic_replay_native" \
    > "$OUT/compile_native.stdout.txt" \
    2> "$OUT/compile_native.stderr.txt"
printf '%s\n' "$?" > "$OUT/compile_native.status.txt"

: > "$OUT/ktest_and_replay.txt"
while IFS= read -r testcase; do
    printf '=== %s ===\n' "$testcase" >> "$OUT/ktest_and_replay.txt"
    "$KTEST_TOOL" "$testcase" >> "$OUT/ktest_and_replay.txt" 2>&1
    LD_LIBRARY_PATH="$SNAP_KLEE_LIB${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
        KTEST_FILE="$testcase" \
        "$OUT/basic_replay_native" >> "$OUT/ktest_and_replay.txt" 2>&1
    printf 'native_exit_status=%s\n\n' "$?" >> "$OUT/ktest_and_replay.txt"
done < <(find "$OUT/klee-out" -maxdepth 1 -type f -name '*.ktest' | sort)
