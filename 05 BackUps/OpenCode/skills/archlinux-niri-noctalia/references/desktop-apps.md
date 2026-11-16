# Desktop apps: Qt theme, passwords, brightness, cameras, herdr, media

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

## herdr (TUI session manager)

`herdr` has no GUI: it is a terminal workspace manager for AI agents, run inside a terminal (e.g. `wezterm start --always-new-process -e herdr`).

It refuses a nested start: `nested herdr is disabled by default`. When launching from a shell or from inside a herdr pane, clear its variables first:

```sh
env -u HERDR_ENV -u HERDR_SOCKET_PATH -u HERDR_PANE_ID -u HERDR_TAB_ID \
    -u HERDR_WORKSPACE_ID -u HERDR_STARTUP_CWD -u HERDR_BIN_PATH -u TERM_PROGRAM \
    wezterm start --always-new-process -e herdr
```

Use the same command in the `.desktop` `Exec=` and in a Niri bind. The Noctalia plugin `hy4ri/herdr` only monitors sessions (`herdr session list`) and focuses them; it is not the app.

## Media and volume

```sh
wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
playerctl play-pause | next | previous | stop
```

## Window decorations

Niri draws none. Apps with client-side decorations (GTK, Qt, Chromium, Zen, GitHub Desktop) show a title bar and close button; terminals that draw none on Wayland (WezTerm) are closed with `Mod+Q` / `Alt+F4`.
