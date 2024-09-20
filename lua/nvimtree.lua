
local nvim_tree = require('nvim-tree')

nvim_tree.setup({
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
  renderer = {
    highlight_git = true,  -- Highlight git status
    icons = {
      glyphs = {
        default = "",     -- Default file icon
        symlink = "",     -- Symlink icon
        folder = {
          default = "",    -- Folder icon
          open = "",       -- Open folder icon
          empty = "",      -- Empty folder icon
          empty_open = "",  -- Empty open folder icon
          symlink = "",    -- Symlink folder icon
        },
        git = {
          unstaged = "✗",    -- Unstaged changes icon
          staged = "✓",       -- Staged changes icon
          untracked = "★",    -- Untracked files icon
          deleted = "",      -- Deleted files icon
          renamed = "➜",      -- Renamed files icon
          ignored = "◌",      -- Ignored files icon
        },
       
        javascript = "",  -- JS icon
        typescript = "",   -- TS icon
        rust = "🦀",        -- Rust icon
        go = "",          -- Go icon
        html = "",        -- HTML icon
        css = "",         -- CSS icon
        python = "",      -- Python icon
        lua = "",         -- Lua icon
        markdown = "",    -- Markdown icon
    
      },
    },
  },
})
