# my_custom_theme.zsh-theme

RESET="%f%k"

# white theme
# RESULT_BG="#8A8BD8"
# USER_BG="#B3B4EB"
# DIR_BG="#CCCCFF"
# GIT_BG="#EEEEFF"

# RESULT_FG="white"
# USER_FG="black"
# DIR_FG="black"
# GIT_FG="black"

# dark theme
RESULT_BG="#6363c4"
USER_BG="#5353ab"
DIR_BG="#43438e"
GIT_BG="#343457"

RESULT_FG="white"
USER_FG="black"
DIR_FG="#ff4da6"
GIT_FG="#3dd3a5"

ERROR_SYMBOL="✘"
SUCCESS_SYMBOL="%F{green}✅%f" # \uf00c
SEPARATOR_SYMBOL=""

prompt_result() {
  if [[ $? -eq 0 ]]; then
    echo -n "%K{$RESULT_BG}%F{$RESULT_FG} $SUCCESS_SYMBOL %k%f"
  else
    echo -n "%K{$RESULT_BG}%F{$RESULT_FG} $ERROR_SYMBOL %k%f"
  fi
}

prompt_user() {
  echo -n "%K{$USER_BG}%F{$USER_FG} %n %k%f"
}

prompt_dir() {
  echo -n "%K{$DIR_BG}%F{$DIR_FG} %~ %k%f"
}

prompt_git() {
  local git_branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [ -n "$git_branch" ]; then
    echo -n "%K{$GIT_BG}%F{$GIT_FG} on  $git_branch %k%f"
  else
    echo -n ""
  fi
}

separator_result_user() {
  echo -n "%F{$RESULT_BG}%K{$USER_BG}$SEPARATOR_SYMBOL%k%f"
}

separator_user_dir() {
  echo -n "%F{$USER_BG}%K{$DIR_BG}$SEPARATOR_SYMBOL%k%f"
}

separator_dir_git() {
  if [ -n "$(git symbolic-ref --short HEAD 2>/dev/null)" ]; then
    echo -n "%F{$DIR_BG}%K{$GIT_BG}$SEPARATOR_SYMBOL%k%f"
  else
    echo -n ""
  fi
}

end_separator() {
  if [ -n "$(git symbolic-ref --short HEAD 2>/dev/null)" ]; then
    echo -n "%F{$GIT_BG}$SEPARATOR_SYMBOL%f"
  else
    echo -n "%F{$DIR_BG}$SEPARATOR_SYMBOL%f"
  fi
}

PROMPT='$(prompt_result)$(separator_result_user)$(prompt_user)$(separator_user_dir)$(prompt_dir)$(separator_dir_git)$(prompt_git)$(end_separator) '

RPROMPT=''

