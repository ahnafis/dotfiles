" Settings"""""""""""""""""""""""""""
set nocompatible
filetype off

set encoding=UTF-8

syntax on
if has('termguicolors')
    set termguicolors
endif

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent smartindent

set number
set relativenumber

set noerrorbells

set noswapfile
set nobackup
set undodir=~/.tmp/undodir
set undofile

set smartcase
set incsearch
set nohlsearch

set spell

set scrolloff=10

set clipboard=unnamedplus

set splitbelow
set splitright

"set showtabline=2

set signcolumn=yes
"""""""""""""""""""""""""""""""""""""

" Loading plguins
source ~/.config/nvim/plugins.vim
" Loading keybinds
source ~/.config/nvim/keybinds.vim


"Python Settings""""""""""""""""""""

let g:python3_host_prog = '/usr/local/bin/python3'

"Colorscheme""""""""""""""""""""""""
set background=dark
colorscheme gruvbox
"colorscheme onedark
"colorscheme sonokai
"""""""""""""""""""""""""""""""""""""  

" Plugin settings""""""""""""""""""""
lua << EOF
require('nvim-tree').setup{
view = {
    side = 'left',
    width = 30,
    auto_resize = true
    }
}
require('nvim-web-devicons').setup()
EOF

"let g:lightline = { 'colorscheme' : 'sonokai' }
let g:lightline = { 'colorscheme' : 'gruvbox' }
"let g:lightline = { 'colorscheme' : 'onedark' }

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-emmet',
    \ 'coc-prettier',
    \ 'coc-tsserver',
    \ 'coc-sh',
    \ 'coc-fish',
    \ 'coc-html-css-support'
    \ ]

nmap <F2> :call CocAction('jumpDefinition', 'drop')<CR>
"""""""""""""""""""""""""""""""""""""
