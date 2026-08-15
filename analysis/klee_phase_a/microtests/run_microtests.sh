#!/usr/bin/env bash
set -uo pipefail

cd "$(dirname "$0")"

CLANG13="/home/matin/opt/clang13/bin/clang"
LLVM_DIS13="/home/matin/opt/clang13/bin/llvm-dis"
KLEE="/snap/bin/klee"
KTEST_TOOL="/snap/bin/klee.ktest-tool"
SNAP_KLEE_LIB="/snap/klee/20/usr/local/lib"
OUT="generated"

if [[ -e "$OUT" ]]; then
    echo "refusing to overwrite existing $OUT" >&2
    exit 2
fi

mkdir -p "$OUT/build" "$OUT/logs" "$OUT/klee"

run_logged()
{
    local label="$1"
    shift
    local stdout_file="$OUT/logs/${label}.stdout.txt"
    local stderr_file="$OUT/logs/${label}.stderr.txt"
    local status_file="$OUT/logs/${label}.status.txt"
    local command_file="$OUT/logs/${label}.command.txt"

    printf '%q ' "$@" > "$command_file"
    printf '\n' >> "$command_file"
    "$@" > "$stdout_file" 2> "$stderr_file"
    local status=$?
    printf '%s\n' "$status" > "$status_file"
    return "$status"
}

compile_bc()
{
    local label="$1"
    local target="$2"
    local source="$3"
    local bc="$OUT/build/${label}.bc"

    run_logged "compile_${label}" \
        "$CLANG13" \
        -target "$target" \
        -O0 \
        -g \
        -fno-discard-value-names \
        -Xclang -disable-O0-optnone \
        -emit-llvm \
        -c "$source" \
        -o "$bc"
    local compile_status=$?

    if [[ "$compile_status" -eq 0 ]]; then
        run_logged "disassemble_${label}" \
            "$LLVM_DIS13" "$bc" -o "$OUT/build/${label}.ll"
    fi

    return "$compile_status"
}

run_klee()
{
    local label="$1"
    local bc="$2"
    local output_dir="$OUT/klee/$label"

    run_logged "klee_${label}" \
        "$KLEE" \
        --output-dir="$output_dir" \
        --solver-backend=stp \
        --max-time=10s \
        --watchdog \
        "$bc"

    local status=$?
    local ktest_summary="$OUT/logs/ktest_${label}.txt"
    : > "$ktest_summary"
    while IFS= read -r testcase; do
        printf '=== %s ===\n' "$testcase" >> "$ktest_summary"
        "$KTEST_TOOL" "$testcase" >> "$ktest_summary" 2>&1
        printf '\n' >> "$ktest_summary"
    done < <(find "$output_dir" -maxdepth 1 -type f -name '*.ktest' | sort)

    return "$status"
}

for target_entry in \
    "x86_64:x86_64-pc-linux-gnu" \
    "i386:i386-pc-linux-gnu" \
    "powerpc:powerpc-unknown-linux-gnu"
do
    label="${target_entry%%:*}"
    target="${target_entry#*:}"
    compile_bc "target_probe_${label}" "$target" target_probe.c || true
    compile_bc "basic_symbolic_${label}" "$target" basic_symbolic.c || true
done

for test_source in \
    division_by_zero_natural \
    invalid_shift_natural \
    signed_overflow_natural \
    signed_overflow_explicit
do
    compile_bc "$test_source" x86_64-pc-linux-gnu "$test_source.c" || true
done

for execution in \
    target_probe_x86_64 \
    target_probe_i386 \
    target_probe_powerpc \
    basic_symbolic_x86_64 \
    basic_symbolic_i386 \
    basic_symbolic_powerpc \
    division_by_zero_natural \
    invalid_shift_natural \
    signed_overflow_natural \
    signed_overflow_explicit
do
    bc="$OUT/build/${execution}.bc"
    if [[ -s "$bc" ]]; then
        run_klee "$execution" "$bc" || true
    fi
done

run_logged "compile_basic_native" \
    "$CLANG13" \
    -O0 \
    -g \
    basic_symbolic.c \
    -L "$SNAP_KLEE_LIB" \
    -Wl,-rpath,"$SNAP_KLEE_LIB" \
    -lkleeRuntest \
    -o "$OUT/build/basic_symbolic_native"

native_status=$?
if [[ "$native_status" -eq 0 ]]; then
    native_log="$OUT/logs/native_replay_basic_symbolic.txt"
    : > "$native_log"
    while IFS= read -r testcase; do
        printf '=== %s ===\n' "$testcase" >> "$native_log"
        LD_LIBRARY_PATH="$SNAP_KLEE_LIB${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
            KTEST_FILE="$testcase" \
            "$OUT/build/basic_symbolic_native" >> "$native_log" 2>&1
        printf 'exit_status=%s\n\n' "$?" >> "$native_log"
    done < <(find "$OUT/klee/basic_symbolic_x86_64" -maxdepth 1 -type f -name '*.ktest' | sort)
fi

exit 0
