{ ... }:

{
  xdg.configFile."nvim/lua/plugins/treesitter.lua".text = ''
return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  cmd = {
    'TSUpdate',
    'TSUpdateSync',
    'TSInstall',
    'TSInstallInfo',
    'TSInstallSync',
    'TSUninstall',
    'TSUpdateInfo',
  },
  keys = {
    { '<c-space>', desc = 'Increment selection' },
    { '<bs>', desc = 'Decrement selection', mode = 'x' },
  },
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'jsonc',
      'lua',
      'luadoc',
      'luap',
      'markdown',
      'markdown_inline',
      'python',
      'query',
      'regex',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'yaml',
      'nix',
      'rust',
      'go',
      'gomod',
      'css',
      'cpp',
    },
  },
  config = function(_, opts)
    require('nvim-treesitter').setup(opts)
  end,
}
'';
}
