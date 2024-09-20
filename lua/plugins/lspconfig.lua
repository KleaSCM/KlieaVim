

local lspconfig = require('lspconfig')

-- Common on_attach function to set up keybindings
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  -- General LSP keybindings
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts) 
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  -- Diagnostics key mappings
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Enable error reporting
  vim.cmd [[autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()]]
end

-- Set up TypeScript Language Server
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Set up ESLint Language Server
lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Set up Rust Analyzer
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Set up Go Language Server
lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Set up Python Language Server (Pyright)
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Set up C/C++ Language Server
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})
