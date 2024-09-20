require('todo-comments').setup({
    signs = true,
    keywords = {
      TODO = { icon = "", color = "info" }, 
      FIX = { icon = "", color = "error" },
      TODO = { icon = "", color = "info" },
      HACK = { icon = "", color = "warning" },
      WARN = { icon = "", color = "warning" },
      PERF = { icon = "", color = "perf" },
      NOTE = { icon = "", color = "hint" },
      TEST = { icon = "", color = "test" },
      --  keywords 
    },
      highlight = {
        before = "fg",  -- "fg" or "bg"
        keyword = "bg",  -- "bg" or "fg" or "none"
        after = "fg",    -- "fg" or "bg" or "none"
        pattern = [[.*<(%s)>]],
      },
    })
    