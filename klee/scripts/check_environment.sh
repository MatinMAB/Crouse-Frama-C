#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=common.sh
source "$SCRIPT_DIR/common.sh"

failures=0
for tool_value in "$CLANG" "$LLVM_LINK" "$LLVM_DIS" "$KLEE" "$KTEST_TOOL"; do
    require_command "$tool_value" || failures=$((failures + 1))
done
(( failures == 0 )) || die "$failures required tool(s) unavailable; use environment overrides if needed"

klee_include="$(resolve_klee_include)" || die "klee/klee.h not found; set KLEE_INCLUDE"
clang_major="$(tool_major_version "$CLANG")"
link_major="$(tool_major_version "$LLVM_LINK")"
dis_major="$(tool_major_version "$LLVM_DIS")"
[[ -n "$clang_major" && -n "$link_major" && -n "$dis_major" ]] || \
    die "could not determine LLVM/Clang versions"
[[ "$clang_major" == "$link_major" && "$clang_major" == "$dis_major" ]] || \
    die "LLVM tool mismatch: clang=$clang_major llvm-link=$link_major llvm-dis=$dis_major"

klee_version="$($KLEE --version 2>&1)" || die "klee --version failed"
klee_llvm_major="$(printf '%s\n' "$klee_version" | sed -nE \
    's/.*LLVM( version)?[[:space:]]+([0-9]+).*/\2/p' | head -n 1)"
if [[ -n "$klee_llvm_major" && "$klee_llvm_major" != "$clang_major" ]]; then
    die "KLEE/LLVM mismatch: KLEE reports LLVM $klee_llvm_major, clang reports $clang_major"
fi

printf 'clang:\n'
"$CLANG" --version | sed -n '1,3p'
printf '\nllvm-link:\n'
"$LLVM_LINK" --version | sed -n '1,3p'
printf '\nllvm-dis:\n'
"$LLVM_DIS" --version | sed -n '1,3p'
printf '\nklee:\n%s\n' "$klee_version"
printf '\nktest-tool: %s\n' "$(command -v "$KTEST_TOOL")"
if [[ -n "$klee_include" ]]; then
    printf 'KLEE include: %s\n' "$klee_include"
else
    printf 'KLEE include: compiler default search path\n'
fi
printf 'Compatibility: LLVM/Clang major %s; KLEE LLVM %s\n' \
    "$clang_major" "${klee_llvm_major:-not exposed by --version}"
