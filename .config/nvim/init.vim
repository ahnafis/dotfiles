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
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Plugins
call plug#begin('~/.config/nvim/plugins')
Plug 'morhetz/gruvbox'
"Plug 'https://github.com/joshdick/onedark.vim'
Plug 'itchyny/lightline.vim' 
Plug 'ryanoasis/vim-devicons'
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
"colorscheme onedark

" Keymaps
"<Leader>cc <Plug>
"<Leader>cu <
map <C-b> :NERDTreeToggle<CR>
map <C-s> :w<CR>
map <C-q> :q<CR>
map <C-r> :source %<CR>
map <Enter> C-n<CR>
map <C-left> :tabp<CR>
map <C-right> :tabn<CR>
map <C-w> :tabclose<CR>
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
vmap cc <plug>NERDCommenterToggle
nmap cc <plug>NERDCommenterToggle
