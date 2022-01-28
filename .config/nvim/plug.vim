let g:plug_home = stdpath('data') . '/plugged/'

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf.vim'

Plug 'cohama/lexima.vim'
"Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'sbdchd/neoformat'

"Plug 'tpope/vim-fugitive'
"Plug 'sheerun/vim-polyglot'

Plug 'airblade/vim-gitgutter'
"Plug 'preservim/tagbar'

" LSP
"Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-lua/completion-nvim'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'kabouzeid/nvim-lspinstall'
"Plug 'williamboman/nvim-lsp-installer'
"Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'hrsh7th/cmp-nvim-lsp'


call plug#end()

