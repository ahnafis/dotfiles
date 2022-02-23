---------------------------------------------
-- Plug-ins
---------------------------------------------
local packer = require("packer")

packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "morhetz/gruvbox"
    use "sainnhe/sonokai"
    use "folke/tokyonight.nvim"
    use "cohama/lexima.vim"
    use "mbbill/undotree"
    use "preservim/nerdcommenter"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use "nvim-lualine/lualine.nvim"
    -- use "glepnir/galaxyline.nvim"
    use "airblade/vim-gitgutter"
    use "sheerun/vim-polyglot"
    use "pangloss/vim-javascript"
    use "neovim/nvim-lspconfig"
    use {
        "hrsh7th/nvim-cmp", requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-vsnip"
    }}
end)

---------------------------------------------
-- configurations
---------------------------------------------
local vim = vim
local opt, g, wo, bo = vim.opt, vim.g, vim.wo, vim.bo
local api, fn, exec = vim.api, vim.fn, vim.cmd
local map = vim.api.nvim_set_keymap
local lsp = require("lspconfig")
local protocol = require("vim.lsp.protocol")
local cmp = require("cmp")
local types = require("cmp.types")

opt.termguicolors = true
wo.t_Co = "256"
opt.tabstop = 8
--exec[[
--autocmd BufNewFile,BufRead *.html,*.css,*.js,*.jsx,*.ts,*.tsx,*.json,*.c,*.cpp,*.h*,*.hpp setlocal softtabstop=2 shiftwidth=2
--autocmd BufNewFile,BufRead *.py,*.vim,*.lua,*.sh,*.bash,*.bashrc,*.fish setlocal softtabstop=4 shiftwidth=4
--]]
local indent_2_ft = {
    "html", "css", "javascript",
    "javascriptreact", "typescript",
    "typescriptreact", "json", "jsonc",
    "c", "cpp", "h", "hpp"
}
local indent_4_ft = { "python", "vim", "lua", "sh", "fish" }

for _, ft in ipairs(indent_2_ft) do
    if opt.filetype == ft then
        bo.softtabstop = 2
        bo.shiftwidth = 2
    end
end
for _, ft in ipairs(indent_4_ft) do
    if opt.filetype == ft then
        bo.softtabstop = 4
        bo.shiftwidth = 4
    end
end
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.copyindent = true
opt.number = true
opt.relativenumber = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir= fn.expand("~/.tmp/undodir")
opt.clipboard = "unnamedplus"
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false
opt.scrolloff = 10
opt.splitbelow = true
opt.splitright = true
opt.signcolumn = "yes"
--opt.signcolumn = "number"
opt.pumheight = 10
opt.cursorline = true
opt.showmode = false
opt.completeopt = "menu,menuone,noinsert"
g.python_host_prog = "python3"

-- Colorscheme
--opt.background = "light"
local theme
--theme = "gruvbox"
theme = "tokyonight"
--theme = "sonokai"

if theme == "gruvbox" then
    g.gruvbox_italic = 1
    g.gruvbox_bold = 0
    g.gruvbox_contrast_light = "hard"
    g.gruvbox_contrast_dark = "hard"

elseif theme == "tokyonight" then
    g.tokyonight_terminal_colors = 1
    g.tokyonight_italic_comments = 1
    g.tokyonight_style = "night"

elseif theme == "sonokai" then
    g.sonokai_style = "atlantis"
end

exec("colorscheme " .. theme)

-- Status bar
require("lualine").setup()

-- File tree
require("nvim-tree").setup()

-- Language server protocol
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.update_capabilities(protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })


    --if client.resolved_capabilities.document_formatting then
        --vim.api.nvim_command [[augroup Format]]
        --vim.api.nvim_command [[autocmd! * <buffer>]]
        --vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        --vim.api.nvim_command [[augroup END]]
    --end
end

local servers = {
    "tsserver",
    "pyright",
    "html",
    "cssls",
    "emmet_ls",
    "jsonls",
    "sumneko_lua",
    "vimls",
    "bashls"
}
for _, server in pairs(servers) do
    lsp[server].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- Auto completion
cmp.setup({
    completion = {
        autocomplete = {
            types.cmp.TriggerEvent.InsertEnter,
            types.cmp.TriggerEvent.TextChanged
        },
        completeopt = "menu,menuone,noinsert",
        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
        keyword_length = 1
    },
    preselect = cmp.PreselectMode.None,
    snippet = {
      expand = function(args)
        fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {
            "i",
            "s"
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {
            "i",
            "s"
        })
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "buffer"},
    }
})

cmp.setup.cmdline("/", {
    sources = {
        {name = "buffer"}
    }
})

cmp.setup.cmdline(":", {
    sources = {
        --{ name = "path" },
        { name = "cmdline" }
    }
})

-- NeoVim Treesitter
--require("nvim-treesitter.configs").setup {
--    ensure_installed = {
--        "html",
--        "css",
--        "javascript",
--        "tsx",
--        "python",
--        "bash",
--        "fish",
--        "vim"
--    },
--    highlight = {
--        enable = true
--    }
--}

---------------------------------------------
-- Keyboard shortcuts
---------------------------------------------
-- The <Leader> key
g.mapleader = ","

-- Split navigation
map("n", "<C-h>", "<Cmd>wincmd h<CR>", { noremap = true })
map("n", "<C-l>", "<Cmd>wincmd l<CR>", { noremap = true })
map("n", "<C-k>", "<Cmd>wincmd k<CR>", { noremap = true })
map("n", "<C-j>", "<Cmd>wincmd j<CR>", { noremap = true })

-- Split resizeing
map("n", "<Leader>=", "<Cmd>vertical resize +5<CR>", { noremap = true })
map("n", "<Leader>-", "<Cmd>vertical resize -5<CR>", { noremap = true })
map("n", "<Leader>[", "<Cmd>resize +5<CR>", { noremap = true })
map("n", "<Leader>]", "<Cmd>resize -5<CR>", { noremap = true })

-- Smart tab
_G.smartTab = function()
    return fn.pumvisible() == 1 and t"<C-n>" or t"<Tab>"
end
_G.smartShiftTab = function()
    return fn.pumvisible() == 1 and t"<C-p>" or t"<S-Tab>"
end

map("i", "<Tab>", "v:lua.smartTab()", {expr = true, noremap = true})
map("i", "<S-Tab>", "v:lua.smartShiftTab()", {expr = true, noremap = true})

-- Editing stuff
map("n", "<Leader>a", "ggVG", { noremap = true })
map("n", "<A-k>", "<Cmd>m .-2<CR>==", { noremap = true })
map("n", "<A-j>", "<Cmd>m .+1<CR>==", { noremap = true })
map("i", "<A-k>", "<Esc><Cmd>m .-2<CR>==gi", { noremap = true })
map("i", "<A-j>", "<Esc><Cmd>m .+1<CR>==gi", { noremap = true })
map("v", "<A-k>", "<Cmd>m '<-2<CR>gv=gv'", { noremap = true })
map("v", "<A-j>", "<Cmd>m '>+1<CR>gv=gv'", { noremap = true })

-- File navigation stuff
map("n", "<C-p>", "<Cmd>Telescope find_files<CR>", { noremap = true })
map("n", "<C-e>", "<Cmd>NvimTreeToggle<CR>", { noremap = true })
map("", "<C-u>", "<Cmd>UndotreeToggle<CR>", { noremap = false })

-- Commenting
map("n", "<C-_>", "<plug>NERDCommenterToggle", { noremap = false })
map("v", "<C-_>", "<plug>NERDCommenterToggle", { noremap = false })
