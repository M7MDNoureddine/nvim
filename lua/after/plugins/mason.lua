require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'omnisharp',   -- C#
    'cssls',       -- CSS
    'html',        -- HTML
    'tsserver',    -- JavaScript/TypeScript
    'clangd',      -- C++
    'pyright',     -- Python
    'lua_ls',      -- Lua
    'lemminx',     -- XML
    'dockerls',    -- Dockerfile
    'yamlls',      -- YAML
  }
})

-- Automatically set up language servers with default configs
require('mason-lspconfig').setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup({})
  end,
})

