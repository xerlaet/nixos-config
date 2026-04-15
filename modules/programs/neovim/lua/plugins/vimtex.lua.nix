{ ... }:

{
  xdg.configFile."nvim/lua/plugins/vimtex.lua".text = ''
return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_view_automatic = 1
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_quickfix_mode = 1
    vim.g.vimtex_syntax_enabled = 0
    vim.g.vimtex_indent_enabled = 1
    vim.g.vimtex_syntax_custom_envs = {
      'tikzpicture',
      'axis',
      'adjustbox',
      'lstlisting',
    }
  end,
}
'';
}
