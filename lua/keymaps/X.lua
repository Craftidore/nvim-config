-- [nfnl] lua/keymaps/X.fnl
local utils = _G.vim.g.utils
local Keymaps = utils.keymaps
return Keymaps.noremap("n", "X", "mz$\"_x`z", "Kill [X] the last character on the line")
