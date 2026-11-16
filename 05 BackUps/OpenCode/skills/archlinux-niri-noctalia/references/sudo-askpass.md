# sudo through rofi (Wayland)

Root commands must not prompt in a terminal. Set an askpass helper and call `sudo -A`.

## Helper

`~/.local/bin/rofi-askpass` (executable) prints the password to stdout:

```sh
#!/bin/sh
exec rofi -dmenu -password -p "sudo" -no-fixed-num-lines -lines 0
```

## Environment

In `~/.bashrc`:

```sh
export SUDO_ASKPASS="$HOME/.local/bin/rofi-askpass"
```

Then:

```sh
sudo -A pacman -S --needed --noconfirm <pkg>
```

Do not alias `sudo`: other tooling calls it without `-A` and expects a TTY.

## Gotcha: rofi already open

If any rofi instance is running (for example the app menu), the askpass helper cannot start a second one:

```
(process): Helper-WARNING: Failed to set lock on pidfile: Rofi already running?
sudo: пароль не предоставлен
```

Result: the command fails and nothing changes. Ask the user to close the rofi window, then retry.

## Gotcha: interactive tools

Commands that need a TTY (`opencode auth login`, `herdr`) must run inside a real terminal window, not through a captured shell. Open a terminal:

```sh
niri msg action spawn -- "terminator" "-e" "<command>"
```

(any terminal on PATH works).
