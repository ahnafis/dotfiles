if status is-interactive
#and not set -q TMUX
    #exec tmux
end

set fish_greeting

#export TERM=xterm-256color

## Prompt Customizations:
#function fish_prompt
    #printf "%s%s@%s%s:%s%s%s> " (set_color green) $USER $hostname (set_color normal) (set_color blue) (prompt_pwd) (set_color normal)
#end

## Aliases
alias ll='exa -laH --git --icons'
alias ls='ls -a -F --file-type' #--color=tty'
alias vimc='vim ~/.config/nvim/init.vim'
alias vk='vim ~/.config/kitty/kitty.conf'
alias vb='vim ~/.config/bspwm/bspwmrc'
alias vs='vim ~/.config/sxhkd/sxhkdrc'
alias vc='vim ~/.config/fish/config.fish'

alias sf='source ~/.config/fish/config.fish'

#alias i='sudo pacman -S'
#alias r='sudo pacman -Rsn'
#alias u='sudo pacman -Syu'
#alias s='sudo pacman -Ss'

#alias yi='yay -S'
#alias yr='yay -Rsn'
#alias ys='yay -Ss'

alias open='xdg-open'
alias live='browser-sync'

alias c='clear'
alias e='exit'

source ~/.env

## Starship Prompt
#starship init fish | source
#cat ~/.cache/wal/sequences
