#!/usr/bin/env bash
# Run a privileged command through sudo -A (rofi askpass).
# Usage: sudo-a.sh <command> [args...]
set -euo pipefail

if [ -z "${SUDO_ASKPASS:-}" ]; then
    export SUDO_ASKPASS="$HOME/.local/bin/rofi-askpass"
fi

if [ ! -x "$SUDO_ASKPASS" ]; then
    echo "error: askpass helper not executable: $SUDO_ASKPASS" >&2
    exit 1
fi

exec sudo -A "$@"
