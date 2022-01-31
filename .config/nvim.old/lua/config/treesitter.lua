require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'html',
        'css',
        'javascript',
        'tsx',
        'python',
        'bash',
        'fish',
        'vim'
    },
    highlight = {
        enable = true
    }
}
