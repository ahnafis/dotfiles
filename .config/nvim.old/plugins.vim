let g:plug_home = stdpath('data') . '/plugged/'

call plug#begin()

" Colorscheme
Plug 'joshdick/onedark.vim'

" Utilities
Plug 'junegunn/fzf.vim'
Plug 'cohama/lexima.vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
