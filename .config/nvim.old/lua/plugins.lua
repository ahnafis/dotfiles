local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Color scheme
    -- use 'morhetz/gruvbox'
    use 'tomasiser/vim-code-dark'

    -- Status bar
    use 'itchyny/lightline.vim'

    -- Utility tools
    use 'cohama/lexima.vim'
    use 'junegunn/fzf.vim'
    use 'mbbill/undotree'

    -- Syntax highlighting
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Auto completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
end)
