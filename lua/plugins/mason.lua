
-- Load Mason setup
require('mason').setup()

-- Ensure installed language servers
require('mason-lspconfig').setup({
  ensure_installed = {
    "tsserver",               -- TypeScript Language Server
    "eslint",                 -- ESLint
    "rust_analyzer",          -- Rust Analyzer
    "gopls",                  -- Go Language Server
    "pyright",                -- Python Language Server
    "clangd",                 -- C/C++
    "omnisharp",              -- C#
    "html",                   -- HTML
    "cssls",                  -- CSS
    "kotlin_language_server", -- Kotlin
    "jdtls",                  -- Java
  },
})