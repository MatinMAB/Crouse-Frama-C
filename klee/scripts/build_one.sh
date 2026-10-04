#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=common.sh
source "$SCRIPT_DIR/common.sh"

[[ $# -eq 1 ]] || die "usage: $0 KLEE-ALARM-NNNN"
alarm_id="$1"
validate_alarm_id "$alarm_id"
row="$(manifest_row "$alarm_id")" || die "$alarm_id is absent from $MANIFEST"
IFS=$'\t' read -r _ function source_file _ _ _ _ harness sources _ _ <<< "$row"

result_dir="$RESULTS_DIR/$alarm_id"
build_dir="$result_dir/build"
mkdir -p "$build_dir"
klee_include="$(resolve_klee_include)" || die "klee/klee.h not found; set KLEE_INCLUDE"

common_flags=(
    -std=c11 -O0 -g -emit-llvm -c
    -fno-discard-value-names
    -Xclang -disable-O0-optnone
    -Wall -Wextra
    -Wno-sign-compare
    -Wno-shift-op-parentheses
    -Wno-unused-variable
    -Wno-unused-but-set-variable
    -I"$REPO_ROOT/src_analysis/headers"
    -I"$KLEE_DIR/scripts"
)
[[ -z "$klee_include" ]] || common_flags+=( -I"$klee_include" )

harness_bc="$build_dir/harness.bc"
"$CLANG" "${common_flags[@]}" "$REPO_ROOT/$harness" -o "$harness_bc"

link_inputs=( "$harness_bc" )
IFS=';' read -ra source_list <<< "$sources"
for source_name in "${source_list[@]}"; do
    [[ "$source_name" == "$source_file" ]] && continue
    [[ -f "$REPO_ROOT/$source_name" ]] || die "$alarm_id helper source not found: $source_name"
    helper_base="$(basename "${source_name%.c}")"
    helper_bc="$build_dir/${helper_base}.bc"
    "$CLANG" "${common_flags[@]}" \
        -include "$KLEE_DIR/scripts/klee_compat.h" \
        "$REPO_ROOT/$source_name" -o "$helper_bc"
    link_inputs+=( "$helper_bc" )
done

target_bc="$build_dir/$alarm_id.bc"
"$LLVM_LINK" "${link_inputs[@]}" -o "$target_bc"
"$LLVM_DIS" "$target_bc" -o "$build_dir/$alarm_id.ll"
printf '%s\n' "$target_bc"
