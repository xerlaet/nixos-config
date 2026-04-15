{ ... }:

{
  xdg.configFile."nvim/lua/plugins/lualine.lua".text = ''
return {
  'nvim-lualine/lualine.nvim',
  version = false,
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    options = {
      component_separators = { left = '|', right = '|' },
      section_separators = { left = "", right = "" },
      globalstatus = true,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = {
        {
          'diagnostics',
          symbols = {
            error = '[E]',
            warn = '[W]',
            hint = '[H]',
            info = '[I]',
          },
        },
        { 'diff' },
      },
      lualine_x = {
        {
          'filetype',
          icon_only = true,
          separator = "",
          padding = {
            left = 1,
            right = 0,
          },
        },
        { 'encoding' },
        { 'fileformat' },
      },
      lualine_y = { 'progress' },
      lualine_z = {
        { 'location', padding = { left = 1, right = 0 } },
        function()
          return os.date '%R'
        end,
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          'filename',
          path = 1,
          shorting_target = 40,
          symbols = {
            modified = ' ●',
            readonly = ' ○',
            unnamed = '[No Name]',
            newfile = 'New',
          },
        },
      },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { 'neo-tree', 'lazy' },
  },
}
'';
}
