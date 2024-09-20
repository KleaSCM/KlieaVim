-- Enable mouse support
vim.o.mouse = 'a' -- Enable mouse for all modes

-- Set the runtime path to include lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy.nvim and setup plugins
require('lazy').setup({
  'tpope/vim-sleuth',
  'nvim-treesitter/nvim-treesitter',
  'nvim-lualine/lualine.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'nvim-telescope/telescope.nvim',
  'folke/tokyonight.nvim',
  'kyazdani42/nvim-tree.lua',
  'kyazdani42/nvim-web-devicons',
  'lewis6991/gitsigns.nvim',  -- Gitsigns loaded here
})

-- Basic settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.termguicolors = true
vim.o.hidden = true

-- Load keybinds from the keybinds.lua file
require('keybinds')

-- Set colorscheme
vim.cmd('colorscheme tokyonight')

-- Load plugin configurations for nvim-tree
require('nvim-tree').setup({
  disable_netrw = true,
  hijack_netrw = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = 30,
    side = 'left',
    adaptive_size = false,
    number = true,
    relativenumber = true,
  },
})

-- Load and configure gitsigns with new highlight API
require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  current_line_blame = true,
}

-- Set highlights using vim.api.nvim_set_hl
vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitGutterAdd' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' })
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })
vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitGutterDelete' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })
vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitGutterDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })

-- Load Treesitter configurations
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "javascript", "typescript", "python", "html", "css", "bash" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

-- Setup LSP for TypeScript (use ts_ls instead of tsserver)
require('lspconfig').ts_ls.setup {}
