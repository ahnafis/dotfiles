local function open_fugitive()
    vim.cmd("tab Git")
end

nnoremap("<Leader>g", open_fugitive, { desc = "Open Fugitive in new tab" })
