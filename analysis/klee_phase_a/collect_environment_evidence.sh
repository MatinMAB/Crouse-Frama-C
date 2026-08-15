#!/usr/bin/env bash
set -uo pipefail

cd "$(dirname "$0")/../.."

RAW="analysis/klee_phase_a/raw"
if [[ -e "$RAW" ]]; then
    echo "refusing to overwrite existing $RAW" >&2
    exit 2
fi
mkdir -p "$RAW"

{
    echo '$ pwd'
    pwd
    echo '$ git branch --show-current'
    git branch --show-current
    echo '$ git status --short'
    git status --short
    echo '$ git log -10 --oneline'
    git log -10 --oneline
    echo '$ git rev-parse HEAD'
    git rev-parse HEAD
    echo '$ git merge-base --is-ancestor 4e9ecee HEAD'
    git merge-base --is-ancestor 4e9ecee HEAD
    echo "exit_status=$?"
} > "$RAW/git_state_at_collection.txt" 2>&1

{
    echo '$ uname -a'
    uname -a
    echo '$ lsb_release -a'
    lsb_release -a
    echo '$ getconf GNU_LIBC_VERSION'
    getconf GNU_LIBC_VERSION
} > "$RAW/os_environment.txt" 2>&1

{
    echo '$ uname -m'
    uname -m
    echo '$ getconf LONG_BIT'
    getconf LONG_BIT
    echo '$ lscpu'
    lscpu
} > "$RAW/cpu_architecture.txt" 2>&1

{
    echo '$ command -v <tool>'
    for tool in klee ktest-tool clang clang++ llvm-config llvm-link llvm-dis llvm-as opt lli llc llvm-bcanalyzer docker z3 stp; do
        printf '%-20s' "$tool"
        command -v "$tool" || true
    done
    echo
    echo '$ find version-suffixed tool candidates'
    find /usr/bin /usr/local/bin -maxdepth 1 \( -type f -o -type l \) -printf '%f\n' 2>/dev/null |
        grep -E '^(klee|ktest-tool|clang(\+\+)?|llvm-(config|link|dis|as|bcanalyzer)|opt|lli|llc|z3|stp)(-[0-9]+([.][0-9]+)*)?$' |
        sort -V |
        uniq
    echo
    echo '$ ls -l /snap/bin | grep klee'
    ls -l /snap/bin | grep -E 'klee|ktest' || true
} > "$RAW/tool_paths.txt" 2>&1

{
    echo '$ klee --version'
    klee --version
    echo
    echo '$ snap list klee'
    snap list klee
} > "$RAW/klee_version.txt" 2>&1

{
    echo '$ klee --help'
    klee --help
} > "$RAW/klee_help.txt" 2>&1

{
    echo '$ clang 13 version and target inventory'
    /home/matin/opt/clang13/bin/clang --version
    /home/matin/opt/clang13/bin/llvm-config --version
    /home/matin/opt/clang13/bin/llvm-config --host-target
    /home/matin/opt/clang13/bin/llvm-config --targets-built
    echo
    echo '$ clang 18 version and target inventory'
    clang-18 --version
    llvm-config-18 --version
    llvm-config-18 --host-target
    llvm-config-18 --targets-built
} > "$RAW/clang_versions.txt" 2>&1

{
    for tool in llvm-config llvm-link llvm-dis llvm-as opt lli llc llvm-bcanalyzer; do
        echo "=== LLVM 13 $tool ==="
        "/home/matin/opt/clang13/bin/$tool" --version 2>&1 || true
    done
    for tool in llvm-config-18 llvm-link-18 llvm-dis-18 llvm-as-18 opt-18 lli-18 llc-18 llvm-bcanalyzer-18; do
        echo "=== LLVM 18 $tool ==="
        "$tool" --version 2>&1 || true
    done
} > "$RAW/llvm_versions.txt" 2>&1

{
    echo '$ dpkg --print-architecture'
    dpkg --print-architecture
    echo '$ dpkg --print-foreign-architectures'
    dpkg --print-foreign-architectures
    echo '$ relevant installed dpkg packages'
    dpkg-query -W -f='${binary:Package}\t${Version}\t${Architecture}\t${db:Status-Status}\n' 2>/dev/null |
        grep -Ei '^(klee|llvm|clang|libclang|z3|libz3|stp|libstp|libc\+\+|libc\+\+abi|gcc-multilib|g\+\+-multilib|libc6-dev-i386|lib32gcc|lib32stdc|compiler-rt|libclang-rt)' |
        sort -V
    echo '$ selected apt-cache policy'
    for package in klee llvm llvm-13 llvm-18 clang clang-13 clang-18 z3 libz3-dev stp libstp-dev libc++-dev libc++abi-dev gcc-multilib libc6-dev-i386 libclang-rt-13-dev libclang-rt-18-dev; do
        echo "--- $package"
        apt-cache policy "$package" 2>/dev/null | sed -n '1,12p'
    done
} > "$RAW/package_inventory.txt" 2>&1

{
    echo '$ snap metadata'
    sed -n '1,260p' /snap/klee/20/meta/snap.yaml
    echo
    echo '$ snap build manifest (relevant build configuration)'
    sed -n '1,360p' /snap/klee/20/snap/manifest.yaml
} > "$RAW/klee_build_metadata.txt" 2>&1

