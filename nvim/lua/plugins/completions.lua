return {
  {"L3MON4D3/LuaSnip",
	  version = "v2.*",
	  build = "make install_jsregexp",
    dependencies = {"saadparwaiz1/cmp_luasnip"}
  },

  { 'hrsh7th/cmp-nvim-lsp' },

  {'hrsh7th/nvim-cmp',
  config = function()
  local cmp = require'cmp'
  require("luasnip.loaders.from_lua").lazy_load({ paths = {"~/.config/nvim/luasnippets"} })
  require("luasnip").config.set_config({
        enable_autosnippets = true,
      })
    local ls = require("luasnip")
  local ls = require("luasnip")

  vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
  vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
  vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

  vim.keymap.set({"i", "s"}, "<C-E>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, {silent = true})
  cmp.setup({

    snippet = {
      expand = function(args)
            require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
     completion = cmp.config.window.bordered(),
     documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp', max_item_count = 7 },
      { name = 'luasnip', max_item_count = 5 },
    }, {
      { name = 'buffer', max_item_count = 7},
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })
  end

  },

}
