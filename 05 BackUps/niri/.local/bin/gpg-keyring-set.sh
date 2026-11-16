#!/usr/bin/env bash
# Сохранить GPG-пароль в gnome-keyring (для авторазблокировки gpg-agent).
# Пароль вводится в окне rofi (скрытый ввод).
set -u
pw=$(rofi -dmenu -password -p "GPG passphrase" -lines 0) || exit 1
[ -n "$pw" ] || exit 1
printf '%s' "$pw" | secret-tool store --label="GPG passphrase" service gpg key gpg-passphrase && \
  echo "Пароль сохранён в gnome-keyring."
