vim9script noclear

if utils#IsLoaded("statusline")
    finish
endif

g:loaded_statusline = true

import autoload "utils.vim"
import autoload "icons.vim"

def StatusLine(): string
    var line = ""

    var git_branch = g:FugitiveHead()
    var file_name = expand("%t")

    var diagnostics = CocDiagnostics()
    var file_type = utils.GetFileType(&filetype)

    var line_nr = "%l"
    var column_nr = "%v"

    var spacing = "  "

    line ..= spacing

    if g:development
        line ..= git_branch
    else
        line ..= file_name
    endif

    line ..= "%="

    line ..= diagnostics
    line ..= spacing

    line ..= file_type
    line ..= spacing

    line ..= $"{line_nr}:{column_nr}"

    line ..= spacing

    return line
enddef

def CocDiagnostics(): string
    var info = b:->get("coc_diagnostic_info", {})
    var errors = info->get("error", 0)
    var warnings = info->get("warnings", 0)

    return $"{icons.Get("error")} {errors} {icons.Get("warning")} {warnings}"
enddef

# Always show status line.
set laststatus=2

augroup setup_status_line
    autocmd!
    autocmd BufEnter,BufWrite * &l:statusline = StatusLine()
    autocmd filetypedetect FileType * &l:statusline = StatusLine()
augroup END
autocmd User CocDiagnosticChange :redrawstatus
