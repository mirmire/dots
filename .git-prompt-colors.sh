##############################################################################
# Changes the prompt to a Debian-style one that truncates pwd to a max length
# depending on the terminal column width. Also uses the prompt_callback
# function of bash-git-prompt to set the window title to almost the same
# Debian-style. This version has been tweaked for Ubuntu standard terminal
# fonts.
#
# The prompt will use a Debian-style on the form
#
# relative-path-from-git-toplevel-dir bash-git-prompt-info <exit status>
# HH:MM ▶
#
# ● ✖ ◆ ➤ ▶ ❚❖ ⬅ ◀ ✔ ✘ ⬆ ⬇ ✚ ❮❮ ❯❯ ✦ ✛ ✲
#
# The window title will have the form
# relative-path-from-git-toplevel-dir
#
# Example usage:
# if [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
#   GIT_PROMPT_THEME=Minimal_Time
#   source ~/.bash-git-prompt/gitprompt.sh
# fi
#
# [https://github.com/modib]
# 14.04.2020 generated and updated from base theme Minimal_Chevron to my liking
# Prakash Acharya
##############################################################################
override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Minimal_Time"

  #Overrides the prompt_callback function used by bash-git-prompt
  function prompt_callback {
    GIT_CONTAINER_FOLDER_FULLPATH=$(git rev-parse --show-toplevel 2> /dev/null)
    GIT_CONTAINER_FOLDER=$(basename $GIT_CONTAINER_FOLDER_FULLPATH 2> /dev/null)
    CURRENT_FULLPATH=$(pwd)
    local PS1=$GIT_CONTAINER_FOLDER${CURRENT_FULLPATH#$GIT_CONTAINER_FOLDER_FULLPATH}
    gp_set_window_title "$PS1"
    echo "${Yellow}${PS1}${ResetColor}"
  }

  GIT_PROMPT_BRANCH="${Magenta}"
  GIT_PROMPT_MASTER_BRANCH="${White}"

  GIT_PROMPT_PREFIX="["
  GIT_PROMPT_SUFFIX="]"
  GIT_PROMPT_SEPARATOR=""
  GIT_PROMPT_STAGED=" ${Green}●"
  GIT_PROMPT_CONFLICTS=" ${Red}✲"
  GIT_PROMPT_CHANGED=" ${Red}◆"

  GIT_PROMPT_REMOTE=" "
  GIT_PROMPT_UNTRACKED=" ${Cyan}…"
  GIT_PROMPT_STASHED=" ${Cyan}⚑"
  GIT_PROMPT_CLEAN=""
  GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING=""

  GIT_PROMPT_COMMAND_OK="${Green}✔"
  GIT_PROMPT_COMMAND_FAIL="${Red}✘ _LAST_COMMAND_STATE_"

  local gp_start="_LAST_COMMAND_INDICATOR_"
  local gp_end="${ResetColor} ❯❯"

  GIT_PROMPT_START_USER="${gp_start} "
  GIT_PROMPT_END_USER="${gp_end} "

  GIT_PROMPT_SYMBOLS_AHEAD="⬆."
  GIT_PROMPT_SYMBOLS_BEHIND="⬇."

}

reload_git_prompt_colors "Minimal_Time"
