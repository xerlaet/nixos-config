{ ... }:

{
  xdg.configFile."nvim/lua/plugins/todo-comments.lua".text = ''
return {
  'folke/todo-comments.nvim',
  version = false,
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'TodoTrouble', 'TodoTelescope', 'TodoLocList', 'TodoQuickfix' },
  event = { 'BufReadPost', 'BufNewFile' },
  keys = {
    { ']t', function() require('todo-comments').next() end, desc = 'Next todo comment' },
    { '[t', function() require('todo-comments').prev() end, desc = 'Previous todo comment' },
    { '<leader>td', '<cmd>TodoTelescope<cr>', desc = 'List all todos' },
  },
  opts = {
    signs = true,
    sign_priority = 8,
    keywords = {
      FIX = { icon = 'E ', color = 'error', sign = true, alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
      TODO = { icon = 'T ', color = 'info' },
      HACK = { icon = 'W ', color = 'warning' },
      WARN = { icon = '! ', color = 'warning', alt = { 'WARNING', 'XXX' } },
      PERF = { icon = 'P ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
      NOTE = { icon = 'N ', color = 'hint', alt = { 'NOTES', 'INFO' } },
      TEST = { icon = 'S ', color = 'test', alt = { 'TESTS', 'TESTING', 'PASSED', 'FAILED' } },
    },
    gui_style = {
      fg = 'NONE',
      bg = 'BOLD',
    },
    merge_keywords = true,
    highlight = {
      multiline = true,
      multiline_context = 10,
      before = "",
      keyword = 'wide',
      after = 'fg',
      pattern = [[.*<(KEYWORDS)\s*:]],
      comments_only = true,
      max_line_len = 400,
      exclude = {},
    },
    search = {
      command = 'rg',
      args = {
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
      },
      pattern = [[\b(KEYWORDS)\b]],
    },
  },
}
'';
}
