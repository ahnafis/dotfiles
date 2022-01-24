# Tmux
if status is-interactive
and not set -q TMUX
    exec tmux
end

set fish_greeting

#export TERM=xterm-256color
set -x TERM xterm-256color
#set -x VIMINIT 'source ~/.config/vim/init.vim'

## Prompt Customizations:
function fish_prompt
    printf "%s%s%s%s\$ " (set_color green) (prompt_pwd) (set_color normal) (fish_git_prompt)
end

## Aliases
#alias ll='exa -laH --git --icons'
alias ll='ls -a -F --file-type'
alias ls='ls -a -F --file-type' #--color=tty'
alias vimc='vim ~/.config/nvim/init.vim'
alias vk='vim ~/.config/kitty/kitty.conf'
alias vb='vim ~/.config/bspwm/bspwmrc'
alias vs='vim ~/.config/sxhkd/sxhkdrc'
alias vc='vim ~/.config/fish/config.fish'

alias sf='source ~/.config/fish/config.fish'

alias open='xdg-open'
alias live='browser-sync'

alias c='clear'
alias e='exit'

alias tmux="TERM=screen-256color-bce tmux"

source ~/.env

## Starship Prompt
#starship init fish | source
#cat ~/.cache/wal/sequences
