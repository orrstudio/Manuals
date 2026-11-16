# Палитра и тема (единая точка)

Собрано 2026-11-16. Файлы настроек перечислены в `MIRRORS.md`; здесь — значения.

## Bash prompt (PS1, `~/.bashrc`)

```
\e[1;97;48;2;58;140;160m \u@\h \e[1;38;2;0;0;0;48;2;200;210;220m \w/ \e[0m\n
```

- `user@host` — фон холодный циан `#3a8ca0`, текст белый, bold
- `путь` — фон светло-серый `#c8d2dc`, текст чёрный `#000000`, bold

## WezTerm (`~/.wezterm.lua`)

- схема `GruvboxDark`, переопределён только фон: `config.colors = { background = '#000000' }`
- шрифт: JetBrains Mono 16 + Noto Sans CJK KR + Symbols Nerd Font Mono (fallback)

## Noctalia (`~/.local/state/noctalia/settings.toml`)

- тема: `source = "wallpaper"` (`wallpaper_scheme = "m3-content"`), `pure_black_dark = true`
- бар `OrrPanel`: капсулы `fill = "surface_container"`, группа скорости (`g3`) — `fill = "primary"`, `foreground = "on_primary"`
- dock выключен (`dock.enabled = false`), lockscreen включён

## Qt (`~/.config/qt6ct/`)

- `qt6ct.conf`: `style=Fusion`, палитра `colors/darker-black.conf`, шрифт Adwaita Sans/Mono 16 pt
- `darker-black.conf`: база `darker`, `Base`/`Window` = `#000000`, `AlternateBase` = `#0a0a0a`
- `QT_QPA_PLATFORMTHEME=qt6ct` в `~/.bashrc`

## GTK

- `gtk-theme = Adwaita`, `color-scheme = prefer-dark`
- `~/.config/gtk-3.0/gtk.css` и `gtk-4.0/gtk.css`: `window, .background { background-color: #000000; }`

## yazi (`~/.config/yazi/`)

- `theme.toml`: flavor `gruvbox-dark`, индикатор `current` — `#ebdbb2` на `#504945`, `preview` — `#a89984` на `#3c3836`
- фона не задаёт, берёт чёрный из терминала

## Herdr App (`~/.config/herdr-app/`)

- `settings.json`: `appearance = "dark"`, `zoom = 1.4`; темы — в `~/.config/herdr-app/themes/`
- Herdr TUI удалён, в системе только нативное приложение

## Flatpak

- Transmission, Pinta: `flatpak override --user --env=GTK_THEME=Adwaita-dark`
- рантайм темы: `org.gtk.Gtk3theme.Adwaita-dark`
