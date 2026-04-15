{ ... }:

{
  xdg.configFile."nvim/lua/core/options.lua".text = ''
-- =============================================================================
-- Core Neovim Options
-- =============================================================================

vim.g.maplocalleader = ' '
vim.g.mapleader = ' '

-- Performance
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.hidden = true

-- Numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.numberwidth = 4

-- Clipboard
vim.o.clipboard = 'unnamedplus'

-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smartindent = true

-- UI
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = false
vim.o.signcolumn = 'yes'
vim.o.showmode = false
vim.o.cmdheight = 1
vim.o.termguicolors = true
vim.o.scrolloff = 4
vim.o.sidescrolloff = 8

-- Search
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Files
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true

-- Formatting
vim.opt.formatoptions:remove({ 'c', 'r', 'o' })

-- Word wrap
vim.o.wrap = false
vim.o.linebreak = true

-- Mouse
vim.o.mouse = 'a'

-- Completion
vim.o.completeopt = 'menuone,noselect'
vim.opt.shortmess:append 'c'
vim.o.pumheight = 10

-- Buffer/tab line
vim.o.showtabline = 2

-- Terminal
vim.o.shell = '/bin/bash'
vim.o.whichwrap = 'bs<>[]hl'

-- Misc
vim.o.conceallevel = 0
vim.o.fileencoding = 'utf-8'
vim.o.backspace = 'indent,eol,start'
vim.opt.iskeyword:append '-'
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
'';
}
