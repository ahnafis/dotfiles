local builtin = require("telescope.builtin")
local api = require("utils.api")

api.nmap("<Leader>f", builtin.find_files, { desc = "Find [F]iles" })
api.nmap("<Leader>b", builtin.buffers, { desc = "Find existing [B]uffers" })
api.nmap("<Leader>k", builtin.keymaps, { desc = "Find [K]eymaps" })
