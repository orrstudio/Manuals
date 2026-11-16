# Runbook: развернуть систему на новой машине

Для агента, который ставит систему с нуля. Бэкап лежит в git-репозитории `Manuals`:
путь `05 BackUps/niri/` = домашняя папка `~/` пользователя, `05 BackUps/OpenCode/` = `~/.config/opencode/`.
Читать целиком до начала; выполнять фазы по порядку, после каждой — проверка.

## Фаза 0. Предпосылки

```sh
git clone <repo-url> ~/GitHub/Manuals      # или получить архивом
sudo -A pacman -S --needed git base-devel
```

Проверка: `ls ~/GitHub/Manuals/05\ BackUps/niri` и `.../OpenCode`.

## Фаза 1. Пользователь и группы

- Создать пользователя с домашним каталогом. UID 1000 не обязателен, но удобен.
- Добавить в группы:

```sh
sudo -A usermod -aG video,input,wheel <user>
```

`video` нужна для яркости (`brightnessctl`), `input` — для устройств ввода, `wheel` — для sudo.
Проверка: `id` показывает группы; после перелогина `test -w /sys/class/backlight/*/brightness`.

## Фаза 2. Пакеты

```sh
# системные
sudo -A pacman -S --needed $(cat "05 BackUps/niri/system/pkglist.txt")

# AUR (нужен yay)
yay -S --needed - < "05 BackUps/niri/system/aurlist.txt"

# flatpak
sudo -A flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
while read -r app _; do sudo -A flatpak install --system -y flathub "$app"; done < "05 BackUps/niri/system/flatpak-list.txt"
sudo -A flatpak install --system -y flathub org.gtk.Gtk3theme.Adwaita-dark
flatpak override --user --env=GTK_THEME=Adwaita-dark com.github.PintaProject.Pinta
flatpak override --user --env=GTK_THEME=Adwaita-dark com.transmissionbt.Transmission
```

Проверка: `pacman -Qqe | wc -l` ≈ 89; `flatpak list --app | wc -l` = 10.

## Фаза 3. Восстановить домашние конфиги

```sh
cp -a "05 BackUps/niri/." ~/          # = весь $HOME из бэкапа
cp -a "05 BackUps/OpenCode/." ~/.config/opencode/
```

Это вернёт: Niri (`config.kdl`), Noctalia (`settings.toml`, `state.toml`, `plugins/data/`, палитры),
`.bashrc`, `.wezterm.lua`, `~/.local/bin/*`, `yazi/`, `herdr-app/`, `mc/`, `qt6ct/`, `gtk-*/gtk.css`,
speech-dispatcher, закладки, ярлыки `.desktop`.

Проверка: `niri validate`; `ls ~/.local/bin | wc -l`.

## Фаза 4. Системные копии и сервисы

```sh
sudo -A install -m 644 "05 BackUps/niri/system/etc/udev/rules.d/90-backlight.rules" /etc/udev/rules.d/
sudo -A udevadm control --reload-rules && sudo -A udevadm trigger --action=add --subsystem-match=backlight
sudo -A install -m 644 "05 BackUps/niri/system/etc/speech-dispatcher/modules/piper.conf" /etc/speech-dispatcher/modules/
systemctl --user daemon-reload
```

Проверка: `ls -l /sys/class/backlight/*/brightness` → `root:video rw-rw-r--`.

## Фаза 5. Пересоздать то, что не бэкапится

| Компонент | Действие |
|---|---|
| piper | скачать piper в `~/.local/opt/piper`, симлинк `~/.local/bin/piper`; модели `ru_RU-irina-medium`, `en_US-lessac-high` в `~/.local/share/piper/voices` |
| Silero | пересоздать venv `~/.local/share/silero-venv` (см. `OpenCode/Voxtype-And-TTS-Reader.md`) |
| SuperWhisper | `git clone` в `~/superwhisper-linux` + uv venv + `~/.local/bin/superwhisper` |
| Herdr App (~98 МБ) | `curl -fsSL https://releases.herdr.dev/app/install.sh | sh` (ядро herdr-core ставится автоматически) |

Без piper голос Orca и резерв читалки не работают; без Silero — основной русский TTS.

Проверка: `spd-say -o piper -w "тест"`; `printf 'тест' | ~/.local/bin/say-clipboard`.

## Фаза 6. Железо и учётные данные

- **Мониторы**: `~/.config/kanshi/config` и `[lockscreen_widgets]` в Noctalia содержат `eDP-1`/`DP-3`. На другой конфигурации переписать или удалить записи.
- **gpu-boot-report**: юнит и скрипт специфичны для ноутбука ZBook — на другой машине отключить/удалить.
- **Секреты**: `~/.password-store` (git), `~/.ssh`, `~/.gnupg`, keyring — перенести вручную, не из этого бэкапа.
- **Сеть/Bluetooth**: NetworkManager-подключения и pairings — настроить заново.

## Фаза 7. Финальная проверка

```sh
niri validate
noctalia msg config-reload && noctalia msg color-scheme-get     # wallpaper
spd-say -o piper -w "тест"
env QT_QPA_PLATFORMTHEME=qt6ct qtpass &
gparted-root.sh
brightnessctl -m
```

Проверить руками: `Mod+K` (оверлей), закладки (flatpak через `flatpak run`), бар Noctalia,
тёмная тема GTK/Qt/WezTerm/yazi, промпт (`PS1` из `.bashrc`), TTS по `Mod+A`/`Pause`, Orca по `Mod+S`.

## Что читать в этом скилле

- `pacman.md` — установка/удаление, проверка зависимостей
- `backup-sync.md` — как синхронизировать бэкап дальше
- `noctalia.md` — настройка бара/закладок после восстановления
- `tts-orca.md` — piper/speech-dispatcher/Orca
- `desktop-apps.md` — Qt/GParted/камера/Herdr App
