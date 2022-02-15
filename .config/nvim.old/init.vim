" ---------------------------- [General settings] ---------------------------
filetype on
filetype plugin on
filetype indent on

syntax on
set termguicolors
set t_Co=256

set tabstop=8
autocmd BufNewFile,BufRead *.html,*.css,*.js,*.jsx,*.ts,*.tsx,*.json,*.c,*.cpp,*.h*,*.hpp setlocal softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.py,*.vim,*.lua,*.sh,*.bash,*.fish setlocal softtabstop=4 shiftwidth=4
set expandtab
set autoindent
set smartindent
set copyindent

set number
set relativenumber
set noerrorbells
set noswapfile
set nobackup
set undofile
set undodir=~/.tmp/undodir
set clipboard=unnamedplus

set smartcase
set incsearch
set nohlsearch

set scrolloff=10
set splitbelow
set splitright
set signcolumn=yes
set pumheight=10

" ---------------------------- [General settings] ---------------------------

" ---------------------- [Plugins and plguins settings] ---------------------
let g:python_host_prog = 'python3'

let g:plug_home = stdpath('data') . '/plugged/'

call plug#begin()

Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'cohama/lexima.vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'sbdchd/neoformat'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

lua << EOF
-- Configurations
require('config.lsp')
require('config.completion')
--require('config.treesitter')
EOF

" Color scheme
set background=dark

"colorscheme onedark
"let g:lightline = {'colorscheme': 'onedark'}

"let g:sonokai_style = 'atlantis'
"let g:sonokai_style = 'andromeda'
"let g:sonokai_style = 'shusia'
"let g:sonokai_style = 'maia'
"let g:sonokai_style = 'espresso'
"colorscheme sonokai
"let g:lightline = {'colorscheme': 'sonokai'}

let g:gruvbox_termcolors = 16
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = 0
colorscheme gruvbox
let g:lightline = {'colorscheme': 'gruvbox'}

"colorscheme codedark
"let g:lightline = {'colorscheme': 'codedark'}

" Prettier
autocmd BufWritePre *.html,*.css,*.scss,*.js,*.jsx,*.ts,*.tsx,*.json,*.md Neoformat
" -------------------------- [Keyboard shortcuts] ---------------------------
" Set mapleader
let mapleader = ','

" Split navigation
nnoremap <C-h> <Cmd>wincmd h<CR>
nnoremap <C-l> <Cmd>wincmd l<CR>
nnoremap <C-k> <Cmd>wincmd k<CR>
nnoremap <C-j> <Cmd>wincmd j<CR>

" Toggle undotree
map <C-u> <Cmd>UndotreeToggle<CR>

" Tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>": "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>": "\<S-Tab>"

" Resizing stuff
nnoremap <Leader>= <Cmd>vertical resize +5<CR>
nnoremap <Leader>- <Cmd>vertical resize -5<CR>
nnoremap <Leader>[ <Cmd>resize +5<CR>
nnoremap <Leader>] <Cmd>resize -5<CR>

" Selection stuff
"nnoremap <Leader>a ggVG
nnoremap <C-a> ggVG
"inoremap <C-a> <Esc>ggVG

" File navigation stuff
map <C-p> <Cmd>Telescope find_files<CR>
map <C-e> <Cmd>NERDTreeToggle<CR>

" Line moving stuff
nnoremap <A-k> <Cmd>m .-2<CR>==
inoremap <A-j> <esc><Cmd>m .+1<CR>==gi
nnoremap <A-j> <Cmd>m .+1<CR>==
inoremap <A-k> <esc><Cmd>m .-2<CR>==gi
"vnoremap <A-j> <Cmd>m '>+1<CR>gv=gv
"vnoremap <A-k> <Cmd>m '<-2<CR>gv=gv

" Commenting
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle

