# Журнал установленных приложений

Заполняется по ходу установки. Для каждого приложения: что установлено, где конфиг, бэкапится ли он.

Дата создания: 2026-11-12

## Основные приложения

| Приложение | Пакет | Дата | Конфиг в системе | Бэкапится? |
|-----------|-------|------|------------------|-----------|
| Niri (композитор) | `niri` | — | `~/.config/niri/config.kdl` | да |
| Noctalia (shell) | `noctalia` | 07.11 | `~/.local/state/noctalia/` | да (settings, state, plugins/data) |
| SuperWhisper | uv tool (github) | 11.11 | `~/.config/superwhisper-linux/config.json` | да |
| WezTerm (терминал) | `wezterm` | — | `~/.wezterm.lua` | да |
| Terminator (терминал) | `terminator` | — | `~/.config/terminator/config` | да |
| Kanshi (мониторы) | `kanshi` | — | `~/.config/kanshi/config` | да |
| Rofi (лаунчер) | `rofi` | — | нет (дефолт) | нет |
| Zen Browser | `zen-browser-bin` (AUR) | — | `~/.config/zen/` | нет (решение) |
| GitHub Desktop | flatpak `io.github.shiftey.Desktop` | 12.11 | `~/.var/app/io.github.shiftey.Desktop/` | нет (решение) |
| LocalSend | flatpak | — | `~/.var/app/org.localsend.localsend_app` | нет (решение) |
| Midnight Commander | `mc` | — | `~/.config/mc/` | нет (решение) |
| gedit | `gedit` | — | `~/.config/gedit/` | нет (решение) |
| Waybar | `waybar` | — | `~/.config/waybar/` | нет (не используется) |
| yay (AUR-хелпер) | `yay` (AUR) | — | `~/.config/yay/` (пусто) | нет |
| OpenCode | `opencode-bin` (AUR) | — | `~/.config/opencode/` | да (AGENTS, memory, MIRRORS, skills, справочники) |

## Плагины Noctalia

| Плагин | ID | Конфиг | Бэкапится? |
|--------|----|--------|-----------|
| herdr | `hy4ri/herdr` | `~/.config/herdr/config.toml` | да |
| layout-fix | `umedbazarov/layout-fix` | `~/.config/layout-fix/config` | да |
| keymap | `blackbartblues/keymap` | `settings.toml` (plugin_settings) | да (в settings) |
| bookmarks | `dunarand/bookmarks` | `plugins/data/dunarand/bookmarks/` | да |
| localsend | `mera/localsend` | `plugins/data/mera/localsend/` | да |
| launcher-pass | `mellotanica/launcher-pass` | `plugins/data/mellotanica/launcher-pass/` | да |
| ufw | `3dprogramin/ufw` | — | нет данных |
| usb-manager | `rylos/usb-manager` | — | нет данных |
| vpn-manager | `andrewdems/vpn-manager` | — | нет данных |
| notes | `noctalia/notes` | — | нет данных |
| calculator | `yuuto/calculator` | — | нет данных |
| cat | `dotnetrob/cat` | — | нет данных |
| default-apps | `thaer99ob/default-apps` | — | нет данных |
| dns-switcher | `nightwatch75/dns-switcher` | — | нет данных |
| geoip-monitor | `pk/geoip-monitor` | — | нет данных |

## TTS / голос

| Компонент | Пакет | Назначение |
|-----------|-------|-----------|
| Silero | `~/.local/share/silero-venv` | Русский TTS (baya) |
| Piper | `~/.local/share/piper` | Английский TTS (lessac-high) |
| RHVoice | `rhvoice`, `rhvoice-language-russian` | Резервный русский TTS |
| espeak-ng | `espeak-ng` | Резервный TTS |
| speech-dispatcher | `speech-dispatcher` | Диспетчер речи |
| translate-shell | `translate-shell` | Перевод буфера |

## Служебные утилиты
| Утилита | Пакет | Назначение |
|---------|-------|-----------|
| wl-clipboard | `wl-clipboard` | Буфер обмена Wayland |
| wtype | `wtype` | Эмуляция ввода |
| ydotool | `ydotool` | Эмуляция ввода (user-сервис) |
| brightnessctl | — | Яркость (бинды Niri) |
| playerctl | — | Управление медиа (бинды Niri) |
| wpctl (wireplumber) | `wireplumber` | Звук (бинды Niri) |
| uv | `uv` | Python-окружения |
| git | `git` | Git |
| ufw | `ufw` | Файрвол |
| NetworkManager | `networkmanager` | Сеть |
| BlueZ | `bluez`, `bluez-utils` | Bluetooth |

## GPG / секреты

| Компонент | Пакет | Дата | Конфиг | Назначение |
|-----------|-------|------|--------|-----------|
| pinentry-rofi | `pinentry-rofi` (AUR) | 12.11 | `~/.gnupg/gpg-agent.conf` | Ввод пароля GPG через Rofi |
| pass | `pass` | 12.11 | `~/.password-store/` | Менеджер паролей (репозиторий из GitHub) |
| gnome-keyring | `gnome-keyring` | 12.11 | `~/.local/share/keyrings/` | Провайдер `org.freedesktop.secrets` для приложений (GitHub Desktop и др.) |
| Автозапуск keyring | — | — | `~/.bash_profile` | `gnome-keyring-daemon --start --components=secrets` перед Niri |

**Важно:** `pass-secret-service` удалён (конфликт с gnome-keyring). Токены приложений теперь в gnome-keyring (keyring с пустым паролем, разблокируется автоматически при автологине). `~/.local/share/pass-secrets/` больше не используется.

## SSH-ключи

| Файл | Путь | Права |
|------|------|-------|
| Приватный ключ | `~/.ssh/id_ed25519` | 600 |
| Публичный ключ | `~/.ssh/id_ed25519.pub` | 644 |
| Конфиг | `~/.ssh/config` | 600 |

## Как пополнять

При установке нового приложения:
1. Добавить строку в таблицу «Основные приложения»: имя, пакет, дата, путь конфига, бэкапится ли.
2. Если конфиг уникален — скопировать в `niri/` по системному пути.
3. Периодически обновлять списки пакетов (вручную):
   ```
   pacman -Qqe > ~/GitHub/Manuals/05\ BackUps/niri/system/pkglist.txt
   pacman -Qqm > ~/GitHub/Manuals/05\ BackUps/niri/system/aurlist.txt
   flatpak list --app --columns=application,origin > ~/GitHub/Manuals/05\ BackUps/niri/system/flatpak-list.txt
   systemctl list-unit-files --state=enabled --no-pager > ~/GitHub/Manuals/05\ BackUps/niri/system/systemd-enabled.txt
   systemctl --user list-unit-files --state=enabled --no-pager > ~/GitHub/Manuals/05\ BackUps/niri/system/systemd-user-enabled.txt
   ```
