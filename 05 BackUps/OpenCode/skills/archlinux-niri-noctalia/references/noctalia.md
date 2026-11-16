# Noctalia: shell settings, panels, Bookmarks

State directory: `~/.local/state/noctalia/` (`settings.toml`, `state.toml`, `plugins/data/`).

## Editing settings

Prefer the IPC so the daemon applies and rewrites the file itself:

```sh
noctalia msg config-set dock.enabled false
noctalia msg config-reload
noctalia msg config-get dock.enabled
```

Editing `settings.toml` by hand is fine for bulk changes; follow with `noctalia msg config-reload`. Do not fight the daemon: an open settings window can overwrite your edit.

## Panels and IPC

```sh
noctalia msg panel-toggle launcher
noctalia msg panel-toggle control-center
noctalia msg panel-toggle clipboard
noctalia msg panel-toggle session
noctalia msg panel-toggle dunarand/bookmarks:panel
```

## Dock (bottom of the screen)

```sh
noctalia msg config-set dock.enabled false     # off
noctalia msg config-set dock.enabled true      # on
```

`[dock]` also holds `pinned`, `smart_auto_hide`, `active_monitor_only`, `magnification_scale`. Runtime toggles exist too (`dock-hide`, `dock-show`, `dock-toggle`) but they are overrides, not settings.

## Lockscreen

`[lockscreen] enabled = true` plus a bind:

```kdl
Mod+L { spawn "noctalia" "msg" "session" "lock"; }
```

## Bar

`[bar.<name>]` holds `start`, `center`, `end` lists of widget ids, plus `capsule`, `scale`, groups (`[[bar.<name>.capsule_group]]`). To remove a widget from the bar, delete its id from those arrays (the widget config under `[widget.<id>]` may stay).

## Bookmarks plugin (`dunarand/bookmarks`)

Data: `~/.local/state/noctalia/plugins/data/dunarand/bookmarks/data.json`. Root is an array, order = display order.

```json
{
  "type": "bookmark",
  "glyph": "folder",
  "label": "Files",
  "cmd": "gtk-launch org.gnome.Nautilus",
  "description": "File manager",
  "runInBackground": true,
  "runInTerminal": false
}
```

- `type`: `bookmark` or `folder` (folders may only contain bookmarks, one level).
- `label` and `cmd` are required; `glyph` falls back to `bookmark`/`folder`.
- Glyph names come from the Tabler set shipped by Noctalia: `/usr/share/noctalia/assets/fonts/tabler.json`. Check a name before using it:
  `grep -q '"terminal"' /usr/share/noctalia/assets/fonts/tabler.json`
- GUI apps: `runInBackground: true`. Для flatpak-приложений надёжнее `cmd = "flatpak run <app-id>"` — `gtk-launch` в окружении Noctalia срабатывал нестабильно.
- Для обычных приложений — `gtk-launch <desktop-id>`.
- Add/edit with a small JSON script, then mirror the file to the backup.

Useful glyphs seen: `folder`, `terminal`, `terminal-2`, `search`, `palette`, `world`, `file-text`, `layout-dashboard`, `adjustments`, `send`, `microphone`, `chart-line`, `sitemap`, `tool`, `video`, `camera`, `satellite`, `gauge`, `robot`, `key`, `lock-square-rounded`.

## Plugin data and backup

`plugins/data/` is user data (bookmarks, notes, plugin state) and is backed up. `plugins/sources/`, `plugins/materialized/`, caches and palettes are rebuilt by Noctalia — not backed up.
