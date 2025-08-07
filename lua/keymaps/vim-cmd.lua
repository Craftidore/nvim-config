-- [nfnl] lua/keymaps/vim-cmd.fnl
local utils = _G.vim.g.utils
local Keymaps = utils.keymaps
local g = _G.vim.g
local _1_
if (g.cmdline_auto_height ~= nil) then
  _1_ = tostring(g.cmdline_auto_height)
else
  _1_ = "3"
end
return Keymaps.noremap("c", "<C-f>", ("<C-f><C-w>" .. _1_ .. "_a"), "Open cmdline-window")
