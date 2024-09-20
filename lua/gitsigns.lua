-- lua/plugins/gitsigns.lua

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
  