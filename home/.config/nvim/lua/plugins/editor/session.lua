local api = require("utils.api")

local session_path = vim.fn.stdpath("state") .. "/session"
local session_file_name = vim.fn.getcwd():gsub("/", "__") .. ".vim"
local session_file = string.format("%s/%s", session_path, session_file_name)

local session_dir_exists = vim.fn.isdirectory(session_path) == 1
local session_file_exists = vim.fn.filereadable(session_file) == 1

if not session_dir_exists then
    vim.fn.mkdir(session_path)
    vim.print("Ceated session directory at " .. session_path)
end

-- Do not store current options.
vim.opt.sessionoptions = {
    "blank",
    "buffers",
    "curdir",
    "folds",
    "tabpages",
    "winsize",
}

local function save_session()
    vim.cmd.mksession({
        args = { session_file },
        bang = true,
    })
end

local function restore_session()
    if session_file_exists then
        vim.cmd.source(session_file)
    end
end

-- Setting up auto commands.
local sesseionize = api.augroup("sesseionize")

api.autocmd("VimEnter", {
    group = sesseionize,
    pattern = "*",
    callback = restore_session,
    nested = true,
})

api.autocmd("VimLeave", {
    group = sesseionize,
    pattern = "*",
    callback = save_session,
})
