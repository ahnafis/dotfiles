local api = require("utils.api")

local function open_fugitive()
	vim.cmd("tab Git")
end

api.nmap("<Leader>g", open_fugitive, { desc = "Open Fugitive in new tab" })
