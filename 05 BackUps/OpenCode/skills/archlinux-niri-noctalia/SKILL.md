---
name: archlinux-niri-noctalia
description: Operates an Arch Linux desktop built on Niri + Noctalia. Use when installing or removing packages (pacman/yay/flatpak), running privileged commands through sudo -A with rofi-askpass, editing Niri keybinds (spawn/spawn-sh, hotkey overlay, Mod vs Super duplicates), configuring Noctalia (dock, lockscreen, panels, Bookmarks plugin, settings.toml), setting up TTS (speech-dispatcher, piper, RHVoice, GNOME Orca screen reader), theming Qt apps (qt6ct, QtPass/pass), fixing brightness (brightnessctl + udev), importing photos from a camera (gphoto2, gvfs-gphoto2, gthumb, exiftool), launching herdr, or syncing the file backup (MIRRORS.md, BACKUP-MANIFEST.md). Triggers: pacman, sudo -A, rofi-askpass, Mod+K, bookmarks data.json, piper, Orca Insert, qtpass, gphoto2, MIRRORS.
---

# Arch + Niri + Noctalia operations

## Working cycle (every task)

1. **Probe** — read-only first: `pacman -Qi`, `--print` simulation, `grep` the config, `systemctl status`, logs. Never change state to find out what state is.
2. **Confirm** — before installs, removals, config edits, or anything with side effects, state the plan and ask the user. One explicit yes per action.
3. **Apply** — smallest edit, then verify: `niri validate`, `pacman -Q`, `command -v`, a real launch, a `--help`.
4. **Mirror** — every changed file gets copied to the backup and diff-checked, and the registries updated. See `references/backup-sync.md`. The change is not done until the mirror matches.

## Hard rules

- Root commands go through `sudo -A` with `SUDO_ASKPASS` set, so the password is typed in a rofi window. See `references/sudo-askpass.md`.
- Removing a package requires a dependency check first (`Required By` + `pacman -Rd --print`). See `references/pacman.md`.
- Never write secrets into configs; keys live in `pass`.
- Keep each fact in one place: registries (`MIRRORS.md`, `BACKUP-MANIFEST.md`, `INSTALLED-APPS.md`) are the source of truth for files, this skill for procedures, memory for personal values.

## Reference map

| Task | Read |
|---|---|
| install/remove packages, dependency checks, package lists | `references/pacman.md` |
| `sudo -A`, rofi password prompt, SUDO_ASKPASS | `references/sudo-askpass.md` |
| Niri keybinds, overlay, spawn vs spawn-sh, duplicate keys | `references/niri.md` |
| Noctalia: dock, lockscreen, panels, Bookmarks, settings.toml | `references/noctalia.md` |
| TTS: speech-dispatcher, piper, RHVoice, GNOME Orca | `references/tts-orca.md` |
| Qt theme, QtPass/pass, brightness, cameras, herdr, media keys | `references/desktop-apps.md` |
| backup mirroring, registries, package lists | `references/backup-sync.md` |

Scripts: `scripts/sudo-a.sh`, `scripts/pkg-remove-check.sh`, `scripts/backup-sync.sh`.
