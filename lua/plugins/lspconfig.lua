-- lua/plugins/lspconfig.lua

local lspconfig = require('lspconfig')

-- Example LSP server setup (for Python)
lspconfig.pyright.setup{}

-- Example LSP server setup (for JavaScript/TypeScript)
lspconfig.tsserver.setup{}
