syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set noswapfile
set nobackup
set undodir=~/.tmp/undodir
set undofile
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.config/nvim/plugins')

Plug 'Valloric/YouCompleteMe'

call plug#end()

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
