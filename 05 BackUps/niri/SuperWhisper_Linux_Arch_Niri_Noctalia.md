# Инструкция по установке SuperWhisper Linux на Arch Linux + Niri + Noctalia

**Дата:** 11 ноября 2026  
**Целевая система:** Arch Linux + графические оболочки Niri и/или Noctalia  
**Цель:** голосовой ввод (речь в текст) по горячей клавише, аналог SuperWhisper для Linux

---

## ⚠️ Важное предупреждение

Официальный **SuperWhisper** (сайт superwhisper.com) выпускается только для **macOS, Windows, iOS и Android**. Для Linux официальной версии нет.

Вместо этого используется неофициальный клон сообщества специально для Arch Linux / Omarchy:

> **SuperWhisper Linux** — https://github.com/adityasinghcodes/superwhisper-linux

Это сторонний проект на Python с движком `faster-whisper` (локальная транскрибация, без облака и без API-ключей).

---

## Содержание

1. [Предварительные требования](#предварительные-требования)
2. [Установка системных зависимостей](#установка-системных-зависимостей)
3. [Установка SuperWhisper Linux](#установка-superwhisper-linux)
4. [Настройка PATH](#настройка-path)
5. [Горячие клавиши для Niri](#горячие-клавиши-для-niri)
6. [Горячие клавиши для Noctalia](#горячие-клавиши-для-noctalia)
7. [Автозапуск (systemd или desktop entry)](#автозапуск-systemd-или-desktop-entry)
8. [Конфигурационный файл](#конфигурационный-файл)
9. [Команды управления](#команды-управления)
10. [Список файлов после установки](#список-файлов-после-установки)
11. [Проверка работоспособности](#проверка-работоспособности)
12. [Устранение неполадок](#устранение-неполадок)
13. [Удаление](#удаление)
14. [Ссылка на документацию в интернете](#ссылка-на-документацию-в-интернете)

---

## 1. Предварительные требования

| Требование | Пояснение |
|------------|-----------|
| Arch Linux | Проверено на Arch / Omarchy |
| Python 3.13+ | Требуется для `uv` и зависимостей |
| PipeWire аудио | Для захвата микрофона и аудио-обратной связи |
| NVIDIA GPU с CUDA | Опционально — ускорение транскрибации; fallback на CPU |

---

## 2. Установка системных зависимостей

```bash
sudo pacman -S uv wl-clipboard wtype libappindicator-gtk3
```

| Пакет | Назначение |
|-------|------------|
| `uv` | Менеджер пакетов Python и установщик приложения |
| `wl-clipboard` | Работа с буфером обмена на Wayland (`wl-copy`, `wl-paste`) |
| `wtype` | Имитация нажатий клавиш для авто-вставки текста |
| `libappindicator-gtk3` | Иконка в трее (system tray) |

---

## 3. Установка SuperWhisper Linux

### 3.1 Клонировать репозиторий

```bash
git clone https://github.com/adityasinghcodes/superwhisper-linux.git
cd superwhisper-linux
```

### 3.2 Установить зависимости Python

```bash
uv sync
```

### 3.3 Установить приложение

```bash
uv run superwhisper install
```

Эта команда:
- устанавливает команду `superwhisper` глобально (через `uv tool install`);
- добавляет desktop entry (приложение появляется в лаунчере);
- настраивает автозапуск при входе в систему;
- устанавливает иконку приложения.

### 3.4 Добавить в PATH (если команда не находится)

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Или для Zsh:
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

---

## 4. Горячие клавиши для Niri

Niri использует конфигурационный файл в формате KDL:

```
~/.config/niri/config.kdl
```

Добавьте блок `bind` для клавиши `Ctrl + Tab` (по умолчанию в SuperWhisper Linux):

```kdl
bind {
    modifier {
        Control
    }
    key Tab
    exec superwhisper toggle
}
```

После изменения примените конфиг:

```bash
niri msg action reload-config
```

**Горячая клавиша по умолчанию:** `Ctrl + Tab`  
Нажмите и удерживайте — запись начинается, отпустите — транскрибация и вставка текста.

Если хотите другую клавишу, измените в `config.json` поле `hotkey` и соответствующий `bind` в Niri.

---

## 5. Горячие клавиши для Noctalia

Noctalia — Wayland композитор. Точный формат конфигурации горячих клавиш зависит от версии. Обычно настройка ведётся в файле конфигурации Noctalia (например, `~/.config/noctalia/config` или аналогичный путь).

Общий принцип:

1. Найдите файл конфигурации Noctalia (проверьте `~/.config/noctalia/` или документацию проекта).
2. Добавьте привязку клавиши на выполнение команды:

```
# Пример (точный синтаксис уточните в документации Noctalia)
bind <Control><Tab> exec superwhisper toggle
```

3. Перезапустите Noctalia или примените конфиг без перезагрузки сессии, если это поддерживается.

**Примечание:** Сам демон `voxtype` (если у вас уже установлен) использует свою собственную горячую клавишу `SCROLLLOCK` независимо от compositeur. SuperWhisper Linux использует `Ctrl+Tab` (настраивается). Не назначайте одну и ту же клавишу двум разным приложениям голосового ввода одновременно.

---

## 6. Автозапуск

SuperWhisper Linux можно запускать двумя способами:

### Способ A: Автозапуск через desktop entry (по умолчанию)

После `uv run superwhisper install` создаётся:

```
~/.config/autostart/superwhisper.desktop
```

Приложение стартует автоматически при входе в сессию.

### Способ B: Через systemd пользовательский сервис

```bash
uv run superwhisper install --systemd
```

Управление:

```bash
systemctl --user start superwhisper      # запустить сейчас
systemctl --user stop superwhisper       # остановить
systemctl --user restart superwhisper    # перезапустить
systemctl --user status superwhisper     # статус
systemctl --user enable superwhisper     # автозапуск с сессией
journalctl --user -u superwhisper -f     # логи в реальном времени
```

---

## 7. Конфигурационный файл

Путь: `~/.config/superwhisper-linux/config.json`

Пример содержимого:

```json
{
  "model": "tiny",
  "device": "auto",
  "compute_type": "auto",
  "language": "en",
  "hotkey": "CTRL+TAB",
  "microphone": "Your Microphone Name",
  "notifications_enabled": true,
  "audio_feedback_enabled": false,
  "show_model_info": true,
  "show_recording_timer": true,
  "auto_paste_enabled": true
}
```

### Основные параметры

| Параметр | Значение по умолчанию | Пояснение |
|----------|----------------------|-----------|
| `model` | `tiny` | Модель Whisper (tiny, base, small, medium, large-v3) |
| `device` | `auto` | `auto` — GPU если есть, иначе CPU; `cuda` — принудительно NVIDIA; `cpu` — только CPU |
| `compute_type` | `auto` | Тип вычислений |
| `language` | `en` | Язык распознавания или `auto` |
| `hotkey` | `CTRL+TAB` | Горячая клавиша записи |
| `microphone` | `Your Microphone Name` | Имя микрофона (выбирается в трее) |
| `notifications_enabled` | `true` | Показывать уведомления рабочего стола |
| `audio_feedback_enabled` | `false` | Звук при начале/окончании записи |
| `show_model_info` | `true` | Показывать имя модели в меню трея |
| `show_recording_timer` | `true` | Показывать длительность записи в трее |
| `auto_paste_enabled` | `true` | Автоматически вставлять текст в активное окно |

### Таблица моделей

| Модель | Размер | Когда использовать |
|--------|--------|-------------------|
| tiny | ~75 МБ | Быстро, для быстрых заметок |
| base | ~145 МБ | Сбалансировано |
| small | ~465 МБ | Лучше точность |
| medium | ~1,5 ГБ | Высокая точность |
| large-v3 | ~3 ГБ | Лучшая точность, медленнее |

---

### faster-whisper vs tiny: в чем разница

Это **не одно и то же**, их нельзя сравнивать напрямую:

| Что это | Описание | Роль |
|---------|----------|------|
| **faster-whisper** | Движок (библиотека) на базе CTranslate2 | Отвечает за **скорость** транскрибации. Работает быстрее обычного whisper.cpp, особенно на CPU без GPU. |
| **tiny** | Одна из моделей Whisper (~75 МБ) | Отвечает за **точность** и размер. Самая легкая и быстрая модель, но менее точная. |

**Они работают вместе:** SuperWhisper Linux использует движок `faster-whisper` для запуска выбранной вами модели (tiny, base, small и т.д.). На старом ноутбуке без NVIDIA самый быстрый вариант — **faster-whisper + модель `tiny`**.

---

## 8. Команды управления

| Команда | Назначение |
|---------|------------|
| `superwhisper` | Запустить приложение |
| `superwhisper toggle` | Включить/выключить запись (используется привязкой клавиши) |
| `superwhisper keybind` | Вывести инструкцию по настройке горячей клавиши |
| `superwhisper install` | Установить desktop entry, автозапуск, глобальную команду |
| `superwhisper install --systemd` | Установить как systemd-сервис вместо autostart |
| `superwhisper uninstall` | Удалить все установленные файлы интеграции |
| `superwhisper status` | Показать статус установки (что установлено, чего не хватает) |
| `superwhisper --help` | Справка по командам |

---

## 9. Список файлов после установки

| Путь | Назначение |
|------|------------|
| `~/.config/superwhisper-linux/config.json` | Настройки приложения |
| `~/.config/superwhisper-linux/logs/` | Логи (ротация при 5 МБ) |
| `~/.local/share/applications/superwhisper.desktop` | Desktop entry (лаунчер приложений) |
| `~/.config/autostart/superwhisper.desktop` | Автозапуск при входе в сессию |
| `~/.config/systemd/user/superwhisper.service` | Systemd сервис (если `--systemd`) |
| `~/.local/bin/superwhisper` | Глобальная команда запуска |
| `/run/user/$UID/superwhisper.pid` | PID-файл (пока приложение работает) |

---

## 10. Проверка работоспособности

```bash
# 1. Проверить статус установки
superwhisper status

# 2. Запустить приложение
superwhisper

# 3. В трее должна появиться иконка SuperWhisper

# 4. Нажать горячую клавишу (по умолчанию Ctrl+Tab)
#    Иконка станет красной (идёт запись)
#    Говорите
#    Отпустите клавишу — текст транскрибируется и вставляется в активное окно

# 5. Посмотреть логи при ошибках
cat ~/.config/superwhisper-linux/logs/superwhisper.log
tail -f ~/.config/superwhisper-linux/logs/superwhisper.log

# 6. Если используется systemd
journalctl --user -u superwhisper -f
```

---

## 11. Устранение неполадок

### Не работает горячая клавиша (Niri)
```bash
# Проверить, что Niri видит биндинг
niri msg action reload-config
# Убедиться, что в ~/.config/niri/config.kdl есть блок bind с exec superwhisper toggle
```

### Не работает горячая клавиша (Noctalia)
Проверьте синтаксис конфига Noctalia и перезапустите композитор.

### "No speech detected" или пустой результат
- Выберите правильный микрофон в меню трея SuperWhisper.
- Проверьте громкость микрофона в настройках системы.
- Тест микрофона:
  ```bash
  arecord -d 3 /tmp/test.wav && aplay /tmp/test.wav
  ```

### Медленная транскрибация
- Проверьте, используется ли GPU:
  ```bash
  grep -i "cuda\|device" ~/.config/superwhisper-linux/logs/superwhisper.log
  ```
- Если CPU — попробуйте меньшую модель в `config.json`: `"model": "tiny"`.
- Для NVIDIA убедитесь, что драйверы и CUDA установлены: `nvidia-smi`.

### Приложение не запускается
```bash
superwhisper 2>&1 | head -50
# Удалить устаревший PID-файл:
rm -f /run/user/$(id -u)/superwhisper.pid
```

---

## 12. Удаление

```bash
# Удалить интеграцию приложения
superwhisper uninstall

# Удалить глобальную команду
uv tool uninstall superwhisper

# Удалить конфигурацию и логи
rm -rf ~/.config/superwhisper-linux

# Полное удаление (остановить приложение перед этим)
pkill -f superwhisper
superwhisper uninstall
uv tool uninstall superwhisper
rm -rf ~/.config/superwhisper-linux
```

---

## 13. Ссылка на документацию в интернете

Официальный репозиторий проекта (источник установки и документации):

**https://github.com/adityasinghcodes/superwhisper-linux**

README репозитория содержит полные инструкции по установке, настройке, устранению неполадок и удалению.

---

## Примечания

- Это **неофициальный клон** SuperWhisper, созданный энтузиастом для Arch Linux (Hyprland/Omarchy). Автор предупреждает, что на других конфигурациях может потребоваться доработка.
- Если у вас уже установлен **Voxtype** (демон `voxtype.service` с клавишей `SCROLLLOCK`), не назначайте `Ctrl+Tab` одновременно обоим приложениям — они могут конфликтовать.
- На Niri/Noctalia авто-вставка текста через `wtype` может работать иначе, чем на GNOME/Hyprland. Если вставка не работает, скопируйте текст из буфера обмена вручную или проверьте настройки `auto_paste_enabled`.
