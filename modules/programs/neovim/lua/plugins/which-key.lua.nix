{ ... }:

{
  xdg.configFile."nvim/lua/plugins/which-key.lua".text = ''
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    defer = {
      gc = 'Comments',
    },
    keys = {
      scroll_down = '<c-d>',
      scroll_up = '<c-u>',
    },
    win = {
      border = 'rounded',
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = 'left',
    },
    show_help = true,
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)
    wk.add({
      { '<leader><tab>', group = '+tabs' },
      { '<leader>b', group = '+buffer' },
      { '<leader>c', group = '+code' },
      { '<leader>f', group = '+file/find' },
      { '<leader>g', group = '+git' },
      { '<leader>gh', group = '+hunks' },
      { '<leader>q', group = '+quit/session' },
      { '<leader>s', group = '+search' },
      { '<leader>u', group = '+ui' },
      { '<leader>w', group = '+windows' },
    })
  end,
}
'';
}
