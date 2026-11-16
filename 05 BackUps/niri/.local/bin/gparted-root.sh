#!/usr/bin/env bash
# GParted от root на Wayland: pkexec теряет Wayland-окружение и падает на X11
# ("cannot open display :0"). Передаём WAYLAND_DISPLAY/XDG_RUNTIME_DIR явно.
set -u
export SUDO_ASKPASS="$HOME/.local/bin/rofi-askpass"
exec sudo -A env \
    GDK_BACKEND=wayland \
    WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-1}" \
    XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}" \
    GTK_THEME=Adwaita:dark \
    gparted "$@"
