alias ls='ls -a'
alias ll='ls -alh'

function pyclean() {
    find -type f -name '*.pyc' -delete
    find -type d -name '__pycache__' -delete
}
alias pyfind='find . -name "*.py"'
alias pygrep='grep --include="*.py"'

alias venv='source .venv/bin/activate'

function zz() {
    vim ~/.zshrc
    source ~/.zshrc
}

HISTFILE=~/.zsh_history
SAVEHIST=10000
setopt INC_APPEND_HISTORY

bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

autoload -Uz promptinit
promptinit
if [[ '$USER' == 'serge' && '$HOSTNAME' == 'zenbook' ]]; then
    PROMPT='%F{red}%n%f@%F{blue}%m%f %F{yellow}%1~%f %# '
else
    PROMPT='%F{yellow}%1~%f %# '
fi

echo '\( -.-)/__(")(")'
