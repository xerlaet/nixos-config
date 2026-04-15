{ ... }:

{
  xdg.configFile."nvim/lua/plugins/hop.lua".text = ''
return {
  'smoka7/hop.nvim',
  version = '*',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
    term_seq_bias = 0.5,
    reverse_appearance = true,
  },
  config = function()
    require('hop').setup()
    vim.keymap.set("", 'f', function()
      require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })
    end, { desc = 'Hop to char forward' })
    vim.keymap.set("", 'F', function()
      require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })
    end, { desc = 'Hop to char backward' })
    vim.keymap.set("", 's', function()
      require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = false })
    end, { desc = 'Hop to any char forward' })
    vim.keymap.set("", 'S', function()
      require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = false })
    end, { desc = 'Hop to any char backward' })
    vim.keymap.set("", 'gs', function()
      require('hop').hint_lines()
    end, { desc = 'Hop to line' })
  end,
}
'';
}
