local formatter_options = require("plugins.coding.formatting")
local auto_pairs_options = require("plugins.coding.auto_pairs")

---@type LazySpec
return {
    "tpope/vim-surround",

    {
        "tpope/vim-commentary",
        config = function()
            require("plugins.coding.commenting")
        end,
    },

    {
        "stevearc/conform.nvim",
        opts = formatter_options,
    },

    {
        "windwp/nvim-autopairs",
        opts = auto_pairs_options,
    },
}
