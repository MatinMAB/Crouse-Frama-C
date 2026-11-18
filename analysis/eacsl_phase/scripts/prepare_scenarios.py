#!/usr/bin/env python3
"""Create untracked source views for control, full, and selective scenarios."""

from __future__ import annotations

import csv
import json
import re
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
PHASE = ROOT / "analysis" / "eacsl_phase"
WORK = PHASE / "work" / "generated"
SELECTION = PHASE / "data" / "eacsl_selection_matrix.tsv"
SOURCE_NAMES = ("MulHword.c", "avrg_Ccode.c", "div_Ccode.c", "hip_Ccode.c", "mul_Ccode.c", "rotatefunc.c")
LABEL = re.compile(r"eva_klee_alarm_(\d{4})")
ACSL_BLOCK = re.compile(r"/\*@.*?\*/", re.DOTALL)


with SELECTION.open(newline="", encoding="utf-8") as stream:
    rows = list(csv.DictReader(stream, delimiter="\t"))

all_ids = {row["alarm_id"] for row in rows}
selected_ids = {row["alarm_id"] for row in rows if row["selected_for_eacsl"] == "YES"}
if len(all_ids) != 149 or len(selected_ids) != 101:
    raise SystemExit("selection matrix does not contain the frozen 149/101 sets")


def disabled(block: str, alarm_number: str | None) -> str:
    description = (
        f"/* E-ACSL selection disabled KLEE-ALARM-{alarm_number} */"
        if alarm_number else "/* E-ACSL auxiliary annotation disabled */"
    )
    return description + "\n" * block.count("\n")


def generate(name: str, active_ids: set[str]) -> None:
    destination = WORK / name
    source_dir = destination / "sources"
    header_dir = destination / "headers"
    source_dir.mkdir(parents=True, exist_ok=True)
    header_dir.mkdir(parents=True, exist_ok=True)
    for header in sorted((ROOT / "src_repaired" / "headers").glob("*")):
        if header.is_file():
            shutil.copy2(header, header_dir / header.name)
    for source_name in SOURCE_NAMES:
        source = ROOT / "src_repaired" / "sources" / source_name
        text = source.read_text(encoding="utf-8")

        def transform(match: re.Match[str]) -> str:
            block = match.group(0)
            label = LABEL.search(block)
            if not label:
                return disabled(block, None)
            alarm_id = f"KLEE-ALARM-{label.group(1)}"
            return block if alarm_id in active_ids else disabled(block, label.group(1))

        (source_dir / source_name).write_text(ACSL_BLOCK.sub(transform, text), encoding="utf-8")
    actual: list[str] = []
    for source in source_dir.glob("*.c"):
        for block in ACSL_BLOCK.finditer(source.read_text(encoding="utf-8")):
            label = LABEL.search(block.group(0))
            if label:
                actual.append(f"KLEE-ALARM-{label.group(1)}")
    if len(actual) != len(set(actual)) or set(actual) != active_ids:
        raise SystemExit(f"{name}: active assertion set mismatch")
    (destination / "selection.json").write_text(
        json.dumps({
            "scenario": name,
            "selected_count": len(active_ids),
            "selected_alarm_ids": sorted(active_ids),
            "canonical_source_revision": "09e759283a6f1f9483cb560873e0b97d544fa714",
            "current_wp_base": "e79f62404a280add6f5bc63610a9fe1803e37c16",
            "selection_mechanism": "DETERMINISTIC_SOURCE_VIEW_WITH_LINE_COUNT_PRESERVATION",
        }, indent=2) + "\n", encoding="utf-8",
    )
    print(f"{name}: {len(actual)} unique active target assertions")


generate("control", set())
generate("full", all_ids)
generate("selective", selected_ids)
