# My Bash configuration for Arch Linux.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start tmux.
if command -v tmux &>/dev/null && [ -n "$PS1" ] &&
    [[ ! "$TERM" =~ screen ]] &&
    [[ ! "$TERM" =~ tmux ]] &&
    [ -z "$TMUX" ]; then
    exec tmux
fi

# Append "$1" to $PATH when not already in.
append_path() {
    case ":$PATH:" in
    *:"$1":*) ;;
    *) PATH="${PATH:+$PATH:}$1" ;;
    esac
}

PNPM_HOME="$HOME/.local/bin"

append_path "$HOME/.local/share/pnpm"
append_path "$PNPM_HOME"

unset -f append_path

EDITOR="$(which vim)"
SUDO_PROMPT="Password 🔑: "

# Set compilers for C/C++.
CC="/usr/bin/gcc"
CXX="/usr/bin/clang++"

# Ibus:
GTK_IM_MODULE="ibus"
XMODIFIERS="@im=ibus"
QT_IM_MODULE="ibus"

BAT_THEME="gruvbox-dark"
WALLPAPERS="$HOME/Pictures/Wallpapers/Useless"

# Bash history. -1 means unlimited records will be stored.
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL="erasedups:ignoreboth"
HISTIGNORE="clear:exit:cd:pwd:ls:la:ll:gs"
shopt -s histappend

# Fzf:
FZF_DEFAULT_OPTS="--layout=reverse --prompt= "
FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --exclude=.git"

# Load Fzf key-bindings.
source /usr/share/fzf/key-bindings.bash

# Colors:
reset='\[\033[00m\]'
green='\[\033[00;32m\]'
blue='\[\033[00;34m\]'

# Prompt customizations:
prompt_indicator="$" #"❯"
user="$green\u$reset"
cwd="$blue\W$reset"

PS1="$user:$cwd$prompt_indicator "

unset -v prompt_indicator
unset -v user
unset -v cwd

# Unset colors.
unset -v reset
unset -v blue
unset -v green

# Unset all of the previous aliases.
unalias -a

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
alias vim='VIM_DEV_MODE=1 $EDITOR'

# Misc:
alias sb='source $HOME/.bashrc'
alias mkdir="mkdir -pv"
alias rm="rm -fv"
alias cf="cf -p -v"
alias grep="grep --color=auto"
alias wimi="curl -s https://checkip.amazonaws.com"

# Export environment variables.
export BAT_THEME
export CC
export CXX
export EDITOR
export FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS
export GTK_IM_MODULE
export HISTCONTROL
export HISTFILESIZE
export HISTSIZE
export PATH
export PNPM_HOME
export PS1
export QT_IM_MODULE
export SUDO_PROMPT
export TERM_BACKGROUND
export WALLPAPERS
export XMODIFIERS
