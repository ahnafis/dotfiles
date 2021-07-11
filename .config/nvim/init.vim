" General Settings
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
"set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Plugins
call plug#begin('~/.config/nvim/plugins')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Plugins Settings
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/usr/local/bin/python3'

" Colorscheme
set bg=dark
colorscheme gruvbox

" Keymaps
"<Leader>cc <Plug>
"<Leader>cu <
nmap <C-b> :NERDTreeToggle<CR>
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nmap <C-r> :source %<CR>
nmap <Enter> C-n<CR>
nmap <C-left> :tabp<CR>
nmap <C-right> :tabn<CR>
nmap <C-w> :tabclose<CR>
