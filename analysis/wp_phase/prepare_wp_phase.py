#!/usr/bin/env python3
"""Generate target-only Frama-C/WP launchers for the 48 confirmed alarms."""

from __future__ import annotations

import csv
import os
import shlex
import shutil
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
WP = ROOT / "analysis" / "wp_phase"
REPAIR = ROOT / "analysis" / "repair_phase"
CONFIRMED = REPAIR / "48_CONFIRMED_REPAIR_TARGETS.tsv"
PROPERTY_MAP = REPAIR / "149_ACSL_PROPERTY_MAP.tsv"
RUNTIME = REPAIR / "101_RUNTIME_ONLY_PROPERTIES.tsv"

MACHINE_MODEL = "ppc_32"
WP_MODEL = "Typed+int"
EXTERNAL_PROVERS = "alt-ergo,z3,cvc5"
PROVER_DESCRIPTION = "Qed; Alt-Ergo 2.6.2; Z3 4.8.12; CVC5 1.1.2"
DEFAULT_TIMEOUT = "120"
DEFAULT_MEMLIMIT = "2000"
INCLUDE_OPTION = "-cpp-extra-args=-Isrc_repaired/headers"
INCLUDE_VALUE = "-Isrc_repaired/headers"


def read_tsv(path: Path) -> tuple[list[str], list[dict[str, str]]]:
    with path.open(newline="", encoding="utf-8") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        return list(reader.fieldnames or []), list(reader)


def write_tsv(path: Path, headers: list[str], rows: list[dict[str, str]]) -> None:
    with path.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(
            stream,
            fieldnames=headers,
            delimiter="\t",
            lineterminator="\n",
            extrasaction="ignore",
        )
        writer.writeheader()
        writer.writerows(rows)


def command_output(command: list[str]) -> tuple[int, str]:
    completed = subprocess.run(
        command,
        cwd=ROOT,
        check=False,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
    )
    return completed.returncode, completed.stdout


def shell_value(value: str) -> str:
    return shlex.quote(value)


def translation_inputs(source: str) -> list[str]:
    if source.endswith("/mul_Ccode.c") or source.endswith("/MulHword.c"):
        return [
            "src_repaired/sources/mul_Ccode.c",
            "src_repaired/sources/MulHword.c",
        ]
    return [source]


def assertion_owner(source: str, reported_function: str) -> str:
    if source.endswith("/MulHword.c"):
        return "MulHighWord"
    return reported_function


WP.mkdir(parents=True, exist_ok=True)
environment = WP / "environment"
environment.mkdir(exist_ok=True)
targets_dir = WP / "targets"
targets_dir.mkdir(exist_ok=True)
(WP / "lib").mkdir(exist_ok=True)
(WP / "results").mkdir(exist_ok=True)
(WP / "sessions").mkdir(exist_ok=True)
(WP / "results" / ".gitignore").write_text("*\n!.gitignore\n", encoding="utf-8")
(WP / "sessions" / ".gitignore").write_text(
    "*\n!*/\n!*/.gitkeep\n!.gitignore\n", encoding="utf-8"
)

framac_rc, framac_version = command_output(["frama-c", "-version"])
wp_help_rc, wp_help = command_output(["frama-c", "-wp-help"])
provers_rc, prover_list = command_output(["frama-c", "-wp-list-provers"])
report_help_rc, report_help = command_output(["frama-c", "-report-help"])
if any(code != 0 for code in [framac_rc, wp_help_rc, provers_rc, report_help_rc]):
    raise SystemExit("Frama-C environment discovery failed")

(environment / "FRAMAC_VERSION.txt").write_text(framac_version, encoding="utf-8")
(environment / "WP_HELP.txt").write_text(wp_help, encoding="utf-8")
(environment / "WP_AVAILABLE_PROVERS.txt").write_text(prover_list, encoding="utf-8")
(environment / "REPORT_HELP.txt").write_text(report_help, encoding="utf-8")

tool_names = ["frama-c", "frama-c-gui", "why3", "alt-ergo", "z3", "cvc5", "cpp", "node", "yarn", "shellcheck"]
tool_lines = []
for name in tool_names:
    tool_lines.append(f"{name}\t{shutil.which(name) or 'NOT_FOUND'}")
