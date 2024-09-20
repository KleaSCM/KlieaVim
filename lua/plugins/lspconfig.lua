
local lspconfig = require('lspconfig')

-- Load Mason setup
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    "tsserver",
    "eslint",
    "rust_analyzer",
    "gopls",
    "pyright",
    "clangd",
  },
})

-- Common on_attach function to set up keybindings
local on_attach = function(client, bufnr)
  -- General LSP keybindings will be set in keybinds.lua

  -- Enable error reporting
  vim.cmd [[autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()]]
end

-- Setup for language servers
local servers = {
  tsserver = {},
  eslint = {},
  rust_analyzer = {},
  gopls = {},
  pyright = {},
  clangd = {},
}

for server, config in pairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = config.settings or {},
  })
end
