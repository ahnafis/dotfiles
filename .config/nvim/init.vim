" Load plugins
runtime plug.vim
" Load keymaps
runtime maps.vim

" General settings {
set nocompatible

" Detect file type
filetype indent plugin on

" Encoding
set encoding=utf-8

" Enable syntax highlighting
syntax enable

" Enable 24-bit RGB color
set termguicolors

" Enable tab stuff
set tabstop=8
" Set indentation rules according to file type
autocmd BufNewFile,BufRead *.html,*.css,*.js,*.jsx,*.ts,*.tsx,*.json,*.c,*.cpp,*.h*,*.hpp set softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.py,*.vim,*.lua set softtabstop=4 shiftwidth=4

" Conver tabs into spaces
set expandtab

" Be smart when indenting
set autoindent
set smartindent

" Line number
set number
set relativenumber

" Disable beep or screen flash
set noerrorbells

" Disable backups
set noswapfile
set nobackup

" Enable undo
set undofile
set undodir=~/.tmp/undodir

" Be smart when searching
set smartcase

" Enable incremental search
set incsearch

" Don't highlight patterns
set nohlsearch

" Check spelling
set spell
set spelllang=en_us
set spellfile=~/.config/nvim/spell/en_us.utf-8.add
set complete+=kspell

" Keep space between cursor and screen
set scrolloff=10

" Use system clipboard
set clipboard=unnamedplus

" Split rules
set splitbelow
set splitright

" Extra column
"set signcolumn=yes
" }

" Plugin settings {
" Color scheme
set background=dark
colorscheme gruvbox

" Lightline color scheme
let g:lightline = {'colorscheme': 'gruvbox'}

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-html-css-support',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-emmet',
    \ 'coc-prettier',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-sh',
    \ 'coc-fish',
    \ 'coc-vimlsp'
    \ ]
" }

