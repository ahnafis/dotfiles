[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

## Aliases
alias ls='ls -la --color=auto'
alias s='sudo'
alias a='cd /a/'
alias vc='vim ~/.bashrc'
alias vk='vim ~/.config/kitty/kitty.conf'
alias vb='vim ~/.config/bspwm/bspwmrc'
alias vs='vim ~/.config/sxhkd/sxhkdrc'
alias vg='vim ~/.config/pygen/pygen.py'
alias st='sudo thunar'
alias i='sudo pacman -S'
alias r='sudo pacman -Rsn'
alias u='sudo pacman -Syu'
alias s='sudo pacman -Ss'
alias yi='yay -S'
alias yr='yay -R'
alias ys='yay -Ss'
alias py='python3'
alias pip='pip3'
alias h='htop'
alias n='neofetch'
alias c='clear'
alias e='exit'

eval "$(starship init bash)"
#cat ~/.cache/wal/sequences
