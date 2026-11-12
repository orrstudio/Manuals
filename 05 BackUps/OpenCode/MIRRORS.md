# Реестр зеркал и бэкапов

Единый список всех файлов, которые зеркалируются/бэкапятся.
При изменении системного файла — сразу обновлять копию (полная синхронизация).

---

## 1. Конфиги OpenCode → `~/GitHub/Manuals/05 BackUps/OpenCode/`

| Файл в системе | Файл в бэкапе |
|----------------|---------------|
| `~/.config/opencode/AGENTS.md` | `OpenCode/AGENTS.md` |
| `~/.config/opencode/memory.md` | `OpenCode/memory.md` |
| `~/.config/opencode/MIRRORS.md` | `OpenCode/MIRRORS.md` |
| `~/.config/opencode/Voxtype-And-TTS-Reader.md` | `OpenCode/Voxtype-And-TTS-Reader.md` |
| `~/.config/opencode/sudo-rofi-askpass.md` | `OpenCode/sudo-rofi-askpass.md` |
| `~/.config/opencode/skills/` (вся папка) | `OpenCode/skills/` |

---

## 2. Бэкап системы → `~/GitHub/Manuals/05 BackUps/niri/`

Папка `niri/` = домашняя папка `~/`. Структура путей повторяет системную.

### 2.1. Скрипты `~/.local/bin/`

| Файл в системе | Файл в бэкапе (`niri/...`) | Назначение |
|----------------|---------------------------|------------|
| `~/.local/bin/hyprctl` | `.local/bin/hyprctl` | Stub hyprctl для Niri (`{"class":""}`) |
| `~/.local/bin/rofi-askpass` | `.local/bin/rofi-askpass` | Пароль sudo через Rofi |
| `~/.local/bin/say-clipboard` | `.local/bin/say-clipboard` | Озвучка буфера (Silero/Piper) |
| `~/.local/bin/silero-generate` | `.local/bin/silero-generate` | Генерация русского TTS (Silero) |
| `~/.local/bin/sw-record-timeout.sh` | `.local/bin/sw-record-timeout.sh` | Таймер 60 с: автостоп записи |
| `~/.local/bin/sw-start.sh` | `.local/bin/sw-start.sh` | Запуск: запись + таймер |
| `~/.local/bin/sw-toggle` | `.local/bin/sw-toggle` | Обёртка `superwhisper toggle` |
| `~/.local/bin/text-split-runs` | `.local/bin/text-split-runs` | Разбиение текста по алфавиту |
| `~/.local/bin/toggle-laptop-panel.sh` | `.local/bin/toggle-laptop-panel.sh` | Вкл/выкл экрана eDP-1 |
| `~/.local/bin/translate-clipboard` | `.local/bin/translate-clipboard` | Перевод буфера |

### 2.2. Конфиги

| Файл в системе | Файл в бэкапе (`niri/...`) | Назначение |
|----------------|---------------------------|------------|
| `~/.config/niri/config.kdl` | `.config/niri/config.kdl` | Конфиг Niri (бинды, 124 русских описания) |
| `~/.config/terminator/config` | `.config/terminator/config` | Терминал Terminator |
| `~/.config/kanshi/config` | `.config/kanshi/config` | Профили мониторов (eDP-1, DP-3) |
| `~/.config/superwhisper-linux/config.json` | `.config/superwhisper-linux/config.json` | SuperWhisper: модель medium, ru, auto_paste true |
| `~/.config/herdr/config.toml` | `.config/herdr/config.toml` | Плагин Noctalia herdr |
| `~/.config/layout-fix/config` | `.config/layout-fix/config` | Плагин раскладки |
| `~/.config/autostart/superwhisper.desktop` | `.config/autostart/superwhisper.desktop` | Автозапуск SuperWhisper |

### 2.3. Домашняя папка

| Файл в системе | Файл в бэкапе (`niri/...`) | Назначение |
|----------------|---------------------------|------------|
| `~/.bashrc` | `.bashrc` | PATH, ключи API, SUDO_ASKPASS |
| `~/.bash_profile` | `.bash_profile` | Автозапуск Niri на tty1 |
| `~/.bash_logout` | `.bash_logout` | Действия при выходе |
| `~/.wezterm.lua` | `.wezterm.lua` | Терминал WezTerm: шрифты, тема, горячие клавиши |
| `~/gpu-boot-report.sh` | `gpu-boot-report.sh` | Отчёт GPU при загрузке — **для ноутбука З-Бук** |

