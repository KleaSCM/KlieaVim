-- Enable mouse support
vim.o.mouse = 'a'

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
  'lewis6991/gitsigns.nvim',
  'mfussenegger/nvim-dap',      -- Debugging
  'rcarriga/nvim-dap-ui',       -- DAP UI
  'nvim-neotest/nvim-nio',      -- Required for nvim-dap-ui
  'williamboman/mason.nvim',    -- Mason
  'williamboman/mason-lspconfig.nvim', -- Mason for LSP
  'windwp/nvim-autopairs',      -- Auto-pairing
  'iamcco/markdown-preview.nvim', -- Markdown Preview
  'tpope/vim-fugitive',         -- Git integration
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

-- Set background images
vim.g.neovide_background_image = "/home/kliea/.config/nvim/assets/editor.png"
vim.g.neovide_transparency = 0.8  -- Adjust for the desired transparency level
vim.g.neovide_background_image_blur = 0.5  -- Optionally blur the image



-- Configure Mason
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    "ts_ls",
    "eslint",
    "rust_analyzer",
    "gopls",
    "pyright",
  },
})

-- LSP server setup
local lspconfig = require('lspconfig')
local on_attach = function(_, bufnr)
  local buf_set_keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }
  -- LSP key mappings
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

lspconfig.ts_ls.setup({ on_attach = on_attach })
lspconfig.eslint.setup({ on_attach = on_attach })
lspconfig.rust_analyzer.setup({ on_attach = on_attach })
lspconfig.gopls.setup({ on_attach = on_attach })
lspconfig.pyright.setup({ on_attach = on_attach })
lspconfig.clangd.setup({ on_attach = on_attach })

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
})

-- Set colorscheme
vim.cmd('colorscheme tokyonight')

-- Nvim-CMP (Autocompletion)
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})

-- Lualine statusline
require('lualine').setup({
  options = { theme = 'tokyonight', section_separators = '', component_separators = '' },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename', 'lsp_progress' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'location' },
    lualine_z = { 'progress' }
  },
  extensions = { 'fugitive' }
})

-- Telescope fuzzy finder
require('telescope').setup()

-- NvimTree setup
require('nvim-tree').setup({
  view = {
    width = 30,
    side = 'left',
  },
})

-- Terminal setup on the right side
vim.cmd [[
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd TermOpen * startinsert
  command! Terminal rightbelow split | wincmd l | terminal
]]

-- Treesitter setup
require('nvim-treesitter.configs').setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
})

-- DAP (Debugging) setup
local dap = require('dap')
local dapui = require('dapui')

dap.set_log_level('DEBUG')
dapui.setup()

-- Ensure keybindings for DAP
vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>di', '<cmd>lua require"dap".step_into()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua require"dap".step_over()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<CR>', { noremap = true })

-- Additional setup for hover and diagnostics
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  update_in_insert = true,
})

-- Auto-pairs setup
require('nvim-autopairs').setup{}

-- Markdown Preview setup
vim.cmd [[
  autocmd FileType markdown nnoremap <buffer> <leader>mp :MarkdownPreview<CR>
]]

-- Load keybindings
require('keybinds')
