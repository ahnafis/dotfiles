local api = require("utils.api")

api.autocmd("TextYankPost", {
    group = api.augroup("highlight_yank"),
    desc = "Highlight yanked text",
    callback = function()
        vim.hl.on_yank({ higroup = "Visual" })
    end,
})
