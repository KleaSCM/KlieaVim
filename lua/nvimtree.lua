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
      -- Remove auto_resize and open_on_setup
      adaptive_size = false,  -- Use this if you want the width to adjust based on content
      number = true,          -- Show line numbers
      relativenumber = true,  -- Show relative line numbers
    },
  })
  