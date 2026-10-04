#!/usr/bin/env bash

set -o pipefail

KLEE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO_ROOT="$(cd "$KLEE_DIR/.." && pwd)"
MANIFEST="$KLEE_DIR/manifest.tsv"
RESULTS_DIR="$KLEE_DIR/results"

CLANG="${CLANG:-clang}"
LLVM_LINK="${LLVM_LINK:-llvm-link}"
LLVM_DIS="${LLVM_DIS:-llvm-dis}"
KLEE="${KLEE:-klee}"
KTEST_TOOL="${KTEST_TOOL:-ktest-tool}"
if [[ "$KTEST_TOOL" == "ktest-tool" ]] \
    && ! command -v "$KTEST_TOOL" >/dev/null 2>&1 \
    && command -v klee.ktest-tool >/dev/null 2>&1; then
    KTEST_TOOL="klee.ktest-tool"
fi

die()
{
    printf 'error: %s\n' "$*" >&2
    exit 1
}

require_command()
{
    command -v "$1" >/dev/null 2>&1 || {
        printf 'missing required tool: %s\n' "$1" >&2
        return 1
    }
}

validate_alarm_id()
{
    [[ "$1" =~ ^KLEE-ALARM-[0-9]{4}$ ]] || die "invalid alarm ID: $1"
}

manifest_row()
{
    local alarm_id="$1"
    awk -F '\t' -v wanted="$alarm_id" \
        'NR > 1 && $1 == wanted { print; found++ } END { if (found != 1) exit 1 }' \
        "$MANIFEST"
}

normalize_max_time()
{
    local value="$1"
    if [[ "$value" =~ ^[0-9]+$ ]]; then
        printf '%ss\n' "$value"
    elif [[ "$value" =~ ^[0-9]+(s|m|h|min)$ ]]; then
        printf '%s\n' "$value"
    else
        die "invalid --max-time '$value' (use seconds such as 60 or a KLEE duration such as 5m)"
    fi
}

resolve_klee_include()
{
    local candidate
    if [[ -n "${KLEE_INCLUDE:-}" ]]; then
        [[ -f "$KLEE_INCLUDE/klee/klee.h" ]] || return 1
        printf '%s\n' "$KLEE_INCLUDE"
        return 0
    fi
    if printf '#include <klee/klee.h>\n' | "$CLANG" -E -x c - >/dev/null 2>&1; then
        printf '%s\n' ""
        return 0
    fi
    for candidate in /usr/local/include /usr/include /snap/klee/current/usr/local/include; do
        if [[ -f "$candidate/klee/klee.h" ]]; then
            printf '%s\n' "$candidate"
            return 0
        fi
    done
    return 1
}

tool_major_version()
{
    "$1" --version 2>&1 | sed -nE \
        's/.*(version |LLVM version )([0-9]+)(\.[0-9]+)*/\2/p' | head -n 1
}
