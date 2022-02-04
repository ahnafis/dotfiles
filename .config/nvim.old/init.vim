" ---------------------------- [General settings] ---------------------------
if &compatible
    set nocompatible
endif

" Detect file type
filetype indent plugin on

" Encoding
set encoding=utf-8

" Enable syntax highlighting
syntax enable

" Enable 24-bit RGB color
set termguicolors

" Enable 256 color support
set t_Co=256

" Enable tab stuff
set tabstop=8

" Set indentation rules according to file type
autocmd BufNewFile,BufRead *.html,*.css,*.js,*.jsx,*.ts,*.tsx,*.json,*.c,*.cpp,*.h*,*.hpp setlocal softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.py,*.vim,*.lua,*.sh,*.bash,*.fish setlocal softtabstop=4 shiftwidth=4

" Convert tabs into spaces
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

" Keep space between cursor and screen
set scrolloff=10

" Use system clipboard
set clipboard=unnamedplus

" Split rules
set splitbelow
set splitright

" Extra column
set signcolumn=yes

" Netrw
let g:netrw_winsize = 20
let g:netrw_wiw = 20

" Status bar customization
set statusline=
set statusline+=\ %F\ %r%M
set statusline+=%=\ %y\ %l:%c\ %p%%/%L\ [%n]

" Pop-up menu height
set pumheight=10
" ---------------------------- [General settings] ---------------------------

" -------------------------------- [Plugins] --------------------------------
let g:plug_home = stdpath('data') . '/plugged/'

call plug#begin()

" Colorscheme
Plug 'joshdick/onedark.vim'

" Utilities
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'cohama/lexima.vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" -------------------------------- [Plugins] --------------------------------

" ---------------------------- [Plugin settings] ----------------------------
" Color scheme
set background=dark
colorscheme onedark

" COC settings
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

" -------------------------- [Keyboard shortcuts] ---------------------------
" Set mapleader
let mapleader = ','

" Split navigation
nnoremap <c-h> <cmd>wincmd h<cr>
nnoremap <c-l> <cmd>wincmd l<cr>
nnoremap <c-k> <cmd>wincmd k<cr>
nnoremap <c-j> <cmd>wincmd j<cr>

" Toggle undotree
map <c-u> <cmd>UndotreeToggle<cr>

" Tab completion
inoremap <expr> <Tab> pumvisible() ? "\<c-n>": "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<c-p>": "\<S-Tab>"

" Resizing stuff
nnoremap <leader>= <cmd>vertical resize +5<cr>
nnoremap <leader>- <cmd>vertical resize -5<cr>
nnoremap <leader>[ <cmd>resize +5<cr>
nnoremap <leader>] <cmd>resize -5<cr>

" Selection stuff
nnoremap <leader>a ggVG

" File navigation stiff
map <c-p> <cmd>W<cr>

" Line moving stuff
nnoremap <a-k> <cmd>m .-2<cr>==
inoremap <a-j> <esc><cmd>m .+1<cr>==gi
nnoremap <a-j> <cmd>m .+1<cr>==
inoremap <a-k> <esc><cmd>m .-2<cr>==gi
"vnoremap <a-j> <cmd>m '>+1<cr>gv=gv
"vnoremap <a-k> <cmd>m '<-2<cr>gv=gv


" COC: Jump to definition
nmap gd <cmd>call CocAction('jumpDefinition', 'drop')<cr>

" Commenting
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle

