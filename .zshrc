export ZSH="/home/ahnaf/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

__git_files () { 
    _wanted files expl 'local files' _files     
}

## Aliases
alias ls='ls -la -F --file-type'
alias a='cd /a/'
alias sv='sudo nvim'
alias vim='nvim'
alias v='nvim'
alias vz='nvim ~/.zshrc'
alias va='nvim ~/.config/alacritty/alacritty.yml'
alias vk='nvim ~/.config/kitty/kitty.conf'
alias vb='nvim ~/.config/bspwm/bspwmrc'
alias vs='nvim ~/.config/sxhkd/sxhkdrc'
alias vg='nvim ~/.config/pygen/pygen.py'
alias st='sudo thunar'
alias i='sudo pacman -S'
alias r='sudo pacman -Rsn'
alias u='sudo pacman -Syu'
alias s='sudo pacman -Ss'
alias yi='yay -S'
alias yr='yay -R'
alias ys='yay -Ss'
alias py='python3.8'
alias pi='pip3.8 install'
alias pr='pip3.8 uninstall'
alias pu='pip3.8 install --upgrade'
alias h='htop'
alias n='neofetch'
alias c='clear'
alias e='exit'

#eval "$(starship init zsh)"
cat ~/.cache/wal/sequences

export PATH='/a/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/ahnaf/.cargo/bin:$PATH'
