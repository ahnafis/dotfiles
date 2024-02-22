vim9script

command! -complete=file -nargs=*  Ls     :!ls -A --color=auto -F <args>
command! -complete=file -nargs=+  Mkdir  :!mkdir -pv <args>
command! -complete=file -nargs=+  Rm     :!rm -fv <args>
command!                -nargs=?  Date   :!date <args>
command!                          Clear  :!clear
