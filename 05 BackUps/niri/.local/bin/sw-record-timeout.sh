#!/usr/bin/env bash
# Автостоп записи SuperWhisper через 60 секунд.
# Запускается вместе с биндом Ctrl+Tab (старт записи).
# Если запись всё ещё идёт по истечении таймаута — отправляет toggle (стоп).

LOG="$HOME/.config/superwhisper-linux/logs/superwhisper.log"
SW_TOGGLE="$HOME/.local/bin/sw-toggle"
TIMEOUT=60

sleep "$TIMEOUT"

[ -f "$LOG" ] || exit 0

# Последнее событие записи в логе
last=$(grep -E 'Recording (started|stopped|blocked)' "$LOG" | tail -1)

case "$last" in
    *"Recording started"*) ;;
    *) exit 0 ;;
esac

# Время старта записи из строки лога: "YYYY-MM-DD HH:MM:SS | ..."
ts=$(echo "$last" | cut -d'|' -f1 | sed 's/[[:space:]]*$//')
start_epoch=$(date -d "$ts" +%s 2>/dev/null) || exit 0
now=$(date +%s)
elapsed=$((now - start_epoch))

# Если запись идёт дольше таймаута — останавливаем
if [ "$elapsed" -ge "$TIMEOUT" ]; then
    notify-send "SuperWhisper" "60 секунд истекли — запись остановлена"
    "$SW_TOGGLE"
fi
