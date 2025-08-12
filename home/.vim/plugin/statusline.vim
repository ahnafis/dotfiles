vim9script noclear

if utils#IsLoaded("statusline")
    finish
endif

g:loaded_statusline = true

import autoload "utils.vim"

def StatusLine(): string
    var line = ""

    var git_branch = utils.GitBranch()
    var file_name = expand("%t")

    var diagnostics = utils.CocDiagnostics()
    var file_type = utils.GetFileType(&filetype)

    var line_nr = "%l"
    var column_nr = "%v"

    var spacing = "  "

    line ..= spacing

    if empty(git_branch)
        line ..= file_name
    else
        line ..= git_branch
    endif

    line ..= "%="

    if g:development
        line ..= diagnostics
        line ..= spacing
    endif

    line ..= file_type
    line ..= spacing

    line ..= $"{line_nr}:{column_nr}"

    line ..= spacing

    return line
enddef

# Always show status line.
set laststatus=2

augroup setup_status_line
    autocmd!
    autocmd BufEnter,BufWrite * &l:statusline = StatusLine()
    autocmd filetypedetect FileType * &l:statusline = StatusLine()
augroup END
autocmd User CocDiagnosticChange :redrawstatus
