-- [nfnl] lua/keymaps/run-utility.fnl
local utils = _G.vim.g.utils
local Keymaps = utils.keymaps
local api = _G.vim.api
local g = _G.vim.g
local function _1_()
  return utils.keymaps.wk_add({{"<leader>u", group = "Run [U]tility"}})
end
utils.defer.add_deferred(_1_, "which-key")
Keymaps.noremap("n", "<leader>uu", "<NOP>", "Util: Cancel util run without undo")
Keymaps.noremap("n", "<leader>uh", "<CMD>nohl<CR>", "Util: Turn search [h]ighlighting off")
Keymaps.noremap("n", "<leader>ucl", "mz?[a-z]<cr><cmd>nohl<cr>gul`z", "[U]til: Lowercase latest upper[c]ase [l]etter")
Keymaps.noremap("n", "<leader>ua", "mzggVG\"+y`z", "Util: Copy [a]ll of the buffer to clipboard")
local function _2_()
  return utils.keymaps.wk_add({{"<leader>uw", group = "Manage opt_local.text[w]idth"}})
end
utils.defer.add_deferred(_2_, "which-key")
local function _3_()
  local current_text_width = api.nvim_get_option_value("textwidth", {scope = "local"})
  if (current_text_width == 0) then
    return api.nvim_set_option_value("textwidth", g.text_width, {scope = "local"})
  else
    return api.nvim_set_option_value("textwidth", 0, {scope = "local"})
  end
end
Keymaps.noremap("n", "<leader>uwt", _3_, "Toggle :set textwidth for current buffer")
local function _5_()
  return api.nvim_set_option_value("textwidth", g.text_width, {scope = "local"})
end
Keymaps.noremap("n", "<leader>uwe", _5_, "Enable :set textwidth for current buffer")
local function _6_()
  return api.nvim_set_option_value("textwidth", 0, {scope = "local"})
end
return Keymaps.noremap("n", "<leader>uwd", _6_, "Disable :set textwidth for current buffer")
