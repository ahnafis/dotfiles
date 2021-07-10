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
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Plugins
call plug#begin('~/.config/nvim/plugins')
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Plugins Settings
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:deoplete#enable_at_startup = 1

" Keymaps
"<Leader>cc <Esc>
"<Leader>cu <Esc>

"COC
source ~/.config/nvim/plugins/coc.vim
