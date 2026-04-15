{ ... }:

{
  xdg.configFile."nvim/lua/core/keymaps.lua".text = ''
-- =============================================================================
-- Keybindings
-- =============================================================================

local opts = { silent = true, noremap = true }
local expr_opts = { silent = true, noremap = true, expr = true }

-- Split navigation with Alt+hjkl
vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move to down window' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move to up window' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move to right window' })

vim.keymap.set('i', '<M-h>', '<C-o><C-w>h', { desc = 'Move to left window' })
vim.keymap.set('i', '<M-j>', '<C-o><C-w>j', { desc = 'Move to down window' })
vim.keymap.set('i', '<M-k>', '<C-o><C-w>k', { desc = 'Move to up window' })
vim.keymap.set('i', '<M-l>', '<C-o><C-w>l', { desc = 'Move to right window' })

-- Split resize
vim.keymap.set('n', '<S-H>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<S-L>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })
vim.keymap.set('n', '<S-J>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<S-K>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })

-- Splits
vim.keymap.set('n', '<leader>th', ':split | terminal<CR>', { desc = 'Horizontal split with terminal', silent = true })
vim.keymap.set('n', '<leader>tv', ':vsplit | terminal<CR>', { desc = 'Vertical split with terminal', silent = true })
vim.keymap.set('n', '<leader>ph', ':split<CR>', { desc = 'Horizontal split', silent = true })
vim.keymap.set('n', '<leader>pv', ':vsplit<CR>', { desc = 'Vertical split', silent = true })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Toggle word wrap
vim.keymap.set('n', '<leader>w', ':set wrap!<CR>', { desc = 'Toggle word wrap' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- Move text up/down in visual mode
vim.keymap.set('v', 'J', ":move '>+1<CR>gv=gv", { desc = 'Move visual selection down' })
vim.keymap.set('v', 'K', ":move '<-2<CR>gv=gv", { desc = 'Move visual selection up' })

-- Better paste
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without yanking' })

-- Clear highlights
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })

-- Save and quit
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>Q', ':qa!<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<leader>s', ':w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>S', ':wa<CR>', { desc = 'Save all' })

-- Better indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- LSP keybindings (set on LspAttach)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    local buf = args.buf

    -- Go to
    vim.keymap.set('n', 'gD', vim.lsp.buf.definition, { buffer = buf, desc = 'Go to definition' })
    vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { buffer = buf, desc = 'Go to type definition' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, { buffer = buf, desc = 'Go to declaration' })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = buf, desc = 'Go to references' })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = buf, desc = 'Go to implementation' })

    -- Show info
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = buf, desc = 'Show hover info' })
    vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help, { buffer = buf, desc = 'Show signature' })

    -- Code actions
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = buf, desc = 'Code actions' })
    vim.keymap.set('n', '<leader>cA', function()
      vim.lsp.buf.code_action({ apply = true })
    end, { buffer = buf, desc = 'Source actions' })

    -- Rename
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { buffer = buf, desc = 'Rename symbol' })

    -- Diagnostics
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = buf, desc = 'Previous diagnostic' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = buf, desc = 'Next diagnostic' })
    vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { buffer = buf, desc = 'Document diagnostics' })
    vim.keymap.set('n', '<leader>cD', vim.lsp.buf.document_symbols, { buffer = buf, desc = 'Document symbols' })
  end,
})

-- Formatting
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.documentFormattingProvider then
      vim.keymap.set('n', '<leader>cF', function()
        vim.lsp.buf.format({ async = true })
      end, { buffer = args.buf, desc = 'Format document' })
    end
  end,
})
'';
}
