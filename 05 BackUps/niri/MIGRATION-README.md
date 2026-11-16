# Читай сначала это

Это бэкап системы (Arch + Niri + Noctalia). Для агента, который разворачивает новую машину:

**Полный пошаговый runbook:** `05 BackUps/OpenCode/skills/archlinux-niri-noctalia/references/migration.md`

Короткая карта:

| Что | Где |
|---|---|
| Домашние конфиги (=$HOME) | `niri/` (`.config/`, `.local/`, `.bashrc`, `.wezterm.lua`) |
| Системные копии | `niri/system/etc/` (udev backlight, speech-dispatcher piper.conf) |
| Списки пакетов | `niri/system/pkglist.txt`, `aurlist.txt`, `flatpak-list.txt` |
| Реестр всех зеркал | `OpenCode/MIRRORS.md` |
| Реестр бэкапа | `niri/BACKUP-MANIFEST.md` |
| Журнал установок | `niri/system/INSTALLED-APPS.md` |
| Палитра/тема | `OpenCode/Theme-Palette.md` |
| Память ассистента | `OpenCode/memory.md` |
| Скилл (процедуры) | `OpenCode/skills/archlinux-niri-noctalia/` |

Порядок: пользователь и группы → пакеты → `cp -a niri/. ~/` → `/etc`-копии → пересоздать
piper/Silero/SuperWhisper → железо/секреты → проверка (`niri validate`, `spd-say -o piper`).

Важно: `niri/` = домашняя папка, копировать содержимое, а не саму папку.
