require'nvim-treesitter.configs'.setup {
  -- Ensure installed language parsers
  ensure_installed = {
    "lua", "javascript", "typescript", "python", "html", "css", "bash", 
    "go", "rust", "java", "cpp", "c_sharp", "kotlin", "htmx", "json", "yaml", "scss"
  },
  
  -- Syntax highlighting
  highlight = {
    enable = true, -- Enable syntax highlighting
    additional_vim_regex_highlighting = false, -- Disable Vim regex highlighting
    custom_captures = {
      -- Highlight specific nodes (example for variables)
      -- ["variable.foo"] = "Identifier",
    },
  },

  -- Tree-sitter based indentation
  indent = {
    enable = true,
    disable = { "python" }, -- Disable for specific languages if needed
  },

  -- Incremental selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>", -- Start selection
      node_incremental = "<C-space>", -- Increment to node
      scope_incremental = "<C-s>", -- Increment to scope
      node_decremental = "<C-backspace>", -- Decrement selection
    },
  },

  -- Rainbow parentheses
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags
    max_file_lines = nil, -- Enable for all files
  },

  -- Folding based on Tree-sitter
  fold = {
    enable = true,
    disable = {}, -- List of languages to disable folding
  },

  -- Playground to visualize the syntax tree
  playground = {
    enable = true,
    updatetime = 25, -- Update time for highlighting nodes in the playground
    persist_queries = false, -- Don't keep queries in memory
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_language = 't',
      toggle_all = 'a',
      goto_node = '<cr>',
      show_help = '?',
    },
  },

  -- Context-aware display (plugin)
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
