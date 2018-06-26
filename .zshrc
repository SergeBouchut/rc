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

echo '\( -.-)/__(")(")'
