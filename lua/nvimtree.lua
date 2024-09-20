-- lua/plugins/nvimtree.lua

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
  
  -- Key mapping to toggle the file tree
  vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  