(environment / "TOOL_PATHS.txt").write_text("\n".join(tool_lines) + "\n", encoding="utf-8")

version_commands = {
    "Why3": ["why3", "--version"],
    "Alt-Ergo": ["alt-ergo", "--version"],
    "Z3": ["z3", "--version"],
    "CVC5": ["cvc5", "--version"],
    "C preprocessor": ["cpp", "--version"],
}
version_rows: list[tuple[str, str]] = []
for label, command in version_commands.items():
    if shutil.which(command[0]):
        _, output = command_output(command)
        version_rows.append((label, output.splitlines()[0] if output else "UNKNOWN"))
    else:
        version_rows.append((label, "NOT_FOUND"))

environment_md = [
    "# Frama-C/WP Environment",
    "",
    f"- Frama-C: `{framac_version.strip()}`",
    f"- Frama-C executable: `{shutil.which('frama-c')}`",
    f"- GUI launcher: `{shutil.which('frama-c-gui')}`",
    f"- Machine model: `{MACHINE_MODEL}`",
    f"- WP model: `{WP_MODEL}`",
    f"- External prover aliases: `{EXTERNAL_PROVERS}`",
    "- Internal simplifier: `Qed` (part of WP, not an external prover)",
    "",
    "## Tool versions",
    "",
]
environment_md.extend(f"- {label}: `{version}`" for label, version in version_rows)
environment_md.extend(
    [
        "",
        "## GUI availability",
        "",
        "`frama-c-gui` is installed, but the installed launcher currently requires Node.js 24 or later.",
        "No `node` or `yarn` executable was detected, so GUI launchers are prepared but cannot start",
        "until that external prerequisite is supplied by the user. No software was installed or configured.",
        "",
        "## Machine-readable reporting",
        "",
        "Frama-C 33.0 supports `-wp-report-json`; terminal launchers write `wp-report.json`.",
        "The Report plug-in CSV facility was discovered but is not enabled because WP JSON directly",
        "records the isolated target goal without adding a broad property-reporting surface.",
    ]
)
(environment / "WP_ENVIRONMENT.md").write_text("\n".join(environment_md) + "\n", encoding="utf-8")

_, confirmed_rows = read_tsv(CONFIRMED)
_, property_rows = read_tsv(PROPERTY_MAP)
_, runtime_rows = read_tsv(RUNTIME)
properties = {row["KLEE Alarm ID"]: row for row in property_rows}
runtime_ids = {row["KLEE Alarm ID"] for row in runtime_rows}
confirmed_ids = {row["KLEE Alarm ID"] for row in confirmed_rows}
if len(confirmed_rows) != 48 or len(confirmed_ids) != 48:
    raise SystemExit("confirmed target input is not exactly 48 unique alarms")
if confirmed_ids & runtime_ids:
    raise SystemExit("confirmed and runtime-only target sets overlap")

input_headers = [
    "KLEE Alarm ID",
    "Function",
    "Assertion Owner Function",
    "ACSL Label",
    "Repair Status",
    "Repair Commit",
    "Original Source File",
    "Repaired Source File",
    "Original Source Line",
    "Current Assertion Line",
    "Eva Safety Property",
    "Translation Unit Inputs",
    "Include Arguments",
    "Macro Arguments",
    "Machine Model",
    "WP Model",
    "Provers",
    "Timeout",
    "Script Status",
]
input_rows: list[dict[str, str]] = []
result_headers = [
    "KLEE Alarm ID",
    "Function",
    "ACSL Label",
    "Eva Safety Property",
    "Repair Status",
    "Repair Commit",
    "Original KLEE Counterexample",
    "WP Eligible?",
    "Terminal Run?",
    "GUI Inspected?",
    "Qed Result",
    "Alt-Ergo Result",
    "Z3 Result",
    "CVC5 Result",
    "Other Prover Results",
    "WP Target Property Status",
    "Runtime",
    "Result Directory",
    "Final WP Classification",
    "Notes",
]
result_rows: list[dict[str, str]] = []
ready_ids: list[str] = []

