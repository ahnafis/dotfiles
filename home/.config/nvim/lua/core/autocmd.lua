autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    desc = "Highlight yanked text",
    callback = function()
        vim.hl.on_yank({ higroup = "Visual" })
    end,
})
