return {
    {"williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
    {"williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({ ensure_installed = {"lua_ls", "clangd", "zls", "texlab"} })
    end
  },
    {"neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspc = require("lspconfig")
      lspc.lua_ls.setup({
        capabilities = capabilities
      })
      lspc.clangd.setup({
        capabilites = capabilities
      })
      lspc.texlab.setup ({
        capabilities = capabilities
      })
      lspc.zls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "zls" },
        filetypes = { "zig", "zir" },
        root_dir = lspc.util.root_pattern("zls.json", "build.zig", ".git"),
        single_file_support = true,
      })
      vim.keymap.set("n", 'K', vim.lsp.buf.hover, noremap)
      vim.keymap.set("n", '<leader>D', vim.lsp.buf.declaration, noremap)
      vim.keymap.set("n", '<leader>cs', vim.lsp.buf.code_action, noremap)
    end
  },
}
