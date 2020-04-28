# bash git prompt, after cloning https://github.com/magicmonty/bash-git-prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=0
    GIT_PROMPT_THEME=Custom
    # shellcheck disable=SC1090
    source "$HOME/.bash-git-prompt/gitprompt.sh"
fi

# taken from Arch Linux Wiki page
# make man command output colorful
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

export PROMPT_COMMAND="${PROMPT_COMMAND:-:};history -a; history -n;"
export PYTHONSTARTUP="$HOME/.pythonrc"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
