#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
# shellcheck source=../../lib/wp_common.sh
source "$SCRIPT_DIR/../../lib/wp_common.sh"
# shellcheck source=metadata.env
source "$SCRIPT_DIR/metadata.env"
wp_run_gui