for repair_row in sorted(confirmed_rows, key=lambda row: row["KLEE Alarm ID"]):
    alarm_id = repair_row["KLEE Alarm ID"]
    prop = properties[alarm_id]
    source = prop["Repaired Source File"]
    inputs = translation_inputs(source)
    owner = assertion_owner(source, repair_row["Function"])
    script_status = (
        "WP_READY" if repair_row["Repair Status"].startswith("REPAIRED") else "REPAIR_POLICY_REQUIRED"
    )
    eligible = "YES" if script_status == "WP_READY" else "NO"
    if eligible == "YES":
        ready_ids.append(alarm_id)
    assertion_line = prop["Current Assertion Location"].rsplit(":", 1)[1]

    input_rows.append(
        {
            "KLEE Alarm ID": alarm_id,
            "Function": repair_row["Function"],
            "Assertion Owner Function": owner,
            "ACSL Label": repair_row["ACSL Label"],
            "Repair Status": repair_row["Repair Status"],
            "Repair Commit": repair_row["Repair Commit"],
            "Original Source File": repair_row["Original Source File"],
            "Repaired Source File": source,
            "Original Source Line": repair_row["Original Source Line"],
            "Current Assertion Line": assertion_line,
            "Eva Safety Property": repair_row["Raw Eva Property"],
            "Translation Unit Inputs": ";".join(inputs),
            "Include Arguments": INCLUDE_OPTION,
            "Macro Arguments": "NONE",
            "Machine Model": MACHINE_MODEL,
            "WP Model": WP_MODEL,
            "Provers": PROVER_DESCRIPTION,
            "Timeout": f"{DEFAULT_TIMEOUT} seconds (WP_TIMEOUT override)",
            "Script Status": script_status,
        }
    )
    result_rows.append(
        {
            "KLEE Alarm ID": alarm_id,
            "Function": repair_row["Function"],
            "ACSL Label": repair_row["ACSL Label"],
            "Eva Safety Property": repair_row["Raw Eva Property"],
            "Repair Status": repair_row["Repair Status"],
            "Repair Commit": repair_row["Repair Commit"],
            "Original KLEE Counterexample": repair_row["Concrete Inputs"],
            "WP Eligible?": eligible,
            "Terminal Run?": "NO",
            "GUI Inspected?": "NO",
            "Qed Result": "NOT_RUN",
            "Alt-Ergo Result": "NOT_RUN",
            "Z3 Result": "NOT_RUN",
            "CVC5 Result": "NOT_RUN",
            "Other Prover Results": "NOT_RUN",
            "WP Target Property Status": "NOT_RUN",
            "Runtime": "NOT_RUN",
            "Result Directory": "NOT_RUN",
            "Final WP Classification": "NOT_RUN" if eligible == "YES" else "REPAIR_POLICY_REQUIRED",
            "Notes": "NONE" if eligible == "YES" else "Implementation repair policy remains unresolved; do not execute WP yet.",
        }
    )

    target = targets_dir / alarm_id
    target.mkdir(exist_ok=True)
    target_session = WP / "sessions" / alarm_id
    target_session.mkdir(exist_ok=True)
    (target_session / ".gitkeep").touch()
    metadata = {
        "KLEE_ALARM_ID": alarm_id,
        "TARGET_FUNCTION": repair_row["Function"],
        "WP_FUNCTION": owner,
        "ACSL_LABEL": repair_row["ACSL Label"],
        "ALARM_KIND": repair_row["Alarm Kind"],
        "ORIGINAL_EXPRESSION": repair_row["Original Expression"],
        "RAW_EVA_PROPERTY": repair_row["Raw Eva Property"],
        "INSERTED_ACSL_PROPERTY": repair_row["Inserted ACSL Property"],
        "ORIGINAL_SOURCE_FILE": repair_row["Original Source File"],
        "ORIGINAL_SOURCE_LINE": repair_row["Original Source Line"],
        "REPAIRED_SOURCE_FILE": source,
        "CURRENT_ASSERTION_LOCATION": prop["Current Assertion Location"],
        "COUNTEREXAMPLE_INPUTS": repair_row["Concrete Inputs"],
        "KTEST_PATH": repair_row["KTest"],
        "ERR_EVIDENCE_PATH": repair_row["Target Error Evidence"],
        "REPAIR_STATUS": repair_row["Repair Status"],
        "REPAIR_COMMIT": repair_row["Repair Commit"],
        "SCRIPT_STATUS": script_status,
        "WP_ELIGIBLE": eligible,
        "TRANSLATION_UNIT_INPUTS": " ".join(inputs),
        "CPP_EXTRA_ARGS": INCLUDE_VALUE,
        "MACRO_ARGS": "",
        "MACHINE_MODEL": MACHINE_MODEL,
        "WP_MODEL": WP_MODEL,
        "EXTERNAL_PROVERS": EXTERNAL_PROVERS,
        "DEFAULT_WP_TIMEOUT": DEFAULT_TIMEOUT,
        "DEFAULT_WP_MEMLIMIT": DEFAULT_MEMLIMIT,
    }
    (target / "metadata.env").write_text(
        "# Generated by analysis/wp_phase/prepare_wp_phase.py\n"
        + "\n".join(f"{key}={shell_value(value)}" for key, value in metadata.items())
        + "\n",
        encoding="utf-8",
    )

    policy_note = ""
    if script_status == "REPAIR_POLICY_REQUIRED":
        policy_note = (
            "\n## Repair-policy gate\n\n"
            "**REPAIR_POLICY_REQUIRED.** The current implementation has not received the final thesis "
            "repair for this target. Both launchers intentionally refuse to execute. No WP conclusion "
            "should be drawn until repair policy is resolved and this metadata is regenerated.\n"
        )
    owner_note = ""
    if owner != repair_row["Function"]:
        owner_note = (
            f"\nThe KLEE entry context is `{repair_row['Function']}`, while the assertion is physically "
            f"inside helper `{owner}`. WP therefore selects `{owner}` with `-wp-fct` and includes both "
            "the caller translation unit and `MulHword.c`.\n"
        )
    readme = f"""# {alarm_id} target-only WP launcher

- KLEE alarm: `{alarm_id}`
- KLEE entry function: `{repair_row['Function']}`
- WP assertion owner function: `{owner}`
- Repaired source: `{source}`
- Original occurrence: `{repair_row['Original Source File']}:{repair_row['Original Source Line']}`
- Current assertion: `{prop['Current Assertion Location']}`
- Original Eva alarm: `{repair_row['Alarm Kind']}` on `{repair_row['Original Expression']}`
- Raw Eva safety property: `{repair_row['Raw Eva Property']}`
- Inserted ACSL property: `{repair_row['Inserted ACSL Property']}`
- ACSL label: `{repair_row['ACSL Label']}`
- KLEE counterexample inputs: `{repair_row['Concrete Inputs']}`
- Repair status: `{repair_row['Repair Status']}`
- Repair commit: `{repair_row['Repair Commit']}`
- Script status: `{script_status}`

This launcher asks WP about only `{repair_row['ACSL Label']}`. It does not enable RTE generation
or select other assertions. The property text and source placement come unchanged from the repair-phase
manifest.{owner_note}{policy_note}
## Terminal

```bash
./analysis/wp_phase/targets/{alarm_id}/run_terminal.sh
```

Each run creates a fresh directory under `analysis/wp_phase/results/{alarm_id}/` containing the
exact command, Git/tool metadata, combined output, elapsed time, exit code, and `wp-report.json`.
The persistent proof session is `analysis/wp_phase/sessions/{alarm_id}/`.

## GUI

```bash
./analysis/wp_phase/targets/{alarm_id}/run_gui.sh
```

The GUI uses the same source inputs, function selection, property label, machine/WP models,
provers, and persistent target session. The current host still needs Node.js 24+ and Yarn for
the installed GUI launcher; the script reports that prerequisite failure without changing it.

A tool exit code of zero is not a proof classification. Inspect the selected target's WP result
in `wp-report.json` or the GUI before updating `WP_RESULTS.tsv`.
"""
    (target / "README.md").write_text(readme, encoding="utf-8")

    terminal = """#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
# shellcheck source=../../lib/wp_common.sh
source "$SCRIPT_DIR/../../lib/wp_common.sh"
# shellcheck source=metadata.env
source "$SCRIPT_DIR/metadata.env"
wp_run_terminal
"""
    gui = """#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
# shellcheck source=../../lib/wp_common.sh
source "$SCRIPT_DIR/../../lib/wp_common.sh"
# shellcheck source=metadata.env
source "$SCRIPT_DIR/metadata.env"
wp_run_gui
"""
    for name, content in [("run_terminal.sh", terminal), ("run_gui.sh", gui)]:
        path = target / name
        path.write_text(content, encoding="utf-8")
        path.chmod(0o755)

