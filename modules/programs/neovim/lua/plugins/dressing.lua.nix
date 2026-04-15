{ ... }:

{
  xdg.configFile."nvim/lua/plugins/dressing.lua".text = ''
return {
  'stevearc/dressing.nvim',
  version = false,
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    input = {
      default_prompt = '> ',
      border = 'rounded',
      relative = 'cursor',
      win = {
        win_options = {
          winblend = 0,
        },
      },
    },
    select = {
      backend = { 'telescope', 'builtin' },
      builtin = {
        border = 'rounded',
        win_options = {
          cursorline = true,
          cursorlineopt = 'both',
        },
      },
    },
  },
}
'';
}
