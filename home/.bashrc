# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###############################################################################
#################################### TMUX #####################################
###############################################################################
if command -v tmux &> /dev/null && [ -n "$PS1" ] &&\
  [[ ! "$TERM" =~ screen ]] &&\
  [[ ! "$TERM" =~ tmux ]] &&\
  [ -z "$TMUX" ]; then
  exec tmux
fi

###############################################################################
################################### Basics ####################################
###############################################################################
pnpm_home="/home/ahnaf/.local/share/pnpm"
PATH="$PATH:$pnpm_home"

EDITOR="$(which vim)"

SUDO_PROMPT="Password 🔑: "
FZF_DEFAULT_OPTS=(--layout=reverse --prompt=\ )

# C/C++ compilers:
CC="/usr/bin/gcc"
CXX="/usr/bin/clang++"

# Avro keyboard:
GTK_MODULE="ibus"
XMODIFIERS="@im=ibus"
QT_IM_MODULE="ibus"

# Background color:
TERM_BACKGROUND="dark"

hour="$(date +%H)"
sunrise_time=$((6 + 1))
sunset_time=$((19 - 1))

# Use light background during day light.
if [ "$hour" -ge "$sunrise_time" ] && [ "$hour" -lt "$sunset_time" ]; then
  TERM_BACKGROUND="light"
fi

# Set color schemes for terminal apps.
color_scheme="gruvbox"
BAT_THEME="$color_scheme-$TERM_BACKGROUND"

theme_src="$HOME/.config/kitty/themes/$color_scheme-$TERM_BACKGROUND.conf"
theme_dest="$HOME/.config/kitty/themes/index.conf"
ln -sf "$theme_src" "$theme_dest"

# Bash history. -1 means unlimited records will be stored.
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL="erasedups:ignoreboth"
shopt -s histappend

###############################################################################
################################### Prompt ####################################
###############################################################################
reset='\[\033[00m\]'
blue='\[\033[00;34m\]'

prompt_indicator="❯"
current_directory="$blue\W$reset"

PS1="$current_directory $prompt_indicator "

###############################################################################
################################### Aliases ###################################
###############################################################################
# Directory listing:
alias ls="ls -AF --color=auto"
alias ll="tree -alC --dirsfirst --gitignore -I .git"
alias la="ll -L 1"

# Easy movement:
alias ..="cd .. && pwd"
alias ...="cd ../.. && pwd"
alias ....="cd ../../.. && pwd"

# Git:
alias gs="git status -s"
alias ga="git add"
alias gm="git commit"
alias gb="git branch"
alias gco="git checkout"

# Vim:
alias vim='DEV=1 $EDITOR'

# Misc:
alias sb="source ~/.bashrc"
alias mkdir="mkdir -pv"
alias rm="rm -fv"

###############################################################################
################################## Clear ups ##################################
###############################################################################
unset pnpm_home
unset hour
unset color_scheme
unset theme_src
unset theme_dest
unset prompt_indicator
unset current_directory
unset reset
unset blue
unset sunrise_time
unset sunset_time

###############################################################################
################################### Exports ###################################
###############################################################################
export BAT_THEME
export CC
export CXX
export EDITOR
export FZF_DEFAULT_OPTS
export GTK_MODULE
export PATH
export PS1
export QT_IM_MODULE
export SUDO_PROMPT
export TERM_BACKGROUND
export XMODIFIERS
export HISTSIZE
export HISTFILESIZE
export HISTCONTROL