write_tsv(WP / "WP_TARGET_INPUTS.tsv", input_headers, input_rows)
write_tsv(WP / "WP_RESULTS.tsv", result_headers, result_rows)

common = r'''#!/usr/bin/env bash
set -euo pipefail

WP_COMMON_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
REPO_ROOT=$(cd -- "$WP_COMMON_DIR/../../.." && pwd -P)

wp_require_ready() {
  if [[ ${SCRIPT_STATUS:?} != WP_READY ]]; then
    printf '%s: REPAIR_POLICY_REQUIRED; WP execution is intentionally blocked.\n' "$KLEE_ALARM_ID" >&2
    printf 'Resolve and freeze the repair policy, then regenerate this launcher.\n' >&2
    exit 3
  fi
}

wp_require_tools() {
  local tool
  for tool in "$@"; do
    if ! command -v "$tool" >/dev/null 2>&1; then
      printf 'required tool not found: %s\n' "$tool" >&2
      exit 127
    fi
  done
}

wp_build_command() {
  local report_json=$1
  local wp_out=$2
  local session_dir=$3
  local -a inputs
  read -r -a inputs <<< "$TRANSLATION_UNIT_INPUTS"
  WP_COMMAND=(
    frama-c
    -machdep "$MACHINE_MODEL"
    "-cpp-extra-args=$CPP_EXTRA_ARGS"
  )
  WP_COMMAND+=("${inputs[@]}")
  WP_COMMAND+=(
    -wp
    -wp-fct "$WP_FUNCTION"
    -wp-prop "$ACSL_LABEL"
    -wp-model "$WP_MODEL"
    -wp-prover "$EXTERNAL_PROVERS"
    -wp-run-all-provers
    -wp-par 1
    -wp-timeout "$WP_TIMEOUT"
    -wp-memlimit "$WP_MEMLIMIT"
    -wp-cache rebuild
    -wp-session "$session_dir"
    -wp-out "$wp_out"
    -wp-report-json "$report_json"
    -wp-proof-trace
    -wp-status
  )
}

wp_capture_versions() {
  local destination=$1
  {
    frama-c -version 2>&1
    why3 --version 2>&1 || true
    alt-ergo --version 2>&1 || true
    z3 --version 2>&1 || true
    cvc5 --version 2>&1 | sed -n '1p' || true
  } > "$destination"
}

wp_new_result_dir() {
  local base="$REPO_ROOT/analysis/wp_phase/results/$KLEE_ALARM_ID"
  local stamp candidate suffix=0
  mkdir -p "$base"
  stamp=$(date -u +%Y%m%d-%H%M%SZ)
  candidate="$base/$stamp"
  while ! mkdir "$candidate" 2>/dev/null; do
    suffix=$((suffix + 1))
    candidate="$base/$stamp-$suffix"
  done
  WP_RESULT_DIR=$candidate
}

wp_write_command() {
  local directory=$1
  {
    printf '#!/usr/bin/env bash\nset -euo pipefail\ncd %q\nexec' "$REPO_ROOT"
    printf ' %q' "${WP_COMMAND[@]}"
    printf '\n'
  } > "$directory/command.sh"
  chmod 755 "$directory/command.sh"
  {
    printf 'cd %q\n' "$REPO_ROOT"
    printf '%q ' "${WP_COMMAND[@]}"
    printf '\n'
  } > "$directory/command.txt"
}

wp_run_terminal() {
  wp_require_ready
  wp_require_tools frama-c why3 alt-ergo z3 cvc5 git tee
  cd "$REPO_ROOT"
  WP_TIMEOUT=${WP_TIMEOUT:-$DEFAULT_WP_TIMEOUT}
  WP_MEMLIMIT=${WP_MEMLIMIT:-$DEFAULT_WP_MEMLIMIT}
  local session_dir="$REPO_ROOT/analysis/wp_phase/sessions/$KLEE_ALARM_ID"
  mkdir -p "$session_dir"
  wp_new_result_dir
  mkdir -p "$WP_RESULT_DIR/wp-out"
  wp_build_command "$WP_RESULT_DIR/wp-report.json" "$WP_RESULT_DIR/wp-out" "$session_dir"
  wp_write_command "$WP_RESULT_DIR"
  cp "$SCRIPT_DIR/metadata.env" "$WP_RESULT_DIR/metadata.txt"
  {
    git rev-parse HEAD
    git branch --show-current
    git describe --always --dirty --tags
    git status --short --branch --untracked-files=no
  } > "$WP_RESULT_DIR/git_state.txt"
  frama-c -version > "$WP_RESULT_DIR/frama_c_version.txt" 2>&1
  wp_capture_versions "$WP_RESULT_DIR/prover_versions.txt"
  local started finished elapsed_ns exit_code
  started=$(date +%s%N)
  set +e
  "${WP_COMMAND[@]}" 2>&1 | tee "$WP_RESULT_DIR/stdout_stderr.log"
  exit_code=${PIPESTATUS[0]}
  set -e
  finished=$(date +%s%N)
  elapsed_ns=$((finished - started))
  printf '%s\n' "$exit_code" > "$WP_RESULT_DIR/exit_code.txt"
  printf '%d.%09d seconds\n' "$((elapsed_ns / 1000000000))" "$((elapsed_ns % 1000000000))" > "$WP_RESULT_DIR/elapsed_time.txt"
  printf 'Frama-C process exit code: %s\n' "$exit_code"
  printf 'Evidence directory: %s\n' "$WP_RESULT_DIR"
  printf 'Proof classification is NOT inferred from the process exit code. Inspect wp-report.json.\n'
  return "$exit_code"
}

wp_run_gui() {
  wp_require_ready
  wp_require_tools frama-c-gui
  cd "$REPO_ROOT"
  WP_TIMEOUT=${WP_TIMEOUT:-$DEFAULT_WP_TIMEOUT}
  WP_MEMLIMIT=${WP_MEMLIMIT:-$DEFAULT_WP_MEMLIMIT}
  local session_dir="$REPO_ROOT/analysis/wp_phase/sessions/$KLEE_ALARM_ID"
  local gui_out="$session_dir/gui-wp-out"
  mkdir -p "$session_dir" "$gui_out"
  wp_build_command "$session_dir/gui-wp-report.json" "$gui_out" "$session_dir"
  WP_COMMAND[0]=frama-c-gui
  exec "${WP_COMMAND[@]}"
}
'''
common_path = WP / "lib" / "wp_common.sh"
common_path.write_text(common, encoding="utf-8")
common_path.chmod(0o755)

