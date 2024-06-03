-- call to my remaps and options
    require("remap")
    require("options")

--Bootstrap lazy, I could just call this like above but this is *snorts pure peruvian* FANCIER
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- some ultisnips commands. Don't move these it doesnt work for some reason. throws a "cannot find luasnip" error and cba to figure that out 
vim.cmd[[
let g:UltiSnipsJumpForwardTrigger= '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
nnoremap <leader>u <Cmd>call UltiSnips#RefreshSnippets()<CR>
]]

-- and now time for vimtex lol (same as above for moving it ffs)
vim.cmd[[
filetype plugin indent on
let g:vimtex_quickfix_enabled = 0
let g:tex_flavor='latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let maplocalleader = ' '
nmap <localleader>li <Plug>(vimtex-info)
nmap <localleader>ll <Plug>(vimtex-compile)
]]
