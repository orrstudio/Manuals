# Sudo с паролем через Rofi (Wayland / Niri)

## Проблема
`sudo` требует ввод пароля в терминале. В WezTerm + Niri + Wayland удобнее вводить пароль в графическом окне Rofi.

## Решение: `sudo -A` + `SUDO_ASKPASS` + Rofi

`sudo -A` (askpass) просит пароль через внешнюю программу, путь к которой указан в переменной `SUDO_ASKPASS`. В этой роли выступает Rofi.

---

### 1. Скрипт askpass

Путь: `~/.local/bin/rofi-askpass`

```bash
#!/usr/bin/env bash
rofi -dmenu \
    -password \
    -no-fixed-num-lines \
    -p "Sudo Password:" \
    -theme-str 'window {width: 400px;} entry {width: 300px;}'
```

Скрипт показывает окно Rofi с запросом пароля (маскировано через `-password`) и выводит введённый пароль на stdout, откуда `sudo` забирает его.

Сделать исполняемым:

```bash
chmod +x ~/.local/bin/rofi-askpass
```

---

### 2. Переменная окружения

В `~/.bashrc` добавлено:

```bash
# Sudo askpass через rofi (Wayland/Niri)
export SUDO_ASKPASS="$HOME/.local/bin/rofi-askpass"
```

После правки применить:

```bash
source ~/.bashrc
```

---

### 3. Использование

Запускать команду с флагом `-A`:

```bash
sudo -A pacman -S --noconfirm noto-fonts-cjk
```

При этом appears окно Rofi — вводите пароль и нажимайте Enter. Команда выполнится от root.

Алиас `sudo` не установлен, чтобы не ломать другие вызовы — используйте `sudo -A` явно там, где нужен пароль через Rofi.


