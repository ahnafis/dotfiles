vim9script noclear

import autoload "utils.vim"

if utils.IsLoaded("statusline")
  finish
endif
g:loaded_statusline = true

set laststatus=2

def StatusLine(): string
  var line = ' '
    .. "%t"
    .. ' '
    .. "%m"
    .. "%="
    .. $"{CocDiagnostics()}"
    .. '  '
    .. $"{utils.GetFileType(&filetype)}"
    .. '  '
    .. "%l:%v"

  return line .. ' '
enddef

def CocDiagnostics(): string
  var info = b:->get("coc_diagnostic_info", {})
  var errors = info->get("error", 0)
  var warnings = info->get("warnings", 0)

  return $" {errors}  {warnings}"
enddef

augroup setup_status_line
  autocmd!
  autocmd BufEnter,BufWrite * &l:statusline = StatusLine()
  autocmd filetypedetect FileType * &l:statusline = StatusLine()
augroup END
autocmd User CocDiagnosticChange &l:statusline = StatusLine()
