local lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')

local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.update_capabilities(protocol.make_client_capabilities())

local opts = {noremap = true, silent = true}

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    

    --if client.resolved_capabilities.document_formatting then
        --vim.api.nvim_command [[augroup Format]]
        --vim.api.nvim_command [[autocmd! * <buffer>]]
        --vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        --vim.api.nvim_command [[augroup END]]
    --end
end

-- JavaScript & TypeScript
lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Python
lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- HTML
lsp.html.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- CSS
lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Emmet
lsp.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Json
lsp.jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Lua
lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Vim
lsp.vimls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Bash
lsp.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