{
    echo '$ KLEE runtime bitcode archives'
    find /snap/klee/20/usr/local/lib/klee/runtime -maxdepth 1 -type f -printf '%f\t%s bytes\n' | sort
    echo
    echo '$ KLEE executables'
    find /snap/klee/20/usr/local/bin -maxdepth 1 -type f -perm -111 -printf '%f\n' | sort
    echo
    echo '$ native replay library'
    file /snap/klee/20/usr/local/lib/libkleeRuntest.so.1.0
} > "$RAW/klee_runtime_inventory.txt" 2>&1

{
    echo '$ z3 --version'
    z3 --version 2>&1 || true
    echo '$ STP command path'
    command -v stp || true
    echo '$ embedded STP evidence'
    ls -l /snap/klee/20/usr/local/lib/libstp.a /snap/klee/20/usr/local/lib/cmake/STP/STPConfigVersion.cmake
    echo '$ tested solver backends from microtests'
    sed -n '1,100p' analysis/klee_phase_a/microtests/generated/logs/klee_basic_symbolic_x86_64.stderr.txt
    sed -n '1,100p' analysis/klee_phase_a/microtests/generated/ubsan_and_solver_probe/klee_z3.stderr.txt
} > "$RAW/solver_inventory.txt" 2>&1

{
    echo '$ docker --version'
    docker --version 2>&1 || true
    echo '$ docker info'
    docker info 2>&1 || true
    echo '$ docker image ls'
    docker image ls --format '{{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.Size}}' 2>&1 || true
    echo '$ repository container definitions'
    find . -path ./.git -prune -o -type f \( -iname 'Dockerfile*' -o -iname 'docker-compose*' -o -iname 'compose.yaml' -o -iname 'compose.yml' -o -path '*/.devcontainer/*' \) -print
} > "$RAW/docker_inventory.txt" 2>&1

{
    echo '$ Frama-C ppc_32 machine-model evidence'
    machdep="/home/matin/.opam/4.14.1/share/frama-c/share/machdeps/machdep_ppc_32.yaml"
    rg -n '^alignof_|^char_is_unsigned:|^compiler:|^little_endian:|^machdep_name:|^sizeof_|^size_t:|^uintptr_t:' "$machdep"
    echo
    echo '$ Clang 13 host/i386/PowerPC predefined model macros'
    for target in x86_64-pc-linux-gnu i386-pc-linux-gnu powerpc-unknown-linux-gnu; do
        echo "--- $target"
        /home/matin/opt/clang13/bin/clang -target "$target" -dM -E -x c /dev/null |
            grep -E '^#define (__SIZEOF_(SHORT|INT|LONG|LONG_LONG|POINTER)__|__CHAR_UNSIGNED__|__BYTE_ORDER__|__ORDER_(LITTLE|BIG)_ENDIAN__)' |
            sort
    done
} > "$RAW/machine_model_evidence.txt" 2>&1

{
    echo '$ target probe IR headers'
    for file in analysis/klee_phase_a/microtests/generated/build/target_probe_*.ll; do
        echo "--- $file"
        sed -n '1,24p' "$file"
    done
    echo '$ 32-bit and PowerPC KLEE outcomes'
    for file in analysis/klee_phase_a/microtests/generated/logs/klee_*i386.stderr.txt analysis/klee_phase_a/microtests/generated/logs/klee_*powerpc.stderr.txt; do
        echo "--- $file"
        sed -n '1,160p' "$file"
    done
    echo '$ native/cross-link outcomes'
    for file in analysis/klee_phase_a/microtests/generated/compatibility_probe/*native_link.stderr.txt; do
        echo "--- $file"
        sed -n '1,160p' "$file"
    done
} > "$RAW/target_32bit_tests.txt" 2>&1

{
    echo '$ validated frozen alarm rows'
    awk -F '\t' 'NR>1 {count++; category[$5]++; status[$9]++} END {print "total=" count; for (x in category) print "category=" x " count=" category[x]; for (x in status) print "status=" x " count=" status[x]}' reports/eva_report_source_package/data/high_precision_alarm_inventory.tsv
    echo '$ comparison rows'
    awk -F '\t' 'NR>1 {count++; status[$3]++} END {print "total=" count; for (x in status) print "status=" x " count=" status[x]}' reports/eva_report_source_package/data/alarm_comparison.tsv
    echo '$ function rows'
    awk 'END {print NR-1}' reports/eva_report_source_package/data/functions.tsv
    echo '$ source location rows'
    awk 'END {print NR-1}' reports/eva_report_source_package/data/source_locations.tsv
} > "$RAW/frozen_dataset_validation.txt" 2>&1

{
    echo '$ repository container/KLEE/LLVM references'
    rg -l -i '\bklee\b|llvm' --glob '!results/**' --glob '!analysis/klee_phase_a/**' . | sort
} > "$RAW/repository_reference_search.txt" 2>&1

{
    echo 'Microtest raw stdout/stderr, exit statuses, LLVM bitcode, disassembled IR, KTest files, and KLEE-generated metadata are stored under:'
    echo 'analysis/klee_phase_a/microtests/generated/'
    echo
    echo '$ aggregate microtest status files'
    find analysis/klee_phase_a/microtests/generated -type f -name '*.status.txt' -print -exec cat {} \;
} > "$RAW/microtest_results_index.txt" 2>&1
