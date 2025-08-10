---@type LazySpec
return {
    {
        "tpope/vim-fugitive",
        config = function()
            require("plugins.git.ui")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins.git.signs")
        end,
    },
}
