# If not running interactively, don't do anything
[[ $- != *i* ]] && return
if command -v tmux &> /dev/null && \
     [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && \
     [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # cat ~/.cache/wal/sequences
  exec tmux
fi

## Environement variables:
source ~/.env
export TERM="tmux-256color"
export EDITOR=vim
export SUDO_PROMPT="Password 🔑: "

# Vi-mode
#set -o vi

## Prompt
PS1='\[\033[0;32m\]\W\[\033[00m\]\$ '
# PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
## Powerline
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/share/powerline/bindings/bash/powerline.sh

## Shortcuts
# alias ls="ls -A"
alias ls="exa -a --icons"
alias la="ls -la"
alias cat=bat
alias sb="source ~/.bashrc"
alias grep="grep --color=always"
alias open="xdg-open"
alias live="browser-sync"
alias tmux="TERM=screen-256color tmux"

alias gs="git status -s"

