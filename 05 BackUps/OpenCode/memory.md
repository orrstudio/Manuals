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
   - **Стандартные Niri:** Mod+1-9 (рабочие столы), Print (скриншот), Mod+J (фокус вниз), Mod+Left/Right (фокус колонок)
   - `Mod+T` → `wezterm` (terminator и alacritty удалены)
   - `Mod+D` → `rofi -show drun` (меню приложений)
   - `Mod+E` → `nautilus` (файловый менеджер; раньше был мёртвый Super+F, перекрытый Mod+F)
   - `Mod+A` → `sw-start.sh` (голосовой ввод SuperWhisper + таймер; было Ctrl+Tab)
   - `Mod+B` → `gtk-launch zen` (Zen Browser)
   - `Mod+G` → `gtk-launch io.github.shiftey.Desktop` (GitHub Desktop, flatpak)
   - `Mod+X` → `noctalia msg panel-toggle clipboard` (история буфера; было Mod+Shift+X)
   - `Mod+S` → `pkill orca || GDK_BACKEND=wayland orca` (Orca; было Super+Alt+S)
   - `Mod+K` → `show-hotkey-overlay` (список хоткеев; было Mod+Shift+Slash)
   - `Mod+L` → `noctalia msg session lock` (блокировка; было Super+Alt+L)
   - `Mod+Up` / `Mod+Down` → переключение рабочих столов (столы в niri вертикальные)
   - `Mod+Tab` → предыдущий рабочий стол
   - Убрано по решению пользователя: `Mod+Shift+C` (центр управления), `Mod+A` → лаунчер, dock (`dock.enabled = false`), `Mod+Shift+E` (quit), `Mod+Shift+P` (power-off-monitors — не смог вернуть экран), `Mod+Escape` (инхибитор клавиш), `Mod+H` (дубль `Mod+Left`), `Mod+J` (фокус окна вниз), `Mod+Page_Up/Down` и `Mod+U/I` (дубли `Mod+Up/Down`), `Mod+Ctrl+U/I` и `Mod+Shift+U/I` (дубли Page-вариантов), `Mod+Shift+H/J/K/L` (дубли стрелок фокуса монитора), буквенные дубли перемещения `Mod+Ctrl+H/J/K/L` и `Mod+Shift+Ctrl+H/J/K/L`
   - `Pause` → `spawn-sh "/home/orr/.local/bin/say-clipboard"` (озвучка буфера)
   - `Ctrl+Pause` → `spawn-sh "/home/orr/.local/bin/translate-clipboard"` (перевод буфера)
   - `Ctrl+Shift+Pause` → `spawn-sh "/home/orr/.local/bin/translate-clipboard --paste"` (перевод + вставка)
   - `Print` → `spawn "niri" "msg" "action" "screenshot"` (скриншот)
   - `XF86MonBrightnessUp/Down` → `brightnessctl` (яркость, после udev-правила)
   - Все `XF86Audio*` и `XF86MonBrightness*` — `hotkey-overlay-title=null` (работают, но в списке `Mod+K` не показываются)

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

### ORCA (экранный диктор) — с 2026-11-15:
- Пакет `orca 51.1`, запуск по `Super+Alt+S`: `pkill orca || GDK_BACKEND=wayland orca`.
  - **Обязательно `GDK_BACKEND=wayland`**: с X11-бэкендом Orca падает на `X Error ... XkbSetMap` и молча умирает.
- Модификатор Orca — `Insert` (внешняя клавиатура; встроенная клавиатура ноутбука испорчена — не использовать). Настройка: `org.gnome.Orca.Keybindings desktop-modifier-keys = ['Insert','KP_Insert']`.
- **`Insert+Пробел` = открыть НАСТРОЙКИ Orca** (не плоский обзор!). `Insert+Ctrl+Пробел` = настройки текущего приложения.
- Плоский обзор (flat review, keyboard-layout = `desktop`): **`KP_Subtract`** (минус на цифровом блоке) — вход/выход.
  - Навигация: `KP_Home` (предыдущая строка), `KP_Up` (текущая), `KP_Page_Up` (следующая), `Insert+KP_Home/End` (начало/конец строки), `Insert+KP_Up/Page_Up` — по словам/символам.
  - Альтернатива: переключить `keyboard-layout` на `laptop` → flat review = `Insert+P`, строки `Insert+U/I/O`.
- `Insert+H` — справка по командам Orca; `Insert+Shift+D` — монитор речи (показывает произносимый текст).
- Терминал Orca **не читает** (эмуляторы терминалов не отдают содержимое через AT-SPI; озвучивается только ввод). Проверять чтение в Firefox/GTK-приложениях; при необходимости `accessibility.browsewithcaret` в about:config.
- Key echo (озвучивание нажатий) = `org.gnome.Orca.TypingEcho`: `key-echo true`, `alphabetic-keys true`, `character-echo false` — оставлено по решению пользователя.

### Синтез речи для Orca (speech-dispatcher + piper):
- `~/.config/speech-dispatcher/speechd.conf`: `AddModule "piper" "sd_generic" "piper.conf"`, `AddModule "espeak-ng" "sd_espeak-ng" "espeak-ng.conf"`, `DefaultModule piper`, `DefaultLanguage ru`.
- Модуль piper лежит в двух местах (полная синхронизация): `~/.config/speech-dispatcher/modules/piper.conf` и `/etc/speech-dispatcher/modules/piper.conf`.
  - Содержимое: `GenericExecuteSynth` → `~/.local/bin/piper-speechd`; `GenericLanguage ru ru_RU utf-8`; **`AddVoice "ru" "FEMALE1" "irina"`**.
