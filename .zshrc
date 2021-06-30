# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export ZSH="/home/ahnaf/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# source ~/powerlevel10k/powerlevel10k.zsh-theme
# source ~/powerlevel10k/powerlevel10k.zsh-theme

# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
alias n='nvim'
alias nz='nvim ~/.zshrc'
alias nk='nvim ~/.config/kitty/kitty.conf'
alias nb='nvim ~/.config/bspwm/bspwmrc'
alias ns='nvim ~/.config/sxhkd/sxhkdrc'
alias st='sudo thunar'
alias i='sudo pacman -S'
alias r='sudo pacman -Rsn'
alias u='sudo pacman -Syu'
alias s='sudo pacman -Ss'
alias yi='yay -S'
alias yr='yay -R'
alias ys='yay -Ss'
alias py='python3'
alias h='htop'
alias neo='neofetch'
alias c='clear'
alias e='exit'

eval "$(starship init zsh)"
alias pip='pip3'
source ~/powerlevel10k/powerlevel10k.zsh-theme
