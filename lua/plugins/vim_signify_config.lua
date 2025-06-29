local utils = vim.g.utils

local VimSignifyConf = {
  'mhinz/vim-signify',
  lazy = false,
  enabled = utils.is_machmotion,
  init = function()
    vim.o.updatetime = 100
  end,
}

vim.cmd([[
    highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
    highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
    highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
]])

return VimSignifyConf
