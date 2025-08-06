vim9script

if has('gui_running') # && &term !~ '^\%(screen\|tmux\)'
  finish
endif

# Better mouse support, see  :help 'ttymouse'
if &mouse != ''
  set ttymouse=sgr
endif

# Cursor:
&t_SI = "\e[5 q"  # Insert mode: blink bar
&t_SR = "\e[3 q"  # Replace mode: blink underline
&t_EI = "\e[1 q"  # Normal mode: blink block

# Underlines:
&t_Cs = "\e[4:3m"  # Under curl start
&t_Ce = "\e[4:0m"  # Under curl end
&t_Us = "\e[4:2m"  # Double underline
&t_ds = "\e[4:4m"  # Dotted underline
&t_Ds = "\e[4:5m"  # Dashed underline

# Enable true colors, see  :help xterm-true-color
set t_Co=256
set termguicolors
&t_8f = "\e[38;2;%lu;%lu;%lum"
&t_8b = "\e[48;2;%lu;%lu;%lum"

# Enable bracketed paste mode, see  :help xterm-bracketed-paste
&t_BE = "\e[?2004h"
&t_BD = "\e[?2004l"
&t_PS = "\e[200~"
&t_PE = "\e[201~"

# Enable focus event tracking, see  :help xterm-focus-event
&t_fe = "\e[?1004h"
&t_fd = "\e[?1004l"
execute "set <FocusGained>=\e[I"
execute "set <FocusLost>=\e[O"

# Enable modified arrow keys, see  :help arrow_modifiers
execute "silent! set <xUp>=\e[@;*A"
execute "silent! set <xDown>=\e[@;*B"
execute "silent! set <xRight>=\e[@;*C"
execute "silent! set <xLeft>=\e[@;*D"

# Map alt keys, see  :help map-alt-keys
var keys = [
  'a', 'b', 'c', 'd', 'e',
  'f', 'g', 'h', 'i', 'j',
  'k', 'l', 'm', 'n', 'o',
  'p', 'q', 'r', 's', 't',
  'u', 'v', 'w', 'x', 'y',
  'z', ';'
]

for key in keys
  execute $"silent! set <A-{key}>=\e{key}"
endfor
