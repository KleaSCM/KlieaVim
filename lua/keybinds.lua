

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

-- General key mappings
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

-- LSP (Language Server Protocol)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'Find references' })
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Hover documentation' })
map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename symbol' })

-- open tree
map('n', '<Leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })


-- Open terminal in a vertical split on the right
map('n', '<Leader>t', ':vsplit<CR>:terminal<CR><C-w>l', { desc = 'Open terminal on the right' })

--  More key mappings can be added here...
