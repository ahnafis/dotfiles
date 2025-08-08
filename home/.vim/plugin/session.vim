vim9script noclear

if !g:development
    finish
endif

if utils#IsLoaded("session")
    finish
endif

g:loaded_session = true

set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize

g:session_cache_dir = $"{$HOME}/.cache/vim/session"
var session_file = getcwd()->substitute("\/", "__", 'g')
var session = $"{g:session_cache_dir}/{session_file}.vim"

def SaveSession(): void
    if !isdirectory(g:session_cache_dir)
        mkdir(g:session_cache_dir)
        echom $"Created session directory at {g:session_cache_dir}"
    endif

    var choice = confirm("Save this session?", "&Yes\n&No")
    if choice != 1
        return
    endif

    execute $"mksession! {session}"
enddef

def RestoreSession(): void
    if filereadable(session)
        execute $"source {session}"
    endif
enddef

def DeleteSession()
    delete(session)
enddef

def GotoLastPosition()
    var current_line = line("'\"")
    var total_lines = line("$")

    var ignored_file_types = [
        "xxd",
        "gitcommit",
        "gitrebase"
    ]

    var line_pos_exists = (current_line >= 1) && (current_line <= total_lines)
    var is_file_type_ignored = ignored_file_types->index(&filetype) == -1

    if line_pos_exists && is_file_type_ignored
        execute "normal! g`\""
    endif
enddef

augroup sessionize
    autocmd!
    autocmd VimLeave * SaveSession()
    autocmd VimEnter * ++nested RestoreSession()
    autocmd BufReadPost * GotoLastPosition()
augroup END

command! SaveSession        SaveSession()
command! RestoreSession     RestoreSession()
command! DeleteSession      DeleteSession()
