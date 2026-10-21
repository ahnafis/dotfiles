---@type LazySpec
return {
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 10000,
        config = function()
            require("plugins.syntax.color_scheme")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("plugins.syntax.tree_sitter")
        end,
    },

    {
        "folke/todo-comments.nvim",
        config = true,
    },
}
