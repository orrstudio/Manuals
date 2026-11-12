# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias h="history"
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Эта пользовательская настройка добавляет в командную строку имя пользователя и хоста на голубом фоне и путь директории
PS1='\e[1;97;46m \u@\h \e[1;97;47m \w/ \e[0m\n'

# Set nano as the default editor for fc
export FCEDIT=nano
export EDITOR=nano

export PATH="$HOME/.local/bin:$PATH"
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/home/orr/.local/share/flatpak/exports/share:/usr/local/share:/usr/share"

# opencode
export PATH=/home/orr/.opencode/bin:$PATH

# API-ключи в pass-хранилище (01.OrrPrivat/open-code/).
[ -z "${DAHL_API_KEY:-}" ] && export DAHL_API_KEY="$(pass show 01.OrrPrivat/open-code/dahl-apikey 2>/dev/null)"

# Sudo askpass через rofi (Wayland/Niri)
export SUDO_ASKPASS="$HOME/.local/bin/rofi-askpass"

# === TTS / say-clipboard (по инструкции настройки голоса и озвучки) ===
export SAY_VOICE="ru_RU-irina-medium"
export SAY_SPEED="0.6"
export SAY_VOICE_EN="en_US-amy-medium"
export SAY_SPEED_EN="0.7"
export SILERO_VOICE="baya"
export SILERO_TEMPO="1.3"
export SAY_RU_ENGINE="silero"

