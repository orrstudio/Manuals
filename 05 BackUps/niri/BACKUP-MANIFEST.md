# Реестр бэкапов Niri

Папка `niri/` = домашняя папка `~/` в системе.
Структура путей внутри повторяет системную: `~/.local/bin/x.sh` → `niri/.local/bin/x.sh`.

Полный список зеркал (включая конфиги OpenCode) — `~/.config/opencode/MIRRORS.md`.

## Скрипты (~/.local/bin/)

| # | Файл в системе | Файл в бэкапе | Назначение | Статус |
|---|----------------|---------------|------------|--------|
| 1 | `~/.local/bin/hyprctl` | `niri/.local/bin/hyprctl` | Stub hyprctl для Niri: отдаёт `{"class":""}` на `activewindow -j`, чтобы SuperWhisper не падал и вставлял через Ctrl+V | актуален |
| 2 | `~/.local/bin/rofi-askpass` | `niri/.local/bin/rofi-askpass` | Запрос пароля sudo через Rofi (для `sudo -A`) | актуален |
| 3 | `~/.local/bin/say-clipboard` | `niri/.local/bin/say-clipboard` | Озвучка буфера: Silero (ru) → Piper (en) → spd-say/espeak; повторное нажатие = стоп | актуален |
| 4 | `~/.local/bin/silero-generate` | `niri/.local/bin/silero-generate` | Генерация русского TTS через Silero v4 (python, venv) | актуален |
| 5 | `~/.local/bin/sw-record-timeout.sh` | `niri/.local/bin/sw-record-timeout.sh` | Таймер 60 с: автостоп записи SuperWhisper + уведомление | актуален |
| 6 | `~/.local/bin/sw-start.sh` | `niri/.local/bin/sw-start.sh` | Единый запуск: `sw-toggle` (запись) + `sw-record-timeout.sh` (таймер) | актуален |
| 7 | `~/.local/bin/sw-toggle` | `niri/.local/bin/sw-toggle` | Обёртка `superwhisper toggle` (SIGUSR1 демону) с нужным окружением | актуален |
| 8 | `~/.local/bin/text-split-runs` | `niri/.local/bin/text-split-runs` | Разбиение текста на куски по смене алфавита (для TTS) | актуален |
| 9 | `~/.local/bin/toggle-laptop-panel.sh` | `niri/.local/bin/toggle-laptop-panel.sh` | Вкл/выкл экрана eDP-1 через `niri msg output` | актуален |
| 10 | `~/.local/bin/translate-clipboard` | `niri/.local/bin/translate-clipboard` | Перевод буфера (кириллица→en, латиница→ru), опционально вставка | актуален |

## Конфиги

| # | Файл в системе | Файл в бэкапе | Назначение | Статус |
|---|----------------|---------------|------------|--------|
| 11 | `~/.config/niri/config.kdl` | `niri/.config/niri/config.kdl` | Конфиг Niri: бинды, 124 русских `hotkey-overlay-title`, `Ctrl+Tab` → `sw-start.sh` | актуален |
| 12 | `~/.config/terminator/config` | `niri/.config/terminator/config` | Терминал Terminator | актуален |
| 13 | `~/.config/kanshi/config` | `niri/.config/kanshi/config` | Профили мониторов (eDP-1, DP-3) | актуален |
| 14 | `~/.config/superwhisper-linux/config.json` | `niri/.config/superwhisper-linux/config.json` | SuperWhisper: модель medium, язык ru, auto_paste true | актуален |
| 15 | `~/.config/herdr/config.toml` | `niri/.config/herdr/config.toml` | Плагин Noctalia herdr | актуален |
| 16 | `~/.config/layout-fix/config` | `niri/.config/layout-fix/config` | Плагин раскладки | актуален |
| 17 | `~/.config/autostart/superwhisper.desktop` | `niri/.config/autostart/superwhisper.desktop` | Автозапуск SuperWhisper при входе в сессию | актуален |

## Домашняя папка

| # | Файл в системе | Файл в бэкапе | Назначение | Статус |
|---|----------------|---------------|------------|--------|
| 18 | `~/.bashrc` | `niri/.bashrc` | PATH, ключи API, SUDO_ASKPASS | актуален |
| 19 | `~/.bash_profile` | `niri/.bash_profile` | Автозапуск Niri на tty1 | актуален |
| 20 | `~/.bash_logout` | `niri/.bash_logout` | Действия при выходе | актуален |
| 21 | `~/.wezterm.lua` | `niri/.wezterm.lua` | Терминал WezTerm: шрифты, тема, горячие клавиши (Ctrl+Shift+O/E/T/W, Alt+стрелки) | актуален |
| 22 | `~/gpu-boot-report.sh` | `niri/gpu-boot-report.sh` | Отчёт GPU при загрузке — **для ноутбука З-Бук** | актуален |

