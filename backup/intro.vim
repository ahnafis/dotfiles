" Intro
function! Start()
    " Don't run if: we have commandline arguments, we don't have an empty
    " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
    if argc() || line2byte('$') != -1 || v:progname !~?
                \ '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif

    " Start a new buffer ...
    enew

    " ... and set some options for it
    setlocal
                \ bufhidden=wipe
                \ buftype=nofile
                \ nobuflisted
                \ nocursorcolumn
                \ nocursorline
                \ nolist
                \ nonumber
                \ noswapfile
                \ norelativenumber
                \ colorcolumn=0
                \ nospell
                \ signcolumn=no
    " \ showtabline=0
    " Now we can just write to the buffer, whatever you want.
    call append('$', "")
    " let message = [
    "             \ ' _     __ _  ',
    "             \ '| |   / /|_|  _________',
    "             \ '| |  / / | | |  _   _  |',
    "             \ '| | / /  | | | | | | | |',
    "             \ '| |/ /   | | | | | | | |',
    "             \ '|___/    |_| |_| |_| |_|'
    " \]

    " Vim ASCII logo by Erling Westenvik (https://www.vim.org/images/vim.txt)
    let message = [
                \ '     ________ ++     ________  ',
                \ '    /VVVVVVVV\++++  /VVVVVVVV\ ',
                \ '    \VVVVVVVV/++++++\VVVVVVVV/ ',
                \ '     |VVVVVV|++++++++/VVVVV/''  ',
                \ '     |VVVVVV|++++++/VVVVV/''    ',
                \ '    +|VVVVVV|++++/VVVVV/''+     ',
                \ '  +++|VVVVVV|++/VVVVV/''+++++   ',
                \ '+++++|VVVVVV|/VVVVV/''+++++++++ ',
                \ '  +++|VVVVVVVVVVV/''+++++++++   ',
                \ '    +|VVVVVVVVV/''+++++++++     ',
                \ '     |VVVVVVV/''+++++++++       ',
                \ '     |VVVVV/''+++++++++         ',
                \ '     |VVV/''+++++++++           ',
                \ '     ''V/''   ++++++             ',
                \ '              ++               '
                \]
    for line in message
        call append('$', '                                          ' . l:line)
    endfor

    " No modifications to this buffer
    setlocal nomodifiable nomodified

    " When we go to insert mode start a new buffer, and start insert
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

" Run after "doing all the startup stuff"
autocmd VimEnter * call Start()


