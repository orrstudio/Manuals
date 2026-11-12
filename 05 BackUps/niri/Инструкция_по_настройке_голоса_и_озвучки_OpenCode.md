# Инструкция по настройке голосового ввода (VoxType) и читалки (TTS)

**Дата создания:** 11 ноября 2026  
**Компьютер:** Arch Linux, GTX 1650 (Vulkan)  
**Цель:** перенос всей конфигурации голосового ввода и озвучки текста на другой компьютер

---

## Содержание

1. [Резервные копии файлов (скопированы рядом с инструкцией)](#резервные-копии-файлов)
2. [Как проверить какую графическую оболочку используем](#как-проверить-графическую-оболочку)
3. [Голосовой ввод (VoxType / STT)](#голосовой-ввод-voxtype-stt)
4. [Озвучка текста / Читалка (TTS)](#озвучка-текста-tts-читалка)
5. [Переменные окружения](#переменные-окружения)
6. [Горячие клавиши — GNOME](#горячие-клавиши-gnome)
7. [Горячие клавиши — Niri + Noctalia](#горячие-клавиши-niri--noctalia)
8. [Список всех файлов и путей](#список-файлов-и-путей)
9. [Как перенести на другой компьютер](#как-перенести-на-другой-компьютер)
10. [Проверка работоспособности](#проверка-работоспособности)

---

## 1. Резервные копии файлов (скопированы рядом с инструкцией)

Все исходные файлы конфигурации скопированы в папку:
```
/home/orr/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/
```

Содержимое папки:

| Файл | Назначение | Куда копировать на новом компьютере |
|------|------------|-------------------------------------|
| `config.toml` | Конфиг voxtype | `~/.config/voxtype/config.toml` |
| `say-clipboard` | Основной скрипт озвучки буфера | `~/.local/bin/say-clipboard` |
| `silero-generate` | Генератор Silero TTS | `~/.local/bin/silero-generate` |
| `text-split-runs` | Разбивка текста по алфавиту | `~/.local/bin/text-split-runs` |
| `translate-clipboard` | Перевод буфера обмена | `~/.local/bin/translate-clipboard` |

**Важно:** после копирования скриптов в `~/.local/bin/` обязательно выдать им права на выполнение:
```bash
chmod +x ~/.local/bin/say-clipboard ~/.local/bin/silero-generate ~/.local/bin/text-split-runs ~/.local/bin/translate-clipboard
```

---

## 2. Как проверить какую графическую оболочку используем

Перед настройкой горячих клавиш определите, какая у вас оболочка (Wayland композитор):

```bash
# Способ 1: через переменную окружения
echo $XDG_CURRENT_DESKTOP

# Способ 2: через lshw / встроенные инструменты
loginctl show-session $(loginctl | grep $(whoami) | awk '{print $1}') -p Type

# Способ 3: для GNOME
gsettings get org.gnome.desktop.wm.preferences theme

# Способ 4: для Niri
niri msg workspaces 2>/dev/null && echo "Это Niri" || echo "Это не Niri"
```

**Возможные результаты:**
- `GNOME` → используйте раздел **Горячие клавиши — GNOME**
- `Niri` → используйте раздел **Горячие клавиши — Niri + Noctalia**
- `Noctalia` → используйте раздел **Горячие клавиши — Niri + Noctalia**

Настройте горячие клавиши **только для той оболочки, которая у вас установлена**.

---

## 3. Голосовой ввод (VoxType / STT)

### Что установлено
- **VoxType** (пакет `voxtype` из AUR, версия 1.1.1) — демон voice-to-text (речь в текст)
- **whisper.cpp** — backend транскрибации (модель `large-v3-turbo`, ~1.6 ГБ)
- **Silero VAD** (`ggml-silero-vad.bin`, ~885 КБ) — голосовая активность, отсекает тишину
- Модели хранятся в: `~/.local/share/voxtype/models/`

### Сервис
- Имя: `voxtype.service` (пользовательский systemd, включён и запущен)
- Команда запуска: `/usr/bin/voxtype -q daemon`
- Статус проверки: `systemctl --user status voxtype.service`

### Конфигурационный файл
`~/.config/voxtype/config.toml`

**Ключевые настройки (актуальные значения):**

| Раздел | Параметр | Значение | Пояснение |
|--------|----------|----------|-----------|
| `[hotkey]` | `key` | `"SCROLLLOCK"` | Клавиша push-to-talk (удерживать для записи) |
| `[hotkey]` | `modifiers` | `[]` | Дополнительные модификаторы (не используются) |
| `[hotkey]` | `mode` | `"push_to_talk"` (закомментировано) | Удержание = запись, отпускание = транскрибация |
| `[audio]` | `device` | `"default"` | Устройство ввода аудио |
| `[audio]` | `sample_rate` | `16000` | Частота дискретизации (whisper требует 16 кГц) |
| `[audio]` | `max_duration_secs` | `300` | Максимальная длительность записи |
| `[whisper]` | `backend` | `"local"` (закомментировано) | Локальный whisper.cpp |
| `[whisper]` | `model` | `"large-v3-turbo"` | Модель транскрибации |
| `[whisper]` | `language` | `["ru", "en", "az"]` | Автоопределение из 3 языков (турецкий удалён — путал с азербайджанским) |
| `[whisper]` | `translate` | `false` | Не переводить на английский |
| `[whisper]` | `flash_attention` | `true` | Включить flash attention для GPU (ускорение ~10%, память −75%) |
| `[output]` | `mode` | `"paste"` | Копировать в буфер + нажать Ctrl+V |
| `[output]` | `fallback_to_clipboard` | `true` | Резерв — только буфер обмена |
| `[output]` | `driver_order` | `["ydotool", "clipboard"]` | Приоритет драйверов ввода |
| `[output]` | `type_delay_ms` | `0` | Задержка между символами |
| `[output]` | `auto_submit` | `false` (закомментировано) | Не нажимать Enter автоматически |
| `[output.notification]` | `on_transcription` | `true` | Уведомление после расшифровки |
| `[osd]` | `frontend` | `"gtk4"` | OSD индикатор (на GNOME не работает — Layer Shell отсутствует, это нормально) |
| `[vad]` | `enabled` | `true` | VAD включён |
| `[vad]` | `backend` | `"whisper"` | Silero через whisper |
| `[vad]` | `threshold` | `0.5` | Порог чувствительности |
| `[vad]` | `min_speech_duration_ms` | `100` | Минимум речи для обнаружения |

### Модели (скачаны в `~/.local/share/voxtype/models/`)
- `ggml-large-v3-turbo.bin` (1,6 ГБ) — основная модель whisper
- `ggml-base.bin` (148 МБ)
- `ggml-base.en.bin` (148 МБ)
- `ggml-silero-vad.bin` (885 КБ) — модель VAD

### Полезные команды
```bash
voxtype status           # idle / recording / transcribing
voxtype setup check      # проверка цепочки вывода
voxtype info accel       # работает ли GPU (Vulkan)
voxtype info devices     # устройства ввода аудио
journalctl --user -u voxtype.service   # логи сервиса
```

### Важные замечания
- **Не ставить `initial_prompt` на азербайджанском** — при `language = ["ru", "en", "az"]` подсказка на одном языке перетягивает автоопределение и портит русский/английский.
- **Не использовать канату/жесты ScrollLock** — push-to-talk остаётся как есть.
- `spd-say` НЕ читает stdin без `-e`. Текст передавать аргументом: `spd-say -l ru -- "текст"`.
- `piper` из репозитория `extra` — это конфигуратор игровых мышей, НЕ TTS.

---

## 4. Озвучка текста / Читалка (TTS)

### Основной скрипт
`~/.local/bin/say-clipboard` — читает текст из буфера обмена и озвучивает его.

**Логика работы:**
1. Берёт текст из буфера через `wl-paste`
2. При повторном нажатии во время чтения — полный останов и выход
3. Определяет язык по алфавиту (кириллица / латиница / смешанный)
4. Озвучивает через подходящий движок с лестницей резервов

### Движки TTS и приоритет

| Язык | Основной | Резерв 1 | Резерв 2 | Резерв 3 |
|------|----------|----------|----------|----------|
| Русский | Silero (baya, tempo 1.3) | piper (ru_RU-irina-medium) | RHVoice (spd-say) | espeak-ng |
| Английский | piper (en_US-amy-medium) | spd-say -l en | espeak-ng | — |

### Установка piper (без пакетного менеджера)
Пакет `piper-tts` из AUR не собирается, `piper-tts-bin` не проходит контрольную сумму. Вместо этого:
- Официальный бинарник piper 1.2.0 скачан с GitHub
- Расположен: `~/.local/opt/piper/piper`
- Симлинк: `~/.local/bin/piper → /home/orr/.local/opt/piper/piper`
- Модели (с huggingface rhasspy/piper-voices): `~/.local/share/piper/voices/`

### Модели piper (в `~/.local/share/piper/voices/`)
| Файл | Язык | Голос | Размер |
|------|------|-------|--------|
| `ru_RU-irina-medium.onnx` | RU | Ирина (женский) | ~61 МБ |
| `ru_RU-denis-medium.onnx` | RU | Денис (мужской) | ~61 МБ |
| `en_US-amy-medium.onnx` | EN | Amy (женский) | ~63 МБ |
| `en_US-lessac-high.onnx` | EN | Lessac (высокое качество) | ~114 МБ |
| `en_US-ryan-high.onnx` | EN | Ryan (высокое качество) | ~121 МБ |

### Установка Silero TTS (венв)
- venv: `~/.local/share/silero-venv/` (python 3.14, torch 2.15.0+cpu, torchaudio, soundfile)
- Генератор: `~/.local/bin/silero-generate` (shebang на venv-питон)
- Модель: `snakers4/silero-models`, `silero_tts`, language=`ru`, speaker=`v4_ru`
- Голос: `baya`, темп: `1.3` (ffmpeg atempo)
- Примеры семплов: `/tmp/opencode/voice-samples/`

### Установленные системные пакеты TTS
`rhvoice`, `rhvoice-language-russian`, `rhvoice-voice-aleksandr-hq`, `speech-dispatcher`, `espeak-ng`, `festival`

### Переменные окружения для say-clipboard

| Переменная | Значение по умолчанию | Пояснение |
|------------|----------------------|-----------|
| `SAY_VOICE` | `ru_RU-irina-medium` | Голос piper для русского |
| `SAY_SPEED` | `0.6` | Скорость piper (`--length_scale`, меньше = быстрее) |
| `SAY_VOICE_EN` | `en_US-amy-medium` | Голос piper для английского |
| `SAY_SPEED_EN` | `0.7` | Скорость piper для английского |
| `SILERO_VOICE` | `baya` | Голос Silero (baya|kseniya|xenia|aidar|eugene) |
| `SILERO_TEMPO` | `1.3` | Темп Silero (ffmpeg atempo, 1.0 = естественный) |
| `SAY_RU_ENGINE` | `silero` | Движок для русского: `silero` или `piper` |

### Замеры скорости piper (одна фраза)
- 0.9 → 6.35 с
- 0.8 → 5.97 с
- 0.7 → 5.13 с
- 0.65 → 5.11 с
- 0.6 → 4.82 с (текущее)
- 0.5 → 4.32 с (ниже — тараторка)

### Как использовать say-clipboard
- **Горячая клавиша:** `Pause` — озвучить буфер обмена
- **Повторное нажатие:** остановить чтение
- Ограничение: 2000 символов
- Пустой буфер → голосом «Буфер обмена пуст»

---

## 5. Переменные окружения

Ниже перечислены все переменные, которые нужно задать на новом компьютере (добавить в `~/.bashrc`, `~/.zshrc`, `~/.profile` или `~/.config/environment.d/`):

```bash
# === TTS / say-clipboard ===
export SAY_VOICE="ru_RU-irina-medium"
export SAY_SPEED="0.6"
export SAY_VOICE_EN="en_US-amy-medium"
export SAY_SPEED_EN="0.7"
export SILERO_VOICE="baya"
export SILERO_TEMPO="1.3"
export SAY_RU_ENGINE="silero"

# === VoxType ===
# (конфигурация в ~/.config/voxtype/config.toml, переменные окружения не требуются)
```

---

## 6. Горячие клавиши — GNOME

Настроено через dconf в `/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/`:

| Клавиша | Команда | Описание |
|---------|---------|----------|
| `Pause` | `/home/orr/.local/bin/say-clipboard` | Озвучить буфер обмена |
| `<Control>Pause` | `/home/orr/.local/bin/translate-clipboard` | Перевести буфер (заменить в буфере) |
| `<Control><Shift>Pause` | `/home/orr/.local/bin/translate-clipboard --paste` | Перевести буфер + вставить в курсор |
| `SCROLLLOCK` (через voxtype) | `voxtype record toggle` | Push-to-talk голосовой ввод |

### Как применить горячие клавиши на новом компьютере (GNOME)
```bash
# Записать настройки custom-keybindings (через dconf):
dconf load /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ < backup.ini

# Или вручную через "Настройки → Клавиатура → Сочетания клавиш → Настраиваемые"
```

---

## 7. Горячие клавиши — Niri + Noctalia

Если вы используете **Niri** или **Noctalia** (Wayland композиторы, не GNOME), настройте клавиши в их конфигурационных файлах вместо dconf/GNOME.

### Niri

Конфигурационный файл: `~/.config/niri/config.kdl`

Пример настройки горячих клавиш (добавьте в секцию `bindings`):

```kdl
bind {
    # Озвучить буфер обмена (Pause)
    modifier {
        none
    }
    key Pause
    exec /home/orr/.local/bin/say-clipboard
}

bind {
    # Перевести буфер (Ctrl+Pause)
    modifier {
        Control
    }
    key Pause
    exec /home/orr/.local/bin/translate-clipboard
}

bind {
    # Перевести буфер и вставить (Ctrl+Shift+Pause)
    modifier {
        Control Shift
    }
    key Pause
    exec /home/orr/.local/bin/translate-clipboard --paste
}

# VoxType push-to-talk (SCROLLLOCK) — управляется через voxtype.service,
# горячая клавиша настраивается в ~/.config/voxtype/config.toml
```

После изменения конфига Niri примените его:
```bash
niri msg action reload-config
```

### Noctalia

Конфигурационный файл: обычно `~/.config/noctalia/config` или аналогичный (зависит от версии).

Пример настройки горячих клавиш:

```ini
# Пример (точное имя ключей уточните в документации Noctalia)
[hotkeys]
pause = /home/orr/.local/bin/say-clipboard
ctrl_pause = /home/orr/.local/bin/translate-clipboard
ctrl_shift_pause = /home/orr/.local/bin/translate-clipboard --paste
```

**Важно для Niri/Noctalia:**
- `voxtype` использует собственный детектор горячих клавиш (`SCROLLLOCK`) — настраивается в `~/.config/voxtype/config.toml` в секции `[hotkey]`, независимо от композитора.
- Для команд `say-clipboard` и `translate-clipboard` нужно привязывать клавиши в конфиге самого композитора (Niri или Noctalia).
- Если горячие клавиши не срабатывают, проверьте, что скрипты имеют права на выполнение (`chmod +x`).

### Как проверить, что работает (Niri / Noctalia)
```bash
# Прямой запуск скрипта для проверки:
echo "Привет, мир" | wl-copy
/home/orr/.local/bin/say-clipboard

# Проверка voxtype:
systemctl --user status voxtype.service
voxtype status
```

---

## 8. Список всех файлов и путей

### Иконфигурация VoxType (голосовой ввод)
| Путь | Назначение |
|------|------------|
| `~/.config/voxtype/config.toml` | Основной конфиг voxtype |
| `~/.local/share/voxtype/models/ggml-large-v3-turbo.bin` | Модель whisper (1.6 ГБ) |
| `~/.local/share/voxtype/models/ggml-silero-vad.bin` | Модель VAD |
| `~/.local/share/voxtype/models/ggml-base.bin` | Модель whisper base |
| `~/.local/share/voxtype/models/ggml-base.en.bin` | Модель whisper base.en |
| `/usr/bin/voxtype` | Бинарник voxtype |
| `~/.config/systemd/user/voxtype.service` | Unit файл systemd |
| `~/.config/systemd/user/graphical-session.target.wants/voxtype.service` | Автозапуск с сессией |

### Конфигурация TTS (озвучка)
| Путь | Назначение |
|------|------------|
| `~/.local/bin/say-clipboard` | Основной скрипт озвучки буфера |
| `~/.local/bin/silero-generate` | Генератор Silero TTS |
| `~/.local/bin/text-split-runs` | Разбивка текста по алфавиту |
| `~/.local/bin/translate-clipboard` | Перевод буфера обмена (trans / Google Translate) |
| `~/.local/opt/piper/piper` | Бинарник piper 1.2.0 |
| `~/.local/bin/piper → ~/.local/opt/piper/piper` | Симлинк piper |
| `~/.local/share/piper/voices/*.onnx` | Модели piper (irina, denis, amy, lessac, ryan) |
| `~/.local/share/silero-venv/` | venv для Silero (torch, torchaudio, soundfile) |
| `/usr/bin/espeak-ng` | Резервный TTS (системный) |
| `/usr/bin/spd-say` | Speech Dispatcher (резерв) |
| `/usr/bin/ffmpeg` | Для изменения темпа Silero (atempo) |
| `/usr/bin/wl-paste` | Чтение буфера обмена (Wayland) |
| `/usr/bin/pw-play` | Воспроизведение аудио (PipeWire) |

### Резервные копии (рядом с инструкцией)
| Путь | Назначение |
|------|------------|
| `~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/config.toml` | Копия конфига voxtype |
| `~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/say-clipboard` | Копия скрипта озвучки |
| `~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/silero-generate` | Копия генератора Silero |
| `~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/text-split-runs` | Копия разбивщика текста |
| `~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/translate-clipboard` | Копия скрипта перевода |

### Конфигурация OpenCode
| Путь | Назначение |
|------|------------|
| `~/.config/opencode/opencode.jsonc` | Конфиг OpenCode (провайдеры Dahl, GitHub) |
| `~/.config/opencode/cli.json` | CLI настройки OpenCode |
| `~/.config/opencode/service.json` | Конфиг фонового сервиса OpenCode (пароль) |
| `~/.config/opencode/AGENTS.md` | Инструкции для агента |
| `~/.opencode/memory.md` | Память агента (содержит настройки голоса и TTS) |
| `~/.opencode/bin/opencode` | Бинарник OpenCode |
| `~/.opencode/bin/opencode2` | Обёртка над opencode |

### Перевод буфера (translate-clipboard)
| Путь | Назначение |
|------|------------|
| `~/.local/bin/translate-clipboard` | Скрипт перевода (trans CLI) |
| `/usr/bin/trans` | CLI для Google Translate |
| `/usr/bin/ydotool` | Инструмент ввода клавиш (для вставки перевода) |
| `/usr/bin/wtype` | Резерв для ввода клавиш |

---

## 9. Как перенести на другой компьютер

### Шаг 1. Установить системные зависимости

**Arch Linux:**
```bash
sudo pacman -S espeak-ng festival speech-dispatcher pipewire pipewire-pulse ffmpeg wl-clipboard ydotool wtype trans
yay -S voxtype  # или скачать бинарник
```

**Для Niri/Noctalia** дополнительно может потребоваться:
```bash
sudo pacman -S niri  # или noctalia, в зависимости от оболочки
```

### Шаг 2. Установить piper (без AUR)
```bash
mkdir -p ~/.local/opt/piper ~/.local/share/piper/voices
# Скачать piper 1.2.0 с GitHub releases в ~/.local/opt/piper/
# Скачать модели с huggingface rhasspy/piper-voices в ~/.local/share/piper/voices/
ln -sf ~/.local/opt/piper/piper ~/.local/bin/piper
```

### Шаг 3. Установить Silero venv
```bash
python3 -m venv ~/.local/share/silero-venv
~/.local/share/silero-venv/bin/pip install torch torchaudio soundfile
# Скопировать скрипт silero-generate в ~/.local/bin/
chmod +x ~/.local/bin/silero-generate
```

### Шаг 4. Скопировать файлы конфигурации (из папки с инструкцией)

Скопируйте файлы из `~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/` в соответствующие места:

```bash
mkdir -p ~/.config/voxtype ~/.local/bin ~/.local/share/piper/voices ~/.local/share/voxtype/models

# Конфиги из папки с инструкцией
cp ~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/config.toml ~/.config/voxtype/config.toml

# Скрипты из папки с инструкцией
cp ~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/say-clipboard ~/.local/bin/
cp ~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/silero-generate ~/.local/bin/
cp ~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/text-split-runs ~/.local/bin/
cp ~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/translate-clipboard ~/.local/bin/

# Выдать права на выполнение
chmod +x ~/.local/bin/say-clipboard ~/.local/bin/silero-generate ~/.local/bin/text-split-runs ~/.local/bin/translate-clipboard

# Модели piper
cp ~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/*.onnx ~/.local/share/piper/voices/ 2>/dev/null || true

# Модели voxtype
cp ~/Documents/НАСТРОЙКА_ГОЛОСА_И_ОЗВУЧКИ/конфиги/ggml-*.bin ~/.local/share/voxtype/models/ 2>/dev/null || true
```

### Шаг 5. Настроить переменные окружения
Добавить в `~/.bashrc` (или `~/.zshrc`, или `~/.profile`):
```bash
export SAY_VOICE="ru_RU-irina-medium"
export SAY_SPEED="0.6"
export SAY_VOICE_EN="en_US-amy-medium"
export SAY_SPEED_EN="0.7"
export SILERO_VOICE="baya"
export SILERO_TEMPO="1.3"
export SAY_RU_ENGINE="silero"
```

### Шаг 6. Настроить systemd сервис voxtype
```bash
systemctl --user daemon-reload
systemctl --user enable voxtype.service
systemctl --user start voxtype.service
```

### Шаг 7. Настроить горячие клавиши

**Для GNOME:** через "Настройки → Клавиатура → Сочетания клавиш → Настраиваемые" или dconf (см. раздел 6).

**Для Niri:** добавить bindings в `~/.config/niri/config.kdl` (см. раздел 7).

**Для Noctalia:** добавить в конфиг Noctalia (см. раздел 7).

---

## 10. Проверка работоспособности

### VoxType (голосовой ввод)
```bash
systemctl --user status voxtype.service        # должен быть active (running)
voxtype status                                  # idle
voxtype setup check                             # проверка цепочки
voxtype info accel                              # GPU через Vulkan
# Нажать SCROLLLOCK, decir что-то, отпустить — текст должен появиться в буфере и вставить
```

### TTS (озвучка)
```bash
# Проверить piper:
echo "Привет, мир" | ~/.local/bin/piper --model ~/.local/share/piper/voices/ru_RU-irina-medium.onnx --length_scale 0.6 --output_file /tmp/test.wav
pw-play /tmp/test.wav

# Проверить say-clipboard:
echo "Текст для проверки" | wl-copy
~/.local/bin/say-clipboard  # должен прозвучать

# Проверить Silero:
echo "Привет" | ~/.local/bin/silero-generate --voice baya --tempo 1.3 --out /tmp/silero.wav
pw-play /tmp/silero.wav
```

---

## Примечания

- **spd-say не читает stdin.** Всегда передавайте текст аргументом: `spd-say -l ru -- "текст"`.
- **OSD индикатор записи на GNOME не работает** (требует Layer Shell, которого в Mutter нет). Это нормально, результат приходит через уведомления.
- **Папка `~/.opencode/`** — служебная папка OpenCode, не трогать без необходимости.
- **Пароль в `~/.config/opencode/service.json`** — секрет доступа к фоновому сервису OpenCode, не передавать посторонним.
- При переносе на другой компьютер с другой графической оболочкой (не GNOME), настройте горячие клавиши в конфиге этой оболочки (Niri или Noctalia), а не в dconf/GNOME.
