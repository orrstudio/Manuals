#!/usr/bin/env bash
# Show what removing a package would take with it, before touching anything.
# Usage: pkg-remove-check.sh <package> [package...]
set -uo pipefail

if [ "$#" -eq 0 ]; then
    echo "usage: $0 <package> [package...]" >&2
    exit 2
fi

for pkg in "$@"; do
    echo "== $pkg"
    if ! pacman -Q "$pkg" >/dev/null 2>&1; then
        echo "   not installed"
        continue
    fi
    pacman -Qi "$pkg" | grep -iE 'Требуется|Required By|Конфликтует|Conflicts With' || true
    echo "   simulation:"
    sudo -A pacman -Rd --print "$pkg" 2>&1 | sed 's/^/   /'
done
