
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "javascript", "typescript", "python", "html", "css", "bash" }, -- Add languages you work with
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
