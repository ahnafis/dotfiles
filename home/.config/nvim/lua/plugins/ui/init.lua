require("plugins.ui.status_line")

---@type LazySpec
return {
    "nvim-tree/nvim-web-devicons",
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.ui.noice")
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
}
