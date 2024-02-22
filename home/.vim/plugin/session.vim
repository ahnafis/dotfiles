vim9script noclear

import autoload "utils.vim"

if utils.IsLoaded("session")
  finish
endif
g:loaded_session = true

set sessionoptions-=options 

var session_dir = "./.vim"
var session_file = $"{session_dir}/last_session.vim"

def SaveSession(): void
  var choice = confirm("Save this session?", "&Yes\n&No")
  if choice != 1
    return
  endif

  if !isdirectory(session_dir) && !filereadable(session_file)
    mkdir(session_dir)
  endif
  execute $"mksession! {session_file}"
enddef

def RestoreSession(): void
  if filereadable(session_file)
    execute $"source {session_file}"
  endif
enddef

augroup sessionize
  autocmd!
  autocmd VimLeave * SaveSession()
  autocmd VimEnter * ++nested RestoreSession()

  # Remembers last cursor position.
  autocmd BufReadPost * {
    if line("'\"") >= 1 && line("'\"") <= line("$") && &filetype !~# 'commit'
        && index(['xxd', 'gitrebase'], &filetype) == -1
      execute "normal! g`\""
    endif
  }
augroup END
