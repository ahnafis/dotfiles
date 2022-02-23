# If not running interactively, don't do anything
[[ $- != *i* ]] && return
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  #cat ~/.cache/wal/sequences
  exec tmux
fi

export TERM='xterm-256color'
## Prompt
#PS1='[\u@\h \W]\$ '
PS1='\u@\h:\W\$ '
#eval "$(starship init bash)"

## Shortcuts
#alias ls="exa -a --icons"
#alias ll="exa -laH --icons"
#alias la="exa -laH --icons --tree"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
