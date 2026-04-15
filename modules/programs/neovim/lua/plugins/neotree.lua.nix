{ ... }:

{
  xdg.configFile."nvim/lua/plugins/neotree.lua".text = ''
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>e', ':Neotree reveal<CR>', desc = 'Open file explorer', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_hidden = true,
        hide_by_name = {
          '.DS_Store',
          'thumbs.db',
          'node_modules',
          '__pycache__',
          '.venv',
          'venv',
        },
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<leader>e'] = 'close_window',
          ['h'] = 'toggle_hidden',
          ['R'] = 'refresh',
        },
      },
    },
    buffers = {
      bind_to_netrw = true,
      hide_root_folder = false,
      show_hidden = true,
    },
    default_component_configs = {
      git_status = {
        symbols = {
          added = 'A',
          modified = 'M',
          deleted = 'D',
          renamed = 'R',
          untracked = 'U',
          ignored = 'I',
          unstaged = ' ',
          staged = ' ',
          conflict = '!',
        },
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)
  end,
}
'';
}
