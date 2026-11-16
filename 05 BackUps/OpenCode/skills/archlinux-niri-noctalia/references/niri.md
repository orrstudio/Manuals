# Niri: keybinds and debugging

Config: `~/.config/niri/config.kdl`. Validate and reload:

```sh
niri validate
```

Niri reloads the config automatically on save (journal shows `niri_config: loaded config`). No restart needed.

## spawn vs spawn-sh

`spawn` passes each quoted string as a separate argv element — it does not split on spaces and does not expand `~` or `$VAR`:

```kdl
spawn "gtk-launch" "zen"                       // correct
spawn "herdr-app"
spawn "gtk-launch zen"                         // WRONG: one binary name with a space
```

Use `spawn-sh` when you need a shell (pipes, env, variables, `||`):

```kdl
spawn-sh "pkill orca || GDK_BACKEND=wayland orca"
```

Verify a suspicious bind without restarting by asking the compositor to run it:

```sh
NIRI_SOCKET=$(ls /run/user/*/niri.*.sock | head -1) niri msg action spawn -- "true" "--flag"
```

## Hotkey overlay (the Mod+K list)

- `hotkey-overlay-title="text"` — shown with that label.
- `hotkey-overlay-title=null` — bind stays active but disappears from the overlay (use it to hide media keys).
- Binds without the property and plain spawns sort after custom-titled binds; the hardcoded list comes first. There is no supported way to force a custom order.

## Mod == Super

On a TTY session `Mod` is `Super`. `Mod+D` and `Super+D` are the same physical key; when both exist, one silently shadows the other. Find real duplicates:

```sh
awk '/^binds \{/,0' ~/.config/niri/config.kdl \
  | grep -vE '^\s*//' | grep -oE '^\s*[A-Za-z0-9+_.]+' | tr -d ' ' \
  | sed 's/^Mod+/Super+/' | sort | uniq -d
```

Same action bound to several keys is harmless but noisy; list it:

```sh
awk '/^binds \{/,0' ~/.config/niri/config.kdl | grep -vE '^\s*//' \
  | sed -E 's/^[[:space:]]*//; s/ hotkey-overlay-title=[^ ]*//; s/ allow-[^ ]*//; s/ repeat=[^ ]*//' \
  | awk -F'[{;]' '{print $2 "\t" $1}' | sort | uniq -c | sort -rn | head -20
```

## Checking occupied keys

`+` is an ERE quantifier, so escape it (or use grep -F) when testing a key:

```sh
grep -qE "^[[:space:]]*Mod\+W([[:space:]]|\{)" ~/.config/niri/config.kdl
```

## Binds that call Noctalia

Noctalia is a Wayland client, not a compositor extension: a global key can only be caught by Niri and forwarded.

```kdl
Mod+Shift+C { spawn "noctalia" "msg" "panel-toggle" "control-center"; }
```

Available panels: `launcher`, `control-center`, `session`, `clipboard`, plus plugin panels (`<plugin-id>:panel`).

## Window decorations

Niri draws no server-side decorations. Windows have title bars and close buttons only if the app draws client-side decorations (GTK, Qt, Chromium apps). WezTerm on Wayland draws none: close with `Mod+Q` / `Alt+F4`, or run it under XWayland (`env -u WAYLAND_DISPLAY wezterm`).

## Useful IPC

```sh
niri msg windows
niri msg workspaces
niri msg action                     # list every action
niri msg action spawn -- <argv...>
niri msg keyboard-layouts
```
