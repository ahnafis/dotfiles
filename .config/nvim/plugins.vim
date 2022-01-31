let g:plug_home = stdpath('data') . '/plugged/'

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf.vim'
Plug 'cohama/lexima.vim'

Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'

Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'

call plug#end()
