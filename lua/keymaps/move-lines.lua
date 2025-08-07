-- [nfnl] lua/keymaps/move-lines.fnl
local utils = _G.vim.g.utils
local Keymaps = utils.keymaps
local api = _G.vim.api
local function _1_()
  local lines = utils.visual.get_visual_lines()
  local diff = (lines[2] - lines[1])
  local keys = ("<Esc><CMD>'<,'>m '>-" .. tostring((diff + 2)) .. "<CR>gv=gv")
  return api.nvim_feedkeys(utils.keys.escape_keys(keys), "v", false)
end
Keymaps.noremap({"v"}, "<C-k>", _1_, "Move selected lines up")
local function _2_()
  local lines = utils.visual.get_visual_lines()
  local diff = (lines[2] - lines[1])
  local keys = ("<Esc><CMD>'<,'>m '<+" .. tostring((diff + 1)) .. "<CR>gv=gv")
  return api.nvim_feedkeys(utils.keys.escape_keys(keys), "v", false)
end
return Keymaps.noremap({"v"}, "<C-j>", _2_, "Move selected lines down")
