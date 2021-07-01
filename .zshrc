export ZSH="/home/ahnaf/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Aliases
#alias ls='ls -lah'
alias s='sudo'
alias a='cd /a/'
alias acode='cd /a/Code'
alias vz='vim ~/.zshrc'
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

eval "$(starship init zsh)"
cat ~/.cache/wal/sequences
