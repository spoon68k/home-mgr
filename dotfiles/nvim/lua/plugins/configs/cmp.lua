--

return {
    'hrsh7th/nvim-cmp',

    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },

    config = function()

        -- Load LuaSnip and snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- Set up nvim-cmp
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({

  snippet = {
    -- REQUIRED: You must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- For LuaSnip users
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),     -- Scroll up in documentation
    ['<C-f>'] = cmp.mapping.scroll_docs(4),      -- Scroll down in documentation
    ['<C-Space>'] = cmp.mapping.complete(),      -- Trigger completion manually
    ['<C-e>'] = cmp.mapping.abort(),             -- Close the completion window
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Accept currently selected item
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },   -- LSP completions
    { name = 'luasnip' },    -- Snippet completions
  }, {
    { name = 'buffer' },     -- Buffer word completions
    { name = 'path' },       -- File path completions
  }),

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = {
        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- can also be a function to dynamically calculate max width such as
        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
        menu = 50, -- leading text (labelDetails)
        abbr = 50, -- actual suggestion item
      },
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
    })
    }
})

-- Set configuration for specific filetype (optional)
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },    -- Git completions
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (search mode)
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (command-line mode)
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