### 2.4. systemd (user)

| Файл в системе | Файл в бэкапе (`niri/...`) | Назначение |
|----------------|---------------------------|------------|
| `~/.config/systemd/user/gpu-boot-report.service` | `.config/systemd/user/gpu-boot-report.service` | Наш сервис запуска `gpu-boot-report.sh` |
| `~/.gnupg/gpg-agent.conf` | `.gnupg/gpg-agent.conf` | Настройка pinentry-rofi (пароль GPG через Rofi) |

### 2.5. Ярлыки приложений

| Файл в системе | Файл в бэкапе (`niri/...`) | Назначение |
|----------------|---------------------------|------------|
| `~/.local/share/applications/org.localsend.localsend_app.desktop` | `.local/share/applications/org.localsend.localsend_app.desktop` | Ярлык LocalSend |
| `~/.local/share/applications/superwhisper.desktop` | `.local/share/applications/superwhisper.desktop` | Ярлык SuperWhisper |

### 2.6. Noctalia

| Файл в системе | Файл в бэкапе (`niri/...`) | Назначение |
|----------------|---------------------------|------------|
| `~/.local/state/noctalia/settings.toml` | `.local/state/noctalia/settings.toml` | Вся конфигурация Noctalia |
| `~/.local/state/noctalia/state.toml` | `.local/state/noctalia/state.toml` | Состояние (тема, обои) |
| `~/.local/state/noctalia/plugins/data/` | `.local/state/noctalia/plugins/data/` | Данные плагинов (закладки, сертификаты) |

### 2.7. Система (`niri/system/`)

| Файл в бэкапе | Источник | Назначение |
|---------------|----------|------------|
| `system/pkglist.txt` | `pacman -Qqe` | Явно установленные пакеты |
| `system/aurlist.txt` | `pacman -Qqm` | AUR-пакеты |
| `system/flatpak-list.txt` | `flatpak list --app` | Flatpak-приложения |
| `system/systemd-enabled.txt` | `systemctl list-unit-files --state=enabled` | Системные сервисы |
| `system/systemd-user-enabled.txt` | `systemctl --user list-unit-files --state=enabled` | Пользовательские сервисы |
| `system/INSTALLED-APPS.md` | вручную | Журнал приложений: что установлено, где конфиг, бэкапится ли |

Списки пакетов обновляются **вручную** после установки приложений (скрипта нет — по решению пользователя).

---

## 3. НЕ бэкапим

| Что | Причина |
|-----|---------|
| `~/.config/waybar/` | Не используется (заменён Noctalia) |
| `~/.config/mc/`, `gtk-3.0/`, `gtk-4.0/`, `qt5ct/`, `qt6ct/` | По решению пользователя |
| `~/.config/mimeapps.list`, `user-dirs.dirs` | По решению пользователя |
| `~/.config/opencode/opencode.jsonc`, `cli.json`, `package.json` | По решению пользователя |
| `~/.config/dconf/user` | По решению пользователя |
| `~/.var/app/` (LocalSend flatpak) | По решению пользователя |
| Zen Browser (`~/.config/zen/`) | Пароли в браузере не хранятся, профиль не нужен |
| `/etc/*` (fstab, grub, mkinitcpio, pacman.conf) | По решению пользователя |
| Списки пакетов (`pkglist`, `aurlist`, `flatpak-list`) | Пока рано — установка продолжается |
| `~/.local/share/uv`, `silero-venv`, `piper` | Окружения/модели, пересоздаются |
| `~/.local/share/Trash`, `~/.config/pulse/cookie`, `~/.config/go/telemetry` | Мусор/сессионные данные |
| `~/.ssh`, `~/.gnupg`, `~/.password-store` | Секреты — не в git |
| `~/.bash_history` | Может содержать секреты |
| Noctalia `plugins/sources/`, `plugins/materialized/`, `plugin-cache/`, `community-palettes/`, `community-templates/` | Noctalia скачивает сама |
