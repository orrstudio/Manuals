# Если вы не работаете в интерактивном режиме, ничего не меняйте.
[[ $- != *i* ]] && return

alias h="history"

# Эта пользовательская настройка добавляет в командную строку имя пользователя и хоста на голубом фоне и путь директории
PS1='\e[1;97;46m \u@\h \e[1;97;47m \w/ \e[0m\n'

# pyenv (управление версиями Python)
command -v pyenv >/dev/null 2>&1 && {
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
}

# Pipx
export PATH="$PATH:$HOME/.local/bin"

# NVM (управление версиями Node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set nano as the default editor for fc
export FCEDIT=nano

# Added by opencode CLI
export PATH="$HOME/.opencode/bin:$PATH"

# API-ключи в pass-хранилище (01.OrrPrivat/open-code/).
[ -z "${DAHL_API_KEY:-}" ] && export DAHL_API_KEY="$(pass show 01.OrrPrivat/open-code/dahl-apikey 2>/dev/null)"
[ -z "${GITHUB_API_KEY:-}" ] && export GITHUB_API_KEY="$(pass show 01.OrrPrivat/open-code/github-token 2>/dev/null)"
[ -z "${GITHUB_TOKEN:-}" ] && export GITHUB_TOKEN="$GITHUB_API_KEY"  # GitHub Copilot CLI
