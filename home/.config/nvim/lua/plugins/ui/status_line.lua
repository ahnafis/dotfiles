local utils = require("utils")

vim.opt.laststatus = 3

local function status_line()
    local branch = vim.fn.FugitiveHead() or ""
    local modification_status = "%m"
    local file_type = utils.get_file_type(vim.opt.filetype:get())
    local cusror_position = "%l:%v"

    local components = {
        branch,
        modification_status,
        "%=",
        file_type,
        " ",
        cusror_position,
    }

    local line = ""
    local last_component = #components

    for index, component in pairs(components) do
        line = line .. component

        if component ~= "" and index ~= last_component then
            line = line .. " "
        end
    end

    return string.format(" %s ", line)
end

autocmd("VimEnter", {
    group = augroup("setup_status_line"),
    callback = function()
        vim.opt.statusline = status_line()
    end,
})
