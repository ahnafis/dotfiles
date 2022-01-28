call plug#begin('~/.config/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'folke/tokyonight.nvim'
Plug 'sainnhe/sonokai'
Plug 'tomasiser/vim-code-dark'
Plug 'ayu-theme/ayu-vim'

"Plug 'rcarriga/nvim-notify'
"Plug 'romgrk/barbar.nvim'

"Plug 'iamcco/markdown-preview.nvim'
"Plug 'folke/todo-comments.nvim'

Plug 'junegunn/fzf.vim'
"Plug 'junegunn/rainbow_parentheses.vim'

Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'kyazdani42/nvim-tree.lua'
"Plug 'kyazdani42/nvim-web-devicons'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'

Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'

"Plug 'dense-analysis/ale'
"Plug 'vim-python/python-syntax'

"Plug 'ap/vim-css-color'
Plug 'terryma/vim-multiple-cursors'

Plug 'airblade/vim-gitgutter'
Plug 'preservim/tagbar'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

