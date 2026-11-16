# Журнал установленного

Пакеты восстанавливаются из списков, конфиги — из бэкапа. Здесь только то, что не выводится из `pacman -Qqe` / `MIRRORS.md`.

- Пакеты: `system/pkglist.txt`, `system/aurlist.txt`, `system/flatpak-list.txt`
- Файлы и конфиги: `MIRRORS.md`, `BACKUP-MANIFEST.md`

## Установлено без пакетного менеджера

| Что | Как установлено | Конфиг | Бэкап |
|---|---|---|---|
| SuperWhisper | uv tool из `~/superwhisper-linux` | `~/.config/superwhisper-linux/config.json` | да |
| Zen Browser | AUR `zen-browser-bin` | `~/.config/zen/` | нет (решение) |
| GitHub Desktop | flatpak `io.github.shiftey.Desktop` | `~/.var/app/...` | нет (решение) |
| LocalSend | flatpak `org.localsend.localsend_app` | `~/.var/app/...` | нет (решение) |
| Easyflatpak (GUI для flatpak) | flatpak `org.dupot.easyflatpak` | `~/.var/app/...` | нет (решение) |
| Transmission (torrent) | flatpak `com.transmissionbt.Transmission` | `~/.var/app/...` | нет (решение) |
| Pinta (графика) | flatpak `com.github.PintaProject.Pinta` | `~/.var/app/...` | нет (решение) |
| VLC (медиа) | flatpak `org.videolan.VLC` | `~/.var/app/...` | нет (решение) |
| SMPlayer (медиа) | flatpak `info.smplayer.SMPlayer` | `~/.var/app/...` | нет (решение) |
| Flatsweep (очистка flatpak) | flatpak `io.github.giantpinkrobots.flatsweep` | `~/.var/app/...` | нет (решение) |
| Flatseal (права flatpak) | flatpak `com.github.tchx84.Flatseal` | `~/.var/app/...` | нет (решение) |
| Gearlever (AppImage) | flatpak `it.mijorus.gearlever` | `~/.var/app/...` | нет (решение) |
| Herdr App (нативный GUI) | установщик releases.herdr.dev → `~/.local/share/herdr-app`, `herdr-app` в `~/.local/bin` | `~/.config/herdr-app/` | да (без data/frame) |
| piper | `~/.local/share/piper` (модели) | — | нет (пересоздаётся) |
| Silero | `~/.local/share/silero-venv` | — | нет (пересоздаётся) |

## Секреты и keyring

| Компонент | Пакет | Конфиг |
|---|---|---|
| pass | `pass` | `~/.password-store/` (в git, не в бэкапе) |
| pinentry-rofi | `pinentry-rofi` (AUR) | `~/.gnupg/gpg-agent.conf` (бэкап) |
| gnome-keyring | `gnome-keyring` | `~/.local/share/keyrings/` (не бэкап) |
| Автозапуск keyring | — | `~/.bash_profile` перед Niri |
| browserpass | `browserpass` + `browserpass-firefox` | хост `/usr/bin/browserpass`, расширение `browserpass@maximbaz.com` в Zen |
| GPG авторазблокировка | — | пароль в gnome-keyring, `gpg-keyring-unlock.sh` в `.bash_profile`, `allow-preset-passphrase` |

`pass-secret-service` удалён (конфликт с gnome-keyring); токены приложений — в gnome-keyring с пустым паролем.

## SSH

`~/.ssh/id_ed25519` (600), `~/.ssh/id_ed25519.pub` (644), `~/.ssh/config` (600). В бэкап не входят.

## Плагины Noctalia

Список включённых — `settings.toml` (`[plugins] enabled`). Данные плагинов (`bookmarks`, `localsend`, `launcher-pass`, `layout-fix`) — в `plugins/data/`, бэкапятся.

## TTS

Silero venv и модели piper не бэкапятся (пересоздаются). Конфиги speech-dispatcher (`speechd.conf`, `modules/piper.conf`) — бэкапятся; голоса RHVoice — пакеты (`rhvoice-voice-*`).

## Как пополнять

1. Новое приложение без пакета — строка в таблицу выше.
2. Новый пакет — `pacman -Qqe` в списки (см. `backup-sync.sh`).
3. Новый конфиг — строка в `MIRRORS.md` и копия в бэкап.
