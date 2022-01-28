" Loading stuff {
" Load plugins
source ~/.config/nvim/plug.vim
" Load keymaps
source ~/.config/nvim/maps.vim
"}

" General settings {
set nocompatible
filetype off

set encoding=UTF-8

syntax enable
if has('termguicolors')
    set termguicolors
endif

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent smartindent

" Line number
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

"set spell

set scrolloff=10

" Use system clipboard
set clipboard=unnamedplus

" Split rules
set splitbelow
set splitright

" Extra column
set signcolumn=yes
"}

" Plugin settings {
" Colorscheme
set background=dark
colorscheme gruvbox

" Lightline colorscheme
let g:lightline = { 'colorscheme': 'gruvbox' }

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-html-css-support',
    \ 'coc-emmet',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-sh',
    \ 'coc-fish',
    \ 'coc-vimlsp'
    \ ]

"}
