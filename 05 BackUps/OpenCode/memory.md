# Память OpenCode

## VOX TYPE (голосовой ввод)
Система: Arch + Niri на Wayland, GTX 1650 (Vulkan). Desktop shell: **Noctalia**.

## ТЕКУЩИЙ СТАТУС: VOICE INPUT + TTS + TRANSLATE (Niri / Arch)

### ВЕРНЫЕ ДЕЙСТВИЯ (работает):

1. **SuperWhisper Linux** (github.com/adityasinghcodes/superwhisper-linux)
   - `~/superwhisper-linux`, uv venv, команда `superwhisper` в `~/.local/bin/`
   - Модель: **medium** (заменена с tiny/base для лучшего качества)
   - Язык: ru, устройство: auto, auto_paste: **true** (включён, не трогать — решение пользователя)
   - Конфиг: `~/.config/superwhisper-linux/config.json`
   - Логи: `~/.config/superwhisper-linux/logs/superwhisper.log`

2. **Niri горячие клавиши** (`~/.config/niri/config.kdl` — стандартный конфиг niri-wm/niri + наши добавления):
   - **Стандартные Niri:** Mod+T (foot), Mod+D (fuzzel), Mod+Shift+Slash (помощь), Alt+Q (quit), Alt+стрелки (фокус), Mod+стрелки (перемещение окон), Mod+1-9 (рабочие столы), Print (скриншот), и многие другие
   - `Super+D` → `spawn "rofi" "-show" "drun"` (меню приложений Rofi)
- `Super+Shift+T` → `spawn "terminator"` (терминал Terminator)
   - `Pause` → `spawn-sh "/home/orr/.local/bin/say-clipboard"` (озвучка буфера)
   - `Ctrl+Pause` → `spawn-sh "/home/orr/.local/bin/translate-clipboard"` (перевод буфера)
   - `Ctrl+Shift+Pause` → `spawn-sh "/home/orr/.local/bin/translate-clipboard --paste"` (перевод + вставка)
   - `Ctrl+Tab` → `spawn-sh "/home/orr/.local/bin/sw-toggle"` (голосовой ввод SuperWhisper)
   - `Print` → `spawn "niri" "msg" "action" "screenshot"` (скриншот)

3. **TTS-читалка** (`~/.local/bin/say-clipboard`):
   - Русский: Silero (baya) → Piper Irina → RHVoice → espeak-ng
   - Английский: Piper lessac-high → spd-say → espeak-ng (Amy СЛОМАН, ошибка кодпоинтов)
   - Повторное нажатие = стоп
   - Лог отладки: `/run/user/1000/say-clipboard.log`

4. **Переменные окружения** (`~/.bashrc`):
   ```bash
   export SAY_VOICE="ru_RU-irina-medium"
   export SAY_SPEED="0.6"
   export SAY_VOICE_EN="en_US-lessac-high"
   export SAY_SPEED_EN="0.7"
   export SILERO_VOICE="baya"
   export SILERO_TEMPO="1.3"
   export SAY_RU_ENGINE="silero"
   ```

5. **hyprctl stub** (`~/.local/bin/hyprctl`):
   - Возвращает `{"class": ""}` для `hyprctl activewindow -j`
   - Нужно SuperWhisper, который иначе падает с FileNotFoundError на Niri

6. **Раскладка клавиатуры:** us+ru, переключение Super+Пробел (xkb в config.kdl)

### НЕВЕРНЫЕ ДЕЙСТВИЯ (исправлены):

1. **auto_paste отключён** — hyprctl не существует на Niri, вызывал ошибку. Создан stub `~/.local/bin/hyprctl` (возвращает `{"class": ""}`), после чего auto_paste включён обратно (`true`).
2. **Английский голос piper Amy сломан** (ошибка кодпоинтов) — заменён на lessac-high в say-clipboard
3. **Конфиг Niri полностью перезаписан стандартным** из resources/default-config.kdl + наши привязки добавлены в конец секции binds

### ТЕКУЩИЙ СТАТУС (всё работает):

| Функция | Статус | Клавиша/команда |
|---------|--------|-----------------|
| Микрофон / диктовка | ✅ Работает (модель medium) | **Ctrl+Tab** (нажать → говорить; автостоп через 60 с) |
| Транскрибация | ✅ Работает (~12с на 60с аудио) | Автоматически после остановки записи |
| Озвучка русского | ✅ Работает (Silero baya → Piper Irina) | **Pause** |
| Озвучка английского | ⚠️ Нужно проверить (Piper lessac-high → spd-say → espeak-ng) | **Pause** |
| Перевод буфера (только буфер) | ✅ Работает | **Ctrl+Pause** |
| Перевод + вставка в курсор | ✅ Работает | **Ctrl+Shift+Pause** |
| Вставка текста из буфера | ✅ Работает (wtype) | **Ctrl+Shift+V** |
| Скриншот | ✅ Работает | **Print** |
| Раскладка us+ru | ✅ Работает | **Super+Пробел** |
| Rofi (меню приложений) | ✅ Работает | **Super+D** |

