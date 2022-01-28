let g:plug_home = stdpath('data') . '/plugged/'

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf.vim'
Plug 'cohama/lexima.vim'

Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'

"Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}

"Plug 'nvim-lua/completion-nvim'
"Plug 'glepnir/lspsaga.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
