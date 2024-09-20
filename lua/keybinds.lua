-- Function to set key mappings easily
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Leader key
vim.g.mapleader = ' ' -- Set space as the leader key

-- Telescope
map('n', '<Leader>ff', ':Telescope find_files<CR>', { desc = 'Find files' })
map('n', '<Leader>fg', ':Telescope live_grep<CR>', { desc = 'Live grep' })

-- Navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Move left between splits' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move down between splits' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move up between splits' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move right between splits' })

-- Save and quit
map('n', '<Leader>w', ':w<CR>', { desc = 'Save file' })
map('n', '<Leader>q', ':q<CR>', { desc = 'Quit file' })

-- Buffers
map('n', '<Leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<Leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<Leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })

-- Windows
map('n', '<Leader>ws', ':split<CR>', { desc = 'Horizontal split' })
map('n', '<Leader>wv', ':vsplit<CR>', { desc = 'Vertical split' })

-- LSP 
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'Find references' })
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Hover documentation' })
map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename symbol' })
map('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { desc = 'Format code' })

-- NvimTree
map('n', '<Leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- Terminal
map('n', '<Leader>t', ':vsplit<CR>:terminal<CR><C-w>l', { desc = 'Open terminal on the right' })
map('n', '<Leader>ct', ':bd!<CR>', { desc = 'Close terminal' })

-- Additional key mappings
map('n', '<C-c>', '"+y', { desc = 'Copy to clipboard' })
map('n', '<C-v>', '"+p', { desc = 'Paste from clipboard' })
map('n', '<C-x>', '"+d', { desc = 'Cut to clipboard' })
map('n', '<C-z>', 'u', { desc = 'Undo' })
map('n', '<C-s>', ':w<CR>', { desc = 'Save file' })
map('n', '<Leader>rnf', ':Rename<CR>', { desc = 'Rename file' })
map('n', '<C-S-c>', ':q!<CR>', { desc = 'Stop running task' })

-- DAP keybindings
map('n', '<Leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { desc = 'Toggle breakpoint' })
map('n', '<Leader>dc', '<cmd>lua require"dap".continue()<CR>', { desc = 'Continue debugging' })
map('n', '<Leader>di', '<cmd>lua require"dap".step_into()<CR>', { desc = 'Step into' })
map('n', '<Leader>do', '<cmd>lua require"dap".step_over()<CR>', { desc = 'Step over' })
map('n', '<Leader>dr', '<cmd>lua require"dap".repl.open()<CR>', { desc = 'Open REPL' })
map('n', '<Leader>du', '<cmd>lua require"dapui".toggle()<CR>', { desc = 'Toggle DAP UI' })

-- Additional key mappings for code management
map('n', '<Leader>mp', ':MarkdownPreview<CR>', { desc = 'Preview Markdown' })

-- Bufferline keybindings 
map('n', '<Leader>bp', ':BufferLinePick<CR>', { desc = 'Pick buffer' })


