alias br='git status 2> /dev/null | head -1 | sed -e "s/On branch //"'
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
# directly add entry in history file instead of waiting shell exit
setopt INC_APPEND_HISTORY

bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

autoload -Uz promptinit
promptinit
# sequence coloration: %F{color}...%f
# n last folders in path: %1~
# prompt char (% or # for root): %#
setopt PROMPT_SUBST  # enable use of alias/functions in prompt
PROMPT='%F{yellow}%1~%f ($(br)) %# '  # project_dir (master) %

echo '\( -.-)/__(")(")'