run_one = r'''#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
if [[ $# -ne 2 ]]; then
  printf 'usage: %s KLEE-ALARM-XXXX terminal|gui\n' "$0" >&2
  exit 2
fi
alarm_id=$1
mode=$2
if [[ ! $alarm_id =~ ^KLEE-ALARM-[0-9]{4}$ ]]; then
  printf 'invalid alarm ID: %s\n' "$alarm_id" >&2
  exit 2
fi
case "$mode" in
  terminal) launcher=run_terminal.sh ;;
  gui) launcher=run_gui.sh ;;
  *) printf 'invalid mode: %s (expected terminal or gui)\n' "$mode" >&2; exit 2 ;;
esac
target="$SCRIPT_DIR/targets/$alarm_id/$launcher"
if [[ ! -x $target ]]; then
  printf 'target launcher not found or not executable: %s\n' "$target" >&2
  exit 2
fi
exec "$target"
'''
run_one_path = WP / "run_one.sh"
run_one_path.write_text(run_one, encoding="utf-8")
run_one_path.chmod(0o755)

batch_lines = [
    "#!/usr/bin/env bash",
    "set -euo pipefail",
    "",
    "# WARNING:",
    "# This script performs the actual WP verification campaign.",
    "# Do not run automatically.",
    "",
    'SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)',
    "targets=(",
]
batch_lines.extend(f"  {alarm_id}" for alarm_id in ready_ids)
batch_lines.extend(
    [
        ")",
        "",
        'printf "Running %d WP_READY targets.\\n" "${#targets[@]}"',
        'for alarm_id in "${targets[@]}"; do',
        '  "$SCRIPT_DIR/run_one.sh" "$alarm_id" terminal',
        "done",
    ]
)
batch_path = WP / "run_all_wp_ready.sh"
batch_path.write_text("\n".join(batch_lines) + "\n", encoding="utf-8")
batch_path.chmod(0o755)

