" ----------------------------- [Loading stuff] -----------------------------
" Plugins
runtime plugins.vim

" Keymaps
runtime keymaps.vim

" ----------------------------- [Loading stuff] -----------------------------

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

" Check spelling
"set spell
"set spelllang=en_us
"set spellfile=~/.config/nvim/spell/en_us.utf-8.add
"set complete+=kspell

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

" Complete options
set completeopt=menu,menuone,noinsert
" ---------------------------- [General settings] ---------------------------

" ---------------------------- [Plugin settings] ----------------------------
" Color scheme
set background=dark
colorscheme codedark

"let g:lightline = { 'colorscheme': 'codedark' }
