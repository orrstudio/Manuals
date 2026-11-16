# Desktop apps: Qt theme, passwords, brightness, cameras, Herdr App, media

## Qt apps look white on a dark desktop (qt6ct)

Qt does not read the GTK theme. Install `qt6ct`, give it a dark palette and a font, and point Qt at it:

`~/.config/qt6ct/qt6ct.conf`

```
[Appearance]
color_scheme_path=/usr/share/qt6ct/colors/darker.conf
custom_palette=true
style=Fusion

[Interface]
icon_theme=Adwaita

[Fonts]
general="Adwaita Sans,16,-1,5,50,0,0,0,0,0"
fixed="Adwaita Mono,16,-1,5,50,0,0,0,0,0"
```

`~/.bashrc`: `export QT_QPA_PLATFORMTHEME="qt6ct"` (applies after re-login).

For a session that predates the variable, launch the app explicitly:

```sh
env QT_QPA_PLATFORMTHEME=qt6ct <app>
```

That is also the right form for a Niri bind or a `.desktop` file.

Alternative palettes: `/usr/share/qt6ct/colors/{darker,dusk,airy,sand,waves}.conf`.

## pass and QtPass

- `pass` store: `~/.password-store`; keys in GPG.
- `qtpass` is the GUI. First run asks for the store path (`~/.password-store`) and `gpg`.
- QtPass config: `~/.config/QtPass/`. Not backed up by policy; the theme/font settings live in qt6ct.
- Launch with the Qt theme: `env QT_QPA_PLATFORMTHEME=qt6ct qtpass`.

## Brightness (brightnessctl + udev)

`brightnessctl` alone is not enough: `/sys/class/backlight/*/brightness` is root-only.

`/etc/udev/rules.d/90-backlight.rules`:

```
SUBSYSTEM=="backlight", ACTION=="add", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"
```

Add the user to `video` (`sudo -A usermod -aG video <user>`), reload:

```sh
sudo -A udevadm control --reload-rules
sudo -A udevadm trigger --action=add --subsystem-match=backlight
ls -l /sys/class/backlight/*/brightness      # expect root:video rw-rw-r--
brightnessctl -m
```

Binds:

```kdl
XF86MonBrightnessUp { spawn "brightnessctl" "--class=backlight" "set" "+10%"; }
XF86MonBrightnessDown { spawn "brightnessctl" "--class=backlight" "set" "10%-"; }
```

## Photo camera import

- `gvfs-gphoto2` + `libgphoto2` — camera appears in Nautilus (PTP). Restart `gvfs-daemon` after installing.
- `gphoto2` — CLI: `gphoto2 --auto-detect`, `--list-files`, `--get-all-files` (downloads into cwd).
- `gthumb` — GUI thumbnails/import.
- `exiftool` (`perl-image-exiftool`) — metadata.
- If the camera is absent, check its USB mode (PTP/MTP, not charge-only) and run `gphoto2 --auto-detect`.

## Media and volume

```sh
wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
playerctl play-pause | next | previous | stop
```

## Window decorations

Niri draws none. Apps with client-side decorations (GTK, Qt, Chromium, Zen, GitHub Desktop) show a title bar and close button; terminals that draw none on Wayland (WezTerm) are closed with `Mod+Q` / `Alt+F4`.

## GParted (root GUI on Wayland)

`pkexec` drops Wayland environment, so the stock launcher fails with `cannot open display :0`. Use a wrapper that passes it explicitly:

```sh
export SUDO_ASKPASS="$HOME/.local/bin/rofi-askpass"
exec sudo -A env GDK_BACKEND=wayland \
    WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-1}" \
    XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}" \
    GTK_THEME=Adwaita:dark gparted "$@"
```

Point a user `.desktop` (`Exec=gparted-root.sh`) at it — it overrides the system launcher. `GTK_THEME=Adwaita:dark` is the correct form (there is no `Adwaita-dark` theme directory).

## Herdr App (native GUI)

Separate from Herdr TUI: the app runs agents in `herdr-core` and does not share sessions with the TUI.

```sh
curl -fsSL https://releases.herdr.dev/app/install.sh | sh   # official installer, verifies sha256
herdr-app                                                    # GUI
```

- Installs to `~/.local/share/herdr-app`, symlink `~/.local/bin/herdr-app`, `.desktop` + icon.
- `herdr-core` (and `hc`) go to `~/.local/bin` only if absent; the app keeps them updated.
- Config: `~/.config/herdr-app/` (`settings.json`, `keys.json`, `layouts/`, `mods/`, `themes/`, `AGENTS.md`). `data/` and `frame/` are caches — do not back them up.
- Back up the config, not the 98 MB binary; re-run the installer instead.
- On Linux the app turns on systemd linger for the user so the core outlives logins.
