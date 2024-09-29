---
-- LSP configuration
---
local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, silent = true })

end

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- These are just examples. Replace them with the language
-- servers you have installed in your system
require('lspconfig').csharp_ls.setup({
    capabilities = capabilities,
})
require('lspconfig').cssls.setup({
    capabilities = capabilities,
})
require('lspconfig').html.setup({
    capabilities = capabilities,
})
require('lspconfig').ts_ls.setup({
    capabilities = capabilities,
})
require('lspconfig').clangd.setup({
    capabilities = capabilities,
})
require('lspconfig').pyright.setup({
    capabilities = capabilities,
})
require('lspconfig').lua_ls.setup({
    capabilities = capabilities,
})
require('lspconfig').lemminx.setup({
    capabilities = capabilities,
})
require('lspconfig').dockerls.setup({
    capabilities = capabilities,
})
require('lspconfig').yamlls.setup({
    capabilities = capabilities,
})


-- Autocompletion setup
---
local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({

        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete()
    })
})
