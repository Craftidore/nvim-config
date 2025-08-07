-- [nfnl] ftdetect/tmp.fnl
local vim = _G.vim
return vim.filetype.add({extension = {tmp = "tmp", temp = "tmp"}})
