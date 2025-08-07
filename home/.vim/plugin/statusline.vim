vim9script noclear

if utils#IsLoaded("statusline")
    finish
endif

g:loaded_statusline = true

import autoload "utils.vim"

def StatusLine(): string
    var line = ' '
        .. (g:development ? g:FugitiveHead() : "%t")
        .. ' '
        .. "%m"
        .. "%="
        .. $"{g:development ? CocDiagnostics() : ""}"
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

set laststatus=2

augroup setup_status_line
    autocmd!
    autocmd BufEnter,BufWrite * &l:statusline = StatusLine()
    autocmd filetypedetect FileType * &l:statusline = StatusLine()
augroup END
autocmd User CocDiagnosticChange &l:statusline = StatusLine()
