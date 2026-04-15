{ ... }:

{
  xdg.configFile."nvim/lua/plugins/cmp.lua".text = ''
return {
  -- Cmp core
  {
    'hrsh7th/nvim-cmp',
    version = '*',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'rafamadriz/friendly-snippets',
    },
    event = 'InsertEnter',
    opts = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local defaults = require 'cmp.config.default'()

      require('luasnip.loaders.from_vscode').lazy_load()

      -- Check if we're in a git commit (where LspAttach hasn't run)
      local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities()
      )

      return {
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = false },
          ['<S-CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
        formatting = {
          format = function(_, item)
            local icons = {
              Text = '○',
              Method = 'ƒ',
              Function = 'λ',
              Constructor = 'Ω',
              Field = 'field',
              Variable = 'var',
              Class = 'C',
              Interface = 'I',
              Module = 'M',
              Property = 'P',
              Unit = 'U',
              Value = 'V',
              Enum = 'E',
              Keyword = 'K',
              Snippet = 'S',
              Color = 'color',
              File = 'F',
              Reference = 'ref',
              Folder = 'D',
              EnumMember = 'EM',
              Constant = 'C',
              Struct = 'S',
              Event = 'Ev',
              Operator = 'Op',
              TypeParameter = 'TP',
            }
            if icons[item.kind] then
              item.kind = icons[item.kind] .. ' ' .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = 'CmpGhostText',
          },
        },
        sorting = defaults.sorting,
      }
    end,
    config = function(_, opts)
      for _, source in ipairs(opts.sources) do
        source.group_index = source.group_index or 1
      end
      require('cmp').setup(opts)
    end,
  },

  -- LuaSnip
  {
    'L3MON4D3/LuaSnip',
    version = '*',
    build = 'make install_jsregexp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    opts = {
      history = true,
      region_check_events = 'CursorHold',
      delete_check_events = 'TextChanged,InsertEnter',
    },
    config = function(_, opts)
      require('luasnip').setup(opts)
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_snipmate').lazy_load()
    end,
  },

  -- Friendly snippets
  {
    'rafamadriz/friendly-snippets',
    version = '*',
  },
}
'';
}
