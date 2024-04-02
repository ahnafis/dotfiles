local utils = require("utils")

local function status_line()
  local file_name = "%t"
  local modification_status = "%m"
  local file_type = "%y "
  local cusror_position = "%l:%v"

  local components = {
    file_name,
    modification_status,
    "%=",
    file_type,
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

vim.opt.laststatus = 3

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("setup_status_line", { clear = true }),
  callback = function()
    vim.opt.statusline = status_line()
  end,
})
