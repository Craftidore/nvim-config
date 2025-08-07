-- [nfnl] lua/keymaps/open-utility.fnl
local utils = _G.vim.g.utils
local Keymaps = utils.keymaps
local g = _G.vim.g
local function _1_()
  return utils.keymaps.wk_add({{"<leader>o", group = "[O]pen"}})
end
utils.defer.add_deferred(_1_, "which-key")
Keymaps.noremap("n", "<leader>oz", "<CMD>WhichKey<CR>z=", "Open Spell Suggest Picker ([z]= alias)")
local _2_
if (g.quickfix_auto_height ~= nil) then
  _2_ = tostring(g.quickfix_auto_height)
else
  _2_ = "3"
end
Keymaps.noremap("n", "<leader>oc", ("<CMD>copen<CR><C-w>" .. _2_ .. "_"), "Open Qui[c]kfix (:copen alias)")
local function _4_()
  return utils.scratch.get_scratch("lox_buf")
end
return Keymaps.noremap("n", "<leader>ox", _4_, "Open Scratch [x] Buffer")
