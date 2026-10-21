---@type LazySpec
return {
    "hrsh7th/nvim-cmp",

    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
    },

    config = function()
        require("plugins.completion.config")
    end,
}
