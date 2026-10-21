local bar_sign = "▌"

require("gitsigns").setup({
    signs = {
        add = { text = bar_sign },
        change = { text = bar_sign },
        delete = { text = bar_sign },
        changedelete = { text = bar_sign },
        topdelete = { text = "‾" },
        untracked = { text = "┆" },
    },
})
