-- [nfnl] lua/plugins/vim-signify-config.fnl
local vim = _G.vim
local utils = vim.g.utils
local vim_signify_conf
local function _1_()
  vim.o.updatetime = 100
  return nil
end
vim_signify_conf = {"mhinz/vim-signify", enabled = utils.is_machmotion, init = _1_, lazy = false}
vim.cmd("highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE\n   highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE\n   highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE")
return vim_signify_conf
