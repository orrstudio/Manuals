# Backup mirroring

The backup is a copy of the user's home plus selected system files. Layout:

```
<backup>/niri/          = $HOME   (~/.local/bin/x.sh -> <backup>/niri/.local/bin/x.sh)
<backup>/niri/system/   = system extras (etc/, usr/bin/ copies, package lists)
<backup>/OpenCode/      = mirror of ~/.config/opencode (AGENTS, memory, MIRRORS, skills, docs)
```

Registries — each is the single source of truth for its scope:

| File | Scope |
|---|---|
| `~/.config/opencode/MIRRORS.md` | every mirrored file and where it goes; also "not backed up" list |
| `<backup>/niri/BACKUP-MANIFEST.md` | numbered table: file, backup path, purpose, status |
| `<backup>/niri/system/INSTALLED-APPS.md` | journal: app, package, date, config path, backed up |

## Procedure for any changed file

1. Copy preserving mode: `cp -p <src> <dst>`. Keep the original file name — never invent dated names.
2. Prove the copy: `diff -q <src> <dst>` must print nothing.
3. If the file is new to the backup, add it to `MIRRORS.md` and `BACKUP-MANIFEST.md`.
4. If the change affects packages, refresh the lists (below).
5. If the change affects the OpenCode config mirror, copy `AGENTS.md`, `memory.md`, `MIRRORS.md`, and the reference docs too.

## Package lists

```sh
pacman -Qqe > <backup>/niri/system/pkglist.txt
pacman -Qqm > <backup>/niri/system/aurlist.txt
flatpak list --app --columns=application,origin > <backup>/niri/system/flatpak-list.txt
systemctl list-unit-files --state=enabled --no-pager > <backup>/niri/system/systemd-enabled.txt
systemctl --user list-unit-files --state=enabled --no-pager > <backup>/niri/system/systemd-user-enabled.txt
```

Lists are refreshed manually (no timer) — do it in the same session as an install/removal.

## What is not backed up

Registries under `MIRRORS.md` section 3 (secrets, caches, `.var/app`, browser profiles, `qt5ct/qt6ct`, Noctalia plugin sources/palettes). If a setting there matters, record the setting itself in memory, not the file.

## Script

`scripts/backup-sync.sh <backup_root>` syncs pairs from stdin (`src|relative-dest`) and refreshes the lists:

```sh
printf '%s\n' "$HOME/.config/niri/config.kdl|.config/niri/config.kdl" \
  | scripts/backup-sync.sh "$HOME/GitHub/Manuals/05 BackUps/niri"
```

It prints `ok` or `DIFF` per pair, so a silent run means everything matched.
