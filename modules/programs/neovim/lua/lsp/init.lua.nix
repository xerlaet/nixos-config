{ ... }:

{
  xdg.configFile."nvim/lua/plugins/lsp.lua".text = ''
return {
  {
    'neovim/nvim-lspconfig',
    version = '*',
    dependencies = {
      'mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = 'if_many',
          prefix = '●',
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '✗',
            [vim.diagnostic.severity.WARN] = '⚠',
            [vim.diagnostic.severity.HINT] = '💡',
            [vim.diagnostic.severity.INFO] = '○',
          },
        },
      },
      inlay_hints = {
        enabled = true,
      },
      capabilities = {},
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      log = {
        level = 'warn',
      },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities(),
        opts.capabilities or {}
      )

      local servers = opts.servers or {}
      local function setup(server)
        local server_opts = servers[server] or {}
        server_opts.capabilities = vim.tbl_deep_extend('force', capabilities, server_opts.capabilities or {})
        require('lspconfig')[server].setup(server_opts)
      end

      require('mason').setup(opts.mason or {})
      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            setup(server_name)
          end,
        },
      })
    end,
  },

  {
    'williamboman/mason.nvim',
    version = '*',
    ft = { 'lua', 'python', 'rust', 'go', 'cpp', 'c', 'html', 'css', 'json', 'yaml', 'bash', 'markdown', 'nix', 'tex' },
    opts = {
      ensure_installed = {
        'lua_ls',
        'pyright',
        'rust_analyzer',
        'gopls',
        'clangd',
        'html',
        'cssls',
        'jsonls',
        'yamlls',
        'bashls',
        'marksman',
        'nil_ls',
        'texlab',
      },
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    version = '*',
    cmd = { 'MasonToolsUpdate', 'MasonToolsInstall', 'MasonToolsClean' },
    opts = {
      ensure_installed = {
        'prettier',
        'stylua',
        'shfmt',
        'flake8',
        'black',
        'mypy',
        'hadolint',
        'yamlfmt',
        'jsonlint',
        'selene',
      },
      auto_update = false,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 5,
    },
  },
}
'';
}
