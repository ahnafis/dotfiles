vim9script noclear

import autoload "utils.vim"

if utils.IsLoaded("statusline")
  finish
endif
g:loaded_statusline = true

def StatusLine(): string
  var line = " "

  line ..= "%t"
  line ..= " %m"

  # Separator
  line ..= "%="

  # File type
  line ..= $"{utils.GetFileType(&filetype)}  "

  # Line, column and total lines
  line ..= "%l:%v (%L lines)"

  return line .. " "
enddef

augroup setup_status_line
  autocmd!
  autocmd BufEnter,BufWrite * &l:statusline = StatusLine()
  autocmd filetypedetect FileType * &l:statusline = StatusLine()
augroup END
autocmd User CocDiagnosticChange &l:statusline = StatusLine()