## systemd (user)

| # | Файл в системе | Файл в бэкапе | Назначение | Статус |
|---|----------------|---------------|------------|--------|
| 23 | `~/.config/systemd/user/gpu-boot-report.service` | `niri/.config/systemd/user/gpu-boot-report.service` | Наш сервис запуска `gpu-boot-report.sh` при загрузке | актуален |
| 23b | `~/.gnupg/gpg-agent.conf` | `niri/.gnupg/gpg-agent.conf` | Настройка pinentry-rofi (ввод пароля через Rofi) | актуален |

## Ярлыки приложений

| # | Файл в системе | Файл в бэкапе | Назначение | Статус |
|---|----------------|---------------|------------|--------|
| 24 | `~/.local/share/applications/org.localsend.localsend_app.desktop` | `niri/.local/share/applications/org.localsend.localsend_app.desktop` | Ярлык LocalSend | актуален |
| 25 | `~/.local/share/applications/superwhisper.desktop` | `niri/.local/share/applications/superwhisper.desktop` | Ярлык SuperWhisper | актуален |

## Noctalia

| # | Файл в системе | Файл в бэкапе | Назначение | Статус |
|---|----------------|---------------|------------|--------|
| 26 | `~/.local/state/noctalia/settings.toml` | `niri/.local/state/noctalia/settings.toml` | Вся конфигурация Noctalia: панель, виджеты, тема, список плагинов | актуален |
| 27 | `~/.local/state/noctalia/state.toml` | `niri/.local/state/noctalia/state.toml` | Состояние Noctalia (тема, обои, миграции) | актуален |
| 28 | `~/.local/state/noctalia/plugins/data/` | `niri/.local/state/noctalia/plugins/data/` | Данные плагинов: закладки (bookmarks), сертификаты LocalSend, layout-fix, launcher-pass | актуален |

## Система (`niri/system/`)

| # | Файл в бэкапе | Источник | Назначение | Статус |
|---|---------------|----------|------------|--------|
| 29 | `niri/system/pkglist.txt` | `pacman -Qqe` | Явно установленные пакеты (65) | актуален |
| 30 | `niri/system/aurlist.txt` | `pacman -Qqm` | AUR-пакеты (5) | актуален |
| 31 | `niri/system/flatpak-list.txt` | `flatpak list --app` | Flatpak (LocalSend) | актуален |
| 32 | `niri/system/systemd-enabled.txt` | `systemctl list-unit-files --state=enabled` | Системные сервисы | актуален |
| 33 | `niri/system/systemd-user-enabled.txt` | `systemctl --user list-unit-files --state=enabled` | Пользовательские сервисы | актуален |
| 34 | `niri/system/INSTALLED-APPS.md` | вручную | Журнал приложений: что установлено, конфиг, бэкапится ли | актуален |

Списки пакетов обновляются вручную после установки приложений (скрипта нет — по решению пользователя).

## Noctalia — что НЕ бэкапим (скачивается/пересоздаётся автоматически)

| Путь | Размер | Почему |
|------|--------|--------|
| `plugins/sources/` | 31 МБ | Исходники плагинов — скачиваются по списку `[plugins] enabled` из `settings.toml` |
| `plugins/materialized/` | 4 МБ | Скомпилированные плагины — пересоздаются из sources |
| `plugin-cache/` | 4 КБ | Кэш |
| `community-palettes/` | 52 КБ | Каталог палитр — скачивается заново |
| `community-templates/` | 1,2 МБ | Шаблоны тем (у нас отключены: `enable_*_templates = false`) |
| `recently_used.json`, `usage_counts.json`, `screen_time.json` | 12 КБ | Статистика использования |

## Не бэкапим (бинарники и симлинки)

- `herdr` — бинарник 30 МБ (компонент плагина Noctalia)
- `piper`, `superwhisper` — симлинки на установленные пакеты
- `wl-copy`, `wl-paste`, `xclip`, `xsel`, `xsel-real` — установленные утилиты

## Правила

- Каждый файл, добавленный в бэкап, вносится в эту таблицу и в `MIRRORS.md`.
- Системный файл и его копия в бэкапе должны совпадать (полная синхронизация).
- При изменении системного файла — сразу обновлять копию в бэкапе.
