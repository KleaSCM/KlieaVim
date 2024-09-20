-- init.lua

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
  -- Plugin manager
  'tpope/vim-sleuth', -- Automatically adjusts indentation based on file content
  'nvim-treesitter/nvim-treesitter', -- Syntax highlighting and parsing
  'nvim-lualine/lualine.nvim', -- Status line
  'neovim/nvim-lspconfig', -- LSP support
  'hrsh7th/nvim-cmp', -- Autocompletion
  'hrsh7th/cmp-nvim-lsp', -- LSP completion
  'L3MON4D3/LuaSnip', -- Snippets
  'saadparwaiz1/cmp_luasnip', -- Snippet completions
  'nvim-telescope/telescope.nvim', -- Fuzzy finder
  'folke/tokyonight.nvim', -- Theme
  'kyazdani42/nvim-tree.lua', -- File explorer
  'kyazdani42/nvim-web-devicons', -- Optional, for file icons
  'lewis6991/gitsigns.nvim', -- Git integration
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

-- Key mappings
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) -- New: File tree toggle

-- Set colorscheme
vim.cmd('colorscheme tokyonight')

-- Load plugin configurations
require('nvim-tree').setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  auto_close = true,
  open_on_tab = false,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = 30,
    side = 'left',
    auto_resize = true,
  },
})

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitGutterAdd', text = '│', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
    change       = {hl = 'GitGutterChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "javascript", "typescript", "python", "html", "css", "bash" }, -- Add languages you work with
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
