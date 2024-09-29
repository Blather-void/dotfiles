return {
  -- amongst your other plugins
  'akinsho/toggleterm.nvim', version = "*", config = true,
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-\>]],
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = false,
      persist_mode = false,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      float_opts = {
        border = 'curved',
        winblend = 0,
      }
    })
    local terminal = require('toggleterm.terminal').Terminal
    --btop
    local btop = terminal:new({ cmd = "btop", hidden = true })
    function _BTOP_TOGGLE()
      btop:toggle()
    end
    vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>lua _BTOP_TOGGLE()<CR>", {noremap = true, silent = true})
    
    --Vertical terminal
    local vtem = terminal:new({size = 60, direction = "vertical", hidden = true})
    function _VTERM_TOGGLE()
      vterm:toggle()
    end
    vim.api.nvim_set_keymap("n", "<leader>v", "<cmd>lua _VTERM_TOGGLE()<CR>", {noremap = true, silent = true})

    --build and run c code
    local crun = terminal:new({cmd = "./%:r", hidden = false})
    function _C_RUN()
      crun:toggle()
    end
    vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>lua _C_RUN()<CR>", {noremap = true, silent = true})

  end
}
