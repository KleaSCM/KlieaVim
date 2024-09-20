

-- Create a custom statusline function
  _G.statusline = function()  -- Use _G to make it global
    local mode = vim.fn.mode()
    local filename = vim.fn.expand('%:t')
    local filetype = vim.bo.filetype
    local line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
  
    -- Git information
    local git_branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null"):gsub('\n', '') -- Current branch
    local git_status = vim.fn.system("git status --porcelain 2>/dev/null") -- Git status
    local modified_files = 0
  
    if git_status ~= '' then
      for _ in git_status:gmatch('\n') do
        modified_files = modified_files + 1
      end
    end
  
    local last_commit = vim.fn.system("git log -1 --pretty=%B 2>/dev/null"):gsub('\n', '') -- Last commit message
    local git_info = string.format(' %s | %d changes | %s', git_branch, modified_files, last_commit)
  
    return string.format(' %s | %s | %s:%d/%d | %s ', mode, filename, filetype, line, total_lines, git_info)
  end
  
  -- Set the custom statusline
  vim.opt.statusline = '%!v:lua.statusline()'
  
  -- Enable the global statusline
  vim.opt.laststatus = 3
  