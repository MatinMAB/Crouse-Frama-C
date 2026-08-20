#!/usr/bin/env python3
"""Update auditable status fields in the confirmed repair-target manifest."""

from __future__ import annotations

import argparse
import csv
from pathlib import Path


MANIFEST = Path(__file__).resolve().parent / "48_CONFIRMED_REPAIR_TARGETS.tsv"

parser = argparse.ArgumentParser()
parser.add_argument("--ids", nargs="+", required=True)
parser.add_argument("--status", required=True)
parser.add_argument("--commit", default="PENDING_COMMIT_HASH")
parser.add_argument("--affected", default="NONE_IDENTIFIED")
parser.add_argument("--rationale", required=True)
arguments = parser.parse_args()

with MANIFEST.open(newline="", encoding="utf-8") as stream:
    reader = csv.DictReader(stream, delimiter="\t")
    headers = list(reader.fieldnames or [])
    rows = list(reader)

requested = set(arguments.ids)
found = {row["KLEE Alarm ID"] for row in rows if row["KLEE Alarm ID"] in requested}
if found != requested:
    raise SystemExit(f"unknown confirmed target IDs: {sorted(requested - found)}")

for row in rows:
    if row["KLEE Alarm ID"] not in requested:
        continue
    row["Repair Status"] = arguments.status
    row["Repair Commit"] = arguments.commit
    row["Additionally Affected Alarm IDs"] = arguments.affected
    row["Repair Rationale"] = arguments.rationale

with MANIFEST.open("w", newline="", encoding="utf-8") as stream:
    writer = csv.DictWriter(
        stream,
        fieldnames=headers,
        delimiter="\t",
        lineterminator="\n",
        extrasaction="ignore",
    )
    writer.writeheader()
    writer.writerows(rows)