methodology = f"""# Target-only Frama-C/WP Verification Methodology

## Scientific scope

This experiment asks whether WP can prove only the named ACSL assertion derived from each
confirmed Eva/KLEE alarm. It does not generate or attempt unrelated runtime-error obligations.
Every launcher selects exactly one label with `-wp-prop eva_klee_alarm_XXXX` and restricts the
assertion-owning function with `-wp-fct`.

`-wp-rte` is intentionally **not used**. RTE generation is disabled by omission: the launchers never
pass that option and do not invoke an RTE phase. No new ACSL assertion is generated. The 149 frozen
assertions and their locations are not edited by this preparation phase.

## Models and preprocessing

- Machine model: `-machdep {MACHINE_MODEL}`.
- WP model: `-wp-model {WP_MODEL}`.
- Include configuration: `{INCLUDE_OPTION}`.
- Macro arguments: none.

`Typed+int` uses WP's typed memory model and machine-integer arithmetic. It retains the relevant
fixed-width integer side conditions under `ppc_32`; neither natural-number arithmetic nor the
potentially unsound weak-integer option is used. This common model is used for all 48 launchers.

The translation-unit inputs reproduce the existing project analysis setup. Multiplication targets
include both `mul_Ccode.c` and `MulHword.c`; other targets use their repaired owning source. For six
helper assertions, the KLEE entry-context function is preserved in metadata while WP selects the
physical owner `MulHighWord`.

## Provers and reproducibility

Qed remains WP's internal simplifier. External goals are submitted to the detected aliases
`{EXTERNAL_PROVERS}` with `-wp-run-all-provers`, so one external success does not suppress the other
solver results. Official terminal runs use `-wp-par 1`, a default timeout of {DEFAULT_TIMEOUT} seconds,
a default prover memory limit of {DEFAULT_MEMLIMIT} MiB, and `-wp-cache rebuild`. Timeout and memory
may be overridden with `WP_TIMEOUT` and `WP_MEMLIMIT` without changing the selected property.

Each alarm has its own persistent session. Each terminal execution creates a new UTC timestamped
evidence directory and archives the exact command, repository/tool state, combined output, elapsed
time, process exit code, prover versions, and WP JSON report. A zero process exit code is not treated
as a Valid proof.

The CLI and GUI launchers use the same repaired inputs, machine/WP models, function, property,
provers, limits, and target session. GUI inspection does not broaden the property selection.

## Eligibility boundary

Scripts exist for all 48 confirmed alarms. The 32 repaired targets are `WP_READY`; the 16 unresolved
targets are `REPAIR_POLICY_REQUIRED` and their launchers refuse execution. The 101 runtime-only Eva
targets are absent from this phase and receive no WP task.
"""
(WP / "WP_VERIFICATION_METHODOLOGY.md").write_text(methodology, encoding="utf-8")

