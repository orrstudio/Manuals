# Голосовой ввод и TTS — сводка

Процедуры (установка, speech-dispatcher, Orca, piper-модуль) — скилл `archlinux-niri-noctalia`, `references/tts-orca.md`. Здесь — что установлено и грабли.

## Диктовка (SuperWhisper)

- Репозиторий `~/superwhisper-linux`, uv venv, команда `superwhisper` в `~/.local/bin/`
- Модель `medium`, язык ru, `auto_paste: true` — решение пользователя
- Конфиг `~/.config/superwhisper-linux/config.json`, логи `~/.config/superwhisper-linux/logs/`
- Бинд `Mod+A` → `~/.local/bin/sw-start.sh` (запись + таймер 60 с)
- `sw-record-timeout.sh` — автостоп через 60 с и уведомление
- `hyprctl` stub (`~/.local/bin/hyprctl`) возвращает `{"class":""}` — без него SuperWhisper падает на Niri

## Читалка буфера (`~/.local/bin/say-clipboard`)

- Русский: Silero (baya) → piper Irina → RHVoice → espeak-ng
- Английский: piper lessac-high → spd-say → espeak-ng (**Amy сломан**)
- Повторное нажатие во время чтения = полный стоп
- Смешанный текст (кириллица + латиница) читается русским голосом целиком
- Лог: `/run/user/$(id -u)/say-clipboard.log`

Переменные (`~/.bashrc`, без правки скриптов):

```bash
SAY_VOICE="ru_RU-irina-medium"   SAY_SPEED="0.6"
SAY_VOICE_EN="en_US-lessac-high" SAY_SPEED_EN="0.7"
SILERO_VOICE="baya"              SILERO_TEMPO="1.3"
SAY_RU_ENGINE="silero"
```

## Перевод буфера (`~/.local/bin/translate-clipboard`)

- `Ctrl+Pause` — перевести буфер (ru→en / en→ru), результат заменяет буфер
- `Ctrl+Shift+Pause` — перевести и вставить в курсор
- Движок: translate-shell (Google)

## Правила, проверенные опытом

- **Piper Amy сломан** при любом тексте: `Phonemes must be one codepoint`. Не возвращать; английский — `lessac-high` (файл 114 МБ уже есть).
- **Silero живёт в venv** `~/.local/share/silero-venv`; при его удалении русский автоматически уйдёт на piper Irina, затем на RHVoice.
- **Не редактировать скрипты ради скорости**: всё вынесено в переменные окружения.
- Читалка и скринридер Orca независимы: `say-clipboard` использует Silero/piper напрямую, `spd-say` там только резерв.

## Откат

- Вернуть Irina основным: `SAY_RU_ENGINE=piper say-clipboard` или убрать блок Silero.
- Вернуть прежнюю скорость: `SAY_SPEED=0.7`.
- Выключить перевод: убрать бинды `Ctrl+Pause` / `Ctrl+Shift+Pause` из `config.kdl`.
- Полное удаление Silero: `rm -rf ~/.local/share/silero-venv` (упадёт на piper/RHVoice).

## Файлы

Скрипты (`say-clipboard`, `sw-*`, `translate-clipboard`, `hyprctl`) — в `~/.local/bin/`, бэкапятся. Полный перечень — `MIRRORS.md`.
