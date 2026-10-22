local api = require("utils.api")

-- The legend key ;)
vim.g.mapleader = ";"

api.nmap("<A-a>", "msggVG", { desc = "Select all" })

api.vmap("<", "<gv", { desc = "Restore visual mode after a visual shifting" })
api.vmap(">", ">gv", { desc = "Restore visual mode after a visual shifting" })

api.nmap("<C-k>", function()
	vim.fn.append(vim.fn.line(".") - 1, "")
end, {
	silent = true,
	desc = "Add an empty line above",
})

api.nmap("<C-j>", function()
	vim.fn.append(vim.fn.line("."), "")
end, {
	silent = true,
	desc = "Add an empty line below",
})

api.nmap("<A-k>", "<Cmd>move . -2<CR>", { desc = "Move current line up" })
api.vmap("<A-k>", ":move '< -2<CR>gv", { desc = "Move current line up" })
api.nmap("<A-j>", "<Cmd>move . +1<CR>", { desc = "Move current line down" })
api.vmap("<A-j>", ":move '> +1<CR>gv", { desc = "Move current line down" })

api.nmap("<Leader>d", "<Cmd>bdelete<CR>", { desc = "Delete current buffer" })
-- api.nmap("<Tab>", "<Cmd>bnext<CR>", { desc = "Go to the next buffer" })
-- api.nmap("<S-Tab>", "<Cmd>bprevious<CR>", {
--     desc = "Go to the previous buffer",
-- })

api.nmap("<Tab>", "<Cmd>tabnext<CR>", { desc = "Go to the next tab page" })
api.nmap("<S-Tab>", "<Cmd>tabprevious<CR>", {
	desc = "Go to the previous tab page",
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