- **Критично**: `sd_generic` без `AddVoice` не инициализируется (`module does not have any voice`), speech-dispatcher молча падает на `espeak-ng` — отсюда «робот с английским акцентом».
- `~/.local/bin/piper-speechd`: stdin → `piper --model ru_RU-irina-medium.onnx --length_scale 0.6 -q --output_file -` → `pw-play -`. Скорость 0.6 — как в читалке буфера (`SAY_SPEED=0.6`), быстрее нормы.
- Резервный модуль — `espeak-ng` (подключён). Читатель буфера `say-clipboard` не затронут: он использует Silero/piper напрямую, spd-say там только резерв.
- Альтернатива с мгновенным откликом — RHVoice: пакеты `rhvoice-voice-anna`, `rhvoice-voice-aleksandr`, `rhvoice-voice-aleksandr-hq` установлены (голоса есть, конфига модуля нет); переключение = `DefaultModule rhvoice` после создания `rhvoice.conf`.
- Диагностика: лог `/run/user/1000/speech-dispatcher/log/speech-dispatcher.log` (и `piper.log`), проверка `spd-say -L`, `spd-say -o piper -w "текст"`.

### Orca: что осталось и что удалено (2026-11-16):
- Оставлен только GNOME Orca (скринридер): пакет `orca`, бинд `Mod+S`, настройки speech-dispatcher (piper).
- Удалено по решению пользователя: `stably-orca-bin` (Stably Orca), `/opt/orca-server`, `/usr/local/bin/orca-ide`, `~/.config/orca` (920 МБ, аккаунты), закладка Orca в Bookmarks, бэкап `system/usr/bin/stably-orca`.

### Qt-приложения (тёмная тема):
- Qt6 не наследует GTK-тему (qtpass выглядел светлым на тёмной системе).
- Установлен `qt6ct`; конфиг `~/.config/qt6ct/qt6ct.conf`: `style=Fusion`, `color_scheme_path=/usr/share/qt6ct/colors/darker.conf`, `custom_palette=true`, `[Fonts] general/fixed = Adwaita Sans/Mono 16pt`.
- В `~/.bashrc`: `export QT_QPA_PLATFORMTHEME="qt6ct"` (действует на все Qt-приложения, применяется после перелогина).
- Проверка без перелогина: `QT_QPA_PLATFORMTHEME=qt6ct qtpass`.

### Яркость (brightnessctl):
- Установлен `brightnessctl`; создано `/etc/udev/rules.d/90-backlight.rules` (`chgrp video` + `chmod g+w` на `/sys/class/backlight/*/brightness`); пользователь `orr` добавлен в группу `video`.
- Бинды `XF86MonBrightnessUp/Down` → `brightnessctl --class=backlight set +10%/-10%`. Проверка: `brightnessctl -m`.

### БЭКАП:
- Папка: `~/GitHub/Manuals/05 BackUps/niri/` — структура повторяет домашнюю (`niri/` = `~/`)
- Реестр: `~/GitHub/Manuals/05 BackUps/niri/BACKUP-MANIFEST.md`
- Бэкапим: 11 скриптов `~/.local/bin/` (включая `piper-speechd`), `config.kdl`, `settings.toml`, `state.toml`, `plugins/data/`, конфиги `speech-dispatcher/` (speechd.conf + modules/piper.conf), системные копии в `system/etc/` (udev backlight, `speech-dispatcher/modules/piper.conf`)
- НЕ бэкапим: `plugins/sources/` (31 МБ), `plugins/materialized/`, `plugin-cache/`, `community-palettes/`, `community-templates/` — Noctalia скачивает сама

### ПРИЧИНЫ ВСЕХ ИЗМЕНЕНИЙ:

1. **auto_paste_enabled: true** — SuperWhisper вызывал `hyprctl` (команда Hyprland), которого нет на Niri, и падал с `FileNotFoundError`. Создан stub `~/.local/bin/hyprctl`, возвращающий `{"class": ""}`. После этого auto_paste включён (`true`) — по решению пользователя не менять.

2. **Модель medium** (была tiny, base, small) — tiny давала плохое качество, base лучше, small — оптимум, medium — ещё лучше качество.

3. **Английская озвучка**: Piper Amy (en_US-amy-medium.onnx) сломан — ошибка "Phonemes must be one codepoint" при любом тексте. Переключён на `en_US-lessac-high` (файл есть, 114 МБ). Резерв: spd-say → espeak-ng.

4. **Конфиг Niri полностью заменён на стандартный** из resources/default-config.kdl (офиал niri-wm/niri) + наши привязки добавлены в конец секции binds. Все стандартные привязки Niri восстановлены.

5. **Автостоп записи 60 с**: таймер `sw-record-timeout.sh` запускается вместе с записью (`sw-start.sh`). Проверяет последнее событие в логе; если запись идёт ≥ 60 с — шлёт `sw-toggle` (стоп) и уведомление «60 секунд истекли — запись остановлена».

6. **Причина «самозапуска» записи (2026-11-11)**: не автозапуск. Запись стартовала по `Ctrl+Tab` (18:43:48), второй раз клавишу не нажали — запись шла 4 ч 54 мин. Уведомления не показывались: `org.freedesktop.Notifications` был недоступен (Noctalia не запущена). Решение: таймер 60 с + рабочие уведомления.