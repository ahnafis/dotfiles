""""""""""""""""""""""""""""""
" General Settings:
""""""""""""""""""""""""""""""
" Disable old-time vi compatibility
set nocompatible

" Set to allow auto indent depending on file type
filetype plugin on
filetype indent on

" Set encoding
set encoding=UTF-8

" Enable syntax highlighting
syntax on
if has('termguicolors')
    set termguicolors
endif

" Set to auto read when a file is changed from outside
set autoread
au FocusGained, BufEnter * checktime

" Ignore case sensitivity
set ignorecase

" Be smart about cases ;)
set smartcase

" Set incremental search
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Wildmenu
set wildmenu

" Accessing system clipboard
set clipboard=unnammedplus

" Enabling line number
set number
set relativenumber

" Load plugins
source ~/.config/vim/plugins.vim
" Load keybindings
source ~/.config/vim/keybinds.vim

" Colorscheme
set background=dark
colorscheme gruvbox