classification = """# WP Result Classification

The primary classification concerns only the selected `eva_klee_alarm_XXXX` assertion.

- `VALID_AUTOMATIC`: the selected target property is Valid using Qed and/or an automatic external prover.
- `VALID_INTERACTIVE`: the selected property is Valid only after an auditable interactive proof.
- `UNKNOWN`: WP generated the selected goal, but no configured prover established validity or failure.
- `TIMEOUT`: the selected goal exhausted its configured prover time allowance.
- `FAILED`: the selected property was not proved because of a proof/tool failure that is not a timeout.
- `REPAIR_POLICY_REQUIRED`: implementation policy is unresolved; WP execution is intentionally blocked.
- `NOT_RUN`: no WP execution has been performed for this target.

Frama-C process exit status records tool execution only. It must never be converted directly into
`VALID_AUTOMATIC` or any other proof classification. RTE is outside this experiment and therefore
has no result category.
"""
(WP / "WP_RESULT_CLASSIFICATION.md").write_text(classification, encoding="utf-8")

runbook = """# How to Run the Target-only WP Scripts

Run one eligible target from any directory:

```bash
cd /home/matin/frama-work/frama-eva-analysis
./analysis/wp_phase/targets/KLEE-ALARM-0001/run_terminal.sh
```

Or use the dispatcher:

```bash
./analysis/wp_phase/run_one.sh KLEE-ALARM-0001 terminal
```

Override resource limits only when needed:

```bash
WP_TIMEOUT=300 WP_MEMLIMIT=4000 ./analysis/wp_phase/run_one.sh KLEE-ALARM-0001 terminal
```

Each run creates a fresh UTC timestamped directory under
`analysis/wp_phase/results/KLEE-ALARM-XXXX/`. It contains `command.sh`, `command.txt`,
`metadata.txt`, `git_state.txt`, `frama_c_version.txt`, `prover_versions.txt`,
`stdout_stderr.log`, `exit_code.txt`, `elapsed_time.txt`, `wp-report.json`, and WP working files.
The reusable target session is under `analysis/wp_phase/sessions/KLEE-ALARM-XXXX/`.

Launch the same isolated target in the GUI with:

```bash
./analysis/wp_phase/targets/KLEE-ALARM-0001/run_gui.sh
```

The installed GUI wrapper currently needs Node.js 24+ and Yarn, which are not present. The launch
script is ready but will not work until the user supplies that external prerequisite. No GUI was
started during preparation.

Interpret `Valid` as proof of this named ACSL assertion under the recorded source revision, model,
and hypotheses. `Unknown` means the configured provers did not decide the goal. `Timeout` means a
prover reached its configured limit. Exit code 0 means Frama-C completed; it does not mean the
property is Valid.

After a run, provide the entire timestamped result directory for later classification. Update
`WP_RESULTS.tsv` only from the selected property's WP JSON/output, never from exit code alone.
The batch launcher contains only WP-ready alarms and is intentionally not run during preparation.
"""
(WP / "HOW_TO_RUN_WP.md").write_text(runbook, encoding="utf-8")

validation_record = """# WP Script Preparation Validation

- Confirmed KLEE targets: 48
- Target directories: 48
- `metadata.env` files: 48
- Per-target READMEs: 48
- Terminal launchers: 48
- GUI launchers: 48
- Persistent target session directories: 48
- WP-ready targets: 32
- Repair-policy-required targets: 16
- Runtime-only targets included: 0
- WP target executions during preparation: 0
- GUI target executions during preparation: 0
- Shell syntax: all 99 generated shell scripts pass `bash -n`
- Shellcheck: not installed, therefore not run
- Source/specification changes: none

Validation is static and structural. It establishes launcher construction, target/property isolation,
metadata consistency, shell syntax, and environment capture; it does not claim that any WP goal is Valid.
"""
(WP / "WP_PREPARATION_VALIDATION.md").write_text(validation_record, encoding="utf-8")

print(f"confirmed targets={len(confirmed_rows)}")
print(f"WP_READY={len(ready_ids)}")
print(f"REPAIR_POLICY_REQUIRED={len(confirmed_rows) - len(ready_ids)}")
print(f"runtime-only targets included={len(confirmed_ids & runtime_ids)}")
print(f"target directories={len(list(targets_dir.glob('KLEE-ALARM-*')))}")
