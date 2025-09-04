-- [nfnl] lua/keymaps/date-expansions.fnl
local utils = _G.vim.g.utils
local api = _G.vim.api
local Keymaps = utils.keymaps
local function _1_()
  local date_str = os.date("%y%m%d", os.time())
  return api.nvim_paste(date_str, false, -1)
end
Keymaps.noremap("ia", "sdate", _1_, "Expands to date of form YYMMDD; used for filename prefixes")
local function _2_()
  local date_str = os.date("%Y-%m-%d", os.time())
  return api.nvim_paste(date_str, false, -1)
end
return Keymaps.noremap("ia", "ldate", _2_, "Expands to date of form YYYY-MM-DD")
