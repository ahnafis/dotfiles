export ZSH="/home/ahnaf/.oh-my-zsh"

#ZSH_THEME="robbyrussell"
ZSH_THEME="jispwoso"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

__git_files () { 
    _wanted files expl 'local files' _files     
}

if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

## Aliases
alias ls='ls -la -F --file-type'
alias a='cd /a/'
alias sv='sudo nvim'
alias vim='nvim'
alias vimc='vim ~/.config/nvim/init.vim'
alias vz='vim ~/.zshrc'
alias va='vim ~/.config/alacritty/alacritty.yml'
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
alias python3='/usr/local/bin/python3.8'
alias py='python3'
alias pip3='/usr/local/bin/python3.8 -m pip'
alias pi='pip3 install'
alias pr='pip3 uninstall'
alias pu='pip3 install --upgrade'
alias h='htop'
alias n='neofetch'
alias c='clear'
alias e='exit'

#eval "$(starship init zsh)"
cat ~/.cache/wal/sequences

