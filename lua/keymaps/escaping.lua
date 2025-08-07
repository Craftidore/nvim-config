-- [nfnl] lua/keymaps/escaping.fnl
local utils = _G.vim.g.utils
local Keymaps = utils.keymaps
Keymaps.noremap("i", "jj", "<Esc>", "Switch to normal mode")
return Keymaps.noremap("i", "jk", "<Esc>", "Switch to normal mode")
