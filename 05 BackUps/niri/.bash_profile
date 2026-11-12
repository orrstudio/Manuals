#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Разблокировка gnome-keyring (секреты приложений) перед запуском Niri.
if [ -z "${GNOME_KEYRING_CONTROL}" ] && command -v gnome-keyring-daemon >/dev/null 2>&1; then
    eval "$(gnome-keyring-daemon --start --components=secrets 2>/dev/null)"
    export GNOME_KEYRING_CONTROL
fi

# Автозапуск niri на tty1 (после автологина).
if [ "$(tty)" = "/dev/tty1" ] \
   && [ -z "${WAYLAND_DISPLAY}" ] \
   && [ -z "${DISPLAY}" ] \
   && [ -z "${NIRI_AUTOSTART}" ]; then
    export NIRI_AUTOSTART=1
    if command -v niri-session >/dev/null 2>&1; then
        niri-session
    fi
    unset NIRI_AUTOSTART
fi
