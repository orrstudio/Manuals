# Память OpenCode

Система: Arch Linux + Niri (Wayland) + Noctalia, GTX 1650. Встроенная клавиатура ноутбука испорчена — только внешняя.

Процедуры — скилл `archlinux-niri-noctalia`. Данные — в бэкапе (`config.kdl`, `settings.toml`, `.bashrc`, скрипты) и реестрах (`MIRRORS.md`, `BACKUP-MANIFEST.md`, `INSTALLED-APPS.md`). Здесь — только решения и грабли, которые из конфигов не выводятся.

## Решения и грабли

- **SuperWhisper**: модель `medium`, `auto_paste: true` — не менять. Stub `~/.local/bin/hyprctl` (`{"class":""}`) обязателен, иначе падение на Niri.
- **Автостоп записи 60 с** (`sw-start.sh` + `sw-record-timeout.sh`) — после случая, когда запись шла 4 ч 54 мин без второго нажатия.
- **TTS английский**: piper `Amy` сломан (ошибка кодпоинтов) — использовать `lessac-high`.
- **TTS русский**: основной Silero (baya), резерв piper Irina; `SAY_SPEED=0.6`.
- **Orca**: `GDK_BACKEND=wayland` обязателен (иначе `XkbSetMap`); `Insert+Пробел` = настройки, не flat review; `AddVoice` в piper-модуле обязателен (иначе espeak-«робот»).
- **Herdr**: запускать со сбросом переменных `HERDR_*`, иначе «nested herdr is disabled».
- **Qt**: `qt6ct`, палитра `darker`, шрифт 16 pt, `QT_QPA_PLATFORMTHEME=qt6ct`.
- **Noctalia**: `dock.enabled = false`, `lockscreen.enabled = true`; плагин `keymap` помечен deprecated, но работает.
- **Удалено**: Terminator, alacritty (терминал — WezTerm); Stably Orca, orca-server, `~/.config/orca` (остался GNOME Orca).
- **Не бэкапим**: секреты (`pass`, `~/.ssh`, GPG), кэши Noctalia, `qt6ct`, `.var/app`.

## Что где искать

- Бинды Niri — `~/.config/niri/config.kdl` (бэкап)
- Noctalia — `~/.local/state/noctalia/settings.toml` (бэкап)
- Скрипты — `~/.local/bin/` (бэкап)
- Пакеты — `system/pkglist.txt`, `aurlist.txt`, `flatpak-list.txt`
- Файлы бэкапа — `MIRRORS.md`
