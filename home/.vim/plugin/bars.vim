if g:vim_mode == 'dynamic'
    " Mode:
    " let g:mode_alias = {
    "             \ 'n': 'normal',
    "             \ 'i': 'insert',
    "             \ 'c': 'command',
    "             \ 'v': 'visual',
    "             \ '\<C-V>': 'visual',
    "             \ 'V': 'visual',
    "             \ 'R': 'replace',
    "             \ 's': 'select',
    "             \ 'S': 'select',
    "             \ '': 'none',
    "             \ }

    " function s:exact_mode(mode)
    "     if has_key(g:mode_alias, a:mode)
    "         return g:mode_alias[a:mode]
    "     else
    "         return g:mode_alias['']
    "     endif
    " endfunction

    let g:icons = {
                \ 'none': '',
                \ 'text': '',
                \ 'vim': '',
                \ 'javascript': '',
                \ 'typescript': '',
                \ 'react': '',
                \ 'vue': '﵂',
                \ 'angular': '',
                \ 'c': '',
                \ 'cpp': '',
                \ 'python': '',
                \ 'go': '',
                \ 'lua': '',
                \ 'asm': '',
                \ 'html': '',
                \ 'css': '',
                \ 'markdown': '',
                \ 'license': '',
                \ 'json': '',
                \ 'jsonc': '',
                \ 'conf': '',
                \ 'help': '',
                \ 'git_branch': '',
                \ 'mode_circle': '',
                \ 'mode_circle_dot': '',
                \}

    let g:filetypes = {
                \ '': '[Unknown]',
                \ 'text': 'Plain text',
                \ 'vim': 'VimScript',
                \ 'javascript': 'JavaScript',
                \ 'typescript': 'TypeScript',
                \ 'c': 'C',
                \ 'cpp': 'C++',
                \ 'python': 'Python',
                \ 'asm': 'Assembly',
                \ 'lua': 'Lua',
                \ 'html': 'HTML',
                \ 'css': 'CSS',
                \ 'json': 'JSON',
                \ 'jsonc': 'JSON with comments',
                \ 'markdown': 'Markdown',
                \ 'gitconfig': "Git configuration",
                \ 'gitignore': "Git ignore",
                \ }

    let g:fname = expand("%:t")
    let g:exact_fname = {
                \ '.prettierrc': "Prettier configuration",
                \ '.vimrc': "Vim configuration",
                \ 'vimrc': "Vim configuration",
                \ '.bashrc': "Bash configuration",
                \ 'kitty.conf': "Kitty configuration",
                \ }

    let g:file_formats = {'unix': 'LF', 'dos': 'CRLF'}

    function s:get_ft_of(ft)
        if has_key(g:exact_fname, expand("%:t"))
            return g:exact_fname[expand("%:t")]
        elseif has_key(g:filetypes, a:ft)
            return g:filetypes[a:ft]
        else
            return a:ft
        endif
    endfunction

    let g:git_branch = substitute(system('git branch --show-current'), "\n",
                \ '', '')

    " Colors
    " highlight NormalMode guifg=#78cee9 ctermfg=110 guibg=#3a444b ctermbg=237
    " highlight InsertMode guifg=#9cd57b ctermfg=107 guibg=#3a444b ctermbg=237
    " highlight VisualMode guifg=#f3a96a ctermfg=203 guibg=#3a444b ctermbg=237
    " highlight ReplaceMode guifg=#f76c7c ctermfg=203 guibg=#3a444b ctermbg=237
    " highlight CommandMode guifg=#e3d367 ctermfg=179 guibg=#3a444b ctermbg=237
    " highlight UnknownMode guifg=#e1e2e3 ctermfg=250 guibg=#3a444b ctermbg=237
    " let g:modal_hl = {
    "             \ 'normal': 'NormalMode',
    "             \ 'insert': 'InsertMode',
    "             \ 'visual': 'VisualMode',
    "             \ 'replace': 'ReplaceMode',
    "             \ 'command': 'CommandMode',
    "             \ 'none': 'UnknownMode',
    "             \ 'select': 'UnknownMode'
    "             \ }

    " --> Tab bar
    " function TabLine()
    "     if has_key(g:icons, &ft)
    "         return ' ' .. g:icons[&ft] .. ' ' .. expand('%:t')
    "     elseif &ft == ''
    "         return ' ' .. g:icons['none'] .. ' ' .. expand('%:t')
    "     else
    "         return ' ' .. g:icons['none'] .. ' ' .. expand('%:t')
    "     endif
    " endfunction

    " augroup TabLine
    "     autocmd!
    "     autocmd FileType * setlocal tabline=%!TabLine()
    " augroup END

    " --> Status Bar
    function! StatusBar()
        let s = ''
        " let s .= '%#PmenuSel# %#StatusLine#'
        let s .= ' '

        " let s .= '%#' . g:modal_hl[s:exact_mode(mode())] . '#'
        " let s .= g:icons.mode_circle
        " let s .= '%#StatusLine#'
        " let s .= ' '

        if g:git_branch == ''
            let s .= '%f'
        else
            let s .= g:icons.git_branch . ' ' . g:git_branch
        endif

        let s .= '%='
 
        let s .= 'Lns: %L, Col: %v'
        " let s .= 'Col: %v'
        let s .= ' │ '
        " let s .= '  '
        let s .= toupper(&enc)
        let s .= ' │ '
        " let s .= '  '
        let s .= g:file_formats[&ff]
        let s .= ' │ '
        " let s .= '  '
        let s .= s:get_ft_of(&ft)
        let s .= ' '

        " let s .= '%#PmenuSel# '
        return s
    endfunction
    set statusline=%!StatusBar()
    augroup NetrwStatusBar
        autocmd!
        autocmd FileType netrw,Netrw,vim-plug setlocal statusline=%#NONE#
    augroup END
endif

