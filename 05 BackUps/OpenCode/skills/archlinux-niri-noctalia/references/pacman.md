# pacman: install, remove, inspect

All privileged calls use `sudo -A` (see `sudo-askpass.md`).

## Install

```sh
sudo -A pacman -S --needed --noconfirm <packages...>
```

`--needed` skips already-installed packages. Install optional companions in the same transaction to avoid a second prompt.

### Stale database (404 on package files)

Symptom: `failed to retrieve '<pkg>-<ver>' ... 404`, or the mirror reports only newer versions than the sync database.

Cause: the local sync database is older than the mirrors.

Fix: a full upgrade, not `-Sy` plus install:

```sh
sudo -A pacman -Syu --noconfirm --needed <packages...>
```

`-Sy` followed by an install is a partial upgrade and can break the system. If a new kernel arrives, tell the user a reboot is needed (`uname -r` vs `pacman -Q linux`).

## Remove (check dependencies first)

```sh
pacman -Qi <pkg> | grep -iE 'Требуется|Required By'
sudo -A pacman -Rd --print <pkg>     # simulation: what would be removed
sudo -A pacman -Rns --noconfirm <pkg>
```

- `-n` (nosave) cannot be combined with `--print`; use `-Rd --print` for the simulation.
- `-Rns` removes orphans (`-s`) and config backups (`-n`); `pacman` prints the dependency list it would remove — read it before confirming.
- Then clean user leftovers by hand (`~/.config/<app>`), but only with the user's agreement.

## Inspect before touching

```sh
pacman -Q <pkg>              # installed?
pacman -Qi <pkg>             # version, dependencies, Required By, conflicts
pacman -Ql <pkg>             # file list
pacman -Qo /path             # which package owns a file
pacman -F <file>             # which package provides a file (needs `pacman -Fy` once)
pacman -Ss <name>            # search the sync database
```

## After any install or removal

```sh
command -v <binary> && <binary> --version   # prove it works
```

Then refresh the lists that live in the backup (see `backup-sync.md`):

```sh
pacman -Qqe            > <backup>/system/pkglist.txt
pacman -Qqm            > <backup>/system/aurlist.txt
flatpak list --app --columns=application,origin > <backup>/system/flatpak-list.txt
```

Also add a row to `INSTALLED-APPS.md` (app, package, date, config path, backed up or not).

Finally add the app to the Bookmarks panel (`~/.local/state/noctalia/plugins/data/dunarand/bookmarks/data.json`): `label`, a Tabler `glyph`, `cmd` (`gtk-launch <desktop-id>` for GUI apps), `runInBackground: true`; mirror the file afterwards. Removing an app means removing its bookmark too. Details: `noctalia.md`.

## Gotchas seen in practice

- A package that ships a `.desktop` file can hide a previously installed app's launcher. Check `/usr/share/applications`, `~/.local/share/applications` and `/var/lib/flatpak/exports/share/applications` before overwriting a symlink in `/usr/local/bin`.
- `-Rns` may pull libraries that nobody else needs (e.g. `libxss`); that is expected, `Required By` was empty.
- Flatpak apps launch via `gtk-launch <app-id>` or `flatpak run <app-id>`; `gtk-launch` needs the `.desktop` id.
