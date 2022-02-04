# Tmux
if status is-interactive
and not set -q TMUX
    #cat ~/.cache/wal/sequences
    exec tmux
end

set fish_greeting

set -x TERM xterm-256color
set -x EDITOR vim

## Prompt Customizations:
function fish_prompt
    printf "%s%s%s%s\$ " (set_color green) (prompt_pwd) (set_color normal) (fish_git_prompt)
end

## Aliases
alias ll='exa -laH --icons'
alias ls='ls -a -F --file-type' #--color=tty'
alias vimc='vim ~/.vim/vimrc'
alias sf='source ~/.config/fish/config.fish'

alias open='xdg-open'
alias live='browser-sync'

alias c='clear'
alias e='exit'

#alias tmux="TERM=screen-256color-bce tmux"

#source ~/.env

## Starship Prompt
#starship init fish | source
#cat ~/.cache/wal/sequences
