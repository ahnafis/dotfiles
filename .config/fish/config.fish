if status is-interactive
# Tmux
and not set -q TMUX
    #cat ~/.cache/wal/sequences
    exec tmux
end

source ~/.env

# Disable fish welcome message
set fish_greeting

# Exports
#set -x TERM xterm-256color
set -x EDITOR vim
set -x TERM alacritty

## Prompt Customizations:
function fish_prompt
    printf "%s%s@%s%s:%s%s%s%s\$ " (set_color green) (whoami) (uname -n) (set_color normal) (set_color blue) (prompt_pwd) (set_color normal) (fish_git_prompt)
end

## Aliases
alias ls='exa -a --icons'
alias ll='exa -laH --icons'
#alias ls='ls -a --color=tty'
#alias ls='ls -a -F --file-type' #--color=tty'

alias open='xdg-open'
alias live='browser-sync'
alias tmux='TERM=screen-256color tmux'
#starship init fish | source
