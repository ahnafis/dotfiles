# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Tmux:
if command -v tmux &> /dev/null && [ -n "$PS1" ] &&\
  [[ ! "$TERM" =~ screen ]] &&\
  [[ ! "$TERM" =~ tmux ]] &&\
  [ -z "$TMUX" ]; then
  exec tmux
fi

# Environemnt:
export TERM=tmux-256color
export EDITOR=$(which vim)
export SUDO_PROMPT='Password 🔑: '
export FZF_DEFAULT_OPTS="--layout=reverse --prompt=\ "
export BAT_THEME='Solarized (dark)'
export PNPM_HOME="/home/ahnaf/.local/share/pnpm"

export CC=/usr/bin/gcc
export CXX=/usr/bin/clang++

# Avro keyboard:
export GTK_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Background color:
theme_name=gruvbox
kitty_config_path="$HOME/.config/kitty"

export HOUR=$(date +%H)
export BACKGROUND=dark

if [ $HOUR -ge 18 ]; then
  BACKGROUND=dark

elif [ $HOUR -ge 7 ]; then
  BACKGROUND=light

elif [ $HOUR -ge 0 ]; then
  BACKGROUND=dark
fi

rm -rf "$kitty_config_path/themes/index.conf"
ln -sf $kitty_config_path/themes/$theme_name-$BACKGROUND.conf $kitty_config_path/themes/index.conf

# History:
HISTFILESIZE=-1
HISTSIZE=-1
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

# Colors:
clr='\[\033[00m\]'       # Reset

blk='\[\033[00;30m\]'    # Black
red='\[\033[00;31m\]'    # Red
grn='\[\033[00;32m\]'    # Green
ylw='\[\033[00;33m\]'    # Yellow
blu='\[\033[00;34m\]'    # Blue
pur='\[\033[00;35m\]'    # Purple
cyn='\[\033[00;36m\]'    # Cyan
wht='\[\033[00;37m\]'    # White

bblk='\[\033[01;30m\]'   # Bold black
bred='\[\033[01;31m\]'   # Bold red
bgrn='\[\033[01;32m\]'   # Bold green
bylw='\[\033[01;33m\]'   # Bold yellow
bblu='\[\033[01;34m\]'   # Bold blue
bpur='\[\033[01;35m\]'   # Bold purple
bcyn='\[\033[01;36m\]'   # Bold cyan
bwht='\[\033[01;37m\]'   # Bold white

# Prompt:
# PS1="$grn\u$clr@\h$clr:$blu\W$clr\$ "
PS1="$blu\W$clr ❯ "

# LS:
alias ls='ls -AF --color=auto'
alias ll='tree -alC --dirsfirst --gitignore -I .git'
alias la='ll -L 1'

# Movement:
alias ..='cd .. && pwd'
alias ...='cd ../.. && pwd'
alias ....='cd ../../.. && pwd'

# Misc:
alias sb='source ~/.bashrc'
alias mkdir='mkdir -pv'
alias rm='rm -fv'

# Git:
alias gs='git status -s'
alias ga='git add'
alias gm='git commit'
alias gb='git branch'
alias gco='git checkout'

# Vim:
alias vim="DEV=1 $EDITOR"

# Yarn:
alias yarn='yarn --emoji true'

# Pnpm:
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
