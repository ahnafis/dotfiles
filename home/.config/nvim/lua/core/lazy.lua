local paths = require("utils.paths")

local lazy_path = paths.plugins .. "/lazy.nvim"
local lazy_path_exists = vim.uv.fs_stat(lazy_path)

-- Bootstrapping Lazy.nvim:
if not lazy_path_exists then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazy_path,
    })
end

vim.opt.runtimepath:prepend(lazy_path)

-- Plugin manager.
require("lazy").setup({
    spec = {
        import = "plugins",
    },

    install = {
        colorschme = { "gruvbox", "habamax" },
    },

    change_detection = {
        notify = false,
    },

    performance = {
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "gzip",
                "netrw",
                "netrwPlugin",
                "spellfile_plugin",
                "tarPlugin",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

require("plugins.editor.session")
require("plugins.ui.status_line")
