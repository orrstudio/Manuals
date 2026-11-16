# Реестр бэкапов Niri

Папка `niri/` = домашняя папка `~/`: `~/.local/bin/x.sh` → `niri/.local/bin/x.sh`, `~/.config/niri/config.kdl` → `niri/.config/niri/config.kdl`.

**Полный перечень зеркалируемых файлов — `~/.config/opencode/MIRRORS.md`** (единственный источник истины: что копируется, куда и зачем). Здесь — правила, исключения и статус.

## Правила

1. Каждое изменение оригинала — сразу копия в бэкап (`cp -p`) и проверка `diff -q`.
2. Новый файл — строка в `MIRRORS.md`; при изменении — зеркало.
3. Оригинальное имя файла сохраняется (никаких датированных вариантов).
4. Списки пакетов обновляются вручную в той же сессии, что и установка:
   `pacman -Qqe`, `pacman -Qqm`, `flatpak list --app`, `systemctl [--user] list-unit-files --state=enabled`.
5. Конфиги OpenCode (`AGENTS.md`, `memory.md`, `MIRRORS.md`, справочники, `skills/`) зеркалятся в `05 BackUps/OpenCode/`.

## Не бэкапим

| Что | Почему |
|---|---|
| Noctalia `plugins/sources/`, `plugins/materialized/`, `plugin-cache/`, `community-palettes/`, `community-templates/` | скачиваются/пересоздаются |
| `recently_used.json`, `usage_counts.json`, `screen_time.json` | статистика |
| `~/.ssh`, `~/.password-store`, `~/.gnupg` (ключи), `~/.local/share/keyrings` | секреты |
| `~/.var/app/` (flatpak-профили) | по решению пользователя |
| `~/.config/qt5ct`, `gtk-3.0`, `gtk-4.0`, `mimeapps.list` | по решению (qt6ct бэкапится: conf + палитра Adwaita) |
| `herdr`, `piper`, `superwhisper` бинарники/симлинки | переустанавливаются |
| `~/.config/zen/`, `~/.config/mc/`, `~/.config/waybar/` | по решению |

## Системные копии (`niri/system/`)

`system/pkglist.txt`, `aurlist.txt`, `flatpak-list.txt`, `systemd-enabled.txt`, `systemd-user-enabled.txt`, `INSTALLED-APPS.md`, а также копии системных конфигов: `system/etc/udev/rules.d/90-backlight.rules`, `system/etc/speech-dispatcher/modules/piper.conf`.

## Статус

Последняя полная сверка: 2026-11-16 (все файлы `diff`-чистые). Проверка: `scripts/backup-sync.sh` из скилла `archlinux-niri-noctalia`.
