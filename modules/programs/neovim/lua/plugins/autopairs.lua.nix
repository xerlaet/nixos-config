{ ... }:

{
  xdg.configFile."nvim/lua/plugins/autopairs.lua".text = ''
return {
  'windwp/nvim-autopairs',
  version = false,
  event = { 'InsertEnter', 'BufReadPost' },
  opts = {
    check_ts = true,
    ts_config = {
      lua = { 'string' },
      javascript = { 'template_string' },
      java = false,
    },
    disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = string.gsub([[ [%'%"%]%]%)%] } ]], "%s+", ""),
      offset = 0,
      highlighter = nil,
      check_grow = false,
    },
  },
  config = function(_, opts)
    require('nvim-autopairs').setup(opts)
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
'';
}
