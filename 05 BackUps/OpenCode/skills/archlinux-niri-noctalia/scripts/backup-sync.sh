#!/usr/bin/env bash
# Mirror files into the backup and refresh package lists.
#
# Usage:
#   printf '%s\n' "$HOME/.config/niri/config.kdl|.config/niri/config.kdl" \
#     | backup-sync.sh "$HOME/GitHub/Manuals/05 BackUps/niri"
#
# stdin: one "source|relative-dest" pair per line (relative to backup_root).
# Prints "ok <dst>" or "DIFF <dst>"; exits 1 if any file differs.
set -uo pipefail

root="${1:?usage: backup-sync.sh <backup_root>}"
root="${root%/}"
fail=0

while IFS='|' read -r src rel; do
    [ -n "${src:-}" ] || continue
    [ -n "${rel:-}" ] || { echo "skip (no dest): $src" >&2; fail=1; continue; }
    dst="$root/$rel"

    if [ ! -e "$src" ]; then
        echo "MISSING $src" >&2
        fail=1
        continue
    fi

    mkdir -p "$(dirname "$dst")"
    cp -p "$src" "$dst"
    if diff -q "$src" "$dst" >/dev/null; then
        echo "ok $rel"
    else
        echo "DIFF $rel"
        fail=1
    fi
done

sys="$root/system"
if [ -d "$sys" ]; then
    pacman -Qqe > "$sys/pkglist.txt"
    pacman -Qqm > "$sys/aurlist.txt" 2>/dev/null || true
    flatpak list --app --columns=application,origin > "$sys/flatpak-list.txt" 2>/dev/null || true
    systemctl list-unit-files --state=enabled --no-pager > "$sys/systemd-enabled.txt" 2>/dev/null || true
    systemctl --user list-unit-files --state=enabled --no-pager > "$sys/systemd-user-enabled.txt" 2>/dev/null || true
    echo "ok system lists"
fi

exit "$fail"
