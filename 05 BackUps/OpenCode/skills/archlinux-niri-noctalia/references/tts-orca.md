# TTS: speech-dispatcher, piper, RHVoice, GNOME Orca

Two independent consumers: the clipboard reader (`say-clipboard`, Silero/piper directly) and the screen reader (GNOME Orca via speech-dispatcher). Changing one must not break the other — verify both.

## speech-dispatcher layout

User config: `~/.config/speech-dispatcher/speechd.conf`

```
AddModule "piper" "sd_generic" "piper.conf"
AddModule "espeak-ng" "sd_espeak-ng" "espeak-ng.conf"
DefaultModule piper
DefaultLanguage ru
```

The module config is read from `/etc/speech-dispatcher/modules/` (absolute paths in `AddModule` are unreliable). Keep a copy in `~/.config/speech-dispatcher/modules/` as a mirror, but the file that is actually loaded is the `/etc` one.

`piper.conf`:

```
GenericExecuteSynth "printf '%s' \"$DATA\" | /home/<user>/.local/bin/piper-speechd"
GenericLanguage "ru" "ru_RU" "utf-8"
GenericDefaultCharset "utf-8"
AddVoice "ru" "FEMALE1" "irina"
```

**`AddVoice` is mandatory.** Without it `sd_generic` fails to initialize (`module does not have any voice`), speech-dispatcher silently falls back to espeak-ng, and the screen reader sounds like a robot with an English accent. The module log shows `Module piper started successfully` only when this is right.

## piper wrapper

`~/.local/bin/piper-speechd`:

```sh
#!/usr/bin/env bash
set -u
PIPER="$HOME/.local/bin/piper"
MODEL="$HOME/.local/share/piper/voices/ru_RU-irina-medium.onnx"
exec "$PIPER" --model "$MODEL" --length_scale 0.6 -q --output_file - | pw-play -
```

- Speed lives here (`--length_scale`: 1.0 normal, 0.6 faster). The generic module does not forward speech-dispatcher's rate, so an Orca slider has no effect on piper.
- Check the pipeline before blaming the daemon: `printf 'test' | ~/.local/bin/piper-speechd`.

## Verify

```sh
spd-say -L                      # voices listed
spd-say -o piper -w "тест"      # forces the module
ps -eo args | grep -E 'sd_generic|piper-speechd'   # proves which module runs
tail -30 /run/user/$(id -u)/speech-dispatcher/log/speech-dispatcher.log
```

Restart after config edits: `pkill -x speech-dispatcher; systemctl --user restart speech-dispatcher.socket`.

## RHVoice (alternative, instant response)

Packages: `rhvoice`, `rhvoice-language-russian`, `rhvoice-voice-<name>`. Voices appear under `/usr/share/RHVoice/voices/`. Arch packages ship no `rhvoice.conf` for speech-dispatcher; a module config must be created before `DefaultModule rhvoice` works. Generate a sample with `printf 'text' | RHVoice-test -p <voice> -o out.wav`.

## GNOME Orca (screen reader)

Launch (bind it):

```kdl
Mod+S { spawn-sh "pkill orca || GDK_BACKEND=wayland orca"; }
```

- **`GDK_BACKEND=wayland` is required.** With the X11 backend Orca dies with `X Error ... XkbSetMap` and the bind looks dead.
- Modifier: `org.gnome.Orca.Keybindings desktop-modifier-keys = ['Insert','KP_Insert']`.
- **`Insert+Пробел` opens Orca preferences**, it is not flat review. `Insert+Ctrl+Пробел` opens per-app preferences.
- Flat review, desktop layout: `KP_Subtract` (numpad minus) toggles; `KP_Home` previous line, `KP_Up` current, `KP_Page_Up` next; `Insert+KP_Home/End` line start/end. Laptop layout: `Insert+P` and `Insert+U/I/O`.
- `Insert+H` — command help, `Insert+Shift+D` — speech monitor.
- Orca does not read terminal content (no AT-SPI text for terminal buffers); verify in Firefox or GTK apps.
- Typing echo lives in `org.gnome.Orca.TypingEcho` (`key-echo`, `alphabetic-keys`, `character-echo`).

## Clipboard reader

`~/.local/bin/say-clipboard` uses Silero/piper directly; `spd-say` there is only a fallback. After TTS changes, test both: the Pause bind and the Orca bind.
