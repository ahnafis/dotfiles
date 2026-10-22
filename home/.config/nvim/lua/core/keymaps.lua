local api = require("utils.api")

-- The legend key ;)
vim.g.mapleader = ";"

api.nmap("<A-a>", "msggVG", { desc = "Select all" })

api.vmap("<", "<gv", { desc = "Move selected item to the left" })
api.vmap(">", ">gv", { desc = "Move selected item to the right" })

api.nmap("<C-k>", function()
    vim.fn.append(vim.fn.line(".") - 1, "")
end, { desc = "Add an empty line above", silent = true })

api.nmap("<C-j>", function()
    vim.fn.append(vim.fn.line("."), "")
end, { desc = "Add an empty line below", silent = true })

api.nmap("<A-k>", ":move . -2<CR>", {
    desc = "Move current line up",
    silent = true,
})
api.nmap("<A-j>", ":move . +1<CR>", {
    desc = "Move current line down",
    silent = true,
})
api.vmap("<A-k>", ":move '< -2<CR>gv", {
    desc = "Move current line up",
    silent = true,
})
api.vmap("<A-j>", ":move '> +1<CR>gv", {
    desc = "Move current line down",
    silent = true,
})

api.nmap("<Leader>d", ":bdelete<CR>", {
    desc = "Delete current buffer",
    silent = true,
})

api.nmap("<PageUp>", ":bnext<CR>", {
    desc = "Go to the next buffer",
    silent = true,
})
api.nmap("<PageDown>", ":bprevious<CR>", {
    desc = "Go to the previous buffer",
    silent = true,
})

api.nmap("<Tab>", ":tabnext<CR>", {
    desc = "Go to the next tab page",
    silent = true,
})
api.nmap("<S-Tab>", ":tabprevious<CR>", {
    desc = "Go to the previous tab page",
    silent = true,
})

api.nmap("0", "^")
api.nmap("k", "gk")
api.nmap("j", "gj")
api.nmap("gk", "k")
api.nmap("gj", "j")

api.nmap("<C-u>", "<C-u>zz", { desc = "Scroll up" })
api.nmap("<C-d>", "<C-d>zz", { desc = "Scroll down" })

api.nmap("n", "nzz", { desc = "Go to the next search" })
api.nmap("N", "Nzz", { desc = "Go to the previous search" })

api.nmap("*", "*zzzv", {
    desc = "Go to the next search that matches current word",
})
api.nmap("#", "#zzzv", {
    desc = "Go to the previous search that matches current word",
})

api.nmap("Q", "@q", { desc = "Apply macros" })
