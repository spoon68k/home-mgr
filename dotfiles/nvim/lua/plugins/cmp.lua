return {
  'hrsh7th/nvim-cmp',

  lazy = false,

  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind-nvim', -- add this dependency
  },

  config = function()

    -- Load LuaSnip snippets (from vscode-style snippet collections)
    require('luasnip.loaders.from_vscode').lazy_load()

    local cmp = require('cmp')
    local lspkind = require('lspkind')

    cmp.setup({
      snippet = {
        -- Use LuaSnip for snippet expansion
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },

      mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },

      -- Define primary and secondary sources
      sources = cmp.config.sources({
        { name = "copilot" },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
        { name = 'path' },
      }),

      -- Configure formatting via lspkind
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol', -- show only symbol annotations
          maxwidth = 50,   -- maximum width of the popup menu
          ellipsis_char = '...', -- character to show when truncating
          symbol_map = {
            Copilot = "",
          },
        }),
      },
    })

    -- Filetype specific setup (example for gitcommit)
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' },
      }, {
        { name = 'buffer' },
      })
    })

    -- Use buffer source for '/' (search mode)
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline and path source for ':' (command-line mode)
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end
}

