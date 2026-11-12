#!/usr/bin/env bash
# Единый запуск голосового ввода SuperWhisper:
#   1) toggle  — старт/стоп записи (через sw-toggle)
#   2) таймер  — автостоп через 60 секунд (sw-record-timeout.sh)
# Используется биндом Ctrl+Tab в Niri и кнопкой в панели Noctalia.

"$HOME/.local/bin/sw-toggle" &
"$HOME/.local/bin/sw-record-timeout.sh" &
