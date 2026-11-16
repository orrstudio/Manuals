#!/usr/bin/env bash
# Предзагрузить GPG-пароль из gnome-keyring в gpg-agent (без запросов).
# Вызывается при входе (после разблокировки keyring). Пароль в файлах не хранится.
set -u

GRIP="FF85282E1D00D7F747166C089623454FC92DFEED"   # keygrip субключа шифрования [E]
PRESET="/usr/lib/gnupg/gpg-preset-passphrase"

pw=$(secret-tool lookup service gpg key gpg-passphrase 2>/dev/null) || exit 0
[ -n "$pw" ] || exit 0

printf '%s' "$pw" | "$PRESET" --preset "$GRIP" >/dev/null 2>&1
