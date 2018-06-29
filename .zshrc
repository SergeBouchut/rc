#--- START ALIAS ---#
alias ll='ls -alh'

function pyclean() {
    find -type f -name '*.py[co]' -delete
    find -type d -name '__pycache__' -delete
}

alias pyfind='find . -name "*.py"'

alias pygrep='grep --include="*.py"'

function venv() {
    source .venv"$1"/bin/activate
}

function zz() {
    vim ~/.zshrc
    source ~/.zshrc
}
#--- END ALIAS ---#

HISTFILE=~/.zsh_history
SAVEHIST=10000
# directly add entry in history file instead of waiting shell exit
setopt INC_APPEND_HISTORY

bindkey '^[[A' history-beginning-search-backward
bindkey '^[OA' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[OB' history-beginning-search-forward

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

autoload -Uz promptinit
promptinit
setopt PROMPT_SUBST  # enable use of functions in prompt
function branchname() {
    count=$(git status --short 2> /dev/null | wc --lines)
    if [ "$count" -eq 0 ]; then
        color='cyan'
    else
        color='magenta'
    fi
    name=$(git status 2> /dev/null | head -1 | sed --expression 's/On branch //')
    if [ -n "$name" ]; then
        echo "%F{$color}$name%f "  # trailing space
    fi
}
function dirpath() {
    echo "%F{yellow}%~%f "  # trailing space
}
PROMPT='$(dirpath)$(branchname)%# '  # trailing space

echo '\( -.-)/__(")(")'
