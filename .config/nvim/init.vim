" Settings"""""""""""""""""""""""""""
set nocompatible
filetype off

set encoding=UTF-8

syntax on
set termguicolors

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

set clipboard=unnamed

set splitbelow
set splitright

set showtabline=2

set signcolumn=yes
"""""""""""""""""""""""""""""""""""""


" Plugins""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugins')

Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'

Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'

"Plug 'dense-analysis/ale'
"Plug 'vim-python/python-syntax'

Plug 'ap/vim-css-color'
Plug 'terryma/vim-multiple-cursors'

call plug#end()
"""""""""""""""""""""""""""""""""""""

"Python Settings""""""""""""""""""""

let g:python3_host_prog = '/usr/local/bin/python3'

"Colorscheme""""""""""""""""""""""""
set bg=dark
colorscheme onedark
"""""""""""""""""""""""""""""""""""""  

" Plugin settings""""""""""""""""""""
"NERDTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

"Lightline
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'modified' ] ],
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \   },
    \ }


" Rainbow brackets
let g:rainbow#max_level = 100
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType * RainbowParentheses
"""""""""""""""""""""""""""""""""""""

" Keybindings""""""""""""""""""""""""
let mapleader = " "
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za

" Tab
nnoremap <C-T> :tabnew<CR>

" Tab navigations
map <C-left> :tabp<CR>
map <C-right> :tabn<CR>
map <C-w> :tabclose<CR>

" Nerdtree toggling
map <C-b> :NERDTreeToggle<CR>

" Undotree
map <C-u> :UndotreeToggle<CR>

" Tab complete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

" Commenting
nmap + <plug>NERDCommenterToggle

" Zooming stuff
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Editing stuff
nnoremap <C-A> ggVG

noremap y "+y
noremap p "+p
vnoremap d "+d
noremap yy V"+y

map <C-p> :Files<CR>
"""""""""""""""""""""""""""""""""""""
