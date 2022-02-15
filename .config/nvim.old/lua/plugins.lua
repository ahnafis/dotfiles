local use = require('packer').use
require('packer').startup(function()
    -- Packer itself
    use 'wbthomason/packer.nvim'

    -- Colorscheme
    use 'sainnhe/sonokai'
    use 'morhetz/gruvbox'
    use 'tomasiser/vim-code-dark'
    use 'joshdick/onedark.vim'
    use 'folke/tokyonight.nvim'

    -- Utilities
    --use {'junegunn/fzf', run = './install --all'}
    --use 'junegunn/fzf.vim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'junegunn/goyo.vim'
    use 'cohama/lexima.vim'
    use 'mbbill/undotree'
    use 'airblade/vim-gitgutter'
    use 'preservim/nerdcommenter'
    use 'preservim/nerdtree'
    use 'itchyny/lightline.vim'

    -- Syntax highlighting
    --use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'sheerun/vim-polyglot'
    use 'pangloss/vim-javascript'

    -- Language server protocol
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'glepnir/lspsaga.nvim'

    -- Auto completion
    use {
	'hrsh7th/nvim-cmp',
	requires = {
	    'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-buffer',
	    'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',

	    'hrsh7th/cmp-vsnip',
	    'hrsh7th/vim-vsnip'
        }
    }
end)
