{ ... }:

{
  xdg.configFile."nvim/lua/plugins/telescope.lua".text = ''
return {
  'nvim-telescope/telescope.nvim',
  version = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  cmd = 'Telescope',
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files', silent = true },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Grep files', silent = true },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find buffers', silent = true },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help tags', silent = true },
    { '<leader>fc', '<cmd>Telescope commands<cr>', desc = 'Commands', silent = true },
    { '<leader>fm', '<cmd>Telescope marks<cr>', desc = 'Marks', silent = true },
    { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent files', silent = true },
    { '<leader>fo', '<cmd>Telescope vim_options<cr>', desc = 'Vim options', silent = true },
    { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps', silent = true },
    { '<leader>fs', '<cmd>Telescope grep_string<cr>', desc = 'Grep word under cursor', silent = true },
    { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Diagnostics', silent = true },
    { '<leader>ft', '<cmd>Telescope terms<cr>', desc = 'Terminals', silent = true },
    { '<leader>gc', '<cmd>Telescope git_commits<cr>', desc = 'Git commits', silent = true },
    { '<leader>gb', '<cmd>Telescope git_branches<cr>', desc = 'Git branches', silent = true },
    { '<leader>gs', '<cmd>Telescope git_status<cr>', desc = 'Git status', silent = true },
  },
  opts = {
    defaults = {
      prompt_prefix = ' ',
      selection_caret = ' ',
      entry_prefix = ' ',
      path_display = { 'smart' },
      sorting_strategy = 'ascending',
      layout_strategy = 'horizontal',
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
      },
      file_ignore_patterns = {
        'node_modules',
        '.git',
        '__pycache__',
        '.venv',
        'venv',
        'dist',
        'build',
        'target',
        '.next',
      },
      winblend = 0,
    },
    pickers = {
      find_files = {
        theme = 'dropdown',
        previewer = true,
        hidden = true,
      },
      live_grep = {
        theme = 'ivy',
      },
    },
  },
  config = function(_, opts)
    local telescope = require 'telescope'
    telescope.setup(opts)
    telescope.load_extension 'fzf'
  end,
}
'';
}