### Ключевые файлы:
- `~/.config/superwhisper-linux/config.json` — модель medium, auto_paste: true, язык ru
- `~/.config/niri/config.kdl` — стандартный Niri конфиг + наши биндинги (Super+D, Pause, Ctrl+Pause, Ctrl+Shift+Pause, Ctrl+Tab, Print); 124 русских `hotkey-overlay-title`
- `~/.local/bin/say-clipboard` — английский: lessac-high (первый) → spd-say → espeak-ng (Amy сломан, ошибка кодпоинтов)
- `~/.local/bin/sw-toggle` — обёртка для superwhisper toggle с PATH
- `~/.local/bin/sw-start.sh` — единый запуск: sw-toggle + sw-record-timeout.sh
- `~/.local/bin/sw-record-timeout.sh` — таймер 60 с: автостоп записи + уведомление
- `~/.local/bin/hyprctl` — stub для Niri (SuperWhisper вызывает hyprctl activewindow -j)
- Логи SuperWhisper: `~/.config/superwhisper-linux/logs/superwhisper.log`
- Лог say-clipboard: `/run/user/1000/say-clipboard.log`

### NOCTALIA (desktop shell):
- Конфиг: `~/.local/state/noctalia/settings.toml`, состояние `state.toml`
- Панель `OrrPanel`; в центре после USB-флешки (`bar_4`) добавлены виджеты:
  - `say-clipboard` (глиф `microphone`) → `exec ~/.local/bin/say-clipboard`
  - `sw-record` (глиф `microphone-filled`) → `exec ~/.local/bin/sw-start.sh`
- Перезагрузка конфига: `noctalia msg config-reload`
- Плагин `blackbartblues/keymap` (v1.5.2, помечен **deprecated**, но работает) — описания берёт из `hotkey-overlay-title` в `config.kdl`. Замена при поломке: `kenn/keybind-cheatsheet` (нет ru-перевода).

### БЭКАП:
- Папка: `~/GitHub/Manuals/05 BackUps/niri/` — структура повторяет домашнюю (`niri/` = `~/`)
- Реестр: `~/GitHub/Manuals/05 BackUps/niri/BACKUP-MANIFEST.md`
- Бэкапим: 10 скриптов `~/.local/bin/`, `config.kdl`, `settings.toml`, `state.toml`, `plugins/data/`
- НЕ бэкапим: `plugins/sources/` (31 МБ), `plugins/materialized/`, `plugin-cache/`, `community-palettes/`, `community-templates/` — Noctalia скачивает сама

### ПРИЧИНЫ ВСЕХ ИЗМЕНЕНИЙ:

1. **auto_paste_enabled: true** — SuperWhisper вызывал `hyprctl` (команда Hyprland), которого нет на Niri, и падал с `FileNotFoundError`. Создан stub `~/.local/bin/hyprctl`, возвращающий `{"class": ""}`. После этого auto_paste включён (`true`) — по решению пользователя не менять.

2. **Модель medium** (была tiny, base, small) — tiny давала плохое качество, base лучше, small — оптимум, medium — ещё лучше качество.

3. **Английская озвучка**: Piper Amy (en_US-amy-medium.onnx) сломан — ошибка "Phonemes must be one codepoint" при любом тексте. Переключён на `en_US-lessac-high` (файл есть, 114 МБ). Резерв: spd-say → espeak-ng.

4. **Конфиг Niri полностью заменён на стандартный** из resources/default-config.kdl (офиал niri-wm/niri) + наши привязки добавлены в конец секции binds. Все стандартные привязки Niri восстановлены.

5. **Автостоп записи 60 с**: таймер `sw-record-timeout.sh` запускается вместе с записью (`sw-start.sh`). Проверяет последнее событие в логе; если запись идёт ≥ 60 с — шлёт `sw-toggle` (стоп) и уведомление «60 секунд истекли — запись остановлена».

6. **Причина «самозапуска» записи (2026-11-11)**: не автозапуск. Запись стартовала по `Ctrl+Tab` (18:43:48), второй раз клавишу не нажали — запись шла 4 ч 54 мин. Уведомления не показывались: `org.freedesktop.Notifications` был недоступен (Noctalia не запущена). Решение: таймер 60 с + рабочие уведомления.