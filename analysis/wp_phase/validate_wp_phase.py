#!/usr/bin/env python3
"""Compatibility entry point for the final WP evidence validator."""

from pathlib import Path
import runpy

runpy.run_path(
    str(Path(__file__).resolve().parent / "scripts" / "validate_wp_phase.py"),
    run_name="__main__",
)
